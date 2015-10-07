<%@page import="com.gcit.jdbc.entity.Genre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.gcit.jdbc.service.AdministratorService"%>
<%@page import="com.gcit.jdbc.entity.Author"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String message = (String) request.getAttribute("message");
	String error = (String) request.getAttribute("error");
	
	List<Author> authors = new AdministratorService().getAllAuthors(); 
	List<Genre> gens = new AdministratorService().getAllGenres(); 
	
	List<Author> selectedAuthors = new ArrayList<Author>();
	List<Genre> selectedGens = new ArrayList<Genre>();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function selectMove(s1, s2) {
		var name;
		for (var i = 0; i < s1.length; i++ )
		{
			if(s1[i].selected) {
				s2.appendChild(s1[i]);
			}
		}
	}
	
</script>

</head>
<body>
	<h4>Add Book</h4>
	<div>
		Book Name: <input type="text" name="bookName" />
	</div>
	<br><br>
	
	<h4>Add Author</h4>
	<div><select name="author" multiple style="width:150px">
		<%for(Author author:authors) {%>
			<option value="<%=author.getAuthorId() %>"><%=author.getAuthorName() %></option>
		<% } %>
	</select>
	
	<input type="button" value="insert" onclick="selectMove(document.getElementsByTagName('select')[0], document.getElementsByTagName('select')[1]);"/>
	<input type="button" value="remove" onclick="selectMove(document.getElementsByTagName('select')[1],document.getElementsByTagName('select')[0]);"/>
		
	<select name="selectAuthor" multiple style="width:150px">
		<%for(Author author:selectedAuthors) { %>
			<option value="<%=author.getAuthorId() %>"><%=author.getAuthorName() %></option>
		<% } %>
	</select>
	</div>	
	
	<h4>Add Genre</h4>
	<div><select name="genre" multiple style="width:150px">
		<%for(Genre gen:gens) {%>
			<option value="<%=gen.getGenreId() %>"><%=gen.getGenreName() %></option>
		<% } %>
	</select>
	
	<input type="button" value="insert" onclick="selectMove(document.getElementsByTagName('select')[2], document.getElementsByTagName('select')[3]);"/>
	<input type="button" value="remove" onclick="selectMove(document.getElementsByTagName('select')[3],document.getElementsByTagName('select')[2]);"/>
		
	<select name="selectGen" multiple style="width:150px">
		<%for(Genre gen:selectedGens) { %>
			<option value="<%=gen.getGenreId() %>"><%=gen.getGenreName() %></option>
		<% } %>
	</select>
	</div>	

</body>
</html>