<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Property" %>
<%@ page import="dao.PropertyRepository" %>

<%
    session.invalidate();
    response.sendRedirect("bookmark.jsp");
%>