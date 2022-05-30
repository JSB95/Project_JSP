package dto;

public class Reply {
	
	private int rno; 
	private String rcontent;
	private String rnickname;
	private String rdate;  
	private int rindex; 
	private int relike;
	private int bno; 
	private int mno;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int rno, String rcontent, String rnickname, String rdate, int rindex, int relike, int bno, int mno) {
		super();
		this.rno = rno;
		this.rcontent = rcontent;
		this.rnickname = rnickname;
		this.rdate = rdate;
		this.rindex = rindex;
		this.relike = relike;
		this.bno = bno;
		this.mno = mno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRnickname() {
		return rnickname;
	}

	public void setRnickname(String rnickname) {
		this.rnickname = rnickname;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getRindex() {
		return rindex;
	}

	public void setRindex(int rindex) {
		this.rindex = rindex;
	}

	public int getRelike() {
		return relike;
	}

	public void setRelike(int relike) {
		this.relike = relike;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", rcontent=" + rcontent + ", rnickname=" + rnickname + ", rdate=" + rdate
				+ ", rindex=" + rindex + ", relike=" + relike + ", bno=" + bno + ", mno=" + mno + "]";
	}
	
	
	
	

}
