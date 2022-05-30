package controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MemberDao;
import dao.ReplyDao;
import dto.Board;
import dto.Reply;

/**
 * Servlet implementation class replywrite
 */
@WebServlet("/board/replywrite")
public class replywrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replywrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("댓글");
		request.setCharacterEncoding("UTF-8");
		int bno = Integer.parseInt( request.getParameter("bno") ) ;
		String rcontent = request.getParameter("rcontent");
		rcontent = rcontent.replace("\r\n", "<br>");
			String mid = (String)request.getSession().getAttribute("login");
		int mno = BoardDao.getBoardDao().getmno(mid);
		//String radio = request.getParameter("anonymous");
		//System.out.println(radio.toString());
		// 객체화 [ 댓글번호 , 댓글작성일 , rindex , mid 제외 ]

		
	}
		
		// DB처리
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
