<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>회원 가입 - Industrious by TEMPLATED</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/assets/css/main.css">
</head>
<body>

<div id="heading">
    <h1>회원 가입</h1>
</div>

<section id="main" class="wrapper">
    <form action="./insert" method="post" enctype="multipart/form-data" id="signupForm">
        <div class="inner">
            <div class="content">
                <h2>계정 생성</h2>
                <div class="row gtr-uniform">
                    <div class="col-6 col-12-xsmall">
                        <label for="userName">이름 입력</label>
                        <input type="text" name="user_name" id="userName" placeholder="이름" required>
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="userEmail">이메일</label>
                        <input type="text" name="user_email" id="userEmail" placeholder="이메일" required>
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="userId">아이디</label>
                        <input type="text" name="user_id" id="userId" placeholder="아이디" required>
                        <br>
                        <input type="button" value="중복 확인" id="btncheckid">
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="userResidentno">주민등록번호</label>
                        <div style="display: flex; gap: 5px;">
                            <input type="text" name="user_residentno" id="userResidentno" placeholder="6자리" required style="flex-grow: 1;" maxlength="6">
                            -
                            <input type="password" name="userResidentPass" id="userResidentPass" placeholder="7자리" required style="flex-grow: 1;" maxlength="7">
                        </div>
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="userPassword">비밀번호</label>
                        <input type="password" name="user_password" id="userPassword" placeholder="비밀번호" required>
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="userPasswordConfirm">비밀번호 확인</label>
                        <input type="password" name="userPasswordConfirm" id="userPasswordConfirm" placeholder="비밀번호 확인" required>
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="userPostal">우편번호</label>
                        <button id="searchPostalCode" type="button">우편번호찾기</button>
                        <br><br>
                        <input type="text" name="user_postal" id="userPostal" placeholder="우편번호">
                        <br>
                        <input type="text" name="user_addr1" id="userAddr1" placeholder="기본 주소">
                        <br>
                        <input type="text" name="user_addr2" id="userAddr2" placeholder="상세 주소">
                        <br>
                        <input type="text" name="extraAddr" id="extraAddr" placeholder="참고 항목">
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="userCategory">가입 카테고리</label>
                        <select name="user_category" id="userCategory">
                            <option value="0">학생</option>
                            <option value="2">관리자</option>
                        </select>
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <label for="tutorcateNo">수업 카테고리</label>
                        <select name="tutorcate_no" id="tutorcateNo">
                            <option value="1">JAVA</option>
                            <option value="2">PYTHON</option>
                            <option value="3">C#</option>
                            <option value="4">C++</option>
                            <option value="5">PHP</option>
                            <option value="6">R</option>
                            <option value="7">REACT</option>
                            <option value="8">JAVA SCRIPT, CSS, HTML</option>
                        </select>
                    </div>

                    <div class="col-12">
                        <ul class="actions">
                            <li><input type="submit" value="가입하기" class="primary" onclick="return check();"></li>
                            <li><input type="reset" value="다시 쓰기"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    $(document).ready(function() {
        let jungbok = false;

        $("#btncheckid").click(function() {
            if ($("#userId").val() == '') {
                alert("가입할 아이디를 입력해주세요");
                return;
            }

            $.ajax({
                type: "get",
                dataType: "json",
                url: "./idcheck",
                data: { "searchid": $("#userId").val() },
                success: function(data) {
                    if (data.count == 0) {
                        alert("가입 가능한 아이디입니다");
                        jungbok = true;
                    } else {
                        alert("이미 가입되어있는 아이디입니다");
                        jungbok = false;
                        $("#userId").val("");
                    }
                }
            });
        });

        $("#userId").keyup(function() {
            jungbok = false;
        });

        $("#signupForm").on("submit", function() {
            // 아이디 중복 확인 검사
            if (!jungbok) {
                alert("아이디 중복확인을 해주세요");
                return false;
            }

            // 비밀번호 일치 검사
            var password = $("#userPassword").val();
            var confirmPassword = $("#userPasswordConfirm").val();
            if (password !== confirmPassword) {
                alert("입력하신 비밀번호가 일치하지 않습니다.");
                return false;
            }

            return true;
        });

        document.getElementById("searchPostalCode").addEventListener("click", function() {
            searchAddr();
        });

        function searchAddr() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = '';
                    var extraAddr = '';

                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }

                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if (extraAddr !== '') {
                            extraAddr = '(' + extraAddr + ')';
                        }
                        document.getElementById("extraAddr").value = extraAddr;
                    } else {
                        document.getElementById("userAddr2").value = '';
                    }

                    document.getElementById('userPostal').value = data.zonecode;
                    document.getElementById("userAddr1").value = addr;
                    document.getElementById("userAddr2").focus();
                }
            }).open();
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
