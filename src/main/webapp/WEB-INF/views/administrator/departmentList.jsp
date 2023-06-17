<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
	#row {
	  display: flex;
	  justify-content: center; /* 가로 방향으로 가운데 정렬 */
	  align-items: center; /* 세로 방향으로 가운데 정렬 */
	}
	
	.col-custom {
	  flex-grow: 1;
	}
</style>
<title>Insert title here</title>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/professor_header.jsp"></c:import>
		</sec:authorize>
			
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->
	
		<div class="content-wrapper">
			<div class="col">
					
				<!-- header start -->
				<div class="row">
					<div class="col mt-3">
						<div class="card">
							<h3 class="my-3 mx-3">학과 조회</h3>
						</div>
					</div>
				</div>
				<!-- header end -->
	
				<!-- Default box -->
				<div class="card">
					<div class="card-header">
							
						<div class="card-tools">
							<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>		
						</div>
					
						<!-- Search -->
						<form action="./departmentList" id="search-form">
								<input type="hidden" name="page" value="1">
									<div class="row justify-content-center mx-auto my-3" >
										<div class="col-custom">
											<div class="row"  id="row">
												<div class="col-2">
													<div class="form-group">
														<label>상태</label>
														<select class="select2" name="status" style="width: 100%;">
															<option value="">전체</option>
															<option value="1">사용가능</option>
															<option value="0">사용불가</option>
															
														</select>
													</div>
												</div>
												<div class="col-2">
													<div class="form-group">
														<label>단과 대학</label>
														<select class="select2" name="collegeNum" style="width: 100%;">
															<option value="">전체</option>
															<c:forEach items="${college}" var="collegeVO">
																<option value="${collegeVO.collegeNum}">${collegeVO.collegeName}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											<div class="col-4">
												<div class="form-group">
													<label>학과</label>
													<div class="input-group">
														<input type="text" class="form-control" name="search" placeholder="학과를 입력하세요.">
														<div class="input-group-append">
															<button type="submit" class="btn btn-default" id="submit">
																<i class="fas fa-search "></i>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							
						</form>
					</div>
						   <!-- Default box -->
				        <div class="card-body p-0">
							<table class="table table-hover text-nowrap" style="text-align : center;"  id="table2">
				              <thead>
				                  <tr>
				                      <th style="width: 10%">
				                         학과 번호
				                      </th>
				                      <th style="width: 10%">
				                          단과 대학
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          학과
				                      </th>
				                      <th style="width : 18%">
				                          사용 여부
				                      </th>
				                      <th style="width: 10%">
				                 
				                      </th>
				                    
				                  </tr>
				              </thead>
				              <tbody>
				              	<c:forEach items="${list}" var="collegeVO">
									<c:set value="${collegeVO.collegeName}" var="collegeName"></c:set>
									<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
										<c:set value="${departmentVO.deptNum}" var="deptNum"></c:set>
										<c:set value="${departmentVO.deptName}" var="deptName"></c:set>
										<c:set value="${departmentVO.status}" var="status"></c:set>
										<tr class="dept">
											<c:if test="${status eq 1 }">
												<td><c:out value="${deptNum}"></c:out></td>
												<td><c:out value="${collegeName}"></c:out></td>
												<td><c:out value="${deptName}"></c:out></td>
												<td>
													<select name="status" class="select2" style="width : 31%">
														<option value="1" selected>사용가능</option>
														<option value="0">사용불가</option>
													</select>
												</td>
											</c:if>
											<c:if test="${status eq 0 }">
												<td style="color: #E2E2E2;"><c:out value="${deptNum}"></c:out></td>
												<td style="color: #E2E2E2;"><c:out value="${collegeName}"></c:out></td>
												<td style="color: #E2E2E2;"><c:out value="${deptName}"></c:out></td>
												<td>
													<select name="status" class="select2" style="width : 31%">
														<option value="1">사용가능</option>
														<option value="0" selected>사용불가</option>
													</select>
												</td>
											</c:if>
											<td>
												<button type="button" class="btn btn-primary" id="deptUpdate" data-dept="${deptNum}">
												수정
												</button>
											</td>
										</tr>
									</c:forEach>
									
								</c:forEach>
				            </tbody>
				          </table>
				        </div>
					<!-- /.card-body -->
					<!-- Pagination -->
				    	<div class="row g-3 justify-content-center" style="margin: 20px auto;" id="pagination">
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-sm mx-auto" style="width: 200px;">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./departmentList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./departmentList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./departmentList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./departmentList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./departmentList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
					   </div>
					<div class="wrapper" style="margin : 0 20px 20px 0;">
						 <a href="./departmentAdd"><button type="button" id="add2" class="btn btn-info" style="float : right;">학과 등록</button></a>
					 </div>
				</div>
			</div>
		</div>
	</div>
				
	<!-- ./wrapper -->

<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript" src="../js/administrator/departmentList.js"></script>	
<script type="text/javascript">
/* 페이지네이션 선택 색상 */

   $(function () {
      $('.select2').select2()
    });
</script>

</body>
</html>