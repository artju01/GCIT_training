<%@include file="menu.jsp" %>
	
<style>
	.nav {
		margin-left: 5%;
	}
</style>


	<ul class="nav nav-pills">
        <li class="active"><a href="#">Administrator</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Author<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="addAuthor.jsp">Add Author</a>
  				
            </li>
            <li><a href="listAuthors.jsp">List Authors</a></li>                       
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Book<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Add Book</a></li>
            <li><a href="#">List Books</a></li>                       
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Borrower<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Add Borrower</a></li>
            <li><a href="#">List Borrowers</a></li>                       
          </ul>
        </li>
      </ul>

	
</body>
</html>