package dao;

import java.util.ArrayList;

import dto.Lecture;

public class LectureDao extends Dao{
	public LectureDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public static LectureDao lectureDao = new LectureDao();
	
	public static LectureDao getLectureDao() {
		return lectureDao;
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
	
	public ArrayList<Lecture> getdepartmentlist(String college) {
		
		ArrayList<Lecture> getdepartmentlist = new ArrayList<Lecture>();
		
		String sql = "SELECT * FROM lecture WHERE lcollege = '" + college + "'";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Lecture lecture = new Lecture(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
				getdepartmentlist.add(lecture);
			}
			return getdepartmentlist;
		} catch (Exception e) {
			System.out.println("GET Department ERROR : " + e);
		}
		return null;
		
	}
}
