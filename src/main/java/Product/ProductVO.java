package Product;

public class ProductVO {
	
	private String name;
	private String kind;
	private String many;
	private String id;
	private String img;
	private String date;
	private String company;


		
	public ProductVO() {
		System.out.println("MemberVO 생성자 호출");
	}
	
	public ProductVO(String img, String name) {
		super();
		this.img = img;
		this.name = name;
	}
	
	public ProductVO(String name, String Kind, String Many, String id, String date) {
		super();
		this.name = name;
		this.kind = Kind;
		this.many = Many;
		this.id = id;
		this.date = date;
	}
	
	public ProductVO(String name, String Kind, String Many, String id, String img, String date) {
		super();
		this.name = name;
		this.kind = Kind;
		this.many = Many;
		this.id = id;
		this.img = img;
		this.date = date;
	}
	
	public ProductVO(String img, String name, String kind, String many, String id, String company, String date) {
		super();
		this.name = name;
		this.many = many;
		this.company = company;
		this.img = img;
		this.date = date;
		this.kind = kind;
		this.id = id;
	}
	
	public String getName() { return name;}
	public void setName(String name) { this.name = name; }
	
	public String getKind() { return kind; }
	public void setKind(String kind) { this.kind = kind; }
	
	public String getMany() { return many; }
	public void setMany(String many) { this.many = many; }
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	
	public String getImg() { return img; }
	public void setImg(String img) { this.img = img; }
	
	public String getDate() { return date; }
	public void setDate(String date) { this.date = date; }
	
	public String getCompany() { return company; }
	public void setCompany(String company) { this.company = company; }

}
