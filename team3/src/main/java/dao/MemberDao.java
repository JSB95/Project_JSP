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
		
		
	}
	
	public int login(String mid, String mpassword) {
		
	}
	
	
	
	
}
