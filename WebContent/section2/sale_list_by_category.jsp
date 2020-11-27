<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>카테고리별 매출현황 조회</h3>
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
    ResultSet rs = stmt.executeQuery(" SELECT  category.name, sum(SALE_PRICE), sum(AMOUNT) " + 
    								" FROM sale,product,category WHERE SALE.PRODUCT_ID= PRODUCT.PRODUCT_ID "+
    								"  AND category.category_id = product.category_id "+
    								" group by category.name ");
    
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