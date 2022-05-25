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
 * Servlet implementation class getlecturelist
 */
@WebServlet("/timetable/getlecturelist")
public class getlecturelist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getlecturelist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String department = request.getParameter("department");
		System.out.println("서블릿 학과 : " + department);
		String html="<tr>" +
						"<th> 강의명 </th>" +
						"<th> 교수명 </th>" +
						"<th> 시간 </th>" +
						"<th> 학점 </th>" +
					"</tr>";
		PrintWriter out = response.getWriter();
		ArrayList<Lecture> lecturelist = LectureDao.getLectureDao().getlectureList_depart(department);
		for (Lecture lecture : lecturelist) {
			
			String[] l = lecture.getLtime().split("_");
			String day = "";
			String time = "";
			System.out.print("첫번째 스플릿 : " + Arrays.toString(l));
			System.out.println();
			for (int i = 0; i < l.length; i++) {
				day += l[i].split("/")[0];
				time += l[i].split("/")[1];
			}
			
			System.out.println("요일 : " + day);
			System.out.println("시간 : " + time);
			
			for (int i = 0; i < l.length; i++) {
				if (l[i].split("/")[0].equals(l[i+1].split("/")[0])) {
					l[i] = l[i].split("/")[0];
				}
			}
			
			System.out.println(Arrays.toString(l));
			
			
			
			
			html += 
		
					"<tr>" + 
						"<td>" + lecture.getLname() + "</td>" +
						"<td>" + lecture.getLprofessor() + "</td>" +
						//"<td> 요일 : " + lday + " 교시 : " + ltime + "</td>" +
						"<td>" + lecture.getLcredit() + "</td>" +
					"</tr>";
		}
		
		out.print(html);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
