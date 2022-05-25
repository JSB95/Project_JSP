package dao;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;


import dto.Lecture;

public class ReviewDao extends Dao{

	public ReviewDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public static ReviewDao reviewDao = new ReviewDao();
	
	public static ReviewDao getreviewDao() {
		return reviewDao;
	}
	
	
	
	public ArrayList<Lecture> getlecturelist() {
		
		ArrayList<Lecture> getlecturelist = new ArrayList<Lecture>();
		
		String sql = "select * from lecture";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Lecture lecture = new Lecture(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
				getlecturelist.add(lecture);
			}
			return getlecturelist;
			
		} catch (Exception e) {
			System.out.println("" + e);
		}
		return null;
	}
	
	
	public JSONArray getlecture( int lno ) {
		JSONArray jsonArray = new JSONArray(); // json배열 선언 
		String sql = "select * from lecture where lno ="+lno;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				// 결과내 하나씩 모든 레코드를 -> 하나씩 json객체 변환  
				JSONObject object = new JSONObject();
				object.put( "lno" , rs.getInt(1) );
				object.put( "ldivision" , rs.getInt(2) );
				object.put( "lcollege" , rs.getString(3) );
				object.put( "ldepartment" , rs.getString(4) );
				object.put( "lprofessor" , rs.getString(5) );
				object.put( "lcredit" , rs.getInt(6) );
				object.put( "ltime" , rs.getString(7) );
				object.put( "lname" , rs.getString(8));
				jsonArray.put( object );
			}
			return jsonArray;
		}catch (Exception e) { System.out.println( e );}  return null; 
	}
	
	
	
	
}
