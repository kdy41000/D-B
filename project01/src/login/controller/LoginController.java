package login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.biz.MemberBiz;
import member.biz.MemberBizImpl;
import member.dto.MemberDto;


@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginController() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		MemberBiz biz = new MemberBizImpl();
		
		if(command.equals("login")) {
		
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberDto dto = biz.login(id, pw);
			
			if(dto.getMem_role()!=0) {
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(10*60);
				
				if(dto.getMem_role()==1||dto.getMem_role()==2||dto.getMem_role()==3) {
					//dispatch("home/section.jsp",request,response);
					System.out.println(session.getAttribute("mem_role"));
					response.sendRedirect("home/section.jsp");
				
				}
			}
			
		}else if(command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("login.jsp");
		}else if(command.equals("loginform")) {
			response.sendRedirect("login/login.jsp");
		}
		
	}
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException { //스크립트 메시지를 편하게 사용하기 위한 메서드(out.println으로 사용해도 된다.)
		String res = "<script type='text/javascript>"
				   + " alert('"+msg+"');"
				   + " location.href='"+url+"';"
				   + "</script>";
		PrintWriter out = response.getWriter();
		out.println(res);
	}

}
