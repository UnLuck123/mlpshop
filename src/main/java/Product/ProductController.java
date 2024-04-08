package Product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



@WebServlet("/product/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProductDAO productDAO;
	
	public void init() throws ServletException {
		productDAO = new ProductDAO();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("EUC-KR");
		String nextPage = null;
		String action = request.getPathInfo(); //서블릿에 전달된 경로를 받아옴
		HttpSession session = request.getSession(); //세션 정보를 받아온뒤
		String id =	(String)session.getAttribute("id"); //세션 내에 있는 id를 받음
		
		if (action.equals("/listProducts.do")) //만약 전달된 경로가 /listProducts.do일때
		{
			List<ProductVO> ProductList = productDAO.listProducts(id); //상품 정보를 받아오는 함수
			request.setAttribute("ProductList", ProductList);
			nextPage = "../productor/productor.jsp"; //다음 페이지 정보
			
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			
			dispatch.forward(request, response);
		}
		
		doPost(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		String encoding = "UTF-8";
		String action = request.getPathInfo(); //서블릿에 전달된 경로를 받아옴
		HttpSession session = request.getSession(); //세션 정보를 받아온뒤
		String id =	(String)session.getAttribute("id"); //세션 내에 있는 id를 받음
		if (action.equals("/addProduct.do")) { //만약 전달된 경로가 /addProduct.do일때
			File currentDirPath = new File("C:\\JavaProgram\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Shop\\img"); //이미지를 저장할 폴더 설정
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(currentDirPath); //저장될 경로 설정
			factory.setSizeThreshold(1024 * 1024); //메모리에 저장할 수 있는 최대 크기 설정
			String[] Param = new String[5]; //파라미터를 저장할 배열
			ServletFileUpload upload = new ServletFileUpload(factory); 
			try {
				List items = upload.parseRequest(request); //리스트로 form에서 받아온 정보를 저장
				for (int i = 0; i < items.size(); i++) { //for로 하나씩 꺼내면서
					FileItem fileItem = (FileItem) items.get(i);
					if (fileItem.isFormField()) { //파일이 아닌 일반적인 입력 파라미터면
						Param[i] = fileItem.getString(encoding); //파라미터를 배열에 저장
					} else { //파일일때
						Param[i] = fileItem.getName(); //파일이름을 배열에 저장
						if (fileItem.getSize() > 0) { 
							int idx = fileItem.getName().lastIndexOf("\\");
							if (idx == -1) {
								idx = fileItem.getName().lastIndexOf("/"); 
							}
							String fileName = fileItem.getName().substring(idx + 1);
							File uploadFile = new File(currentDirPath + "\\" + fileName); 
							fileItem.write(uploadFile); //파일 로컬 경로에 저장
						} // end if
					} // end if
				} // end for
				
				//배열에 든 파라미터들을 보기 편하게 정리
				String name = Param[0];
				String kind = Param[1];
				String many = Param[2];
				String img = Param[3];
				String date = Param[4];
				
				//받은 정보들을 insert
				ProductVO productVO = new ProductVO(name, kind, many, id, img, date);
				productDAO.addProduct(productVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			nextPage = "/product/listProducts.do";
		}else if(action.equals("/showProducts.do")){
			String kind = request.getParameter("str");
			System.out.println("str="+kind);
			List<ProductVO> productList = productDAO.showProducts(kind);
			request.setAttribute("productList", productList);
			nextPage = "/food/Result.jsp";
		}else if(action.equals("/Purchase.do")){
			nextPage = "/food/Purchase.jsp";
		}else if(action.equals("/Main.do")) {
			List<ProductVO> allList = productDAO.showAll();
			request.setAttribute("allList", allList);
			nextPage = "/Main.jsp";
		}else if(action.equals("/oneFood.do")) {
			String str = request.getParameter("str");
			ProductVO food = productDAO.showOne(str);
			request.setAttribute("food", food);
			nextPage = "/food/oneFood.jsp";
		}
		else {
			List<ProductVO> productorsList = productDAO.listProducts(id);
			request.setAttribute("productorsList", productorsList);
		}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			
			dispatch.forward(request, response);
	}

}