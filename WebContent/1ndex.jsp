<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/css.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="page1/header.jsp" %>
	<%@include file="page1/nav.jsp" %>
	
	<% 
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
	
	switch(section) {
	case "create_sale":
		%><%@include file="section2/create_sale.jsp"%><%
		break;
	case "sale_list":
		%><%@include file="section2/sale_list.jsp"%><%
		break;
	case "sale_list_by_product":
		%><%@include file="section2/sale_list_by_product.jsp"%><%
		break;
	case "sale_list_by_category":
		%><%@include file="section2/sale_list_by_category.jsp"%><%
		break;
	default:
		%>
		<h3>쇼핑몰 관리 프로그램</h3>
		<pre>
		
<b>쇼핑몰을 관리하기 위한 프로그램이다</b>
		
1.상품테이블, 카테고리 테이블, 매출정보 테이블을 생성한다.
2.판매 등록, 통합 매출 내역 조회, 상품별 매출현황, 카테고리별 매출현황 조회 페이지를 작성한다.
3.올바르게 구현되었는지 확인한다.
		</pre>
		
		<%break;	
		
	}
	%>
	
	
	<%@include file="page1/footer.jsp" %>
	

</body>
</html>