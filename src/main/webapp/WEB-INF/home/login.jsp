<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>학원 홈페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="./assets/css/main.css">
    <style>
        .centered-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .centered-form * {
            margin: 10px; /* 간격 조정 */
            width: 90%; /* 폭 조정 */
            max-width: 300px; /* 최대 폭 설정 */
        }
        #loginForm{
            background-color: #ffffff;
            padding: 30px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
    </style>
</head>
<body class="is-preload">
<div class="centered-form">
    <form id="loginForm">
        <h1>그것</h1>
        <h2>Academy</h2>
        <input type="text" name="user_id" id="userId" placeholder="아이디" required>
        <input type="password" name="user_password" id="userPassword" placeholder="비밀번호" required>
        <button type="button" onclick="login()">로그인</button>
    </form>
    <div id="loginMessage"></div>
    <a href="user/Userform" class="button"> 회원가입</a>
</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script>
    function login() {
        var userId = $("#userId").val();
        var userPassword = $("#userPassword").val();

        $.ajax({
            type: "GET",
            url: "user/logincheck",
            data: {user_id: userId, user_password: userPassword},
            success: function(response) {
                if (response.status === "success") {
                    alert("로그인 되었습니다.");
                    // 로그인 성공 시 이동할 경로 설정
                    window.location.href = "index/index";
                } else {
                    alert("로그인에 실패했습니다. 다시 시도해주세요.");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });

    }
</script>
</body>
</html>
