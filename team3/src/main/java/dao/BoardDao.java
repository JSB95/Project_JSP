package dao;

public class BoardDao extends Dao {
	public BoardDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	public static BoardDao boardDao = new BoardDao();
	public static BoardDao getBoardDao() {
		return boardDao;
	}
	
	// 글작성

}
