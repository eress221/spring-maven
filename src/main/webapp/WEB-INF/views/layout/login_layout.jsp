<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <tiles:insertAttribute name="header" />
	<title>기본 타이틀 - <tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body class="bg-gradient-dark">
	<div id="loading" class="custom-loading">
		<div class="text-center">
			<img src="${pageContext.request.contextPath}/resources/img/loading.svg" alt="loading..." style="width:250px;margin-top:10%;"/>
			<br><span class="h2 text-white">Loading...</span>
		</div>
	</div>
	<h1 class="custom-logo">
<%--		<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""/>--%>
		<span>로고 없음</span>
	</h1>
	<div class="container">
		<tiles:insertAttribute name="content" />
	</div>
	<tiles:insertAttribute name="footer" />
</body>
</html>
