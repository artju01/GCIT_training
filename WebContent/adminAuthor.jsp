<%@ page import="com.gcit.jdbc.entity.Author"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gcit.jdbc.service.AdministratorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<style>
th{
	color: black;
}
</style>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Administrator | Author</title>
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
                            <h1 class="title">Author</h1>
                            <p>Manage authors in the system.</p>
                        </div>
                     </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#page-breadcrumb-->

    <section id="about-company" class="padding-top wow fadeInUp" data-wow-duration="400ms" data-wow-delay="400ms">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
					<div id=addAuthorContainer class="container">
						<br>
						<div class="form-inline" id=addAuthor>
							<form name="addForm" action="addAuthor" method="post">
								<label for="newName">Name:</label> <input type="text"
									class="form-control" id="newName" name="newAuthorName">
								<button type="button" class="btn btn-default"
									onclick="javascript:addAuthor();">Add
								</button>
							</form>
						</div>
						<br>
					</div>
					<div class="container">
						<table>
							<thead>
								<tr>
									<td><input type="text" placeholder="Enter text to search"
										id="searchText" onkeyup="javascript:searchAuthorsFromCurrntPage()" /></td>
								</tr>
							</thead>
							<thead>
								<tr id="pageNo">
								</tr>
							</thead>
						</table>
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align:center">Author Name</th>
									<th style="text-align:center">Edit</th>
									<th style="text-align:center">Delete</th>
								</tr>
							</thead>
							<tbody id="authorsData">
							</tbody>

						</table>
					</div>
					<h1 class="margin-bottom">About the Authors</h1>
                    <p>This is a list of authors in the system.<br /> You can add/edit/delete authors here</p>
                </div>
            </div>
        </div>
    </section>
    <!--/#about-company-->
    
    
	<%@include file="footer.jsp" %>
    <!--/#footer-->

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/jquery.countTo.js"></script>
    <script type="text/javascript" src="js/main.js"></script>   
   
</body>

<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Author</h4>
      </div>
      <div class="modal-body">
        <form name="editFrm" action="editAuthor" method="post">
        	<input type="hidden" name="updatedAuthorId" id="updatedAuthorId"/>
        	<input name="updatedAuthorName" id="updatedAuthorName"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="submitEditAuthor();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Author</h4>
      </div>
      <div class="modal-body">
        <form name="deleteFrm" action="deleteAuthor" method="post">
        	<p>Are you sure you want to delete this author?</p>
        	<input type="hidden" name="deletedAuthorId" id="deletedAuthorId"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="deleteAuthor();">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<script id="entry-template" type="text/x-handlebars-template">
  <tr>
    <td>{{authorName}}</td>
	<td><button type="button" class="btn btn-primary" onclick="javascript:launchModal('{{authorId}}','{{authorName}}');">Edit</button></td>
	<td><button type="button" class="btn btn-danger" onclick="javascript:launchDelModal('{{authorId}}');">Delete</button></td>
  </tr>
</script>

<script id="pageNo-template" type="text/x-handlebars-template">
  	<td><a href="javascript:pageAuthors({{pageNo}});">{{pageNo}}</a></td>
	<td>&nbsp;</td>
</script>

<script>
	var source = $("#entry-template").html();
	var template = Handlebars.compile(source);

	var dataString = "";
	$.ajax({
		method : "POST",
		url : "listAuthors"
	}).done(function(data) {
		data = $.parseJSON(data);
		$.each(data, function(i, item) {
			var html = template(item);
			dataString += html;
		});
		$("#authorsData").html(dataString);
	});
	
	
	var pageSource = $("#pageNo-template").html();
	var pageNoTemplate = Handlebars.compile(pageSource);
	var pageDataString;
	$.ajax({
		method : "POST",
		url : "countAuthors"
	}).done(function(data) {
		var count = $.parseJSON(data);
		var page = Math.ceil(count/10);
		var jsonPage = [];
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
		
		//console.log(pageDataString);
		$("#pageNo").html(pageDataString)
	});

</script>

<script>
	function launchModal(id, name) {
		$('#updatedAuthorId').val(id);
		$('#updatedAuthorName').val(name);
		$('#myModal').modal();
	}
	
	function launchDelModal(id) {
		$('#deletedAuthorId').val(id);
		$('#deleteModal').modal();
	}

	function submitEditAuthor() {
		//document.editFrm.submit();
		$('#myModal').modal('hide');
		
		var id = $('#updatedAuthorId').val();
		var name = $('#updatedAuthorName').val();

		var dataString;
		$.ajax({
			method : "POST",
			url : "editAuthor",
			data : {
						authorId:id,
						authorName:name
					}
		}).done(function(data) {
			reloadAuthorList();
		});
	}
	function deleteAuthor(id) {
		$('#deleteModal').modal('hide');
		
		var id = $('#deletedAuthorId').val();

		var dataString = "";
		$.ajax({
			method : "POST",
			url : "deleteAuthor",
			data : {authorId:id}
		}).done(function(data) {
			pagination();
		});
	}
	
	var currentPage = 1;
	var currentCount = 0;
	
	function pagination() {
		var pageSource = $("#pageNo-template").html();
		var pageNoTemplate = Handlebars.compile(pageSource);
		var pageDataString;
		$.ajax({
			method : "POST",
			url : "countAuthors"
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
			
			
			$.each(jsonPage, function(i, item) {
				var html = pageNoTemplate(item);
				pageDataString += html;
			});
			
			//console.log(pageDataString);
			$("#pageNo").html(pageDataString)
			
			reloadAuthorList();
		});
	}
	
	function reloadAuthorList() {
		if (currentPage > Math.ceil(currentCount/10)) {
			currentPage--;
		}
		else if (currentPage < Math.ceil(currentCount/10)) {
			currentPage = Math.ceil(currentCount/10);
		}
		console.log("current"+currentPage);
		
		var source = $("#entry-template").html();
		var template = Handlebars.compile(source);

		var dataString;
		$.ajax({
			method : "POST",
			url : "listAuthorsWithPage",
			data : {pageNo:currentPage}
		}).done(function(data) {
			data = $.parseJSON(data);
			$.each(data, function(i, item) {
				var html = template(item);
				dataString += html;
			});
			$("#authorsData").html(dataString);
		});		
	}
	
	
	
	function addAuthor() {		
		var name = $('#newName').val();

		var dataString;
		$.ajax({
			method : "POST",
			url : "addAuthor",
			data : {newAuthorName:name}
		}).done(function(data) {
			pagination();
		});
	}
	
	
	function pageAuthors(page) {
		currentPage = page;
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "listAuthors",
			  data: {pageNo: page}
			}).done(function( data ) {
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#authorsData").html(dataString);
			});
		
	}
	
	function searchAuthorsFromCurrntPage() {
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "searchAuthorsWithIndex",
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
				$("#authorsData").html(dataString);
			});
	} 
	
	function searchAuthors() {
		dataString = "";
		$.ajax({
			  method: "POST",
			  url: "searchAuthors",
			  data: {searchText: $("#searchText").val()}
			}).done(function( data ) {
				data = $.parseJSON(data);
				$.each(data, function(i, item) {
					var html = template(item);
					dataString += html;
				});
				$("#authorsData").html(dataString);
			});
	} 

</script>

</html>
