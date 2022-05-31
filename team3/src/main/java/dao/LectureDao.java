package dao;

import java.util.ArrayList;
import java.util.Arrays;

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
	
	public ArrayList<Lecture> getlectureList_depart(String department){
		ArrayList<Lecture> list = new ArrayList<Lecture>();
		
		String sql = "SELECT * FROM lecture WHERE ldepartment = '" + department + "'";
		
		if (department.equals("")) {
			sql = "SELECT * FROM lecture WHERE ldivision = 1";
		}
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Lecture lecture = new Lecture(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
				list.add(lecture);
			}
			System.out.println("학과 : " + department);
			return list;
		} catch (Exception e) {
			System.out.println("getlectureList_depart ERROR : " + e);
		}
		return null;
	}
	
	public ArrayList<Lecture> getlectureinfo(int lno){
		ArrayList<Lecture> arrayList = new ArrayList<Lecture>();
		
		String sql = "SELECT * FROM lecture WHERE lno = " + lno;
		
		try {
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Lecture lecture = new Lecture(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
				arrayList.add(lecture);
				System.out.println(arrayList.toString());
			}
			return arrayList;
			
		} catch (Exception e) {
			System.out.println("getlectureinfo ERROR : " + e);
		}
		return null;
	}
}
