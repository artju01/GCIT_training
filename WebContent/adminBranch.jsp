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
                    <h5 align="center">
						<button type="button" class="btn btn-default"
									onclick="javascript:launchAddModal();">Add New Branch
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

<div class="modal fade" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Branch</h4>
      </div>
      <div class="modal-body">
        <form name="deleteFrm" action="deleteBranch" method="post">
        	<p>Are you sure you want to delete this branch?</p>
        	<input type="hidden" name="deletedBranchId" id="deletedBranchId"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="deleteBranch();">Save changes</button>
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
        	<h2>Branch name</h2>
        	<input name="addedBranchName" id="addedBranchName"/>
        	<h2>Branch address</h2>
        	<input name="addedBranchAddress" id="addedBranchAddress"/>   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="addBranch();">Save changes</button>
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
                 		<li><a href="javascript:launchDelModal('{{branchId}}');"><i class="fa fa-eye"></i></a></li>
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
	
	function launchDelModal(id) {
		$('#deletedBranchId').val(id);
		$('#deleteModal').modal();
	}
	
	function launchAddModal() {
		$('#addModal').modal();
	}

	function submitEditBranch() {
		$('#myModal').modal('hide');
		
		var id = $('#updatedBranchId').val();
		var name = $('#updatedBranchName').val();
		var address = $('#updatedBranchAddress').val();

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
	function deleteBranch(id) {
		$('#deleteModal').modal('hide');
		
		var id = $('#deletedBranchId').val();

		var dataString;
		$.ajax({
			method : "POST",
			url : "deleteBranch",
			data : {branchId:id}
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
			console.log(pageDataString);
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
	
	
	
	function addBranch() {	
		$('#addModal').modal('hide');
		var name = $('#addedBranchName').val();
		var address = $('#addedBranchAddress').val();

		var dataString = "";
		$.ajax({
			method : "POST",
			url : "addBranch",
			data : {
					branchName:name,
					branchAddress:address
					}
		}).done(function(data) {
			pagination();
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
