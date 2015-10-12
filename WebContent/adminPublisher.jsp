<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Administrator | Publisher</title>
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
                            <h1 class="title">Publisher Data</h1>
                            <p>List of all publishers</p>
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
										id="searchText" onkeyup="javascript:searchPublishersFromCurrntPage()" />
					</h4>
					<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align:center">Publisher name</th>
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
									onclick="javascript:launchAddModal();">Add New Publisher
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
        	<input type="hidden" name="updatedPublisherId" id="updatedPublisherId"/>
        	<h2>New name</h2>
        	<input name="updatedPublisherName" id="updatedPublisherName"/>
        	<h2>New address</h2>
        	<input name="updatedPublisherAddress" id="updatedPublisherAddress"/>   
        	<h2>New phone</h2>
        	<input name="updatedPublisherPhone" id="updatedPublisherPhone"/>  
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitEditPublisher();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Book</h4>
      </div>
      <div class="modal-body">
        <form name="deleteFrm" action="deleteBorrower" method="post">
        	<p>Are you sure you want to delete this book?</p>
        	<input type="hidden" name="deletedPublisherId" id="deletedPublisherId"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="deletePublisher();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="addModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Add New Publisher</h4>
			</div>
			<div class="modal-body">
				<h2>Publisher Name</h2>
				<input name="addedPublisherName" id="addedPublisherName" />
				<h2>Address</h2>
				<input name="addedPublisherAddress" id="addedPublisherAddress" />
				<h2>Phone</h2>
				<input name="addedPublisherPhone" id="addedPublisherPhone" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="addPublisher();">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<script id="entry-template" type="text/x-handlebars-template">
  <tr>
    <td align="center">{{publisherName}}</td>
	<td align="center">{{address}}</td>
	<td align="center">{{phone}}</td>
	<td align="center"><button type="button" class="btn btn-primary" onclick="javascript:launchModal('{{publisherId}}','{{publisherName}}','{{address}}','{{phone}}');">Edit</button></td>
	<td align="center"><button type="button" class="btn btn-danger" onclick="javascript:launchDelModal('{{publisherId}}');">Delete</button></td>
  </tr>
</script>

<script id="pageNo-template" type="text/x-handlebars-template">
	<li><a href="javascript:pagePublisher({{pageNo}});">{{pageNo}}</a></li>
</script>


<script>
	var source = $("#entry-template").html();
	var template = Handlebars.compile(source);
	
	var maxPage = 0;

	var dataString = "";
	$.ajax({
		method : "POST",
		url : "listPublishers"
	}).done(function(data) {
		data = $.parseJSON(data);
		$.each(data, function(i, item) {
			var html = template(item);
			dataString += html;
		});	  
		console.log(data);
		$("#dataEntry").html(dataString);

	});
	
	var pageSource = $("#pageNo-template").html();
	var pageNoTemplate = Handlebars.compile(pageSource);
	var pageDataString = "";
	$.ajax({
		method : "POST",
		url : "countPublishers"
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
		$('#modalTitle').html("Edit Publisher"+" ("+name+")");
		$('#updatedPublisherId').val(id);
		$('#updatedPublisherName').val(name);
		$('#updatedPublisherAddress').val(address);
		$('#updatedPublisherPhone').val(phone);
		$('#myModal').modal();
	}
	
	function launchDelModal(id) {
		$('#deletedPublisherId').val(id);
		$('#deleteModal').modal();
	}
	
	function launchAddModal() {
		$('#addModal').modal();

		$('#addedPublisherName').val("");
		$('#addedPublisherAddress').val("");
		$('#addedPublisherPhone').val("");

	}
	

	function submitEditPublisher() {
		$('#myModal').modal('hide');
		
		var id = $('#updatedPublisherId').val();
		var name = $('#updatedPublisherName').val();
		var address = $('#updatedPublisherAddress').val();
		var phone = $('#updatedPublisherPhone').val();

		var dataString ="";
		$.ajax({
			method : "POST",
			url : "editPublisher",
			data : {
						id:id,
						name:name,
						address:address,
						phone:phone
					}
		}).done(function(data) {
			pagination();
		});
	}
	function deletePublisher(id) {
		$('#deleteModal').modal('hide');
		var id = $('#deletedPublisherId').val();
		var dataString;
		$.ajax({
			method : "POST",
			url : "deletePublisher",
			data : {id:id}
		}).done(function(data) {
			pagination();
		});
	}
	
	function addPublisher() {
		var publisherName = $('#addedPublisherName').val();
		var publisherAddress = $('#addedPublisherAddress').val();
		var publisherPhone = $('#addedPublisherPhone').val();
		
		$.ajax({
			  method: "POST",
			  url: "addPublisher",
			  data: {
				  		name:publisherName,
						address:publisherAddress,
						phone:publisherPhone
			 		}
			}).done(function( data ) {	
				$('#addModal').modal('hide');
				pagination();
				alert('Success!');
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
			url : "countPublishers"
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
			
			reloadPublisherList();
		});
	}
	
	function reloadPublisherList() {
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
			url : "listPublishers",
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
	
	function pagePublisher(page) {
		currentPage = page;
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "listPublishers",
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
			pagePublisher(currentPage);
		} 
	}
	
	function previousPage() {
		if (currentPage > 1) {
			currentPage--;
			pagePublisher(currentPage);
		} 
	}
	
	

	function searchPublishersFromCurrntPage() {
		var dataString = "";
		$.ajax({
			method : "POST",
			url : "searchPublishersWithIndex",
			data : {
				searchText : $("#searchText").val(),
				page : currentPage
			}
		}).done(function(data) {
			data = $.parseJSON(data);
			$.each(data, function(i, item) {
				var html = template(item);
				dataString += html;
			});
			$("#dataEntry").html(dataString);
		});
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
