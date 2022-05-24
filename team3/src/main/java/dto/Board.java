package dto;

public class Board {
	
	
	private int bno;
	private String btitle; 
	private String bcontent;
	private int mno;
	private String bimg;
	private int bcategory; 
	private int blike; 
	private String bnickname;  
	private String bdate;
	
	
	public Board() {
		// TODO Auto-generated constructor stub
	}


	public Board(int bno, String btitle, String bcontent, int mno, String bimg, int bcategory, int blike,
			String bnickname, String bdate) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.mno = mno;
		this.bimg = bimg;
		this.bcategory = bcategory;
		this.blike = blike;
		this.bnickname = bnickname;
		this.bdate = bdate;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public String getBimg() {
		return bimg;
	}


	public void setBimg(String bimg) {
		this.bimg = bimg;
	}


	public int getBcategory() {
		return bcategory;
	}


	public void setBcategory(int bcategory) {
		this.bcategory = bcategory;
	}


	public int getBlike() {
		return blike;
	}


	public void setBlike(int blike) {
		this.blike = blike;
	}


	public String getBnickname() {
		return bnickname;
	}


	public void setBnickname(String bnickname) {
		this.bnickname = bnickname;
	}


	public String getBdate() {
		return bdate;
	}


	public void setBdate(String bdate) {
		this.bdate = bdate;
	}


	@Override
	public String toString() {
		return "Board [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", mno=" + mno + ", bimg=" + bimg
				+ ", bcategory=" + bcategory + ", blike=" + blike + ", bnickname=" + bnickname + ", bdate=" + bdate
				+ "]";
	}
	
	
	
	

}
