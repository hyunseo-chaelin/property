<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Property" %>
<%@ page import="dao.PropertyRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\Users\\rin75\\git\\property\\src\\main\\webapp\\resources\\images";
	int maxSize=5 * 1024 * 1024;
	String encType="utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String propertyId=multi.getParameter("propertyId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String description=multi.getParameter("description");
	String city=multi.getParameter("city");
	String district=multi.getParameter("district");
	String area=multi.getParameter("area");
	String releaseDate=multi.getParameter("releaseDate");
	String condition=multi.getParameter("condition");
	String bookmark=multi.getParameter("bookmark");
	String kind=multi.getParameter("kind");
	
	Enumeration files=multi.getFileNames();
	String fname=(String) files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	
	PropertyRepository dao=PropertyRepository.getInstance();
	Property newProperty=new Property();
	
	newProperty.setPropertyID(propertyId);
	newProperty.setName(name);
	newProperty.setUnitPrice(unitPrice);
	newProperty.setCondition(condition);
	newProperty.setKind(kind);
	newProperty.setDescription(description);
	newProperty.setCity(city);
	newProperty.setDistrict(district);
	newProperty.setFilename(filename);
	newProperty.setArea(area);
	
	dao.addProperty(newProperty);
	
	response.sendRedirect("propertyforsale.jsp");
%>