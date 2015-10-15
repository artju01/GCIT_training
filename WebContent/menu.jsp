<!DOCTYPE html>
<html lang="en">
  <head>
    
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <header id="header">      
        <div class="container">
            <div class="row">
                <div class="col-sm-12 overflow">
                   <div class="social-icons pull-right">
                        <ul class="nav nav-pills">
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                            <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                            <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div> 
                </div>
             </div>
        </div>
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="index.html">
                    	<h1><img src="images/logo.png" alt="logo"></h1>
                    </a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li class="dropdown"><a href="#">Administrator <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="adminAuthor.jsp">Author</a></li>
                                <li><a href="adminBook.jsp">Book</a></li>
                                <li><a href="adminBranch.jsp">Branch</a></li>
                                <li><a href="adminBorrower.jsp">Borrower</a></li>       
                                <li><a href="adminPublisher.jsp">Publisher</a></li>
                             	<li><a href="adminBookLoan.jsp">Book Loan</a></li>
                            </ul>
                        </li>                    
                        <li class="dropdown"><a href="blog.html">Librarian <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="librarianBranch.jsp">Branch</a></li>
                                <li><a href="blogtwo.html">Book</a></li>   
                            </ul>
                        </li>
                        <li class="dropdown"><a href="portfolio.html">Borrower <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="portfolio.html">Check out book</a></li>
                                <li><a href="portfoliofour.html">Check in bookr</a></li>
                            </ul>
                        </li>                         
                        <li><a href="shortcodes.html ">Shortcodes</a></li>                    
                    </ul>
                </div>
                <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
  </body>
  
 <script src="./scripts/jquery.min.js"></script>
<script src="./scripts/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="./scripts/ie10-viewport-bug-workaround.js"></script>
<script src="./scripts/handlebars-v4.0.2.js"></script>

<!-- DatePicker -->
<script src="./js/bootstrap-formhelpers.js"></script>
<link href="css/bootstrap-formhelpers.css" rel="stylesheet">
<link href="css/bootstrap-formhelpers.min.css" rel="stylesheet">

</html>


