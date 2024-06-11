<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Property" %>
<%@ page import="dao.PropertyRepository" %>
<jsp:useBean id="propertyDAO" class="dao.PropertyRepository" scope="session" />


<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("propertyforsale.jsp");
        return;
    }

    PropertyRepository dao = PropertyRepository.getInstance();

    Property property = dao.getPropertyById(id);
    if (property == null) {
        response.sendRedirect("exceptionNoProperty.jsp");
    }
    
    ArrayList<Property> bookmarklist = dao.getAllproperty();
    Property bookmark = new Property();
	for (int i = 0; i < bookmarklist.size(); i++) {
		bookmark = bookmarklist.get(i);
    	if (bookmark.getPropertyID().equals(id)) {
        	break;
    	}
	}

	ArrayList<Property> list = (ArrayList<Property>) session.getAttribute("bookmarklist");
	if (list == null) {
    	list = new ArrayList<Property>();
    	session.setAttribute("bookmarklist", list);
	}

	int cnt = 0;
	Property bookmarkQnt = new Property();
	for (int i = 0; i < list.size(); i++) {
		bookmarkQnt = list.get(i);
    	if (bookmarkQnt.getPropertyID().equals(id)) {
        	cnt++;
        	int orderQuantity = bookmarkQnt.getQuantity() + 1;
        	bookmarkQnt.setQuantity(orderQuantity);
    	}
	}
   if (cnt == 0) {
	   bookmark.setQuantity(1);
    list.add(bookmark);
	}

	response.sendRedirect("bookmark.jsp?id=" + id);
%>
