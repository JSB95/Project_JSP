package controller.timetable;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LectureDao;
import dto.Lecture;

/**
 * Servlet implementation class getlectureinfo
 */
@WebServlet("/timetable/getlectureinfo")
public class getlectureinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getlectureinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setCharacterEncoding("UTF-8");
		
		int lno = Integer.parseInt(request.getParameter("lno"));
		
		System.out.println("학과번호 : " + lno);
		
		ArrayList<Lecture> list = LectureDao.getLectureDao().getlectureinfo(lno);
		
		
		
		String html ="";
		
		for (Lecture lecture : list) {
			html += "<div class=\"modal-dialog\" role=\"document\">" +
						"<div class=\"modal-content\">" +
							"<div class=\"modal-header\">" +
								"<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">" +
								"<span aria-hidden=\"true\">×</span>" +
								"</button>" +
							"</div>" +
							"<div class=\"modal-body\">" +
								"<h3 class=\"lecture-title\">" + lecture.getLname() + "</h3>" +
								"<ul class=\"lecture-info\">" +
									"<li class=\"lecture-time\">" +
										"<i class=\"material-icons ic-lecture-info\">access_alarm</i>" +
										"<span>강의 시간 : " + getlecturelist.temp +"</span>" +
									"</li>" +
									"<li class=\"lecture-code\">" +
										"<i class=\"material-icons ic-lecture-info\">code</i>" +
										"<span>교과목 코드 : " + lecture.getLno() +"</span>" +
									"</li>" +
									"<li class=\"lecture-code\">" +
										"<i class=\"material-icons ic-lecture-info\">school</i>" +
										"<span>담당 교수 : " + lecture.getLprofessor() + "</span>" +
									"</li>" +
								"</ul>" +
								"<div class=\"lecture-description\">" +
									"<p class=\"txt-description\"></p>" +
								"</div>" +
							"</div>" +
							"<div class=\"modal-footer\">" +
								"<button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">취소</button>" + 
								"<button type=\"button\" class=\"btn btn-primary\" id=\"btn_regist\">과목 등록하기</button>" +
							"</div>" +
						"</div>" +
					"</div>";
		}
		
		PrintWriter out = response.getWriter();
		
		out.print(html);
		
		System.out.println(html);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
