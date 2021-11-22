package kpu.web.club.controller;

import java.io.IOException;

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
	public RequestDispatcher view;
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
		// TODO Auto-generated method stub
		String cmdReq = "";
		cmdReq = request.getParameter("cmd");
		if(cmdReq.equals("main")) {
			view = request.getRequestDispatcher("welcome.html");
			view.forward(request, response);
		}else if(cmdReq.equals("join")){
			view =request.getRequestDispatcher("register.html");
			view.forward(request, response);
		}else if(cmdReq.equals("intro")) {
			view = request.getRequestDispatcher("introduce.html");
			view.forward(request, response);
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String cmdReq="";
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
			request.setAttribute("username", studentVO.getUsername());
			request.setAttribute("id", studentVO.getId());
			request.setAttribute("snum", studentVO.getSnum());
			request.setAttribute("depart", studentVO.getDepart());
			request.setAttribute("mobile", studentVO.getMobile());
			request.setAttribute("email", studentVO.getEmail());
			
			StudentDAO studentDAO = new StudentDAO();
			view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
		}
		doGet(request, response);
	}

}
