<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/assets/css/main.css">

<html>

<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $("form").on("submit", function(event){
                event.preventDefault();

                $.ajax({
                    url: "/holiday/apply",
                    method: "POST",
                    data: $(this).serialize(),
                    success: function(response){
                        // Assuming response contains the new holiday data in JSON format
                        $("#holiday-table tbody").append(
                            "<tr>" +
                            "<td class='text-left'>" + response.user_name + "</td>" +
                            "<td class='text-left'>" + response.user_id + "</td>" +
                            "<td class='text-left'>" + response.holiday_start + "</td>" +
                            "<td class='text-left'>" + response.holiday_end + "</td>" +
                            "<td class='text-left'>" + response.hdkind_name + "</td>" +
                            "</tr>"
                        );
                    },
                    error: function(error){
                        alert("Error: " + error.responseText);
                    }
                });
            });

            $("#holiday_start").on("change", function() {
                $(this).css("color", "#111111");
            });

            $("#holiday_end").on("change", function() {
                $(this).css("color", "#111111");
            });
        });
    </script>
    <style>
        input[type="date"] {
            color: #111111;
        }
        #holiday-table {
            background: white;
            border-radius: 3px;
            border-collapse: collapse;
            height: 320px;
            margin: auto;
            max-width: 600px;
            padding: 5px;
            width: 100%;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            animation: float 5s infinite;
        }
        th {
            color: #D5DDE5;
            background: #1b1e24;
            border-bottom: 4px solid #9ea7af;
            border-right: 1px solid #343a45;
            font-size: 23px;
            font-weight: 100;
            padding: 24px;
            text-align: left;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            vertical-align: middle;
        }
        th:first-child {
            border-top-left-radius: 3px;
        }
        th:last-child {
            border-top-right-radius: 3px;
            border-right: none;
        }
        tr {
            border-top: 1px solid #C1C3D1;
            border-bottom: 1px solid #C1C3D1;
            color: #666B85;
            font-size: 16px;
            font-weight: normal;
            text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
        }
        tr:hover td {
            background: #e2212f;
            color: #FFFFFF;
            border-top: 1px solid #22262e;
        }
        tr:first-child {
            border-top: none;
        }
        tr:last-child {
            border-bottom: none;
        }
        tr:nth-child(odd) td {
            background: #EBEBEB;
        }
        tr:nth-child(odd):hover td {
            background: whitesmoke;
        }
        tr:last-child td:first-child {
            border-bottom-left-radius: 3px;
        }
        tr:last-child td:last-child {
            border-bottom-right-radius: 3px;
        }
        td {
            background: #EBEBEB;
            padding: 20px;
            text-align: left;
            vertical-align: middle;
            font-weight: 300;
            font-size: 18px;
            text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
            border-right: 1px solid #C1C3D1;
        }
        td:last-child {
            border-right: 0px;
        }
        th.text-left {
            text-align: left;
        }
        th.text-center {
            text-align: center;
        }
        th.text-right {
            text-align: right;
        }
        td.text-left {
            text-align: left;
        }
        td.text-center {
            text-align: center;
        }
        td.text-right {
            text-align: right;
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
                    <li><a href="/holiday/homain?user_id=${sessionScope.loginid}">휴가 신청</a></li>
                    <li><a href="#">잔여휴가 확인</a></li>
                </ul>
            </li>
            <li><a href="#">시험</a>
                <ul class="dropdown">
                    <li><a href="/test/main?user_id=${sessionScope.loginid}">시험 보기</a></li>
                    <li><a href="/test/check?user_id=${sessionScope.loginid}">시험 점수 확인</a></li>
                    <c:if test="${user_category != 0}">
                        <li><a href="">시험 채점</a></li>
                    </c:if>
                </ul>
            </li>
            <li><a href="#">강사 소개</a></li>
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
        <li><a href="#">일정 관리</a></li>
        <li><a href="/user/incentive?user_id=${sessionScope.loginid}">훈련장려금</a></li>
        <li><a href="#">회원정보 수정</a></li>
    </ul>
</nav>
<form id="tableform">
    <table style="width: 100%; align-content: center">
        <tr>
            <td colspan="2">
                <select name="hdkind_no" style="color: white">
                    <c:forEach var="dto" items="${list}">
                        <option value="${dto.hdkind_no}">${dto.hdkind_name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td style="color: black">
                휴가시작일
            </td>
            <td>
                <label>
                    <input type="date" name="holiday_start" class="datePicker" value="${formattedDate}" style="width: 500px;">
                </label>
            </td>
        </tr>
        <tr>
            <td style="color: black">
                휴가종료일
            </td>
            <td>
                <label>
                    <input type="date" name="holiday_end" class="datePicker" value="${formattedDate}" style="width: 500px;">
                </label>
            </td>
        </tr>
    </table>
    <button type="submit" style="width: 100px;">신청</button>
</form>
<br><br>
<table id="holiday-table">
    <thead>
    <tr>
        <th class="text-left">이름</th>
        <th class="text-left">아이디</th>
        <th class="text-left">휴가시작일</th>
        <th class="text-left">휴가종료일</th>
        <th class="text-left">휴가종류</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${listu}">
        <tr>
            <td class="text-left">${dto.user_name}</td>
            <td class="text-left">${dto.user_id}</td>
            <td class="text-left">${dto.holiday_start}</td>
            <td class="text-left">${dto.holiday_end}</td>
            <td class="text-left">${dto.hdkind_name}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
