<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
	<div>
		<a class="sidebar-brand d-flex align-items-center justify-content-center ha" href="${pageContext.request.contextPath}/main.do">
			<div class="sidebar-brand-text mx-3">
				<b>메인</b>
			</div>
		</a>
	</div>
	<hr tabindex="0" class="sidebar-divider my-0" onkeyup="if(event.keyCode==13){scrollKey();}">

	<li class="nav-item">
		<a class="nav-link" href="${pageContext.request.contextPath}/main.do"
		   data-href="/main.do">
			<i class="material-icons fl fs24">&#xe88a;</i>
			<span>메인페이지</span>
        </a>
	</li>

	<li class="nav-item">
		<a class="nav-link" href="${pageContext.request.contextPath}/notice.do"
		   data-href="/notice.do,/addNotice.do,/modNotice.do">
			<i class="material-icons fl fs24">&#xe7f4;</i>
			<span>공지사항</span>
		</a>
	</li>

	<hr class="sidebar-divider">

	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
			<i class="material-icons fl fs24">&#xe30d;</i>
			<span>메뉴1</span>
		</a>
		<div id="collapse1" class="collapse" aria-labelledby="heading1" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="btn-focus collapse-item" href="${pageContext.request.contextPath}/script/script.do"
				   data-href="/script/script.do,/script/addScript.do,/script/modScript.do">서브 메뉴1</a>
				<a class="btn-focus collapse-item" href="${pageContext.request.contextPath}/collect/progress.do"
				   data-href="/collect/progress.do,/collect/work.do,/collect/detail.do,/collect/script.do,/collect/device.do">서브 메뉴2</a>
				<a class="btn-focus collapse-item" href="${pageContext.request.contextPath}/collect/result.do"
				   data-href="/collect/result.do">서브 메뉴3</a>
			</div>
		</div>
	</li>

	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse2" aria-expanded="true" aria-controls="collapse2">
			<i class="material-icons fl fs24">&#xe8d6;</i>
			<span>메뉴2</span>
		</a>
		<div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="btn-focus collapse-item" href="${pageContext.request.contextPath}/api/user.do"
				   data-href="/api/user.do,/api/addUser.do,/api/modUser.do">서브 메뉴1</a>
				<a class="btn-focus collapse-item" href="${pageContext.request.contextPath}/api/history.do"
				   data-href="/api/history.do,/api/batch.do">서브 메뉴2</a>
			</div>
		</div>
	</li>

	<hr class="sidebar-divider d-none d-md-block">

    <div class="fixed-name text-center text-white overflow-hidden">
        <span>-&nbsp;문의&nbsp;-</span>
        <br>
		<div class="text-center">
			<span>연습</span>
			<span>test@test.com</span>
			<br>
		</div>
    </div>

</ul>

<script>
	$(function() {
		$("#accordionSidebar a:not(.collapsed)").each(function(idx, val) {
			var $val = $(val);
			var pathname = $(location).attr("pathname");
			var href = $val.data("href");
			if (href != undefined && href.indexOf(pathname) > -1) {
				if ($val.hasClass("nav-link")) {
					$val.parent().addClass("active");
				} else if ($val.hasClass("collapse-item")) {
					$val.addClass("active");
					$val.parent().parent().addClass("show");
					$val.parent().parent().parent().addClass("active");
					if ($("#accordionSidebar").width() < 150) {
					    $val.parent().parent().prev().click();
                    }
				}
			}
		});
	});
</script>
