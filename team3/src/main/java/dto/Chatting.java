package dto;

public class Chatting {

	int sendno ;
	int getno;
	String ccontent ;
	
	
	public Chatting() {
		// TODO Auto-generated constructor stub
	}


	public Chatting(int sendno, int getno, String ccontent) {
		super();
		this.sendno = sendno;
		this.getno = getno;
		this.ccontent = ccontent;
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
		return "Chatting [sendno=" + sendno + ", getno=" + getno + ", ccontent=" + ccontent + "]";
	}
	
	
	
	
}
