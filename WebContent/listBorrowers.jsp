
<%@page import="com.gcit.jdbc.entity.Borrower"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gcit.jdbc.service.AdministratorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Borrower> borrowers = new AdministratorService().getAllBorrower(); 
	String message = (String) request.getAttribute("message");
	String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LMS</title>

<script>
	function deleteBorrower(id) {
		document.getElementById('cardNo').value = id;
		document.deleteBorrowerForm.submit();
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

<form name="deleteBorrowerForm" action="deleteBorrower" method="post">
	<input type="hidden" id="cardNo" name="cardNo" />
</form>
	<table>
		<tr>
			<td>Name</td>
			<td>Address</td>
			<td>Phone</td>
		</tr>
		<%for(Borrower borrower : borrowers ) {%>
		<tr>
			<td><%=borrower.getName()%></td>
			<td><%=borrower.getAddress()%></td>
			<td><%=borrower.getPhone()%></td>
			<td><input type="button" value="Edit" onclick="javascript:window.location='editAuthor.jsp'+'?cardNo=<%=borrower.getCardNo()%>&name=<%=borrower.getName()%>';"/></td>
			<td><input type="button" value="Delete" onclick="javascript:deleteBorrower('<%=borrower.getCardNo()%>');"/></td>
		</tr>
		<% } %>
		
		
	</table>


</body>
</html>