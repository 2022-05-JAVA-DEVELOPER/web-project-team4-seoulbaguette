<%@page import="com.itwill.bakery.service.QnAService"%>
<%@page import="com.itwill.bakery.vo.QnA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

QnA qna=new QnA();
qna.setQna_no(Integer.parseInt(request.getParameter("qna_no")));
qna.setQna_title(request.getParameter("qna_title"));
qna.setUser_id(request.getParameter("user_id"));
qna.setQna_content(request.getParameter("qna_content"));
qna.setGroupno(Integer.parseInt(request.getParameter("groupno")));

QnAService.getInstance().update(qna);
String pageno="1";
if(request.getParameter("pageno")!=null){
	pageno=request.getParameter("pageno");
}

response.sendRedirect(
		String.format("qna_view.jsp?qna_no=%d&pageno=%s&groupno=%d",
							qna.getQna_no(),pageno,qna.getGroupno()));


%>