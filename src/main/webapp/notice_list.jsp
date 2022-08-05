<%@page import="com.itwill.bakery.service.QnAService"%>
<%@page import="com.itwill.bakery.vo.QnAListPageMaker"%>
<%@page import="com.itwill.bakery.vo.QnA"%>
<%@ page import="com.itwill.bakery.vo.Notice"%>
<%@ page import="java.util.List"%>
<%@ page import="com.itwill.bakery.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!public String getTitleString(QnA qna) {
		StringBuilder title = new StringBuilder(128);
		String t = qna.getQna_title();
		if (t.length() > 15) {
			//t = t.substring(0,15);
			//t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입
		
		for (int i = 0; i < qna.getDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		
		if (qna.getDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}
		
		title.append(t.replace(" ", "&nbsp;"));
		
		return title.toString();
	}%>
<%
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}

QnAListPageMaker qnaListPage
		= new QnAService().findQnAList(Integer.parseInt(pageno));

%>
    
<%
NoticeService noticeService = new NoticeService();
List<Notice> noticeList = noticeService.selectAllNotice();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_main.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>공지</b></td>
								</tr>
							</table>	
							
							<!-- **************************************************** -->
							
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">
									</td>
								</tr>
								
							</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">작성일</td>
										<td width=70 align=center bgcolor="E6ECDE">내용</td>
									</tr>
									<%
										for(Notice notice:noticeList) {
									%>
									<tr>
									
										<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<a href='notice_view.jsp?notice_no=<%= notice.getNotice_no()%>'>
										<%=notice.getNotice_title()%>
										</a>
										<td width=70 align=center bgcolor="ffffff" align="left"><%=notice.getNotice_date()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<a href='notice_view.jsp?notice_no=<%= notice.getNotice_no()%>'>
											<%=notice.getNotice_content().toString().substring(0,15)+"..." %>
											<br>
												<%= "<상세 보기>" %>
											</a>
										</td>
									</tr>
									<%
										}
									%>
								</table>
								<!-- /list -->
							</form> <br>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     
							
							
							<!-- **************************************************** -->
				
				</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
