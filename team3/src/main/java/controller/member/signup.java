package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

/**
 * Servlet implementation class signup
 */
@WebServlet("/member/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
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
		
		request.setCharacterEncoding("UTF-8");
		String mname = request.getParameter("mname");
		String mcode = request.getParameter("mcode");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		String mid = request.getParameter("mid");
		String mpassword = request.getParameter("mpassword");
		
		Member member = new Member(0, mname, mcode, mphone, memail, mid, mpassword);
		
		System.out.println(member.toString());
		
		boolean result = MemberDao.getMemberDao().signup(member);
		
		System.out.println(result);
		
		if (result) {
			response.sendRedirect("/team3/member/login.jsp");
		}else {
			System.out.println("오류");
			response.sendRedirect("/team3/member/login.jsp");
		}
	}

}
