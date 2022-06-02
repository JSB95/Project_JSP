package dto;

public class Textbook {
	private int tno;
	private String timg;
	private String ttitle;
	private String tcontent;
	private String tprice;
	private int tactive; 
	private int tcondition;
	private String tauthor;
	private String tcompany;
	private String tyear;
	private String tclass;
	private int mno;
	@Override
	public String toString() {
		return "Textbook [tno=" + tno + ", timg=" + timg + ", ttitle=" + ttitle + ", tcontent=" + tcontent + ", tprice="
				+ tprice + ", tactive=" + tactive + ", tcondition=" + tcondition + ", tauthor=" + tauthor
				+ ", tcompany=" + tcompany + ", tyear=" + tyear + ", tclass=" + tclass + ", mno=" + mno + "]";
	}
	public Textbook() {
		super();
	}
	public Textbook(int tno, String timg, String ttitle, String tcontent, String tprice, int tactive, int tcondition,
			String tauthor, String tcompany, String tyear, String tclass, int mno) {
		super();
		this.tno = tno;
		this.timg = timg;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tprice = tprice;
		this.tactive = tactive;
		this.tcondition = tcondition;
		this.tauthor = tauthor;
		this.tcompany = tcompany;
		this.tyear = tyear;
		this.tclass = tclass;
		this.mno = mno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTimg() {
		return timg;
	}
	public void setTimg(String timg) {
		this.timg = timg;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public String getTprice() {
		return tprice;
	}
	public void setTprice(String tprice) {
		this.tprice = tprice;
	}
	public int getTactive() {
		return tactive;
	}
	public void setTactive(int tactive) {
		this.tactive = tactive;
	}
	public int getTcondition() {
		return tcondition;
	}
	public void setTcondition(int tcondition) {
		this.tcondition = tcondition;
	}
	public String getTauthor() {
		return tauthor;
	}
	public void setTauthor(String tauthor) {
		this.tauthor = tauthor;
	}
	public String getTcompany() {
		return tcompany;
	}
	public void setTcompany(String tcompany) {
		this.tcompany = tcompany;
	}
	public String getTyear() {
		return tyear;
	}
	public void setTyear(String tyear) {
		this.tyear = tyear;
	}
	public String getTclass() {
		return tclass;
	}
	public void setTclass(String tclass) {
		this.tclass = tclass;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	
	
	
}
