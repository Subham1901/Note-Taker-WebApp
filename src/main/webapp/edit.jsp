<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.handler.FactoryHandler"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<%@include file="all.jsp" %>
</head>
<body>

<%@include file="navbar.jsp" %>

<%
	int id=Integer.parseInt(request.getParameter("id").trim());
	Session s=FactoryHandler.getFact().openSession();
	Note notes=s.get(Note.class, id);
%>
<div style="padding-top: 50px;" class="card">
  <h5 class="card-header">Edit Your Note Here</h5>
 
  <div class="card-body">
   <form action="EditNote" method="get">
   
   <input value=<%=notes.getId() %> type="hidden" name="noteId">
    
  <div class="form-group">
    <label for="exampleInputEmail1">Title</label>
    <input type="text" name="title" class="form-control" value="<%=notes.getHead() %>">
  </div>

<div class="form-group">
    <label for="exampleFormControlTextarea1">Content</label>
    <textarea class="form-control" name="content" rows="3"  placeholder="Enter Content"><%=notes.getContent() %></textarea>
  </div>
  
  <button  type="submit" class="btn btn-dark">Save</button>
</form>
  </div>
</div>

</body>
</html>