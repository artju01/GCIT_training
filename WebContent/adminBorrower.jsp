<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Portfolio Two Columns | Triangle</title>
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
                            <h1 class="title">Borrower Data</h1>
                            <p>List of all borrowers</p>
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
										id="searchText" onkeyup="javascript:searchBorrowersFromCurrntPage()" />
					</h4>
					<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align:center">Name</th>
									<th style="text-align:center">Address</th>
									<th style="text-align:center">Phone</th>
									<th style="text-align:center">Edit</th>
									<th style="text-align:center">Delete</th>
								</tr>
							</thead>
							<tbody id="dataEntry">
							</tbody>

					</table>
                    
                    <h5 align="center">
						<button type="button" class="btn btn-default"
									onclick="javascript:launchAddModal();">Add New Borrower
						</button>
					</h5>
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
        	<input type="hidden" name="updatedBorrowerId" id="updatedBorrowerId"/>
        	<h2>New name</h2>
        	<input name="updatedBorrowerName" id="updatedBorrowerName"/>
        	<h2>New address</h2>
        	<input name="updatedBorrowerAddress" id="updatedBorrowerAddress"/>
        	<h2>New phone</h2>
        	<input name="updatedBorrowerPhone" id="updatedBorrowerPhone"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitEditBorrower();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Branch</h4>
      </div>
      <div class="modal-body">
        <form name="deleteFrm" action="deleteBorrower" method="post">
        	<p>Are you sure you want to delete this branch?</p>
        	<input type="hidden" name="deletedBorrowerId" id="deletedBorrowerId"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="deleteBorrower();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="addModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add New Library Branch</h4>
      </div>
      <div class="modal-body">   
        	<h2>Name</h2>
        	<input name="addedBorrowerName" id="addedBorrowerName"/>
        	<h2>Address</h2>
        	<input name="addedBorrowerAddress" id="addedBorrowerAddress"/> 
        	<h2>Phone</h2>
        	<input name="addedBorrowerPhone" id="addedBorrowerPhone"/>     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="addBorrower();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script id="entry-template" type="text/x-handlebars-template">
  <tr>
    <td align="center">{{name}}</td>
	<td align="center">{{address}}</td>
	<td align="center">{{phone}}</td>
	<td align="center"><button type="button" class="btn btn-primary" onclick="javascript:launchModal('{{cardNo}}','{{name}}','{{address}}','{{phone}}');">Edit</button></td>
	<td align="center"><button type="button" class="btn btn-danger" onclick="javascript:launchDelModal('{{cardNo}}');">Delete</button></td>
  </tr>
</script>

<script id="pageNo-template" type="text/x-handlebars-template">
	<li><a href="javascript:pageBorrower({{pageNo}});">{{pageNo}}</a></li>
</script>

<script>
	var source = $("#entry-template").html();
	var template = Handlebars.compile(source);
	
	var maxPage = 0;

	var dataString = "";
	$.ajax({
		method : "POST",
		url : "listBorrowers"
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
		url : "countBorrowers"
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
	function launchModal(id, name, address, phone) {
		$('#modalTitle').html("Edit Borrower"+" ("+name+")");
		$('#updatedBorrowerId').val(id);
		$('#updatedBorrowerName').val(name);
		$('#updatedBorrowerAddress').val(address);
		$('#updatedBorrowerPhone').val(phone);
		$('#myModal').modal();
	}
	
	function launchDelModal(id) {
		$('#deletedBorrowerId').val(id);
		$('#deleteModal').modal();
	}
	
	function launchAddModal() {
		$('#addModal').modal();
	}

	function submitEditBorrower() {
		$('#myModal').modal('hide');
		
		var id = $('#updatedBorrowerId').val();
		var name = $('#updatedBorrowerName').val();
		var address = $('#updatedBorrowerAddress').val();
		var phone = $('#updatedBorrowerPhone').val();

		var dataString ="";
		$.ajax({
			method : "POST",
			url : "editBorrower",
			data : {
						cardNo:id,
						name:name,
						address:address,
						phone:phone
					}
		}).done(function(data) {
			pagination();
		});
	}
	function deleteBorrower(id) {
		$('#deleteModal').modal('hide');
		
		var id = $('#deletedBorrowerId').val();
		var dataString;
		$.ajax({
			method : "POST",
			url : "deleteBorrower",
			data : {cardNo:id}
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
			url : "countBorrowers"
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
			console.log(pageDataString);
			$("#pageData").html(pageDataString)
			
			reloadBorrowerList();
		});
	}
	
	function reloadBorrowerList() {
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
			url : "listBorrowers",
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
	
	
	
	function addBorrower() {	
		$('#addModal').modal('hide');
		var name = $('#addedBorrowerName').val();
		var address = $('#addedBorrowerAddress').val();
		var phone = $('#addedBorrowerPhone').val();

		var dataString = "";
		$.ajax({
			method : "POST",
			url : "addBorrower",
			data : {
					name:name,
					address:address,
					phone:phone
					}
		}).done(function(data) {
			pagination();
		});
	}
	
	
	function pageBorrower(page) {
		currentPage = page;
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "listBorrowers",
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
			pageBorrower(currentPage);
		} 
	}
	
	function previousPage() {
		if (currentPage > 1) {
			currentPage--;
			pageBorrower(currentPage);
		} 
	}
	
	
	function searchBorrowersFromCurrntPage() {
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "searchBorrowersWithIndex",
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
				$("#dataEntry").html(dataString);
			});
	} 
	

</script>
</html>
