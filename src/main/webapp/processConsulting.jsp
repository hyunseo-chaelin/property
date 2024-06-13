<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%@ include file="dbconn.jsp"%>
<%@ include file="menu.jsp"%>
<%
    // 폼 데이터 수집
    String name = request.getParameter("name");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    String investmentGoal = request.getParameter("investmentGoal");
    String budget = request.getParameter("budget");
    String additionalRequests = request.getParameter("additionalRequests");

    // 전화번호 전체로 합치기
    String phone = phone1 + "-" + phone2 + "-" + phone3;

    // 데이터 유효성 검사
    if (name == null || name.isEmpty() || 
        phone1 == null || phone1.isEmpty() ||
        phone2 == null || phone2.isEmpty() ||
        phone3 == null || phone3.isEmpty() ||
        investmentGoal == null || investmentGoal.isEmpty() ||
        budget == null || budget.isEmpty()) {

        out.println("<script>alert('모든 필드를 채워주세요.'); history.back();</script>");
    } else {
        // 데이터베이스에 저장 (필요한 경우)
        PreparedStatement pstmt = null;

        try {
            // 데이터베이스 연결 설정
            String dbURL = "jdbc:mysql://localhost:3306/propertyDB"; // 데이터베이스 URL
            String dbUser = "root"; // 데이터베이스 사용자 이름
            String dbPassword = "1234"; // 데이터베이스 비밀번호

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL 쿼리 작성
            String sql = "INSERT INTO consulting (name, phone, investmentGoal, budget, additionalRequests) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            pstmt.setString(3, investmentGoal);
            pstmt.setString(4, budget);
            pstmt.setString(5, additionalRequests);

            // 데이터베이스에 데이터 삽입
            int result = pstmt.executeUpdate();

            if (result > 0) {
                // 데이터 삽입이 성공하면 결제 페이지로 리디렉션
                String encodedName = java.net.URLEncoder.encode(name, "UTF-8");
                String encodedPhone = java.net.URLEncoder.encode(phone, "UTF-8");
                String encodedInvestmentGoal = java.net.URLEncoder.encode(investmentGoal, "UTF-8");
                String encodedBudget = java.net.URLEncoder.encode(budget, "UTF-8");
                String encodedAdditionalRequests = java.net.URLEncoder.encode(additionalRequests, "UTF-8");
                String redirectURL = "payment.jsp?name=" + encodedName +
                                     "&phone=" + encodedPhone +
                                     "&investmentGoal=" + encodedInvestmentGoal +
                                     "&budget=" + encodedBudget +
                                     "&additionalRequests=" + encodedAdditionalRequests;
                response.sendRedirect(redirectURL);
            } else {
                out.println("<script>alert('컨설팅 신청에 실패하였습니다. 다시 시도해주세요.'); history.back();</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('오류가 발생하였습니다: " + e.getMessage() + "'); history.back();</script>");
        } finally {
            // 리소스 정리
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
            if (conn != null) try { conn.close(); } catch (SQLException ex) {}
        }
    }
%>
