package Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	
	
	private static  String dbURL = "";
	private static  String dbID = "";
	private static  String dbPassword = "";
	private static  String driver = "";
	
	
	public ProductDAO() {
		
		driver = "com.mysql.jdbc.Driver";
		dbURL = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
		dbID = "root";
		dbPassword = "jinsang1027#";
		
	}
	
	public List<ProductVO> listProducts(String id) {

		List<ProductVO>  productsList = new ArrayList();
		
		try {
				try {
						connDB();	
				} catch (Exception e) {
					e.printStackTrace();
				}
			String query = "select * from product '" + id + "'";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String name = rs.getString("name");
				String Kind = rs.getString("Kind");
				String Many = rs.getString("Many");
				String date = rs.getString("date");
				//Date date = rs.getDate("date");
				
				ProductVO productVO = new ProductVO(name, Kind, Many, id, date);
				
				productsList.add(productVO);
				
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return productsList;
	}

	public void addProduct(ProductVO p) {
		try {
			
			try {
					connDB();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String name = p.getName();
			String kind = p.getKind();
			String many = p.getMany();
			String id = p.getId();
			String img = p.getImg();
			String date = p.getDate();
			//Date date = p.getDate();
			String sql = 
					"INSERT INTO product(name, Kind, Many, Productor_id, img, date)" 
					+ "VALUES(?,?,?,?,?,?)";
						
			PreparedStatement pstmt = conn.prepareStatement(sql);
						
			pstmt.setString(1, name);
			pstmt.setString(2, kind);
			pstmt.setString(3, many);
			pstmt.setString(4, id);
			pstmt.setString(5, img);
			pstmt.setString(6, date);
			//pstmt.setDate(6, date);
						
					
			pstmt.executeUpdate();	
					
			pstmt.close();
						
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	private void connDB() {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			System.out.println("Connection 이 성공적으로 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



}