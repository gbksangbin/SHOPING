<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>상품별 매출 현황</h3>
<table border="1">
    <tr>
        <td>상품명</td>
        <td>총 판매 금액</td>
        <td>판매 개수</td>
    </tr>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_6", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(" SELECT  name, sum(SALE_PRICE), sum(AMOUNT) " + 
    								" FROM sale,product WHERE SALE.PRODUCT_ID= PRODUCT.PRODUCT_ID "+
    								" group by name");
    
    while (rs.next()) {
        %>
            <tr>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getInt(2) %></td>
                <td><%=rs.getInt(3) %></td>
            </tr>
        <%
    }
    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}
%>

</table>