<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>서울고궁안내 - 관리자>자주묻는질문>삭제</title>

	<!-- Icons -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- Common CSS -->
	<%@ include file="/WEB-INF/views/managerViews/layout/jspf/commonCss.jspf" %>
	
	<!-- Page level CSS -->
	<c:url value="/resources/vendor/manager/datatables/dataTables.bootstrap4.css" var="dataTablesBootstrap4Css" />
	<link href="${dataTablesBootstrap4Css}" rel="stylesheet">
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body id="page-top">
	<div id="wrapper">
		
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/managerViews/layout/sidebar.jsp"></jsp:include>
		<!-- Sidebar -->
		
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				
				<!-- TopBar -->
				<jsp:include page="/WEB-INF/views/managerViews/layout/topbar.jsp"></jsp:include>
				<!-- TopBar -->

				<!-- Container Fluid-->
				<div class="container-fluid" id="container-wrapper">
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">자주 묻는 질문 삭제</h1>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/royal/manage/main/index">Home</a></li>
							<li class="breadcrumb-item">자주 묻는 질문</li>
							<li class="breadcrumb-item active" aria-current="page">삭제</li>
						</ol>
					</div>

					<!-- Row -->
					<div class="row">

						<!-- 취소창 -->
						<div class="col-lg-12">
							<div class="card mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">자주 묻는 질문 삭제</h6>
								</div>
								<div class="card-body">
									<form action="/royal/manage/main/faq/post/delete" method="post">
										<div class="form-group">
											<input type="text" class="form-control" id="faq_id" name="faq_id" placeholder="삭제할 자주 묻는 질문 ID">
										</div>
										<button type="button" id="submitBtn" class="btn btn-primary">삭제하기</button>
										<input id="submitInput" type="submit" style="display: none;">
									</form>
								</div>
							</div>
						</div>

						<!-- DataTable with Hover -->
						<div class="col-lg-12">
							<div class="card mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">자주 묻는 질문 목록</h6>
								</div>
								<div class="table-responsive p-3">
									<table class="table align-items-center table-flush table-hover" id="dataTableHover">
										<thead class="thead-light">
											<tr>
												<th>ID</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>내용</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>ID</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>내용</th>
											</tr>
										</tfoot>
										<tbody>
											<c:forEach items="${FAQList}" var="FAQ">
												<tr id="${FAQ.faq_id}" class="tableRowData" data-toggle="modal" data-target="#detailModal">
													<td style="word-break:break-all">${FAQ.faq_id}</td>	
													<c:set var="royal_id" value="${FAQ.royal_id}"></c:set>
													<c:choose>
														<c:when test="${royal_id eq 1}">
															<c:set var="royal_type" value="경복궁"></c:set>
														</c:when>
														<c:when test="${royal_id eq 2}">
															<c:set var="royal_type" value="창덕궁"></c:set>
														</c:when>
														<c:when test="${royal_id eq 3}">
															<c:set var="royal_type" value="창경궁"></c:set>
														</c:when>
														<c:when test="${royal_id eq 4}">
															<c:set var="royal_type" value="덕수궁"></c:set>
														</c:when>
														<c:when test="${royal_id eq 5}">
															<c:set var="royal_type" value="종묘"></c:set>
														</c:when>
													</c:choose>
													
													<td width="100px" style="word-break:break-all">${royal_type}</td>
													<td style="word-break:break-all">${FAQ.faq_title}</td>
													<td style="word-break:break-all">${FAQ.faq_result}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--Row-->
					
				</div>
				<!---Container Fluid-->

			</div>
			
			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/managerViews/layout/footer.jsp"></jsp:include>
			<!-- Footer -->
			
		</div>
	</div>

	<!-- Scroll to top -->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Common JS -->
	<%@ include file="/WEB-INF/views/managerViews/layout/jspf/commonJs.jspf" %>
	
	<!-- Individual JS -->
	<c:url value="/resources/js/manager/faq/delete.js" var="deleteJS" />
	<script src="${deleteJS}"></script>
	
	<!-- Page level plugins -->
	<c:url value="/resources/vendor/manager/datatables/jquery.dataTables.js" var="dataTablesJs" />
	<c:url value="/resources/vendor/manager/datatables/dataTables.bootstrap4.js" var="dataTablesBootstrap4Js" />
  	<script src="${dataTablesJs}"></script>
  	<script src="${dataTablesBootstrap4Js}"></script>
	
	<!-- Page level custom scripts -->
	<script>
		$(document).ready(function () {
		  $('#dataTable').DataTable(); // ID From dataTable 
		  $('#dataTableHover').DataTable(); // ID From dataTable with Hover
		});
	</script>
</body>

</html>