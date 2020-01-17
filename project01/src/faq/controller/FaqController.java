package faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.biz.BoardBiz;
import board.biz.BoardBizImpl;
import board.dto.BoardDto;


@WebServlet("/faq.do")
public class FaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FaqController() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command= request.getParameter("command");
		int currentpage = Integer.parseInt(request.getParameter("currentpage"));
		BoardBiz biz = new BoardBizImpl();
		
		if(command.equals("faqlist")) {
			System.out.println("들어왔따 게시판");
			List<BoardDto>list = biz.totalcnt();
			request.setAttribute("list", list);
			
			dispatch("faq/faplist.jsp?currentpage="+currentpage,request,response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
