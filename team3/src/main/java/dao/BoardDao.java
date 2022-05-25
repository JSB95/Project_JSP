package dao;

import java.util.ArrayList;

import dto.Board;

public class BoardDao extends Dao {
	public BoardDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	public static BoardDao boardDao = new BoardDao();
	public static BoardDao getBoardDao() {
		return boardDao;
	}
	
	// 1. 글작성
	public boolean boardwrite(Board board) {
		
		String sql = "insert into board(btitle,bcontent,mno,bimg,bnickname)values(?,?,?,?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getBtitle());
			ps.setString(2, board.getBcontent());
			ps.setInt(3, board.getMno());
			ps.setString(4, board.getBimg());
			ps.setString(5, board.getBnickname());
			ps.executeUpdate();
			return true;
			
		} catch (Exception e) {System.out.println("게시판 글 작성 오류" + e);}
		
		return false;
	}
	
public int gettotalrow( String key , String keyword  ) {
		
		// 만약에 작성자 요청이면 
		//if( key.equals("mid") ) { key = "mno"; keyword = MemberDao.getmemberDao().getmno(keyword)+""; }
		
		String sql = null;
		if( key.equals("") && keyword.equals("") ) { sql ="select count(*) from board";} //검색이 없을경우 
		else { sql ="select count(*) from board where "+key+" like '%"+keyword+"%'";} // 검색이 있을경우
		
		try { ps = con.prepareStatement(sql); rs = ps.executeQuery(); 
			if( rs.next() ) return rs.getInt(1); 
		}
		catch( Exception e ) { System.out.println( e );} return 0;
	}
	
	// 2. 모든 게시물 출력
	public ArrayList<Board> getboardlist(int startrow,int listsize,String key,String keyword) {
		ArrayList<Board> boardlist = new ArrayList<Board>();
		String sql = "null";
		//if( key.equals("mid") ) { key = "mno"; keyword = MemberDao.getmemberDao().getmno(keyword)+""; }
		if( key.equals("") && keyword.equals("") ) { //검색이 없을경우 
			sql = "select * from board order by bno desc limit "+startrow+","+listsize; /* limit 시작 인덱스 , 표시 개수 */
		}else {
			sql ="select * from board where "+key+" like '%"+keyword+"%' order by bno desc limit "+startrow+","+listsize;
		}
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Board board = new Board(
						rs.getInt(1),rs.getString(2),
						rs.getString(3),rs.getInt(4),
						rs.getString(5),rs.getInt(6),rs.getInt(7),
						rs.getString(8),rs.getString(9)
						);
				boardlist.add(board);
			}
			return boardlist;
			
		} catch (Exception e) {System.out.println("모든 게시물 출력 오류" +e);}
		return null;
	}
	
	// 3. 개별 게시물 출력
	public Board getboaBoard() {
		String sql = "";
		try {
			
		} catch (Exception e) {System.out.println("개별 게시물 출력 오류" + e);}
		return null;
	}
	// 4. 게시물 수정 메소드
	public boolean boardupdate(Board board) {
		String sql = "";
		try {
			
		} catch (Exception e) {System.out.println("게시물 수정 오류 " + e);}
		return false;
	}
	// 5. 게시물 삭제
	public boolean boarddelete() {
		String sql = "";
		try {
			
		} catch (Exception e) {System.out.println("게시물 삭제 오류" + e);}
		return false;
	}
	// 6. 첨부이미지만 삭제?
	public boolean imgdelete() {
		String sql = "";
		try {
			
		} catch (Exception e) {System.out.println("첨부이미지 삭제 오류 " + e);}
		return false;
	}
	
	// 7. 추천메소드
	public boolean boardlike() {
		String sql = "";
		try {
			
		} catch (Exception e) {System.out.println("게시물 추천 오류" + e);}
		return false;
	}
	
	// 8. 인기글 출력리스트 필요한가 ?? *select로 검색후 추천수 10이상인 게시글 리스트 생성?
	
	//////////////////////////////////댓글관련////////////////////////////////////////////////

}
