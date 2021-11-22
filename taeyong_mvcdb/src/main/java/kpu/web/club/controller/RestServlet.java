package kpu.web.club.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import kpu.web.club.domain.StudentVO;
import kpu.web.club.persistence.StudentDAO;


/**
 * Servlet implementation class RestServlet
 */
@WebServlet("/RestServlet")
public class RestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		String cmdReq;
		cmdReq = request.getParameter("cmd");
		PrintWriter out = response.getWriter();
		
		
		if(cmdReq == null) return;
		StudentDAO studentDAO = new StudentDAO();
		List<StudentVO> studentList = studentDAO.getStudentList();
		JSONArray arrayJson = new JSONArray();
		if(cmdReq.equals("list")) {
			try {
				for(StudentVO vo: studentList) {
					JSONObject json = new JSONObject();
					json.put("id", vo.getId());
					json.put("username", vo.getId());
					json.put("passwd", vo.getPasswd());
					json.put("username",vo.getUsername());
					json.put("snum", vo.getSnum());
					json.put("depart", vo.getDepart());
					json.put("mobile", vo.getMobile());
					json.put("email", vo.getEmail());
					arrayJson.put(json);
				}
			}catch(JSONException e) {
				e.printStackTrace();
			}
			out.print(arrayJson);
		}else if(cmdReq.equals("read")) {
			String id = request.getParameter("id");
			try {
				for(StudentVO vo: studentList) {
					JSONObject json = new JSONObject();
					if(vo.getId().equals(id)) {
						json.put("id", vo.getId());
						json.put("username", vo.getId());
						json.put("passwd", vo.getPasswd());
						json.put("username",vo.getUsername());
						json.put("snum", vo.getSnum());
						json.put("depart", vo.getDepart());
						json.put("mobile", vo.getMobile());
						json.put("email", vo.getEmail());
						arrayJson.put(json);
					}
				}
			}catch(JSONException e) {
				e.printStackTrace();
			}
			out.print(arrayJson);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
