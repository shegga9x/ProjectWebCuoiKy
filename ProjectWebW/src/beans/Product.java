package beans;

public class Product {
	String id;
	String name;
	double gia;
	String loai;
	int sluong;
	String filename1;
	String description;
	private double TotalCost;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	public String getLoai() {
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public int getSluong() {
		return sluong;
	}
	public void setSluong(int sluong) {
		this.sluong = sluong;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	  public double getTotalCost() {
		  
	        return TotalCost;
	    }

	    public void setTotalCost(double TotalCost) {
	    
				this.TotalCost = TotalCost;	
	        
	    }

	public Product(String id, String name, double gia, String loai, int sluong, String filename1, String description) {
		super();
		this.id = id;
		this.name = name;
		this.gia = gia;
		this.loai = loai;
		this.sluong = sluong;
		this.filename1 = filename1;
		this.description = description;
	}
	
public Product() {
	// TODO Auto-generated constructor stub
}
	
	
	
}
