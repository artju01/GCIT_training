<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Administrator | Branch</title>
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
                            <h1 class="title">Library Branch</h1>
                            <p>List of all branches</p>
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
                	<h4 align="center"><input type="text" placeholder="Enter text to search"
										id="searchText" onkeyup="javascript:searchBranchesFromCurrntPage()" />
					</h4>
                    <div class="row" id=branchEntry>
                         
                    </div>
                    
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
        <form name="editFrm" action="editBranch" method="post">
        	<input type="hidden" name="updatedBranchId" id="updatedBranchId"/>
        	<h2>New branch name</h2>
        	<input name="updatedBranchName" id="updatedBranchName"/>
        	<h2>New branch address</h2>
        	<input name="updatedBranchAddress" id="updatedBranchAddress"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitEditBranch();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="manageModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modal-manage-title"></h4>
      </div>
      <div class="modal-body" >   
      	<input type="hidden" name="editedBranchId" id="editedBranchId"/>
         <table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align:center">Book Name</th>
									<th style="text-align:center">Book Copies</th>
									<th style="text-align:center">Save Change</th>									
								</tr>
							</thead>
							<tbody id="bookCopiesTable">
							</tbody>

					</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script id="entry-template" type="text/x-handlebars-template">
	<div class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded mockup">
     	<div class="portfolio-wrapper">
        	<div class="portfolio-single">
              	<div class="portfolio-thumb">
                 	<img src="images/portfolio/6.jpg" class="img-responsive" alt="" id="imageIcon">
             	</div>
                <div class="portfolio-view">
                 	<ul class="nav nav-pills">
           				<li><a href="javascript:launchModal('{{branchId}}','{{name}}','{{address}}');"></i></a></li>
						<li><a href="javascript:launchManageModal('{{branchId}}','{{name}}');"></i></a></li>    
               		</ul>
         		</div>
      		</div>
            <div class="portfolio-info ">
            	<h2>{{name}}</h2>
				<h2>{{address}}</h2>
         	</div>
     	</div>
	</div>
</script>

<script id="pageNo-template" type="text/x-handlebars-template">
	<li><a href="javascript:pageBranch({{pageNo}});">{{pageNo}}</a></li>
</script>

<script id="bookcopies-template" type="text/x-handlebars-template">
  <tr>
    <td align="center">{{book.title}}</td>
	<td align="center"><input name="noOfCopiesModal" id="noOfCopiesModal" value={{noOfCopies}} onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></td>
	<td align="center"><button type="button" class="btn btn-primary" onclick="submitEditBookCopies({{book.bookId}});">Save changes</button></td>
  </tr>
</script>

<script>
	var source = $("#entry-template").html();
	var template = Handlebars.compile(source);
	
	var maxPage = 0;

	var dataString = "";
	$.ajax({
		method : "POST",
		url : "listBranches"
	}).done(function(data) {
		data = $.parseJSON(data);
		$.each(data, function(i, item) {
			var html = template(item);
			dataString += html;
		});
		
		  
		$("#branchEntry").html(dataString);
		
		$(".portfolio-thumb img").each(function( index ) {
			var number = Math.floor(Math.random() * 20) + 1;
			this.src = "images/portfolio/"+number+".jpg";
		});
	});
	
	var pageSource = $("#pageNo-template").html();
	var pageNoTemplate = Handlebars.compile(pageSource);
	var pageDataString = "";
	$.ajax({
		method : "POST",
		url : "countBranches"
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
	function launchModal(id, name, address) {
		$('#modalTitle').html("Edit Branch"+" ("+name+")");
		$('#updatedBranchId').val(id);
		$('#updatedBranchName').val(name);
		$('#updatedBranchAddress').val(address);
		
		$('#myModal').modal();
	}
	
	function launchManageModal(id, name) {
		$('#modal-manage-title').html(name+" Management");
		$('#editedBranchId').val(id);
		$('#manageModal').modal();
		
		//bookCopiesTable
		var dataString = "";
		var bookCopieSource = $("#bookcopies-template").html();
		var bookCopiesTemplate = Handlebars.compile(bookCopieSource);
		
		$.ajax({
			method : "POST",
			url : "listBookCopiesForBranch",
			data : {branchId:id}
		}).done(function(data) {
			data = $.parseJSON(data);
			$.each(data, function(i, item) {
				var html = bookCopiesTemplate(item);
				dataString += html;
			});
			$("#bookCopiesTable").html(dataString);
		});
		
	}
	
	function submitEditBookCopies(bookId) {
		$('#myModal').modal('hide');
		
		var id = $('#editedBranchId').val();
		var copies = $('#noOfCopiesModal').val()
		

		var dataString ="";
		$.ajax({
			method : "POST",
			url : "editBookCopies",
			data : {
						bookId:bookId,
						branchId:id,
						noOfCopies:copies
					}
		}).done(function(data) {
			alert("Success");
		});
	}

	function submitEditBranch() {
		var id = $('#updatedBranchId').val();

		var dataString ="";
		$.ajax({
			method : "POST",
			url : "editBranch",
			data : {
						branchId:id,
						branchName:name,
						branchAddress:address
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
			url : "countBranches"
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
			reloadBranchList();
		});
	}
	
	function reloadBranchList() {
		if (currentPage > Math.ceil(currentCount/10)) {
			currentPage--;
		}
		else if (currentPage < Math.ceil(currentCount/10)) {
			currentPage = Math.ceil(currentCount/10);
		}
		
		var source = $("#entry-template").html();
		var template = Handlebars.compile(source);

		var dataString = "";
		$.ajax({
			method : "POST",
			url : "listBranchesWithPage",
			data : {pageNo:currentPage}
		}).done(function(data) {
			data = $.parseJSON(data);
			$.each(data, function(i, item) {
				var html = template(item);
				dataString += html;
			});
			$("#branchEntry").html(dataString);
			
			$(".portfolio-thumb img").each(function( index ) {
				var number = Math.floor(Math.random() * 20) + 1;
				this.src = "images/portfolio/"+number+".jpg";
			});
		});		
	}
	
	function pageBranch(page) {
		currentPage = page;
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "listBranches",
			  data: {pageNo: page}
			}).done(function( data ) {
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#branchEntry").html(dataString);
				
				$(".portfolio-thumb img").each(function( index ) {
					var number = Math.floor(Math.random() * 20) + 1;
					this.src = "images/portfolio/"+number+".jpg";
				});
			});
		
	}
	
	function nextPage() {
		if (currentPage < maxPage) {
			currentPage++;
			pageBranch(currentPage);
		} 
	}
	
	function previousPage() {
		if (currentPage > 1) {
			currentPage--;
			pageBranch(currentPage);
		} 
	}
	
	
	function searchBranchesFromCurrntPage() {
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "searchBranchesWithIndex",
			  data: {
				  		searchText: $("#searchText").val(),
						page: currentPage  
			 		}
			}).done(function( data ) {
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#branchEntry").html(dataString);
			});
	} 
	

</script>
</html>
