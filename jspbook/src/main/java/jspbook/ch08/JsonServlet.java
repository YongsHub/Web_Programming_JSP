package jspbook.ch08;

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

/**
 * Servlet implementation class JsonServlet
 */
@WebServlet("/JsonServlet")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		String cmd;
		cmd = request.getParameter("key");
		PrintWriter out = response.getWriter();
		
		if(cmd.equals("list")) {
			StudentDAO studentDAO = new StudentDAO();
			List<StudentVO> studentList = studentDAO.getStudentList();
			JSONArray arrayJson = new JSONArray();
			
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
		}
		doGet(request, response);
	}

}
