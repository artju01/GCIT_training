<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Administrator | Book</title>
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
                            <h1 class="title">Book Data</h1>
                            <p>List of all books</p>
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
										id="searchText" onkeyup="javascript:searchBooksFromCurrntPage()" />
					</h4>
					<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align:center">Book name</th>
									<th style="text-align:center">Author</th>
									<th style="text-align:center">Publisher</th>
									<th style="text-align:center">Genre</th>
									<th style="text-align:center">Edit</th>
									<th style="text-align:center">Delete</th>
								</tr>
							</thead>
							<tbody id="dataEntry">
							</tbody>

					</table>
                    
                    <h5 align="center">
						<button type="button" class="btn btn-default"
									onclick="javascript:launchAddModal();">Add New Book
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
        <h4 class="modal-title">Delete Book</h4>
      </div>
      <div class="modal-body">
        <form name="deleteFrm" action="deleteBorrower" method="post">
        	<p>Are you sure you want to delete this book?</p>
        	<input type="hidden" name="deletedBookId" id="deletedBookId"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="deleteBook();">Save changes</button>
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
				<h4 class="modal-title">Add New Book</h4>
			</div>
			<div class="modal-body">
				<h2>Book Name</h2>
				<input name="addedBookName" id="addedBookName" />
				<h3>Select Authors</h3>
				<h4>
				<input type="text" placeholder="Enter text to search Authors"
					id="searchTextAuthor" onkeyup="javascript:searchAuthors()" /> 
				</h4>	
				
				<select id=availableAuthors multiple style="width: 150px">
				</select>
				<div class="btn-group-vertical">
					<input type="button" id="btAdd" class="btn btn-primary"
						value=&rarr;
						onclick="selectMove('availableAuthors','selectedAuthors');" /> <input
						type="button" id="btRemove" class="btn btn-primary" value=&larr;
						onclick="selectRemove('selectedAuthors');" />
				</div>
				<select id=selectedAuthors multiple style="width: 150px">
				</select>
				
				<h4>Select Publisher</h4>	
				<h4>
				<input type="text" placeholder="Enter text to search Publishers"
					id="searchTextPublisher" onkeyup="javascript:searchPublishers()" /> 
				</h4>
				<select id=availablePublishers style="width: 150px">
				</select>
				
				<h3>Select Genres</h3>
				<h4>
				<input type="text" placeholder="Enter text to search Genre"
					id="searchTextGenre" onkeyup="javascript:searchGenres()" /> 
				</h4>	
				
				<select id=availableGenres multiple style="width: 150px">
				</select>
				<div class="btn-group-vertical">
					<input type="button" id="btAdd" class="btn btn-primary"
						value=&rarr;
						onclick="selectMove('availableGenres','selectedGenres');" /> <input
						type="button" id="btRemove" class="btn btn-primary" value=&larr;
						onclick="selectRemove('selectedGenres');" />
				</div>
				<select id=selectedGenres multiple style="width: 150px">
				</select>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="addBook();">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="editModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Edit Book</h4>
			</div>
			<div class="modal-body">
				<h2>Book Name</h2>
				<input type="hidden" name="editBookId" id="editedBookId"/>
				<input name="editedBookName" id="editedBookName" />
				<h3>Select Authors</h3>
				<h4>
				<input type="text" placeholder="Enter text to search Authors"
					id="searchTextAuthorEdit" onkeyup="javascript:searchAuthors()" /> 
				</h4>	
				
				<select id=availableAuthorsEdit multiple style="width: 150px">
				</select>
				<div class="btn-group-vertical">
					<input type="button" id="btAdd" class="btn btn-primary"
						value=&rarr;
						onclick="selectMove('availableAuthorsEdit','selectedAuthorsEdit');" /> <input
						type="button" id="btRemove" class="btn btn-primary" value=&larr;
						onclick="selectRemove('selectedAuthorsEdit');" />
				</div>
				<select id=selectedAuthorsEdit multiple style="width: 150px">
				</select>
				
				<h4>Select Publisher</h4>	
				<h4>
				<input type="text" placeholder="Enter text to search Publishers"
					id="searchTextPublisherEdit" onkeyup="javascript:searchPublishers()" /> 
				</h4>
				<select id=availablePublishersEdit style="width: 150px">
				</select>
				
				<h3>Select Genres</h3>
				<h4>
				<input type="text" placeholder="Enter text to search Genre"
					id="searchTextGenreEdit" onkeyup="javascript:searchGenres()" /> 
				</h4>	
				
				<select id=availableGenresEdit multiple style="width: 150px">
				</select>
				<div class="btn-group-vertical">
					<input type="button" id="btAdd" class="btn btn-primary"
						value=&rarr;
						onclick="selectMove('availableGenresEdit','selectedGenresEdit');" /> <input
						type="button" id="btRemove" class="btn btn-primary" value=&larr;
						onclick="selectRemove('selectedGenresEdit');" />
				</div>
				<select id=selectedGenresEdit multiple style="width: 150px">
				</select>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="editBook();">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script id="entry-template" type="text/x-handlebars-template">
  <tr>
    <td align="center">{{title}}</td>
	<td align="center">
		<select>
    		{{#each authors}}
   		 		<option value="{{authorId}}">{{authorName}}</option>
    		{{/each}}
		</select>
	</td>
	<td align="center">{{publisher.publisherName}}</td>
	<td align="center">
		<select>
    		{{#each genres}}
   		 		<option value="{{genreId}}">{{genreName}}</option>
    		{{/each}}
		</select>
	</td>
	<td align="center"><button type="button" class="btn btn-primary" onclick="javascript:launchEditModal('{{bookId}}','{{title}}');">Edit</button></td>
	<td align="center"><button type="button" class="btn btn-danger" onclick="javascript:launchDelModal('{{bookId}}');">Delete</button></td>
  </tr>
</script>

<script id="pageNo-template" type="text/x-handlebars-template">
	<li><a href="javascript:pageBook({{pageNo}});">{{pageNo}}</a></li>
</script>

<script id="authorList-template" type="text/x-handlebars-template"> 
   	<option value="{{authorId}}">{{authorName}}</option>
</script>

<script id="publisherList-template" type="text/x-handlebars-template"> 
   	<option value="{{publisherId}}">{{publisherName}}</option>
</script>

<script id="genreList-template" type="text/x-handlebars-template"> 
   	<option value="{{genreId}}">{{genreName}}</option>
</script>

<script>
	var source = $("#entry-template").html();
	var template = Handlebars.compile(source);
	
	var maxPage = 0;

	var dataString = "";
	$.ajax({
		method : "POST",
		url : "listBooks"
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
		url : "countBooks"
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
	/*function launchModal(id, name, address, phone) {
		$('#modalTitle').html("Edit Borrower"+" ("+name+")");
		$('#updatedBorrowerId').val(id);
		$('#updatedBorrowerName').val(name);
		$('#updatedBorrowerAddress').val(address);
		$('#updatedBorrowerPhone').val(phone);
		$('#myModal').modal();
	}*/
	
	function launchDelModal(id) {
		$('#deletedBookId').val(id);
		$('#deleteModal').modal();
	}
	
	function launchAddModal() {
		$('#addModal').modal();
		
		//reset data
		$('#addedBookName').val("");
		$('#selectedAuthors').empty();
		$('#selectedGenres').empty();
		
		searchAuthors();
		searchPublishers();
		searchGenres();
	}
	
	function launchEditModal(bookId, bookName) {
		$('#editModal').modal();
		
		//reset data
		$('#editedBookId').val(bookId);
		$('#editedBookName').val(bookName);
		$('#selectedAuthorsEdit').empty();

		searchAuthors();
		searchPublishers();
		searchGenres();
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
	function deleteBook(id) {
		$('#deleteModal').modal('hide');
		var id = $('#deletedBookId').val();
		var dataString;
		$.ajax({
			method : "POST",
			url : "deleteBook",
			data : {bookId:id}
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
			url : "countBooks"
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
			
			reloadBooksList();
		});
	}
	
	function reloadBooksList() {
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
			url : "listBooks",
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
	
	function pageBook(page) {
		currentPage = page;
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "listBooks",
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
			pageBook(currentPage);
		} 
	}
	
	function previousPage() {
		if (currentPage > 1) {
			currentPage--;
			pageBook(currentPage);
		} 
	}
	
	
	function searchBooksFromCurrntPage() {
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "searchBooksWithIndex",
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
	
	function searchAuthors() {
		dataString = "";
		var source = $("#authorList-template").html();
		var template = Handlebars.compile(source);
		$.ajax({
			  method: "POST",
			  url: "searchAuthors",
			  data: {
				  		searchText: $("#searchTextAuthor").val(),
						page: currentPage  
			 		}
			}).done(function( data ) {	
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#availableAuthors").html(dataString);
				$("#availableAuthorsEdit").html(dataString);
			});
	}
	
	function searchPublishers() {
		var dataString = "";
		var source = $("#publisherList-template").html();
		var template = Handlebars.compile(source);
		$.ajax({
			  method: "POST",
			  url: "searchPublishers",
			  data: {
				  		searchText: $("#searchTextPublisher").val(),
						page: currentPage  
			 		}
			}).done(function( data ) {	
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#availablePublishers").html(dataString);
				$("#availablePublishersEdit").html(dataString);
			});
	}
	
	function searchGenres() {
		var dataString = "";
		var source = $("#genreList-template").html();
		var template = Handlebars.compile(source);
		$.ajax({
			  method: "POST",
			  url: "searchGenres",
			  data: {
				  		searchText: $("#searchTextGenre").val(),
						page: currentPage  
			 		}
			}).done(function( data ) {	
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#availableGenres").html(dataString);
				$("#availableGenresEdit").html(dataString);
		});
	}
	
	function addBook() {
		var bookName = $('#addedBookName').val();
		var pub = $("#availablePublishers").val();
		
		var authorsList = new Object(); 
		$('#selectedAuthors').each(function(i, entry){ 
			var object = new Object();
			authorsList = $(entry).val(); 
		});
		
		var genresList = new Object();  
		$('#selectedGenres').each(function(i, entry){ 
			genresList = $(entry).val(); 
		});
		
		$.ajax({
			  method: "POST",
			  url: "addBook",
			  data: {			
				  		bookName:bookName,
						authors:authorsList,
						publisher:pub,
						genres:genresList
			 		}
			}).done(function( data ) {	
				$('#addModal').modal('hide');
				pagination();
				alert('Success!');
			});
	}
	
	function editBook() {
		$('#editModal').modal('hide');
		var bookId = $('#editedBookId').val();
		var bookName = $('#editedBookName').val();
		var pub = $("#availablePublishersEdit").val();
		
		var authorsList = new Object(); 
		$('#selectedAuthorsEdit').each(function(i, entry){ 
			var object = new Object();
			authorsList = $(entry).val(); 
		});
		
		var genresList = new Object();  
		$('#selectedGenresEdit').each(function(i, entry){ 
			genresList = $(entry).val(); 
		});
		
		$.ajax({
			  method: "POST",
			  url: "editBook",
			  data: {
				  		bookId:bookId,
				  		bookName:bookName,
						authors:authorsList,
						publisher:pub,
						genres:genresList
			 		}
			}).done(function( data ) {	
				$('#addModal').modal('hide');
				pagination();
				alert('Success!');
			});
	}
	
	function selectMove(id1, id2) {
		var name;
		var s1 = document.getElementById(id1);
		var s2 = document.getElementById(id2);
		
		for (var i = s1.length-1; i >= 0; i-- )
		{
			if(s1[i].selected) {
				s2.appendChild(s1[i]);
			}
		}
	}
	
	function selectRemove(id1) {
		var name;
		var s1 = document.getElementById(id1);
		
		for (var i = s1.length-1; i >= 0; i-- )
		{
			if(s1[i].selected) {
				s1.removeChild(s1[i]);
			}
		}
	}
</script>
</html>
