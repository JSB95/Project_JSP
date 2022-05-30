package dto;

public class Chatting {
	
	int cno;
	int sendno ;
	int getno;
	String ccontent ;
	
	
	public Chatting() {
		// TODO Auto-generated constructor stub
	}


	public Chatting(int cno, int sendno, int getno, String ccontent) {
		super();
		this.cno = cno;
		this.sendno = sendno;
		this.getno = getno;
		this.ccontent = ccontent;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public int getSendno() {
		return sendno;
	}


	public void setSendno(int sendno) {
		this.sendno = sendno;
	}


	public int getGetno() {
		return getno;
	}


	public void setGetno(int getno) {
		this.getno = getno;
	}


	public String getCcontent() {
		return ccontent;
	}


	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}


	@Override
	public String toString() {
		return "Chatting [cno=" + cno + ", sendno=" + sendno + ", getno=" + getno + ", ccontent=" + ccontent + "]";
	}


	
}
