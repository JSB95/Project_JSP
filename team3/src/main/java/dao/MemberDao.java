package dao;

import dto.Member;

public class MemberDao extends Dao {

	public MemberDao() {
		super();
	}
	
	public static MemberDao memberDao = new MemberDao();		//dao 호출시 반복되는 new 연산자
	public static MemberDao getMemberDao() {
			return memberDao;
		}
	


	public boolean signup(Member member) {
		
		String sql = "insert into member(mname, mcode,mphone,memail, mid, mpassword) values(?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,member.getMname());
			ps.setString(2,member.getMcode());
			ps.setString(3,member.getMphone());
			ps.setString(4,member.getMemail());
			ps.setString(5,member.getMid());
			ps.setString(6,member.getMpassword());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("singup 오류 : " + e);
		}
		
		return false;
	}
	
	public boolean codecheck(String mcode) {
		String sql = "select * from member where mcode = '"+mcode+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("codecheck 오류 : " + e);
		}
		return false;
	}

	public boolean idcheck (String mid) {
		String sql = "select * from member where mid = '"+mid+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("idcheck 오류 : " + e);
		}
		return false;
	}
	
	public boolean emailcheck(String email) {
		String sql = "select * from member where memail = '"+email+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("emailcheck 오류 : " + e);
		}
		return false;
	}
	
	public int login(String mid, String mpassword) {
		String sql = "select * from member where mid = '"+mid+"' and mpassword = '"+mpassword+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("1");
				return 1;
			}else {
				System.out.println("2");
				return 2;
			}
		} catch (Exception e) {
			System.out.println("login 오류 : " + e);
		}
		return 3;
	}



	



	
	
}
