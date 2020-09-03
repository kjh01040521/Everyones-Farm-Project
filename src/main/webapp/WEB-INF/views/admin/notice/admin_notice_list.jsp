<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header include -->
<%@include file="../include/admin_header.jsp" %>
<!-- include css -->
<!-- admin pagination css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin/admin_pagination.css" />
<!-- admin notice list css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin/notice/admin_notice_list.css" />

<div class="wrapper">
	<main class="notice__main">
		<div class="notice__title">
			<span class="notice__title-text">공지사항 관리</span>
		</div>
		<!-- 공지사항 목록 -->
		<div class="notice__table">
		<table class="notice__n-table">
			<tr class="n-table__tr-head">
				<th class="n-table__th"><input type="checkbox" name="noticeNo" /></th>
				<th class="n-table__th">공지 번호</th>
				<th class="n-table__th">제목</th>
				<th class="n-table__th">작성자</th>
				<th class="n-table__th">작성일</th>
			</tr>
			<c:choose>
				<%-- nList null 일 때 --%>
				<c:when test="${empty pagingNList }"></c:when>
				<%-- nList null 이 아닐 때 --%>
				<c:when test="${not empty pagingNList }">
					<c:forEach items="${pagingNList }" var="n">
					<tr class="n-table__tr-body">
						<td class="n-table__td"><input type="checkbox" name="noticeNo" /></td>
						<td class="n-table__td">${n.noticeNo }</td>
						<td class="n-table__td"><div class="n-table__title-hidden">${n.title }</div></td>
						<td class="n-table__td"><div class="n-table__id-hidden">${n.adminId }</div></td>
						<td class="n-table__td">
							<fmt:formatDate value="${n.regDate }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
		
		<!-- 작성, 삭제 버튼 -->
		<div class="notice__btns-wrap">
			<!-- 작성 버튼 -->
			<span class="notice__btn-write">공지사항 작성</span>
			<!-- 삭제 버튼 -->
			<span class="notice__btn-delete">공지사항 삭제</span>
		</div>
		
		<!-- include pagination -->
		<%@include file="../include/admin_notice-pagination.jsp" %>
		
	</main>
</div>

<!-- footer include -->
<%@include file="../include/admin_footer.jsp" %>