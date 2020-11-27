<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%
String product_id = request.getParameter("product_id");
int amount = Integer.parseInt(request.getParameter("amount"));
String purchase_date = request.getParameter("purchase_date");


try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_6", "1234");
		
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	ResultSet rs = stmt.executeQuery(" SELECT price FROM product where product_id =" + product_id );
	rs.next();
	int price= rs.getInt(1);
	rs.close();
	
	String insert ="insert into sale(sale_id, product_id, PURCHASE_DATE, SALE_PRICE, AMOUNT) " + 
					" values(seq_sale.nextval, %s, '%s', %d, %d)";
	stmt2.executeQuery(String.format(insert, product_id, purchase_date,price* amount,amount ));
	
	conn.commit();
	stmt.close();
	conn.close();

	}
	catch (Exception e) {
	e.printStackTrace();
	}
%>