<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/assets/css/main.css">
<html>
<head>
    <title>Title</title>
    <style>
        .banner-content {
            text-align: center;
            color: white;
        }
        .banner-content h1 {
            font-size: 2.5em;
            margin-bottom: 0.5em;
        }
        .holiday-info {
            font-size: 1.5em;
            color: #FFD700; /* Gold color for better visibility */
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
            padding: 10px;
            border-radius: 10px;
            display: inline-block;
        }
        .holiday-info h2 {
            margin: 0;
        }
        .holiday-info button {
            margin-top: 1em;
            padding: 10px 10px;
            font-size: 1em;
            color: #fff;
            background-color: #e2212f; /* Button color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .holiday-info button:hover {
            background-color: #c91e2a; /* Darker button color on hover */
        }
        video {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            height: auto;
            min-width: 100%;
            min-height: 100%;
            z-index: -1;
            transform: translate(-50%, -50%);
            object-fit: cover;
        }
    </style>
</head>
<body>
<header id="header">
    <a class="logo" href="/index/index">그것 Academy</a>
    <nav>
        <ul>
            <li><a href="#">휴가 신청</a>
                <ul class="dropdown">
                    <li><a href="/holiday/homain?user_id=${sessionScope.loginid}">휴가 신청</a> </li>
                </ul>
            </li>
            <li><a href="#">시험</a>
                <ul class="dropdown">
                    <li><a href="/test/main?user_id=${sessionScope.loginid}">시험 보기</a></li>
                    <li><a href="/test/check?user_id=${sessionScope.loginid}">시험 점수 확인</a></li>
                    <c:if test="${user_category != 0}">
                        <li><a href="/grading/grade?user_id=${sessionScope.loginid}">시험 채점</a></li>
                    </c:if>
                </ul>
            </li>
            <li><a href="/tutor/info">강사 소개</a></li>
            <li><a href="/location/map">찾아오는 길</a></li>
            <li>
                <nav>
                    <a href="#menu" style="margin-left: 10px;">Menu</a>
                </nav>
            </li>
        </ul>
    </nav>
</header>
<!-- Nav -->
<nav id="menu">
    <ul class="links">
        <li><a href="/Calendar/check?user_id=${sessionScope.loginid}">출결 관리</a></li>
        <li><a href="#">회원정보 수정</a></li>
    </ul>
</nav>
<section id="banner">
    <div class="inner banner-content">
        <h1>${dto.user_name}님 휴가 정보</h1>
        <div class="holiday-info">
            <h2>잔여휴가: <fmt:formatNumber value="${dto.user_holiday}" type="number" maxFractionDigits="0"/>일 남았습니다.</h2>
            <button type="button" onclick="location.href='/holiday/submit?user_no=${dto.user_no}'">휴가신청</button>
        </div>
    </div>
    <video autoplay loop muted playsinline src="/images/banner.mp4"></video>
</section>
</body>
</html>
