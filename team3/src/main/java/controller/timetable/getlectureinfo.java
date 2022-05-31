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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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

		
		
		int lno = Integer.parseInt(request.getParameter("lno"));
		
		Lecture lecture = LectureDao.getLectureDao().getlectureinfo(lno);
		
		JSONArray jsonArray = new JSONArray();
		

		try {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("lname",lecture.getLname());
			jsonObject.put("ltime",lecture.getLtime());
			jsonObject.put("lno", lecture.getLno());
			jsonObject.put("lprofessor",lecture.getLprofessor());
			
			jsonArray.put(jsonObject);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(jsonObject.toString());
			System.out.println("jsonobject : " + jsonObject);
			System.out.println("jsonobject tostring : " + jsonObject.toString());
			System.out.println("jsonarray  : " + jsonArray);
			System.out.println("jsonarray tostring  : " + jsonArray.toString());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
