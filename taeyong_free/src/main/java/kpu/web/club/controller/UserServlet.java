package kpu.web.club.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kpu.web.club.domain.UserVO;
import kpu.web.club.persistence.UserDAO;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		String cmdReq = "";
		
		cmdReq = request.getParameter("cmd");
		if(cmdReq.equals("join")){
			response.sendRedirect("register.html");
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
		cmdReq = request.getParameter("cmd");
		
		
		if(cmdReq.equals("login")) {
			UserVO uservo = new UserVO(); // uservo 객체를 통해 login 시도시 입력한 id와 passwd를 입력받아 객체에 저장
			uservo.setId(request.getParameter("id"));
			uservo.setId(request.getParameter("passwd"));
			
			UserDAO userdao = new UserDAO();
			int result = userdao.login(request.getParameter("id"), request.getParameter("passwd"));
			if(result == 1) {
				request.setAttribute("userID", request.getParameter("id"));
				view = request.getRequestDispatcher("welcome.jsp");
				view.forward(request, response);	
			}else if(result == 0){
				response.sendRedirect("login.html");
			}else if(result == -1) {
				response.sendRedirect("login.html");
			}
			//response.sendRedirect("welcome.jsp");
		}else if(cmdReq.equals("register")) {
			UserVO userVO = new UserVO();
			
			userVO.setId(request.getParameter("id"));
			userVO.setPasswd(request.getParameter("passwd"));
			userVO.setUsername(request.getParameter("username"));
			userVO.setMobile(request.getParameter("mobile"));
			UserDAO userDao = new UserDAO();
			
			if(userDao.add(userVO)) {
				view = request.getRequestDispatcher("welcome.jsp");
				view.forward(request, response);
			}
		}
	}
}
