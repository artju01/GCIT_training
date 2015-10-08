
<%@page import="com.gcit.jdbc.entity.Branch"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gcit.jdbc.service.AdministratorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Branch> branches = new AdministratorService().getAllBranches(); 
	String message = (String) request.getAttribute("message");
	String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LMS</title>

<script>
	function deleteBranch(id) {
		document.getElementById('branchId').value = id;
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

<form name="deleteBranchForm" action="deleteBranch" method="post">
	<input type="hidden" id="branchId" name="branchId" />
</form>
	<table>
		<tr>
			<td>Branch Name</td>
			<td>Address</td>
			<td>Edit</td>
			<td>Delete</td>
		</tr>
		<%for(Branch branch : branches ) {%>
		<tr>
			<td><%=branch.getName()%></td>
			<td><%=branch.getAddress()%></td>
			<td><input type="button" value="Edit" onclick="javascript:window.location='editAuthor.jsp'+'?cardNo=<%=branch.getBranchId()%>&name=<%=branch.getName()%>&address=<%=branch.getAddress()%>';"/></td>
			<td><input type="button" value="Delete" onclick="javascript:deleteBranch('<%=branch.getBranchId()%>');"/></td>
		</tr>
		<% } %>
		
		
	</table>


</body>
</html>