package Product;

import java.sql.Date;

public class ProductVO {
	
	private String name;
	private String Kind;
	private String Many;
	private String id;
	private String img;
	private String date;
	//private Date date;

	
	public ProductVO() {
		System.out.println("MemberVO 생성자 호출");
	}
	
	//public ProductVO(String name, String Kind, String Many, String id, Date date) {
	public ProductVO(String name, String Kind, String Many, String id, String date) {
		super();
		this.name = name;
		this.Kind = Kind;
		this.Many = Many;
		this.id = id;
		this.date = date;
	}
	
	//public ProductVO(String name, String Kind, String Many, String id, String img, Date date) {
	public ProductVO(String name, String Kind, String Many, String id, String img, String date) {
		super();
		this.name = name;
		this.Kind = Kind;
		this.Many = Many;
		this.id = id;
		this.img = img;
		this.date = date;
	}
	
	public String getName() { return name;}
	public void setName(String name) { this.name = name; }
	
	public String getKind() { return Kind; }
	public void setKind(String kind) { Kind = kind; }
	
	public String getMany() { return Many; }
	public void setMany(String many) { Many = many; }
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	
	public String getImg() { return img; }
	public void setImg(String img) { this.img = img; }
	
	public String getDate() { return date; }
	public void setDate(String date) { this.date = date; }
	//public Date getDate() { return date; }
	//public void setDate(Date date) { this.date = date; }
	

}
