<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.handler.FactoryHandler"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="all.jsp" %>
</head>
 <style>
body {
    background-image: url("image/note1.jpg");
   background-size: cover;
  background-repeat: no-repeat;
}

</style>
<body>
<%@include file="navbar.jsp" %>

<p><%@include file="message.jsp" %></p>

<%
	Session s=FactoryHandler.getFact().openSession();
	Query q=s.createQuery("from Note");
	List<Note> list=q.list();
	for(Note notes:list){
		%>
		<div class="container">
		<div style="margin-top: 50px;" class="card text-white bg-dark mb-3">
  <div class="card-header">
    <%=notes.getHead() %>
  </div>
  <div class="card-body">
    <p class="card-text"><%=notes.getContent() %></p>
   <a class="btn btn-light" href="edit.jsp?id=<%=notes.getId() %>" >Edit</a>
  	  <a class="btn btn-info" href="DeleteNote?id=<%=notes.getId()%>">Delete</a>
  </div>
  <div class="card-footer text-muted">
   <%=notes.getDate() %>
  </div>
</div>
</div>
		<%
	}

%>

</body>
</html>