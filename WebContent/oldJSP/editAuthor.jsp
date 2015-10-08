<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function editAuthor() {
		document.getElementById('newName').value = document.getElementById('newNameTextInput').value;
		document.getElementById('authorId').value = <%=request.getParameter("authorId")%>;
		document.editAuthorForm.submit();
	}
</script>

</head>
<body>
<h4>Edit Author</h4>
<div>
&emsp;&emsp;&emsp;&emsp; Name = <%=request.getParameter("authorName")%>
</div>
<div>
	&emsp;&emsp;&emsp;&emsp; New Name = <input type="text" id=newNameTextInput name="newAuthorName" />
	<input type="submit" onclick="javascript:editAuthor();" />
</div>

<form name="editAuthorForm" action="editAuthor" method="post">
	<input type="hidden" id="authorId" name="authorId" />
	<input type="hidden" id="newName" name="newName" />
</form>

</body>
</html>