<%@page import="com.itwill.bakery.service.QnAService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
<%
	String user_id=request.getParameter("user_id");
	String sUser_id=(String)session.getAttribute("s_u_id");

	Integer qna_no=null;
	Integer pageno=null;

	try {
		qna_no=Integer.valueOf(request.getParameter("qna_no"));
		pageno=Integer.valueOf(request.getParameter("pageno"));

	}catch(Exception ex){
	}
	
	boolean result=true;
	String msg="";
	 if(user_id==sUser_id) {
		
			QnAService.getInstance().remove(qna_no, sUser_id);
			result=true;
			msg="게시물을 삭제하였습니다.";
					
	}else {
		
		result=false;
		msg="삭제 권한이 없습니다.";
	
	}
	


	
	//QnAService qnaService = new QnAService();
	//int result=qnaService.remove(qna_no, sUser_id);
		
	//if(removeCount==0){
	//	try{
			
	//		msg="삭제권한이 없습니다.";
	//		out.println("<script>");
	//		out.println("alert('"+msg+"');");
		//	out.println("location.href='qna_list.jsp';");
		//	out.println("</script>");
			
		//}catch (Exception e){
		//	msg="삭제오류: ";
		//	out.println("<script>");
		//	out.println("alert('"+msg+"');"+e.getMessage());
		//	out.println("location.href='qna_list.jsp';");
		//	out.println("</script>");
		//}
		
	//} 
	//if (removeCount==1){
		
		//	msg="게시물을 삭제하였습니다.";
		//	out.println("<script>");
		//	out.println("alert('"+msg+"');");
		//	out.println("location.href='qna_list.jsp';");
		//	out.println("</script>");
			
		
	//}
	

	
%>
<script type="text/javascript">
<%//if (result) {%>
	alert('<%=msg%>');
	location.href='qna_list.jsp?pageno=<%=pageno%>';
<%//} else {%>
	alert('<%=msg%>');
	location.href='qna_list.jsp?pageno=<%=pageno%>';
<%//}%>
	
</script>
