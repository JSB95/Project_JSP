package controller.bookstore;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BookstoreDao;
import dao.MemberDao;
import dto.Textbook;

/**
 * Servlet implementation class bookadd
 */
@WebServlet("/bookstore/bookadd")
public class bookadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookadd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadpath = request.getSession().getServletContext().getRealPath("/bookstore/bookimg");
		
		MultipartRequest multi = new MultipartRequest(
				request, // 요청방식
				uploadpath,	//파일저장경로
				1024*1024*10 , //파일 최대 용량 허용 범위
				"UTF-8",	//인코딩 타입
				new DefaultFileRenamePolicy() //동일한 파일명이 있을 경우 자동 이름 변환
				);
		
		request.setCharacterEncoding("UTF-8");
		String ttitle = multi.getParameter("ttitle");
		String timg = multi.getFilesystemName("timg");
		
		System.out.println("timg : " + timg);
		String tcontent = multi.getParameter("tcontent");
		String tprice = multi.getParameter("tprice");
		int tcondition = Integer.parseInt(multi.getParameter("tcondition"));
			HttpSession session = request.getSession();
			String mid = (String)session.getAttribute("login");
		String tauthor = multi.getParameter("tauthor");
		String tcompany = multi.getParameter("tcompany");
		String tyear = multi.getParameter("tyear");
		String tclass = multi.getParameter("tclass");
		int mno = MemberDao.getMemberDao().getmno(mid);
		
		System.out.println("ttilte : " + ttitle);
		System.out.println("서버경로 : " + request.getSession().getServletContext().getRealPath("/bookstore/bookimg"));
		System.out.println("tcontent : " + tcontent);
		System.out.println("tprice : " + tprice);
		System.out.println("tcondition : " + tcondition);
		System.out.println("mno : " + mno);

		Textbook textbook = new Textbook(0 , timg, ttitle, tcontent, tprice, 1, tcondition, tauthor, tcompany, tyear, tclass, mno);
		
		
		System.out.println(textbook.toString());
		
		boolean result = BookstoreDao.getBookstoreDao().bookadd(textbook);
		
		if( result ) { 
			response.sendRedirect("/team3/bookstore/booklist.jsp");
		}else { 
			System.out.println("오류");
		}
	}

}
