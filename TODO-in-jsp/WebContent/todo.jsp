<%@page import="java.util.Arrays" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TODO - HOme</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h1> TODO </h1>
	<form method="POST" action="todo.jsp">
		
		<input type="text" class="input" name="todo" placeholder="Enter yout TODO" autocomplete="off" />
		
		<hr>
		
		<% 
			List<String> items = (List<String>) session.getAttribute("myTodo");
			
			if(items == null) {
				items = new ArrayList<String>();
				session.setAttribute("myTodo", items);
			}
			
			String myItems = request.getParameter("todo");
			
			if(myItems != null && (!myItems.trim().equals(""))) {
				items.add(myItems);
			}
			
			List<String> delit = null;
			
			if(request.getParameter("todos") != null) {
				delit = Arrays.asList(request.getParameterValues("todos"));
			}
			
			if(delit != null) {
				for(String i : delit) {
					i = i.replaceAll("-", " ");
					items.remove(i);
				}
			}
		%>
		
		<ul class="todos">
			
			<% 
				for(String it : items) {
					it = it.replaceAll(" ", "-");
					out.println("<li>" + "<input type="+"checkbox"+" name="+"todos"+" value="+it+" />" + it +"</li>");
				}
			%>
		
		</ul>
		
			<input class="btn" type="submit" value="Submit">
	</form>
	
		<small>Made by <a class="cp" target="_blank" href="http://google.com"> Nitesh </a> <br> </small>
	
</body>
</html>