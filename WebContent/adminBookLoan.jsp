<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Administrator | Book Loans</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet"> 
    <link href="css/animate.min.css" rel="stylesheet"> 
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

</head><!--/head-->

<body>
	<%@include file="menu.jsp" %>
    <!--/#header-->

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">Book Loan Data</h1>
                            <p>List of all Book Loan</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#page-breadcrumb-->

    <section id="projects" class="padding-top">
    	
        <div class="container">
            <div class="row">     
                <div class="col-md-9 col-sm-8">                      
					<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align:center">Book Name</th>
									<th style="text-align:center">Branch Name</th>
									<th style="text-align:center">Borrower Name</th>						
									<th style="text-align:center">Due Date</th>								
									<th style="text-align:center">Change Due Date</th>
								</tr>
							</thead>
							<tbody id="dataEntry">
							</tbody>

					</table>
                    
                    <div class="portfolio-pagination">
                            <ul class="pagination" id ="pageData">
                                      
                            </ul>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#projects-->

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>  
</body>

<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id = modalTitle></h4>
      </div>
      <div class="modal-body">
        <form name="editFrm" action="editBorrower" method="post">  
        	<input type="hidden" name="updatedBranchId" id="updatedBranchId"/>
        	<input type="hidden" name="updatedBookId" id="updatedBookId"/> 
        	<input type="hidden" name="updatedCardNo" id="updatedCardNo"/>
        	<h2>New Due Date</h2>
        	<div class="bfh-datepicker" data-min="01/15/2013" data-close="false" id="datePicker">
			</div>
        	<input name="updatedDueDate" id="updatedDueDate"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitEditBookLoan();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script id="entry-template" type="text/x-handlebars-template">
  <tr>
    <td align="center">{{book.title}}</td>
	<td align="center">{{branch.name}}</td>
	<td align="center">{{borrower.name}}</td>
	<td align="center">{{dueDate}}</td>

	<td align="center"><button type="button" class="btn btn-primary" onclick="javascript:launchModal('{{book.bookId}}','{{branch.branchId}}','{{borrower.cardNo}}','{{dueDate}}','{{dateIn}}');">Change</button></td>
  </tr>
</script>

<script id="pageNo-template" type="text/x-handlebars-template">
	<li><a href="javascript:pageBookLoans({{pageNo}});">{{pageNo}}</a></li>
</script>


<script>
	var source = $("#entry-template").html();
	var template = Handlebars.compile(source);
	
	var maxPage = 0;

	var dataString = "";
	$.ajax({
		method : "POST",
		url : "listBookLoans"
	}).done(function(data) {
		data = $.parseJSON(data);
		$.each(data, function(i, item) {
			var html = template(item);
			dataString += html;
		});	  
		
		$("#dataEntry").html(dataString);

	});
	
	var pageSource = $("#pageNo-template").html();
	var pageNoTemplate = Handlebars.compile(pageSource);
	var pageDataString = "";
	$.ajax({
		method : "POST",
		url : "countBookLoans"
	}).done(function(data) {
		var count = $.parseJSON(data);
		var page = Math.ceil(count/10);
		maxPage = page;
		var jsonPage = [];
		
		pageDataString += "<li><a href=\"javascript:previousPage();\">left</a></li>"
		for ( var i = 1; i<= page; i++ ) {
			var pageObj = {
					"pageNo":i
			}
			jsonPage.push(pageObj);
		}
		
		
		$.each(jsonPage, function(i, item) {
			var html = pageNoTemplate(item);
			pageDataString += html;
		});
		
		pageDataString += "<li><a href=\"javascript:nextPage();\">right</a></li>"
		$("#pageData").html(pageDataString)
	});
</script>

<script>
	function launchModal(bookId, branchId, cardNo, dueDate, dateIn) {
		$('#updatedBookId').val(bookId);
		$('#updatedBranchId').val(branchId);
		$('#updatedCardNo').val(cardNo);
		$('#updatedDueDate').val(dueDate); 
		$('#datePicker').data('min', '10/20/2015');
		$('#myModal').modal();
	}
	
	
	function submitEditBookLoan() {
		$('#myModal').modal('hide');
		
		console.log($('#datePicker').min);
		
		var bookId = $('#updatedBookId').val();
		var branchId = $('#updatedBranchId').val();
		var cardNo = $('#updatedCardNo').val();
		var dueDate = $('#updatedDueDate').val();
		
	
		var dataString ="";
		$.ajax({
			method : "POST",
			url : "editBookLoans",
			data : {
						bookId:bookId,
						branchId:branchId,
						cardNo:cardNo,
						dueDate:dueDate
					}
		}).done(function(data) {
			pagination();
		});
		
	}

	
	var currentPage = 1;
	var currentCount = 0;
	
	
	function pagination() {
		var pageSource = $("#pageNo-template").html();
		var pageNoTemplate = Handlebars.compile(pageSource);
		var pageDataString = "";
		$.ajax({
			method : "POST",
			url : "countBookLoans"
		}).done(function(data) {
			var count = $.parseJSON(data);
			currentCount = count;
		
			var page = Math.ceil(count/10);
			var jsonPage = [];
			for ( var i = 1; i<= page; i++ ) {
				var pageObj = {
						"pageNo":i
				}
				jsonPage.push(pageObj);
			}
			
			pageDataString += "<li><a href=\"javascript:previousPage();\">left</a></li>"
			$.each(jsonPage, function(i, item) {
				var html = pageNoTemplate(item);
				pageDataString += html;
			});
			pageDataString += "<li><a href=\"javascript:previousPage();\">right</a></li>"
			$("#pageData").html(pageDataString)
			
			reloadBookLoansList();
		});
	}
	
	function reloadBookLoansList() {
		var source = $("#entry-template").html();
		var template = Handlebars.compile(source);
		
		var dataString = "";
		$.ajax({
			method : "POST",
			url : "listBookLoans",
			data : {pageNo:currentPage}
		}).done(function(data) {
			data = $.parseJSON(data);
			$.each(data, function(i, item) {
				var html = template(item);
				dataString += html;
			});
			$("#dataEntry").html(dataString);
		});		
	}
	
	function pageBookLoans(page) {
		currentPage = page;
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "listBookLoans",
			  data: {pageNo: page}
			}).done(function( data ) {
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#dataEntry").html(dataString);
				
			});
		
	}
	
	function nextPage() {
		if (currentPage < maxPage) {
			currentPage++;
			pageBookLoans(currentPage);
		} 
	}
	
	function previousPage() {
		if (currentPage > 1) {
			currentPage--;
			pageBookLoans(currentPage);
		} 
	}
	
	


	function editBook() {
		var bookName = $('#editedBookName').val();
		var pub = $("#availablePublishersEdit").val();

		var authorsList = new Object();
		$('#selectedAuthorsEdit').each(function(i, entry) {
			var object = new Object();
			authorsList = $(entry).val();
		});

		var genresList = new Object();
		$('#selectedGenresEdit').each(function(i, entry) {
			genresList = $(entry).val();
		});

		$.ajax({
			method : "POST",
			url : "editBook",
			data : {
				bookName : bookName,
				authors : authorsList,
				publisher : pub,
				genres : genresList
			}
		}).done(function(data) {
			$('#addModal').modal('hide');
			pagination();
			alert('Success!');
		});
	}
</script>
</html>
