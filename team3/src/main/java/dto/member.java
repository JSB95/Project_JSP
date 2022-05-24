package dto;

public class member {
	private int mno;
	private String mname;
	private String mcode;
	private String mphone;
	private String memail;
	private String mid;
	private String mapssword;
	
	@Override
	public String toString() {
		return "member [mno=" + mno + ", mname=" + mname + ", mcode=" + mcode + ", mphone=" + mphone + ", memail="
				+ memail + ", mid=" + mid + ", mapssword=" + mapssword + "]";
	}
	
	public member() {
		super();
	}

	public member(int mno, String mname, String mcode, String mphone, String memail, String mid, String mapssword) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mcode = mcode;
		this.mphone = mphone;
		this.memail = memail;
		this.mid = mid;
		this.mapssword = mapssword;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMapssword() {
		return mapssword;
	}
	public void setMapssword(String mapssword) {
		this.mapssword = mapssword;
	}
	
	
	
}
