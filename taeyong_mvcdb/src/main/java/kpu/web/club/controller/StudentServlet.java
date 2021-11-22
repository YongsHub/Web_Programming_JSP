package kpu.web.club.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kpu.web.club.domain.StudentVO;
import kpu.web.club.persistence.StudentDAO;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher view;
		
		String cmdReq="";
		cmdReq = request.getParameter("cmd");
		if(cmdReq.equals("main")) {
			response.sendRedirect("welcome.html");
		}
		else if(cmdReq.equals("join")) {
			response.sendRedirect("register.html");
		}else if(cmdReq.equals("list")) {
			StudentDAO dao = new StudentDAO();
			ArrayList<StudentVO> studentList = dao.getStudentList();
			request.setAttribute("studentList", studentList);
			view = request.getRequestDispatcher("student_list.jsp");
			view.forward(request, response);
		}else if(cmdReq.equals("update")) {
			StudentDAO dao = new StudentDAO();
			StudentVO student = dao.read(request.getParameter("id")); // 여기서 id 같은 student 객체 읽어오기
			request.setAttribute("student", student);
			view = request.getRequestDispatcher("update.jsp");
			view.forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher view;
		String cmdReq="";
		String message="";
		cmdReq = request.getParameter("cmd");
		
		
		if(cmdReq.equals("join")) {
			StudentVO studentVO = new StudentVO();
			
			studentVO.setId(request.getParameter("id"));
			studentVO.setPasswd(request.getParameter("passwd"));
			studentVO.setUsername(request.getParameter("username"));
			studentVO.setSnum(request.getParameter("snum"));
			studentVO.setDepart(request.getParameter("depart"));
			studentVO.setMobile(request.getParameter("mobile"));
			studentVO.setEmail(request.getParameter("email"));
			StudentDAO studentDao = new StudentDAO();
			
			if(studentDao.add(studentVO)) message = "가입 축하합니다";
			else message = "가입 실패입니다";
			
			request.setAttribute("greetings", message);
			request.setAttribute("student", studentVO);
			
			view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
		}else if(cmdReq.equals("update")) {
			StudentVO studentVO = new StudentVO();
			
			studentVO.setId(request.getParameter("id"));
			studentVO.setPasswd(request.getParameter("passwd"));
			studentVO.setUsername(request.getParameter("username"));
			studentVO.setSnum(request.getParameter("snum"));
			studentVO.setDepart(request.getParameter("depart"));
			studentVO.setMobile(request.getParameter("mobile"));
			studentVO.setEmail(request.getParameter("email"));
			
			StudentDAO dao = new StudentDAO();
			if(dao.update(studentVO)) message = "수정이 완료되었습니다.";
			else message = "수정 실패입니다.";
			
			request.setAttribute("greetings", message);
			request.setAttribute("student", studentVO);
			
			view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
		}
		
		
		//doGet(request, response);
	}

	
}
