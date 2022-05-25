package dao;

import java.util.ArrayList;

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
			System.out.println("GET LECTURE ERROR : " + e);
		}
		return null;
	}
	
	
	
}
