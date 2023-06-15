<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
<title>Insert title here</title>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../../temp/professor_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../../temp/student_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
			<div class="container-fluid">
				<div class="row">
					<div class="content-wrapper">
							<c:import url="../../temp/sidebar/student_lecture_main.jsp"></c:import>
					</div>
					<div class="col">
						<!-- header start -->
						<div class="row" style="padding-top:10px">
							<div class="col-12">
								<div class="card">
									<h3 class="my-3 mx-3">강의계획서 열람</h3>
								</div>
							</div>
						</div>
						<!-- header end -->
						<div class="card card-default">
          					<!-- card-header start -->
							<div class="card-body">
							<h3 class="my-3 mx-3" style="text-align:center;margin-top:40px;">${lecture.year}년도 ${lecture.semester}학기 강의계획서</h3>
								<div class="row" style="margin-top: 20px">
              						<!-- table-body start -->
              						<div class="card-body">
                						<table class="table table-bordered" style="text-align: center;">
							                <tbody>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">강의 이름</th>
							                		<td colspan="3">${lecture.lectureName}</td>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">교과 구분</th>
							                		<td colspan="3">${lecture.category}</td>
							                	
							                	</tr>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">강의번호</th>
							                		<td>${lecture.lectureNum}</td>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">학부(과)</th>
							                		<td>${lecture.departmentVO.deptName}</td>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">학년</th>
							                		<td>${lecture.grade}학년</td>
							                		
							                	</tr>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">수업시간</th>
							                		<td>${lecture.weekday}${lecture.startTime}-${lecture.endTime}</td>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">수업장소</th>
							                		<td>${lecture.lectureBuilding}${lecture.lectureRoom}</td>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">학점</th>
							                		<td>${lecture.completionGrade}학점</td>
							                	</tr>
											</tbody>
										</table>
										
										<table class="table table-bordered" style="text-align: center;margin-top: 20px">
							                <tbody>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">교과개요</th>
							                		<td colspan="3">${lecture.syllabusVO.curriculumOutline}</td>
							                	</tr>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;vertical-align:middle;" rowspan="2">목표</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">수업방식</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">목표</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">평가방법</th>
							                	</tr>
							                	<tr>
							                		<td>${lecture.syllabusVO.method}</td>
							                		<td>${lecture.syllabusVO.goal}</td>
							                		<td>${lecture.syllabusVO.evaluation}</td>
							                	</tr>
							                	
											</tbody>
										</table>
										
										<table class="table table-bordered" style="text-align: center;margin-top: 20px">
							                <tbody>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;vertical-align:middle;width:210px" rowspan="4">교재 및 참고문서</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">교재명</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">저자</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">출판사</th>
							                	</tr>
							                	<tr>
							                		<td>${lecture.syllabusVO.bookName}</td>
							                		<td>${lecture.syllabusVO.bookAuthor}</td>
							                		<td>${lecture.syllabusVO.bookPublisher}</td>
							                	</tr>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">출판년도</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">ISBN</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">비고</th>
							                	</tr>
							                	<tr>
							                		<td>${lecture.syllabusVO.bookPublicationDate}</td>
							                		<td>${lecture.syllabusVO.bookISBN}</td>
							                		<td>${lecture.syllabusVO.bookNote}</td>
							                	</tr>
							                	
											</tbody>
										</table>
										
										<table class="table table-bordered" style="text-align: center;margin-top: 20px">
                    						<tbody>
	                    						<tr style="background-color:#f8f9fa;color:#17a2b8;">
	                    							<th>차수</th>
                    								<th>수업 주제</th>
                    								<th>주차별 수업목표</th>
                    								<th>관련 역량</th>
                    								<th>비고</th>
	                    						</tr>
		                    					<c:forEach items="${classes}" var="classes">
		                    					
		                    						<tr>
		                    							<td style="vertical-align:middle;">${classes.order}차수</td>
	                    								<td>${classes.subject}</td>
	                    								<td>${classes.goal}</td>
	                    								<td>${classes.capability}</td>
	                    								<td>${classes.note}</td>
	                    							</tr>
		                    					</c:forEach>
	                    						
                    						</tbody>
                    					</table>
									</div>
              						<!-- table-body end -->
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>