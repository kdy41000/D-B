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
		
		
		if(command.equals("faqlist")) {
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
		System.out.println(currentpage+"클릭시 들어온 값");
			
			List<BoardDto>list = biz.totalcnt();
	
			request.setAttribute("list", list);
	
			dispatch("faq/faqlist.jsp?currentpage="+currentpage,request,response);
		}else if(command.equals("faqdetail")) {
			int boa_seq =Integer.parseInt(request.getParameter("boa_seq"));
			BoardDto dto = biz.selectOne(boa_seq);
			request.setAttribute("dto", dto);
			dispatch("faq/faqdetail.jsp?boa_seq="+dto.getBoa_seq()+"",request,response);
			
		}else if(command.equals("faqupdate")) {
			int boa_seq = Integer.parseInt(request.getParameter("boa_seq"));
			BoardDto dto = biz.selectOne(boa_seq);
			
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
