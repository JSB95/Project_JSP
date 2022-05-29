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
	
	//회원가입
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
	//학번 중복체크
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
	//아이디 중복체크
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
	//이메일 중복체크
	public boolean emailcheck(String memail) {
		String sql = "select * from member where memail = '"+memail+"'";
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
	//로그인
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
	//비밀번호 찾기
	public String findpw(String mid, String memail) {
		String sql = "select mpassword from member "
				+ "where mid = '"+mid+"' and memail = '"+memail+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("findpw 오류 : " + e);
		}
		return null;
	}

	//아이디 찾기
	public String findid(String mname, String memail) {
		String sql = "select mid from member "
				+ "where mname = '"+mname+"' and memail = '"+memail+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("findpw 오류 : " + e);
		}
		return null;
	}
	//회원정보 출력
	public Member getmemberinfo (String mid) {
		String sql = "select * from member where mid = '"+mid+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				Member member = new Member(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						);
						return member;
			}
		}catch (Exception e) {
			System.out.println("getmemberinfo 오류 : " + e);
		}
		return null;
	}
	//회원정보 수정
	public boolean update(String memail, String mphone, String mid) {
		
		String sql = "update member set memail = '"+memail+"', mphone='"+mphone+"' where mid='"+mid+"'";
		
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("update 오류 : " + e);
		}
		return false;
	}

	
}
