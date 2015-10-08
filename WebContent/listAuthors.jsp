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

<style>
	.message {
		font-color:green;
	}
	.error {
		font-color:red;
	}
	.table {
		
	}
	.form-inline {
		margin-left: 10%;
		margin-right: 50%;
	}
	#addAuthorContainer.container {
		background-color: #D4D4D4;
		margin-top: 2%;
		margin-bottom: 2%;
	}
</style>

</head>
<body>

<%@include file="menu.jsp" %>


<%if(message != null) {%>
	<span class="message"><%=message%></font></span>
<% } %>
<%if(error != null) {%>
	<span class="error"><%=error%></font></span>
<% } %>

<div id = addAuthorContainer class="container">
	<br>
	<div class="form-inline" id = addAuthor>
  		<form name="addForm" action="addAuthor" method="post">
  			<label for="newName">Name:</label>
  			<input type="text" class="form-control" id="newName" name="newAuthorName">
  			<button type="button" class="btn btn-default"  onclick="javascript:addAuthor();">Add</button>
  		</form>
	</div>
	<br>
</div>

<div class="container">
	<table class="table table-hover ">
		<thead>
		<tr>
			<th>Author Name</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		</thead>
		<tbody>
		<%for(Author author:authors) {%>
		<tr>
			<td><%=author.getAuthorName()%></td>
			<td><button type="button" class="btn btn-primary" onclick="javascript:launchModal('<%=author.getAuthorId()%>', '<%=author.getAuthorName()%>');">Edit</button></td>
			<td><button type="button" class="btn btn-danger" onclick="javascript:launchDelModal('<%=author.getAuthorId()%>');">Delete</button></td>
		</tr>
		<% } %>
		</tbody>
		
	</table>
</div>


<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Author</h4>
      </div>
      <div class="modal-body">
        <form name="editFrm" action="editAuthor" method="post">
        	<input type="hidden" name="updatedAuthorId" id="updatedAuthorId"/>
        	<input name="updatedAuthorName" id="updatedAuthorName"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitEditAuthor();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Author</h4>
      </div>
      <div class="modal-body">
        <form name="deleteFrm" action="deleteAuthor" method="post">
        	<p>Are you sure you want to delete this author?</p>
        	<input type="hidden" name="deletedAuthorId" id="deletedAuthorId"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="deleteAuthor();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
	function launchModal(id, name) {
		$('#updatedAuthorId').val(id);
		$('#updatedAuthorName').val(name);
		$('#myModal').modal();
	}
	
	function launchDelModal(id) {
		$('#deletedAuthorId').val(id);
		$('#deleteModal').modal();
	}

	function submitEditAuthor() {
		document.editFrm.submit();
	}
	function deleteAuthor(id) {
		document.deleteFrm.submit();
	}
	
	function addAuthor() {
		document.addForm.submit();
	}

</script>

</body>
</html>