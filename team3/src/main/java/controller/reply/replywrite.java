package controller.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MemberDao;
import dao.ReplyDao;
import dto.Reply;

/**
 * Servlet implementation class replywrite
 */
@WebServlet("/replywrite")
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
		request.setCharacterEncoding("UTF-8");
		int bno = Integer.parseInt( request.getParameter("bno") ) ;
		String rcontent = request.getParameter("rcontent");
			String mid = (String)request.getSession().getAttribute("login");
		int mno = BoardDao.getBoardDao().getmno(mid);
		// 객체화 [ 댓글번호 , 댓글작성일 , rindex , mid 제외 ]
		Reply reply = new Reply(0,rcontent,null,null,0,0,bno,mno);
		// DB처리
		boolean result = ReplyDao.getReplyDao().replywrite(reply);
		if( result ) { response.getWriter().print( 1 ); }
		else {  response.getWriter().print(2); }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
