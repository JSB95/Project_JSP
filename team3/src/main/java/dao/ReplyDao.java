package dao;

import dto.Board;
import dto.Reply;

public class ReplyDao extends Dao {
	public ReplyDao() {
		
		super();
	}
	public static ReplyDao replyDao = new ReplyDao();
	public static ReplyDao getReplyDao() {
		return replyDao;
	}
	
	
	// 1.댓글 작성
public boolean replywrite(Reply reply) {
		String sql = "insert into board(rcontent,rnickname,rindex,bno,mno)values(?,?,?,?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, reply.getRcontent());
			ps.setString(2, reply.getRnickname());
			ps.setInt(3, reply.getRindex());
			ps.setInt(4, reply.getBno());
			ps.setInt(5, reply.getMno());			
			ps.executeUpdate();
			return true;
			
		} catch (Exception e) {System.out.println("댓글 작성 오류" + e);}
		
		return false;
	}

}
