package dao;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import dto.Textbook;

public class BookstoreDao extends Dao{
	public BookstoreDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	public static BookstoreDao bookstoreDao = new BookstoreDao();
	public static BookstoreDao getBookstoreDao() {
		return bookstoreDao;
	}
	//책 추가
	public boolean bookadd(Textbook textbook) {
		String sql = "insert into textbook( timg, ttitle, tcontent, tprice, tcondition, tauthor, tcompany, tyear, tclass, mno )values (?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, textbook.getTimg());
			ps.setString(2, textbook.getTtitle());
			ps.setString(3, textbook.getTcontent());
			ps.setInt(4, textbook.getTprice());
			ps.setInt(5, textbook.getTcondition());
			ps.setString(6, textbook.getTauthor());
			ps.setString(7, textbook.getTcompany());
			ps.setString(8, textbook.getTyear());
			ps.setString(9, textbook.getTclass());
			ps.setInt(10, textbook.getMno());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("bookadd오류 " + e);
		}
		return false;
	}
	//책 출력
	public ArrayList<Textbook> getbooklist(){
		ArrayList<Textbook> booklist = new ArrayList<Textbook>();
		String sql = "select * from textbook order by tno desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Textbook textbook = new Textbook(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12)
						);
				booklist.add(textbook);
			}
			return booklist;
		} catch (Exception e) {
			System.out.println("getbooklist 오류 : "+ e);
		}
		return null;
	}
	//개별 책 출력
	public Textbook getBook(int tno) {
		String sql = "select * from textbook where tno = "+tno;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				Textbook textbook = new Textbook(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12)
						);
				return textbook;
			}
		
		} catch (Exception e) {
			System.out.println("getbook 오류 : "+ e);
		}
		return null;
	}
	public boolean bookupdate(Textbook textbook) {
		
		return false;
	}
	//책 출력리스트
	public JSONArray getbooklist(String keyword) {
		JSONArray jsonArray = new JSONArray();
		String sql = null;
		System.out.println(keyword);
		if(keyword == null){
			sql = "select * from textbook order by tno desc";
			}
		else {
			sql = "select * from textbook where ttitle like '%"+keyword+"%' order by tno desc";
		}
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				JSONObject object = new JSONObject();
				object.put("tno", rs.getInt(1));
				object.put("timg", rs.getString(2) );
				object.put("ttitle",rs.getString(3));
				object.put("tcontent", rs.getString(4));
				object.put("tprice", rs.getInt(5));
				object.put("tactive", rs.getInt(6));
				object.put("tcondition", rs.getInt(7));
				object.put("tauthor",rs.getString(8) );
				object.put("tcompany",rs.getString(9) );
				object.put("tclass",rs.getString(10) );
				jsonArray.put(object);
				
			}
			return jsonArray;
			
		} catch (Exception e) {
			System.out.println("getbooklist 오류 : "+ e);
			}
		
		
		return null;
	}
	
}
