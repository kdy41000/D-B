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
		
		BoardBiz biz = new BoardBizImpl();
		int currentpage = Integer.parseInt(request.getParameter("currentpage"));
		
		if(command.equals("faqlist")) {
		
			//System.out.println("페이ㅣ지 클릭시 들어왔다!!!!");
			//System.out.println("들어왔따 게시판");
			List<BoardDto>list = biz.totalcnt();
			//System.out.println(list+"리스트");
			//System.out.println(currentpage+"현재페이지");
	
			//request.setAttribute("currentpage", currentpage);
			request.setAttribute("list", list);
		
			//System.out.println("*************"+request.getAttribute("currentpage"));
			//System.out.println("****************"+request.getAttribute("list"));

			dispatch("faq/faqlist.jsp?currentpage="+currentpage,request,response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(url+"페이지클릭시 들어온번호");
		System.out.println(request.getParameter("currentpage"));
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		System.out.println(url+"페이지클릭시 들어온번호******************");
		dispatch.forward(request, response);
	}

}
