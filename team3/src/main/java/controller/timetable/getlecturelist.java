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
		String html="<tr>" +
						"<th> 강의명 </th>" +
						"<th> 교수명 </th>" +
						"<th> 시간 </th>" +
						"<th> 학점 </th>" +
						"<th> 데이터용 시간 </th>" +
					"</tr>";
		PrintWriter out = response.getWriter();
		ArrayList<Lecture> lecturelist = LectureDao.getLectureDao().getlectureList_depart(department);
		for (Lecture lecture : lecturelist) {
			
			String[] l = lecture.getLtime().split("_");
			
			ArrayList<String> temp = new ArrayList<String>();
			if (l.length == 1) {
				temp.add(l[0].split("/")[0] + "(" + l[0].split("/")[1] + ")");
			} else if (l.length == 2) {
				for (int i = 0; i < l.length; i ++) {
					for (int j = i+1; j < l.length; j++) {
						if (l[i].split("/")[0].equals(l[j].split("/")[0])) {
							temp.add(l[i].split("/")[0] + "(" + l[i].split("/")[1] + "-" + l[j].split("/")[1] + ")");
						} else {
							temp.add(l[i].split("/")[0] + "(" + l[i].split("/")[1] + ") " + l[j].split("/")[0] + "(" + l[j].split("/")[1] + ")"); 
						}
					}
				}
			} else if (l.length == 3) {
				
				for (String item : l) {
					temp.add(item);
				}
				
				
				if (temp.get(0).split("/")[0].equals(temp.get(1).split("/")[0]) && temp.get(1).split("/")[0].equals(temp.get(2).split("/")[0])) {
					temp.set(0, temp.get(0).split("/")[0] + "(" + temp.get(0).split("/")[1] + "-" + temp.get(2).split("/")[1] + ")");
					temp.remove(1);
					temp.remove(1);
				} else if (temp.get(0).split("/")[0].equals(temp.get(1).split("/")[0])) {
					temp.set(0, temp.get(0).split("/")[0] + "(" + temp.get(0).split("/")[1] + "-" + temp.get(1).split("/")[1] + ")");
					temp.set(1, temp.get(2).split("/")[0] + "(" + temp.get(2).split("/")[1] + ")");
					temp.remove(2);
				} else if (temp.get(1).split("/")[0].equals(temp.get(2).split("/")[0])) {
					temp.set(0, temp.get(0).split("/")[0] + "(" + temp.get(0).split("/")[1] + ")");
					temp.set(1, temp.get(1).split("/")[0] + "(" + temp.get(1).split("/")[1] + "-" + temp.get(2).split("/")[1] + ")");
					temp.remove(2);
				} else {
					temp.set(0, temp.get(0).split("/")[0] + "(" + temp.get(0).split("/")[1] + ")");
					temp.set(1, temp.get(1).split("/")[0] + "(" + temp.get(1).split("/")[1] + ")");
					temp.set(2, temp.get(2).split("/")[0] + "(" + temp.get(2).split("/")[1] + ")");
				}
				
			} else if (l.length == 4) {
				
				for (String item : l) {
					temp.add(item);
				}
				
				if(temp.get(0).split("/")[0].equals(temp.get(1).split("/")[0]) && temp.get(1).split("/")[0].equals(temp.get(2).split("/")[0]) && temp.get(2).split("/")[0].equals(temp.get(3).split("/")[0])) {
					temp.set(0, temp.get(0).split("/")[0] + "(" + temp.get(0).split("/")[1] + "-" + temp.get(3).split("/")[1] + ")");
					temp.remove(1);
					temp.remove(1);
					temp.remove(1);
				} else if (temp.get(0).split("/")[0].equals(temp.get(1).split("/")[0]) && temp.get(2).split("/")[0].equals(temp.get(3).split("/")[0])) {
					temp.set(0, temp.get(0).split("/")[0] + "(" + temp.get(0).split("/")[1] + "-" + temp.get(1).split("/")[1] + ")");
					temp.set(1, temp.get(2).split("/")[0] + "(" + temp.get(2).split("/")[1] + "-" + temp.get(3).split("/")[1] + ")");
					temp.remove(2);
					temp.remove(2);
				}
				
			} else {
				temp.add("미지원 기능");
			}
			
			html += 
		
					"<tr>" + 
						"<td>" + lecture.getLname() + "</td>" +
						"<td>" + lecture.getLprofessor() + "</td>" +
						"<td>" + temp + "</td>" +
						"<td>" + lecture.getLcredit() + "</td>" +
						"<td id=\"time1\">" + lecture.getLtime() + "</td>" +
					"</tr>" ;
					
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
