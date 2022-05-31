package dao;

import java.util.ArrayList;

import dto.Chatting;

public class ChattingDao extends Dao{

	public ChattingDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public static ChattingDao chattingDao = new ChattingDao();
	
	public static ChattingDao getChattingDao() {
		return chattingDao;
	}
	
	public boolean send(Chatting chatting) {
		String sql = "insert into chatting(sendno,getno,ccontent) value(?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, chatting.getSendno());
			ps.setInt(2, chatting.getGetno());
			ps.setString(3, chatting.getCcontent());
			ps.executeUpdate();
			return true;
		}catch(Exception e) {System.out.println(e);}
		return false;
	}
	
	
	///내 전체쪽지리스트 출력
	public ArrayList<Chatting> chattinglist(){
		try {
			String sql = "SELECT * FROM jsp.chatting where getno=? and sendno=?";
		}catch(Exception e) {}
		return null;
	}
	
	
}
