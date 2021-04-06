<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setStatus(200);%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<title>기본 타이틀</title>
</head>
<body class="bg-white">
	<div id="loading" class="custom-loading">
		<div class="text-center">
			<img src="${pageContext.request.contextPath}/resources/img/loading.svg" alt="loading..." style="width:250px;margin-top:10%;"/>
			<br><span class="h2 text-white">Loading...</span>
		</div>
	</div>
	<div class="container">
		<div class="container-fluid">
			<div class="text-center mt-5 pt-5">
				<c:set var="errorCode" value="${requestScope['javax.servlet.error.status_code']}"/>
				<c:if test="${errorCode ne 403 && errorCode ne 404 && errorCode ne 405 && errorCode ne 500}">
					<c:set var="errorCode" value="500"/>
				</c:if>
				<div class="error mx-auto" data-text="${errorCode}">
					<c:out value="${errorCode}"/>
				</div>
				<p class="lead text-gray-800 mb-5">
					<c:choose>
						<c:when test="${errorCode eq 403}">
							<span>Forbidden</span>
						</c:when>
						<c:when test="${errorCode eq 404}">
							<span>Page Not Found</span>
						</c:when>
						<c:when test="${errorCode eq 405}">
							<span>Method Not Allowed</span>
						</c:when>
						<c:when test="${errorCode eq 500}">
							<span>Internal Server Error</span>
						</c:when>
						<c:otherwise>
							<span>Internal Server Error</span>
						</c:otherwise>
					</c:choose>
				</p>
				<p class="text-gray-500 mb-0">
					<c:choose>
						<c:when test="${errorCode eq 403}">
							<span>접근이 금지되었습니다.</span>
						</c:when>
						<c:when test="${errorCode eq 404}">
							<span>요청하신 페이지는 존재하지 않습니다.</span>
						</c:when>
						<c:when test="${errorCode eq 405}">
							<span>요청된 메소드가 허용되지 않습니다.</span>
						</c:when>
						<c:when test="${errorCode eq 500}">
							<span>서버에 오류가 발생하였습니다.</span>
						</c:when>
						<c:otherwise>
							<span>서버에 오류가 발생하였습니다.</span>
						</c:otherwise>
					</c:choose>
				</p>
				<a href="${pageContext.request.contextPath}/main.do">메인페이지로 이동</a>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>