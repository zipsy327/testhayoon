<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/assets/css/main.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="./assets/css/main.css">
    <title>Dynamic Calendar 2024</title>
    <style>
        .calendar-container, .graph-container {
            max-width: 1000px;
            margin: 20px auto;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 30px; /* 셀의 패딩을 늘림 */
            text-align: center;
            font-size: 10px; /* 글자 크기를 늘림 */
        }
        th {
            background-color: #CD0C22;
        }
        .hidden {
            display: none;
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

<div>
    <select id="monthSelect">
        <option value="0">January</option>
        <option value="1">February</option>
        <option value="2">March</option>
        <option value="3">April</option>
        <option value="4">May</option>
        <option value="5" selected>June</option>
        <option value="6">July</option>
        <option value="7">August</option>
        <option value="8">September</option>
        <option value="9">October</option>
        <option value="10">November</option>
        <option value="11">December</option>
    </select>
    <br><br>
    <br><br>
</div>
<div class="calendar-container">
    <table id="calendar">
        <thead>
        <tr>
            <th>Sun</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<div class="graph-container hidden">
    <p>Graph View is not implemented yet.</p>
</div>

<script>
    // Convert the list of attendance data to a JSON object
    let attendanceList = [
        <c:forEach var="dto" items="${list}" varStatus="status">
        {
            "attendance_day": "${dto.attendance_day}",
            "attendance_in": "${dto.attendance_in}",
            "attendance_out": "${dto.attendance_out}"
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    // Convert the list of holiday data to a JSON object
    let holidayList = [
        <c:forEach var="dto" items="${holidayList}" varStatus="status">
        {
            "holiday_start": "${dto.holiday_start}",
            "holiday_end": "${dto.holiday_end}"
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    console.log("Attendance List:", attendanceList); // Debugging line
    console.log("Holiday List:", holidayList); // Debugging line

    function generateCalendar(year, month, attendanceList, holidayList) {
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        const calendarBody = document.getElementById('calendar').getElementsByTagName('tbody')[0];
        calendarBody.innerHTML = "";
        let date = 1;

        for (let row = 0; row < 6; row++) {
            const newRow = calendarBody.insertRow(-1);
            for (let col = 0; col < 7; col++) {
                const cell = newRow.insertCell(-1);
                if ((row === 0 && col < firstDay.getDay()) || date > lastDay.getDate()) {
                    cell.innerHTML = "";
                } else {
                    let currentDate = new Date(year, month, date+1);
                    let formattedDate = currentDate.toISOString().split('T')[0];
                    cell.innerHTML = formattedDate;

                    // Check if there is attendance data for the current date
                    let attendanceRecord = attendanceList.find(attendance => attendance.attendance_day === formattedDate);
                    if (attendanceRecord) {
                        console.log("Attendance Record for " + formattedDate + ":", attendanceRecord); // Debugging line
                        cell.innerHTML += `<br>입실: ` + attendanceRecord.attendance_in + `<br>퇴실: ` + attendanceRecord.attendance_out;
                    }

                    // Check if there is holiday data for the current date
                    let holidayRecord = holidayList.find(holiday => holiday.holiday_start <= formattedDate && holiday.holiday_end >= formattedDate);
                    if (holidayRecord) {
                        if (holidayRecord.holiday_start === formattedDate) {
                            cell.innerHTML += `<br>휴가 시작`;
                        }
                        if (holidayRecord.holiday_end === formattedDate) {
                            cell.innerHTML += `<br>휴가 끝`;
                        }
                    }

                    date++;
                }
            }
            if (date > lastDay.getDate()) break;
        }
    };

    generateCalendar(2024, 5, attendanceList, holidayList);

    document.getElementById('monthSelect').addEventListener('change', function() {
        generateCalendar(2024, parseInt(this.value), attendanceList, holidayList);
    });

    document.getElementById('viewMode').addEventListener('change', function() {
        if (this.checked) {
            document.querySelector('.calendar-container').classList.remove('hidden');
            document.getElementById('graphMode').checked = false;
        } else {
            document.querySelector('.calendar-container').classList.add('hidden');
        }
    });

    document.getElementById('graphMode').addEventListener('change', function() {
        if (this.checked) {
            document.querySelector('.graph-container').classList.remove('hidden');
            document.getElementById('viewMode').checked = false;
        } else {
            document.querySelector('.graph-container').classList.add('hidden');
        }
    });
</script>
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
