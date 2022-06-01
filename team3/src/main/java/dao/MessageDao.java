package dao;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import dto.Message;


public class MessageDao extends Dao{

	public MessageDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public static MessageDao messageDao = new MessageDao();
	
	public static MessageDao getMessageDao() {
		return messageDao;
	}
	
	
	
	///내 전체쪽지리스트 출력
	public ArrayList<Message> getmessage(int mno){
		ArrayList<Message> getmessage = new ArrayList<Message>();
		try {
			String sql = "SELECT * FROM message where mgetno="+mno;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Message message = new Message(
				rs.getInt(1),rs.getInt(2),
				rs.getInt(3),rs.getString(4),
				rs.getInt(5),rs.getString(6));
				getmessage.add(message);
			}
			return getmessage;
		}catch(Exception e) {System.out.println(e);}
		return null;
	}
	
	public String getmid(int mno) {
		try {
			String sql = "SELECT mid FROM member where mno="+mno;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
			return rs.getString(1); }
		}catch(Exception e) {System.out.println(e); }
		return null;
	}
	
	
	public JSONArray getlist(int mnum){
		System.out.println(mnum);
		JSONArray jsonArray = new JSONArray();
		try {
			String 
				sql = "select * from message A , member B where A.msendno = B.mno and A.mnum="+mnum;
	 		
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while( rs.next() ) {
				// 결과내 하나씩 모든 레코드를 -> 하나씩 json객체 변환  
				JSONObject object = new JSONObject();
				object.put( "mnum" , rs.getInt(1) );
				object.put( "msendno" , rs.getInt(2) );
				object.put( "mgetno" , rs.getInt(3) );
				object.put( "mcontent" , rs.getString(4) );
				object.put( "mactive" , rs.getInt(5) );
				object.put( "mtime" , rs.getString(6) );
				object.put( "mno" , rs.getInt(7) );
				object.put( "mname" , rs.getString(8) );
				object.put( "mcode" , rs.getString(9) );
				object.put( "mphone" , rs.getString(10) );
				object.put( "memail" , rs.getString(11) );
				object.put( "mid" , rs.getString(12) );
				object.put( "mpassword" , rs.getString(13) );
				jsonArray.put( object );
				System.out.println( rs.getString(12) );
			}
			return jsonArray;
		}catch(Exception e) {System.out.println(e);}
		return null;
	}
	
	public boolean read(int mnum) {
		try {
			String sql = "update message set mactive=2 where mnum="+mnum;
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			return true;
		}catch(Exception e) {System.out.println(e);}
		return false;
	}
	
	
	
	public boolean send(int mno, int getno, String mcontent) {
		try {
			String sql = "insert into message(msendno,mgetno,mcontent,mactive) values(?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, mno);
			ps.setInt(2, getno);
			ps.setString(3, mcontent);
			ps.setInt(4, 1);
			ps.executeUpdate();
			return true;
		}catch(Exception e) {}
		return false;
	}
	
	public ArrayList<Message> sendmessage(int mno){
		ArrayList<Message> sendmessage = new ArrayList<Message>();
		try {
			String sql = "SELECT * FROM message where msendno="+mno;
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Message message = new Message(
				rs.getInt(1),rs.getInt(2),
				rs.getInt(3),rs.getString(4),
				rs.getInt(5),rs.getString(6));
				sendmessage.add(message);
			}
			return sendmessage;
		}catch(Exception e) {System.out.println(e);}
		return null;
	}
	
}
