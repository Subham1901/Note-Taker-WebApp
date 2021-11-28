<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add your note</title>
<%@include file="all.jsp" %>
 <style>
body {
    background-image: url("image/note1.jpg");
   background-size: cover;
  background-repeat: no-repeat;
}
.card{
 background-color: rgba(245, 245, 245, 1);
  opacity: 2;
}
</style>
</head>
<body>

<%@include file="navbar.jsp" %>

<div class="container">
<div style="margin-top: 50px;" class="card">
  <h5 class="card-header">Add Your Note Here</h5>
  <p><%@include file="message.jsp" %></p>
  <div class="card-body">
   <form action="AddNote" method="post">
    
  <div class="form-group">
    <label for="exampleInputEmail1">Title</label>
    <input type="text" name="title" class="form-control" placeholder="Enter Title">
  </div>

<div class="form-group">
    <label for="exampleFormControlTextarea1">Content</label>
    <textarea class="form-control" name="content" rows="3"  placeholder="Enter Content"></textarea>
  </div>
  
  <button  type="submit" class="btn btn-dark">Submit</button>
  <button style="margin-left: 20px;" type="reset" class="btn btn-dark">Reset</button>
</form>
  </div>
</div>
</div>
</body>
</html>