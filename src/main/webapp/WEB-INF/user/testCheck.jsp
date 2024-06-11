
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<meta charset="utf-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet" href="/assets/css/main.css">
<head>
    <title>Title</title>
</head>
<body><!-- Header -->
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
<h1>시험 점수보기</h1>

    <h1>Welcome</h1>
    <p>${dto.user_no}</p>
    <p>${dto.tutorcate_no}</p>
    <form id="1">
        <h3>JAVA</h3>
        <h4>사용자로부터 두 개의 정수를 입력받아, 두 수의 최소공배수(LCM)를 계산하여 출력하는 자바 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
        <h4>사용자로부터 세 개의 정수를 입력받아, 이 중 가장 작은 값을 찾아 출력하는 자바 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
    </form>
    <form id="2">
        <h3>PYTHON</h3>
        <h4>사용자로부터 정수 리스트를 입력받아, 리스트 내의 모든 정수의 곱을 반환하는 파이썬 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
        <h4>사용자로부터 문자열을 입력받아, 그 문자열 안에 있는 모든 공백을 제거하고 결과를 출력하는 파이썬 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
    </form>
    <form id="3">
        <h3>C#</h3>
        <h4>사용자로부터 두 개의 날짜를 "yyyy-mm-dd" 형식으로 입력받아, 두 날짜 사이의 일수를 계산하여 출력하는 C# 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
        <h4>사용자로부터 시간을 "hh:mm
            " 형식으로 입력받아, 입력된 시간을 초로 환산하여 출력하는 C# 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
    </form>
    <form id="4">
        <h4>C++</h4>
        <h4>사용자로부터 정수 N을 입력받아, N의 팩토리얼을 계산하여 출력하는 C++ 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
        <h4>사용자로부터 정수 N을 입력받아, 1부터 N까지의 정수 중에서 소수(prime numbers)만을 출력하는 C++ 프로그램을 작성하세요.</h4>
        <textarea> </textarea>
    </form>
    <form id="5">
        <h3>PHP</h3>
        <h4>사용자로부터 이메일 주소를 입력받아, 유효한 이메일 주소인지 확인하는 PHP 스크립트를 작성하세요.</h4>
        <textarea> </textarea>
        <h4>사용자로부터 문자열을 입력받아, 해당 문자열을 역순으로 출력하는 PHP 스크립트를 작성하세요.</h4>
        <textarea> </textarea>
    </form>
    <form id="6">
        <h3>R</h3>
        <h4>사용자로부터 수치 데이터 집합을 입력받아, 그 데이터의 분산을 계산하여 출력하는 R 스크립트를 작성하세요.</h4>
        <textarea> </textarea>
        <h4>사용자로부터 두 벡터를 입력받아, 두 벡터의 내적(dot product)을 계산하여 출력하는 R 스크립트를 작성하세요.</h4>
        <textarea> </textarea>
    </form>
    <form id="7">
        <h3>REACT</h3>
        <h4>간단한 카운터 애플리케이션을 React로 구현하세요. 이 카운터는 증가, 감소 버튼을 포함하며, 현재 카운터의 값을 화면에 표시해야 합니다.</h4>
        <textarea> </textarea>
        <h4>React를 사용하여 날씨 정보를 표시하는 컴포넌트를 작성하세요. 사용자는 도시 이름을 입력하고, 해당 도시의 현재 날씨를 볼 수 있어야 합니다.</h4>
        <textarea> </textarea>
    </form>
    <form id="8">
        <h3>JAVA SCRIPT, CSS, HTML</h3>
        <h4>사용자로부터 금액을 입력받아, 입력된 금액에 해당하는 할인율을 적용한 후 최종 가격을 계산하여 표시하는 JavaScript 기능을 구현하세요.</h4>
        <textarea> </textarea>
        <h4>HTML과 CSS를 사용하여, 마우스를 오버할 때 이미지 크기가 점점 커지는 애니메이션 효과를 구현하세요.</h4>
        <textarea> </textarea>
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
