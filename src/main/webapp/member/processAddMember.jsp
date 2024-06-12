<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm");
	String day = request.getParameter("birthdd");
	String birth = year + "/" + month + "/" + day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address = address1 + " " + address2;
	
	String cardType = request.getParameter("card_type");
	String cardName = request.getParameter("cc_name");
	String cardNum1 = request.getParameter("cc_num_1");
	String cardNum2 = request.getParameter("cc_num_2");
	String cardNum3 = request.getParameter("cc_num_3");
	String cardNum4 = request.getParameter("cc_num_4");
	String cardNumber = cardNum1 + "-" + cardNum2 + "-" + cardNum3 + "-" + cardNum4;
	String cardExpYear = request.getParameter("cc_expiration_yy");
	String cardExpMonth = request.getParameter("cc_expiration_mm");
	String cardExpiration = cardExpYear + "/" + cardExpMonth;
	String cvc = request.getParameter("CVC");
	
	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/propertytDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   	INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
   	<sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=birth%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=timestamp%>" />
	<sql:param value="<%=cardType%>" />
	<sql:param value="<%=cardName%>" />
	<sql:param value="<%=cardNumber%>" />
	<sql:param value="<%=cardExpiration%>" />
	<sql:param value="<%=cvc%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>
