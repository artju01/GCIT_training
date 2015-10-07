<%@ page import="com.gcit.jdbc.entity.Author"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gcit.jdbc.service.AdministratorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Author> authors = new AdministratorService().getAllAuthors(); 
	String message = (String) request.getAttribute("message");
	String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LMS</title>

<script>
	function deleteAuthor(id) {
		document.getElementById('authorId').value = id;
		document.deleteAuthorFrm.submit();
	}
</script>

</head>
<body>
<%if(message != null) {%>
	<span><font color="green"><%=message%></font></span>
<% } %>
<%if(error != null) {%>
	<span><font color="red"><%=error%></font></span>
<% } %>

<form name="deleteAuthorFrm" action="deleteAuthor" method="post">
	<input type="hidden" id="authorId" name="authorId" />
</form>
	<table>
		<tr>
			<td>Author Name</td>
			<td>Edit</td>
			<td>Delete</td>
		</tr>
		<%for(Author author:authors) {%>
		<tr>
			<td><%=author.getAuthorName()%></td>
			<td><input type="button" value="Edit" onclick="javascript:window.location='editAuthor.jsp'+'?authorId=<%=author.getAuthorId()%>&authorName=<%=author.getAuthorName()%>';"/></td>
			<td><input type="button" value="Delete" onclick="javascript:deleteAuthor('<%=author.getAuthorId()%>');"/></td>
		</tr>
		<% } %>
		<select name="authorId" multiple>
		<%for(Author author:authors) {%>
			<option value="<%=author.getAuthorId() %>"><%=author.getAuthorName() %></option>
		<% } %>
		</select>
		
		
	</table>


</body>
</html>