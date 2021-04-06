<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row justify-content-center">
    <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-6 d-none d-lg-block custom-bg-image"><%--로그인 이미지--%></div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                            </div>
                            <form class="user">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="userId" name="userId" value="${param.id}" maxlength="15" placeholder="아이디를 입력해 주세요." onkeyup="idKeyUp();" onkeydown="onEnterSubmit(event);" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="pwd" name="pwd" value="${param.pwd}" placeholder="비밀번호를 입력해 주세요." onkeydown="onEnterSubmit(event);" required/>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox small">
                                        <input type="checkbox" class="custom-control-input" id="idSaveCheck" onchange="checkChange();"/>
                                        <label class="custom-control-label" for="idSaveCheck">아이디 저장</label>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-primary btn-user btn-block" onclick="getLogin();">로그인</button>
                                <hr>
                                <div class="text-center">
<%--                                    <a class="small" href="${pageContext.request.contextPath}/login/findId.do">아이디 찾기</a>--%>
                                    <a class="small" href="${pageContext.request.contextPath}/login/findPw.do">비밀번호 초기화</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/login/loginJoin.do">회원가입</a>
                                </div>
                            </form>
                            <hr>
                            <div class="text-left">
                                <span class="font-weight-bold">- 문의 -</span><br>
                                <span class="font-weight-bold">연습 ( test@test.com )</span><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#userId").focus();
        var key = getCookie("sample");
        $("#userId").val(key);

        if ($("#userId").val() !== "") {
            $("#idSaveCheck").prop("checked", true);
        }
    });

    function onEnterSubmit(a) {
        var evt = a || window.event;

        if (evt.keyCode === 13) {
            if ($("#userId").val() === "") {
                alert("아이디를 입력해 주세요.");
            } else if ($("#pwd").val() === "") {
                alert("비밀번호를 입력해 주세요.");
                $("#pwd").focus();
            } else {
                getLogin();
            }
        }
    }

    function checkChange() {
        if ($("#idSaveCheck").is(":checked")) {
            setCookie("sample", $("#userId").val(), 7);
        } else {
            deleteCookie("sample");
        }
    }

    function idKeyUp() {
        if ($("#idSaveCheck").is(":checked")) {
            setCookie("sample", $("#userId").val(), 7);
        }
    }

    function setCookie(cookieName, value, exdays) {
        var expireDate = moment().add(exdays, "days").toDate();
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + expireDate);
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = moment().add(-1, "days").toDate();
        document.cookie = cookieName + "= " + "; expires=" + expireDate;
    }

    function getCookie(cookieName) {
        cookieName = cookieName + "=";
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = "";

        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(";", start);

            if (end == -1) {
                end = cookieData.length;
            }
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }

    function getLogin() {
        var param = {
            userId: $("#userId").val(),
            pwd: $("#pwd").val()
        };

        $.ajax({
            type: "POST",
            dataType: "json",
            data: param,
            url: contextPath + "/login/loginCheck.do",
            success: function(data) {
                if (data.result == "success") {
                    location.href = contextPath + "/main.do";
                } else if (data.result == "fail") {
                    alert("계정정보가 없습니다.\n아이디와 비밀번호를 확인해 주세요.");
                    $("#userId").val("");
                    $("#pwd").val("");
                    $("#userId").focus();
                } else if (data.result == "diff") {
                    alert("비밀번호가 맞지 않습니다. (오류 횟수: " + data.count + ")\n비밀번호 오류 10회가 초과되면 계정이 잠깁니다.");
                    $("#pwd").val("");
                    $("#pwd").focus();
                } else if (data.result == "lock") {
                    alert("비밀번호 오류 10회가 초과하여 계정이 잠겼습니다.\n비밀번호 초기화 후 이용해주세요.\n(잠긴날짜: " + data.date + ")");
                }
            }
        });
    }
</script>