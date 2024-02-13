package Product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.sql.Date;
import java.text.SimpleDateFormat;

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




@WebServlet("/Product/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProductDAO productDAO;
	
	public void init() throws ServletException {
		productDAO = new ProductDAO();
	}
	
    public ProductController() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String encoding = "utf-8";
		response.setContentType("text/html; charset=utf-8");
		String nextPage = null;
		request.setCharacterEncoding(encoding);
		String action = request.getPathInfo();
		HttpSession session = request.getSession();
		String id =	(String)session.getAttribute("id");

		if (action == null || action.equals("/listProducts.do")) 
		{
			List<ProductVO> ProductList = productDAO.listProducts(id);
			request.setAttribute("ProductList", ProductList);
			nextPage = "../productor/productor.jsp";
		} 

		else if (action.equals("/addProduct.do")) {
			File currentDirPath = new File("C:\\Users\\yach3\\eclipse-workspace\\web01\\src\\main\\webapp\\img");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(currentDirPath);
			factory.setSizeThreshold(1024 * 1024);
			String[] Param = new String[5];
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List items = upload.parseRequest(request);
				for (int i = 0; i < items.size(); i++) {
					FileItem fileItem = (FileItem) items.get(i);

					if (fileItem.isFormField()) {
						Param[i] = fileItem.getString(encoding);
					} else {
						Param[i] = fileItem.getName();
						if (fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							if (idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx + 1);
							File uploadFile = new File(currentDirPath + "\\" + fileName);
							fileItem.write(uploadFile);
						} // end if
					} // end if
				} // end for
						     
		        //Date date = (Date) new SimpleDateFormat("YYYY-MM-DD").parse(Param[4]);  
				String name = Param[0];
				String kind = Param[1];
				String amount = Param[2];
				String img = Param[3];
				String date = Param[4];

				ProductVO productVO = new ProductVO(name, kind, amount, id, img, date);
				productDAO.addProduct(productVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			nextPage = "../productor/productor.jsp";
		} else {
			List<ProductVO> productorsList = productDAO.listProducts(id);
			request.setAttribute("productorsList", productorsList);
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		
		dispatch.forward(request, response);
	}
}