<!DOCTYPE html>
<!-- saved from url=(0050)http://getbootstrap.com/examples/navbar-fixed-top/ -->
<html lang="en"><script type="text/javascript" src="chrome-extension://kajfghlhfkcocafkcjlajldicbikpgnp/catcher.js"><!-- script injected by Request Maker --></script><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">

    <title>LMS</title>

    <!-- Bootstrap core CSS -->
    <link href="./scripts/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./scripts/navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./scripts/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://getbootstrap.com/examples/navbar-fixed-top/#">LMS</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">Home</a></li>
            <li class="dropdown">
          		<a href="admin.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Administrator <span class="caret"></span></a>
          		<ul class="dropdown-menu">
            		<li><a href="listAuthors.jsp">Author</a></li>
            		<li role="separator" class="divider"></li>
            		<li><a href="addBook.jsp">Book</a></li>
            		<li role="separator" class="divider"></li>
            		<li><a href="#">Branch</a></li>
            		<li role="separator" class="divider"></li>
            		<li><a href="#">Borrower</a></li>
          		</ul>
        	</li>
            <li><a href="librarian.jsp">Librarian</a></li>
            <li><a href="borrower.jsp">Borrower</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./scripts/jquery.min.js"></script>
<script src="./scripts/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="./scripts/ie10-viewport-bug-workaround.js"></script>
    
