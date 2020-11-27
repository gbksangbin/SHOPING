<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>판매 등록</h3>
<form name="sale_insert" action="action/sale_insert.jsp">
<table border=1>
	<tr>
		<td>판매한 상품</td>
		<td> 
			<select name="product_id">
		        <%
			        try {
			   	 	Class.forName("oracle.jdbc.OracleDriver");
			    	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_6", "1234");
		
					    Statement stmt = conn.createStatement();
					    ResultSet rs = stmt.executeQuery(" SELECT product_ID,name FROM product");
					    
					    
					 
					    while (rs.next()) {
					    	%>
					    	<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
					    	<%
					    }
					    
					    stmt.close();
					    conn.close();
					
		        	}
					catch (Exception e) {
					    e.printStackTrace();
					}
		        %>
			</select>
		</td>
	</tr>
	<tr>
		<td>수량</td>
		<td><input type="number" name="amount"></td>
	</tr>
	<tr>
		<td>판매날짜</td>
		<td><input type="text" name="purchase_date"></td>
	</tr>
	<tr>
		<td><input type="submit" value="제출"></td>
		<td><input type="button" value="다시쓰기" onclick="form_reset()"></td>
	</tr>
</table>
</form>
<script>
	function form_reset() {
			document.sale_insert.reset();
	}
</script>