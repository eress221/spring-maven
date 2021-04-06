<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <tiles:insertAttribute name="header" />
	<title>기본 타이틀 - <tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body id="page-top">
	<div id="wrapper">
		<tiles:insertAttribute name="leftMenu" />
		<div id="loading" class="custom-loading">
			<div class="text-center">
				<img src="${pageContext.request.contextPath}/resources/img/loading.svg" alt="loading..." style="width:250px;margin-top:10%;"/>
				<br><span class="h2 text-white">Loading...</span>
			</div>
		</div>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<tiles:insertAttribute name="topMenu" />
				<div class="container-fluid">
					<tiles:insertAttribute name="content" />
				</div>
			</div>
		</div>
	</div>

	<a class="scroll-to-top rounded" href="#page-top">
		<i class="material-icons mt-2">&#xe5d8;</i>
	</a>
	<tiles:insertAttribute name="footer" />
</body>
</html>
