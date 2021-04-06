<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	<span>상단 메뉴</span>
	<ul class="navbar-nav ml-auto">
		<div class="topbar-divider d-none d-sm-block"></div>
		<li class="nav-item p-1 mr-5">
			<span class="mr-2 d-none d-lg-inline text-gray-600">${sessionScope.userNm}</span>
		</li>
		<li class="nav-item">
			<a class="btn-focus dropdown-item" href="${pageContext.request.contextPath}/updUserInfo.do">
				<i class="material-icons fl mr-2 text-gray-400">&#xe853;</i>
				정보변경
			</a>
		</li>
		<li class="nav-item">
			<a class="btn-focus dropdown-item" href="${pageContext.request.contextPath}/login/logout.do">
				<i class="material-icons fl mr-2 text-gray-400">&#xe879;</i>
				로그아웃
			</a>
		</li>
	</ul>
</nav>
