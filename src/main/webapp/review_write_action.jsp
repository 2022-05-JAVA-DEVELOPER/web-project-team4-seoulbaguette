<%@page import="com.itwill.bakery.service.OrderReviewService"%>
<%@page import="com.itwill.bakery.vo.Order_Review"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="user_login_check.jspf"%>  --%>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("review_write_form.jsp");
	return;
}
String user_id="guntae123";
int p_no=Integer.parseInt(request.getParameter("p_no"));
int oi_no=Integer.parseInt(request.getParameter("oi_no"));

String r_title=request.getParameter("r_title");
String r_stargrade=request.getParameter("r_stargrade");
String r_content=request.getParameter("r_content");

Review review=new Review(0,r_title,null,Integer.parseInt(r_stargrade),r_content,user_id,new Product(p_no,null,0,null,null,0,0));

ReviewService reviewService=new ReviewService();

try{
	reviewService.writeReivew(review,oi_no);
	
	response.sendRedirect("order_list_test_review.jsp");
	
}catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>