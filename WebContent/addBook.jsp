<%@page import="com.gcit.jdbc.entity.Publisher"%>
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
	List<Publisher> pubs = new AdministratorService().getAllPublisher();
	
	List<Author> selectedAuthors = new ArrayList<Author>();
	List<Genre> selectedGens = new ArrayList<Genre>();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function selectMove(id1, id2) {
		var name;
		var s1 = document.getElementById(id1);
		var s2 = document.getElementById(id2);
		
		for (var i = s1.length-1; i >= 0; i-- )
		{
			if(s1[i].selected) {
				s2.appendChild(s1[i]);
			}
		}
	}
	
	function addBook() {
		document.getElementById('addBookName').value = document.getElementById('bookName').value;
		
		var pubList = document.getElementById("publisherList");
		var pub = pubList.options[pubList.selectedIndex].value;
		document.getElementById('addPubId').value = pub;
		document.addBookForm.submit();
	}
	
</script>

<style>
	.form-control {
		width:auto;
		display:inline-block;
	}
</style>

</head>
<body>
	
	<%@include file="menu.jsp" %>
		
	<form name="addBookForm" action="addBook" method="post">
		<input type="hidden" id="addBookName" name="bookName" />
		<input type="hidden" id="addPubId" name="publisherId" />
		<input type="hidden" id="addAuthor" name="authors" />
		<input type="hidden" id="addGenre" name="genres" />
	

	<h4>Add Book</h4>
	<div>
		Book Name: <input type="text" id=bookName name="bookName" />
	</div>
	<br>
		<h4>Add Author</h4>

		<select class="form-inline" name="author" multiple
			style="width: 150px" id="availableAuthors">
			<%
				for (Author author : authors) {
			%>
			<option value="<%=author.getAuthorId()%>"><%=author.getAuthorName()%></option>
			<%
				}
			%>
		</select>
			<div class="btn-group-vertical">
				<input type="button" id="btAdd" class="btn btn-primary" value=&rarr;
					onclick="selectMove('availableAuthors','selectedAuthors');" /> <input
					type="button" id="btRemove" class="btn btn-primary" value=&larr;
					onclick="selectMove('selectedAuthors','availableAuthors');" />
			</div>

		 <select class="form-inline" name="selectAuthor" multiple
			style="width: 150px" id="selectedAuthors">
			<%
				for (Author author : selectedAuthors) {
			%>
			<option value="<%=author.getAuthorId()%>"><%=author.getAuthorName()%></option>
			<%
				}
			%>
		</select>


		<h4>Add Genre</h4>
	<div><select name="genre" multiple style="width:150px" id="availableGenres">
		<%for(Genre gen:gens) {%>
			<option value="<%=gen.getGenreId() %>"><%=gen.getGenreName() %></option>
		<% } %>
	</select>
	
	<input type="button" value="insert" onclick="selectMove('availableGenres','selectedGenres');"/>
	<input type="button" value="remove" onclick="selectMove('selectedGenres','availableGenres');"/>
		
	<select name="selectGen" multiple style="width:150px" id="selectedGenres">
		<%for(Genre gen:selectedGens) { %>
			<option value="<%=gen.getGenreId() %>"><%=gen.getGenreName() %></option>
		<% } %>
	</select>
	</div>	
	
	<h4>Select Publisher</h4>
	<div><select name="publisher" id="publisherList" style="width:150px">
		<%for(Publisher pub:pubs) {%>
			<option value="<%=pub.getPublisherId() %>"><%=pub.getPublisherName()%></option>
		<% } %>
	</select>
	</div>	
	<br>
	<div>
	<input type="button" value="submit" onclick="javascript:addBook()"/>
	</div>
	
	</form>
</body>
</html>