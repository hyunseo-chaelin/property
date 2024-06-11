<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Property" %>

<%
    String id = request.getParameter("propertyId");
    if (id != null && !id.trim().isEmpty()) {
        ArrayList<Property> bookmarklist = (ArrayList<Property>) session.getAttribute("bookmarklist");
        if (bookmarklist != null) {
            Property bookmarkQnt = null;
            for (int i = 0; i < bookmarklist.size(); i++) {
                bookmarkQnt = bookmarklist.get(i);
                if (bookmarkQnt.getPropertyID().equals(id)) {
                    bookmarklist.remove(bookmarkQnt);
                    break; // 삭제 후 루프 종료
                }
            }
        }
    }
    response.sendRedirect("bookmark.jsp");
%>
