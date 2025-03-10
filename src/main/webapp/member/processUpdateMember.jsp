<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="../dbconn.jsp" %>
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
    String mail2 = request.getParameter("mail2");
    String mail = mail1 + "@" + mail2;
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

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
    String cvc = request.getParameter("cvc");
    
    java.sql.Timestamp timestamp = new java.sql.Timestamp(System.currentTimeMillis());
    
    // null 값을 빈 문자열로 변환
    cardType = (cardType != null) ? cardType : "";
    cardName = (cardName != null) ? cardName : "";
    cardNumber = (cardNumber != null) ? cardNumber : "";
    cardExpiration = (cardExpiration != null) ? cardExpiration : "";
    cvc = (cvc != null) ? cvc : "";

    // Connection 객체를 가져옴
    if (conn == null) {
        out.println("데이터베이스 연결을 사용할 수 없습니다.<br>");
    } else {
        PreparedStatement pstmt = null;
        try {
            String sql = "UPDATE member SET password = ?, name = ?, gender = ?, birth = ?, mail = ?, phone = ?, address = ?, cardType = ?, cardName = ?, cardNumber = ?, cardExpiration = ?, cvc = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, password);
            pstmt.setString(2, name);
            pstmt.setString(3, gender);
            pstmt.setString(4, birth);
            pstmt.setString(5, mail);
            pstmt.setString(6, phone);
            pstmt.setString(7, address);
            pstmt.setString(8, cardType);
            pstmt.setString(9, cardName);
            pstmt.setString(10, cardNumber);
            pstmt.setString(11, cardExpiration);
            pstmt.setString(12, cvc);
            pstmt.setString(13, id);

            int result = pstmt.executeUpdate();
            if (result >= 1) {
                response.sendRedirect("resultMember.jsp?msg=0");
            } else {
                response.sendRedirect("resultMember.jsp?msg=2");
            }
        } catch (SQLException ex) {
            out.println("SQL 오류가 발생했습니다.<br>");
            out.println("SQLException: " + ex.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
        }
    }
%>
