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

import dao.MemberDao;

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
		MultipartRequest multi = new MultipartRequest(
				request, /*요청타입*/
				request.getSession().getServletContext().getRealPath("/admin/productimg"), /*저장 폴더위치*/
				1024*1024*1024, /*파일 최대용량(바이트기준)*/
				"UTF-8", 
				new DefaultFileRenamePolicy()
				);
		String ttitle = multi.getParameter("ttitle");
		String timg = multi.getFilesystemName("timg");
		String tcontent = multi.getParameter("tcontent");
		int tprice = Integer.parseInt(multi.getParameter("tprice"));
		int tactive = Integer.parseInt(multi.getParameter("tactive"));
		int tcondition = Integer.parseInt(multi.getParameter("tcondition"));
			HttpSession session = request.getSession();
			String mid = (String)session.getAttribute("login");
		int mno = MemberDao.getMemberDao().getmno(mid);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
