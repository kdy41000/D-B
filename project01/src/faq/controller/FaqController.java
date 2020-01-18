package faq.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
			
			List<BoardDto>list = biz.totalcnt();	
			request.setAttribute("list", list);
	
			dispatch("faq/faqlist.jsp?currentpage="+currentpage,request,response);
			
		}else if(command.equals("faqdetail")) {
			int boa_seq =Integer.parseInt(request.getParameter("boa_seq"));
			int boa_cnt = Integer.parseInt(request.getParameter("boa_cnt"));
			
			BoardDto dto = biz.selectOne(boa_seq);  //detail로
			request.setAttribute("dto", dto);
			dispatch("faq/faqdetail.jsp?boa_seq="+dto.getBoa_seq()+"",request,response);
			
			int res = biz.cntplus(boa_seq, boa_cnt); //조회수 카운팅
			System.out.println(boa_cnt+"보아씨엔티");
			if(res > 0) {
				jsResponse("카운팅완료","faq.do?command=faqlist&currentpage=1",response);
			}
		}else if(command.equals("faqupdate")) {
			int boa_seq = Integer.parseInt(request.getParameter("boa_seq"));
			BoardDto dto = biz.selectOne(boa_seq);
			request.setAttribute("dto", dto);
			dispatch("faq/faqupdateform.jsp?boa_seq"+dto.getBoa_seq()+"",request,response);
			
		}else if(command.equals("faqupdateres")) {
			int boa_seq = Integer.parseInt(request.getParameter("boa_seq"));
			String boa_title = request.getParameter("boa_title");
			String boa_content = request.getParameter("boa_content");
			BoardDto dto = new BoardDto();
			dto.setBoa_seq(boa_seq);
			dto.setBoa_title(boa_title);
			dto.setBoa_content(boa_content);
			
			int res = biz.update(dto);
			
			if(res > 0) {
				jsResponse("수정이 완료되었습니다.","faq.do?command=faqdetail&boa_seq="+boa_seq+"",response);
			}else {
				jsResponse("수정을 실패하였습니다.","faq.do?command=faqdetail&boa_seq="+boa_seq+"",response);
			}
		}else if(command.equals("faqdelete")) {
			int boa_seq = Integer.parseInt(request.getParameter("boa_seq"));
			int res = biz.delete(boa_seq);
			
			if(res > 0) {
				jsResponse("삭제가 완료되었습니다.","faq.do?command=faqlist&currentpage=1",response);
			}else {
				jsResponse("삭제를 실패하였습니다.","faq.do?command=faqlist&currentpage=1",response);
			}
		}else if(command.equals("cntplus")) {
			int boa_seq = Integer.parseInt(request.getParameter("boa_seq"));
			int boa_cnt = Integer.parseInt(request.getParameter("boa_cnt"));
			System.out.println(boa_cnt+"보아씨엔티첫번째");
			int res = biz.cntplus(boa_seq, boa_cnt);
			System.out.println(boa_cnt+"보아씨엔티");
			if(res > 0) {
				jsResponse("카운팅완료","faq.do?command=faqlist&currentpage=1",response);
			}
			
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
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"')");
		out.println("location.href='"+url+"'");
		out.println("</script>");
	}

}
