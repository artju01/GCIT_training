
<%@page import="com.gcit.jdbc.entity.Genre"%>
<%@page import="com.gcit.jdbc.entity.Author"%>
<%@page import="com.gcit.jdbc.entity.Book"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gcit.jdbc.service.AdministratorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Book> books = new AdministratorService().getAllBooks(); 
	String message = (String) request.getAttribute("message");
	String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LMS</title>

<script>
	function deleteBook(id) {
		document.getElementById('bookId').value = id;
		document.deleteBranchForm.submit();
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

<form name="deleteBranchForm" action="deleteBook" method="post">
	<input type="hidden" id="bookId" name="bookId" />
</form>
	<table>
		<tr>
			<td>Book Name</td>
			<td>Authors</td>
			<td>Publisher</td>
			<td>Genre</td>
		</tr>
		<%for(Book book : books ) {%>
		<tr>
			<td><%=book.getTitle()%></td>
			<td>
				<select name="authorList"  id="authorList">
				<%for(Author auth:book.getAuthors()) { %>
				<option value="<%=auth.getAuthorId() %>"><%=auth.getAuthorName() %></option>
				<% } %>
				</select>
			</td>
			<td>
				<select name="genreList"  id="genreList">
				<%for(Genre gen:book.getGenres()) { %>
				<option value="<%=gen.getGenreId() %>"><%=gen.getGenreName() %></option>
				<% } %>
				</select>
			</td>
			<td><%=book.getPublisher().getPublisherName()%></td>
			<td><input type="button" value="Edit" onclick="javascript:window.location='editAuthor.jsp'+'?bookId=<%=book.getBookId()%>';"/></td>
			<td><input type="button" value="Delete" onclick="javascript:deleteBook('<%=book.getBookId()%>');"/></td>
		</tr>
		<% } %>
		
		
	</table>


</body>
</html>