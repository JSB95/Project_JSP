package controller.chatting;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChattingDao;
import dao.ReviewDao;
import dto.Chatting;

/**
 * Servlet implementation class send
 */
@WebServlet("/send")
public class send extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public send() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = (String)request.getSession().getAttribute("login");
		int mno = ReviewDao.getreviewDao().getmno(mid);
		int getno = Integer.parseInt(request.getParameter("getno"));
		String ccontent = request.getParameter("ccontent");
		
		Chatting chatting = new Chatting(0,mno, getno, ccontent);
		boolean result = ChattingDao.getChattingDao().send(chatting);
		if(result) {
			response.sendRedirect("/team3/chatting/chatting.jsp");
		}
		else{response.sendRedirect("/team3/chatting/send.jsp");}
		
		
		
	}

}
