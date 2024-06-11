<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assets/css/main.css">
</head>
<body class="is-preload">

<!-- Header -->
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
<!-- Content -->
<c:set var="lastLectureName" value="" />
<c:set var="firstTestNo" value="${list[0].test_no}" />

<!-- 과목명과 사용자 답안 출력 -->
<c:forEach var="dto" items="${list}">
    <c:if test="${lastLectureName != dto.lecture_name}">
        <h2 class="tracking-in-expand">${dto.lecture_name}</h2>
        <h3 class="tracking-in-expand">[${dto.user_name}]님의 답안입니다.</h3>
        <c:set var="lastLectureName" value="${dto.lecture_name}" />
    </c:if>
</c:forEach>

<!-- 폼 시작 -->
<form action="/grading/check" method="get">
    <input type="hidden" name="test_no" value="${firstTestNo}" />
    <input type="hidden" name="user_no" value="${user_no}">
    <c:forEach var="dto" items="${list}">
        <table>
            <tr>
                <th colspan="2">사용자로부터 두 개의 정수를 입력받아, 두 수의 최소공배수(LCM)를 계산하여 출력하는 자바 프로그램을 작성하세요.</th>
            </tr>
            <tr>
                <td>${dto.test_content}</td>
            </tr>
        </table>
    </c:forEach>

    <!-- 폼 내에 채점 내용과 제출 버튼 포함 -->
    <table>
        <tr>
            <th>채점내용</th>
        </tr>
        <tr>
            <td><textarea name="grading_content" required="required" style="width: 100%; height: 150px;" placeholder="내용 입력하셈"></textarea></td>
        </tr>
        <tr>
            <td style="width: 50px;">
                <label>
                    <select name="grading_grade">
                        <option value="A" selected>A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="E">E</option>
                    </select>
                </label>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form>
<footer id="footer">
    <div class="inner">
        <div class="content">
            <section>
                <h3>그것 Academy</h3>
                <p>어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고
                    어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고
                    어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고
                    어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고
                    어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 어쩌고 저쩌고 </p>
            </section>
            <section>
                <h4>넣을 게 없다</h4>
                <ul class="alt">
                    <li><a href="#">02) 1122-3344</a></li>
                    <li><a href="#">졸림 ㅠㅠ</a></li>
                    <li><a href="#">ㅋㅋ켘ㅋ컄케</a></li>
                    <li><a href="#">할 말 업슴</a></li>
                </ul>
            </section>
            <section>
                <h4>그것 Academy 관련 링크</h4>
                <ul class="plain">
                    <li><a href="#"><i class="icon fa-twitter">&nbsp;</i>Twitter</a></li>
                    <li><a href="#"><i class="icon fa-facebook">&nbsp;</i>Facebook</a></li>
                    <li><a href="#"><i class="icon fa-instagram">&nbsp;</i>Instagram</a></li>
                    <li><a href="#"><i class="icon fa-github">&nbsp;</i>Github</a></li>
                </ul>
            </section>
        </div>
    </div>
</footer>
</body>
</html>
