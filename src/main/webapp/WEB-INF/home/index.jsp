<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>학생관리ㅋ</title>
    <meta charset="utf-8">
    <meta name="robots"
          content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
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
<!-- Banner -->
<section id="banner">
    <div class="inner">
        <h1>그것(IT) Academy</h1>
        <p>
            우하핰ㅋㅋ <a href="https://templated.co/">그것</a> 호호호
        </p>
    </div>
    <div class="login-box">
        <h3>[${sessionScope.loginid}]님</h3>
        <h5>안녕하세요.</h5>
        <form>
            <div class="textbox">
                수강과목: ${lecture_name}
            </div>
            <c:if test="${check != 0}">
            <input type="button" onclick="location.href='/attendance/in?user_id=${sessionScope.loginid}'" class="btn" value="입실">
            </c:if>
            <c:if test="${check == 0}">
            <input type="button" onclick="location.href='/attendance/out?user_id=${sessionScope.loginid}'" class="btn" value="퇴실">
            </c:if>
        </form>
    </div>
    <video autoplay loop muted playsinline src="/images/banner.mp4"></video>
</section>

<!-- Highlights -->
<section class="wrapper">
    <div class="inner">
        <header class="special">
            <h2>교육 과정</h2>
            <p>성공적인 취업의 준비
                전문가의 개인맞춤 취업 컨설팅, 모의면접, 취업처 탐방, 동행면접까지!<br>
                실무 역량 강화 교육
                차별화 된 강점요소 함양을 위한 High-Level 커리큘럼 제공<br>
                전격 실무 경험
                ‘팀 프로젝트’ 협업 기회와 발표 수업을 통해 실무능력 향상과 경험제공</p>
        </header>
        <div class="highlights">
            <section>
                <div class="content">
                    <header>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-filetype-java" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M14 4.5V11h-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM1.521 15.175a1.3 1.3 0 0 1-.082-.466h.765a.6.6 0 0 0 .073.27.5.5 0 0 0 .454.246q.285 0 .422-.164.138-.165.138-.466V11.85h.79v2.725q0 .66-.357 1.005-.354.345-.984.345a1.6 1.6 0 0 1-.568-.094 1.1 1.1 0 0 1-.408-.266 1.1 1.1 0 0 1-.243-.39m3.972-.354-.314 1.028h-.8l1.342-3.999h.926l1.336 3.999h-.84l-.314-1.028zm1.178-.59-.49-1.616h-.035l-.49 1.617zm2.342 1.618h.952l1.327-3.999h-.878l-.888 3.138h-.038L8.59 11.85h-.917zm3.087-1.028-.314 1.028h-.8l1.342-3.999h.926l1.336 3.999h-.84l-.314-1.028zm1.178-.59-.49-1.616h-.035l-.49 1.617z"/>
                        <h3>Java Programming</h3>
                        <hr>
                        </svg>
                    </header>
                    <p>[강남센터] [N캠프] 클라우드 기반 <br>
                        웹 개발자 & 데브옵스 과정_15기</p>
                    <p>개강일 | 2024-07-02<br>
                        교육기간 | 2024-07-02 ~ 2025-01-08</p>
                </div>
            </section>
            <section>
                <div class="content">
                    <header>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-filetype-py" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2H7v-1h5a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM0 11.85h1.6q.434 0 .732.179.302.175.46.477t.158.677-.16.677q-.158.299-.464.474a1.45 1.45 0 0 1-.732.173H.79v1.342H0zm2.06 1.714a.8.8 0 0 0 .085-.381q0-.34-.185-.521-.185-.182-.513-.182H.788v1.406h.66a.8.8 0 0 0 .374-.082.57.57 0 0 0 .238-.24m2.963.75v1.535H4.23v-1.52L2.89 11.85h.876l.853 1.696h.032l.856-1.696h.855z"/>
                        </svg>
                        <h3>Python Programming</h3>
                        <hr>
                    </header>
                    <p>[AI아카데미] 생성형 AI 활용 인공지능 <br>
                        개발자 양성 과정 5기</p>
                    <p>개강일 | 2024-07-02<br>
                        교육기간 | 2024-07-02 ~ 2024-12-31</p>
                </div>
            </section>
            <section>
                <div class="content">
                    <header>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-filetype-php" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM1.6 11.85H0v3.999h.791v-1.342h.803q.43 0 .732-.173.305-.175.463-.474a1.4 1.4 0 0 0 .161-.677q0-.375-.158-.677a1.2 1.2 0 0 0-.46-.477q-.3-.18-.732-.179m.545 1.333a.8.8 0 0 1-.085.38.57.57 0 0 1-.238.241.8.8 0 0 1-.375.082H.788V12.48h.66q.327 0 .512.181.185.182.185.522m4.48 2.666V11.85h-.79v1.626H4.153V11.85h-.79v3.999h.79v-1.714h1.682v1.714zm.703-3.999h1.6q.433 0 .732.179.3.175.46.477.158.302.158.677t-.161.677q-.159.299-.463.474a1.45 1.45 0 0 1-.733.173H8.12v1.342h-.791zm2.06 1.714a.8.8 0 0 0 .084-.381q0-.34-.184-.521-.184-.182-.513-.182h-.66v1.406h.66a.8.8 0 0 0 .375-.082.57.57 0 0 0 .237-.24Z"/>
                        </svg>
                        <h3>PHP Programming</h3>
                        <hr>
                    </header>
                    <p>[강남센터] PHP 개발 <br>사이트 속도개선_18기</p>
                    <p>개강일 | 2024-08-01<br>
                        교육기간 | 2024-08-01 ~ 2025-01-31</p>
                </div>
            </section>
            <section>
                <div class="content">
                    <header>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-filetype-css" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM3.397 14.841a1.13 1.13 0 0 0 .401.823q.195.162.478.252.284.091.665.091.507 0 .859-.158.354-.158.539-.44.187-.284.187-.656 0-.336-.134-.56a1 1 0 0 0-.375-.357 2 2 0 0 0-.566-.21l-.621-.144a1 1 0 0 1-.404-.176.37.37 0 0 1-.144-.299q0-.234.185-.384.188-.152.512-.152.214 0 .37.068a.6.6 0 0 1 .246.181.56.56 0 0 1 .12.258h.75a1.1 1.1 0 0 0-.2-.566 1.2 1.2 0 0 0-.5-.41 1.8 1.8 0 0 0-.78-.152q-.439 0-.776.15-.337.149-.527.421-.19.273-.19.639 0 .302.122.524.124.223.352.367.228.143.539.213l.618.144q.31.073.463.193a.39.39 0 0 1 .152.326.5.5 0 0 1-.085.29.56.56 0 0 1-.255.193q-.167.07-.413.07-.175 0-.32-.04a.8.8 0 0 1-.248-.115.58.58 0 0 1-.255-.384zM.806 13.693q0-.373.102-.633a.87.87 0 0 1 .302-.399.8.8 0 0 1 .475-.137q.225 0 .398.097a.7.7 0 0 1 .272.26.85.85 0 0 1 .12.381h.765v-.072a1.33 1.33 0 0 0-.466-.964 1.4 1.4 0 0 0-.489-.272 1.8 1.8 0 0 0-.606-.097q-.534 0-.911.223-.375.222-.572.632-.195.41-.196.979v.498q0 .568.193.976.197.407.572.626.375.217.914.217.439 0 .785-.164t.55-.454a1.27 1.27 0 0 0 .226-.674v-.076h-.764a.8.8 0 0 1-.118.363.7.7 0 0 1-.272.25.9.9 0 0 1-.401.087.85.85 0 0 1-.478-.132.83.83 0 0 1-.299-.392 1.7 1.7 0 0 1-.102-.627zM6.78 15.29a1.2 1.2 0 0 1-.111-.449h.764a.58.58 0 0 0 .255.384q.106.073.25.114.142.041.319.041.245 0 .413-.07a.56.56 0 0 0 .255-.193.5.5 0 0 0 .085-.29.39.39 0 0 0-.153-.326q-.152-.12-.463-.193l-.618-.143a1.7 1.7 0 0 1-.539-.214 1 1 0 0 1-.351-.367 1.1 1.1 0 0 1-.123-.524q0-.366.19-.639.19-.272.527-.422t.777-.149q.456 0 .779.152.326.153.5.41.18.255.2.566h-.75a.56.56 0 0 0-.12-.258.6.6 0 0 0-.246-.181.9.9 0 0 0-.37-.068q-.324 0-.512.152a.47.47 0 0 0-.184.384q0 .18.143.3a1 1 0 0 0 .404.175l.621.143q.326.075.566.211t.375.358.135.56q0 .37-.188.656a1.2 1.2 0 0 1-.539.439q-.351.158-.858.158-.381 0-.665-.09a1.4 1.4 0 0 1-.478-.252 1.1 1.1 0 0 1-.29-.375"/>
                        </svg>
                        <h3>CSS, JS, HTML Programming</h3>
                        <hr>
                    </header>
                    <p>[1기] K-Digital Training: 클라우드 기반 <br>프론트엔드 엔지니어링</p>
                    <p>개강일 | 2024-08-01<br>
                        교육기간 | 2024-08-01 ~ 2025-01-31</p>
                </div>
            </section>
            <section>
                <div class="content">
                    <header>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-filetype-jsx" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM3.075 14.841a1.13 1.13 0 0 0 .401.823q.194.162.478.252.284.091.665.091.507 0 .858-.158.355-.158.54-.44a1.17 1.17 0 0 0 .187-.656q0-.336-.135-.56a1 1 0 0 0-.375-.357 2 2 0 0 0-.565-.21l-.621-.144a1 1 0 0 1-.405-.176.37.37 0 0 1-.143-.299q0-.234.184-.384.188-.152.513-.152.214 0 .37.068a.6.6 0 0 1 .245.181.56.56 0 0 1 .12.258h.75a1.1 1.1 0 0 0-.199-.566 1.2 1.2 0 0 0-.5-.41 1.8 1.8 0 0 0-.78-.152q-.44 0-.776.15-.337.149-.528.421-.19.273-.19.639 0 .302.123.524t.351.367q.229.143.54.213l.618.144q.31.073.462.193a.39.39 0 0 1 .153.326.5.5 0 0 1-.085.29.56.56 0 0 1-.255.193q-.167.07-.413.07-.176 0-.32-.04a.8.8 0 0 1-.248-.115.58.58 0 0 1-.255-.384zM0 14.791q0 .247.082.466.083.22.243.39.165.17.407.267.246.093.569.093.63 0 .984-.346.357-.345.358-1.004v-2.725h-.791v2.745q0 .302-.138.466t-.422.164a.5.5 0 0 1-.454-.246.6.6 0 0 1-.073-.27zm8.907-2.859H9.8l-1.274 2.007L9.78 15.93h-.908l-.85-1.415h-.035l-.853 1.415h-.861l1.24-2.016-1.228-1.983h.931l.832 1.438h.036l.823-1.438Z"/>
                        </svg>
                        <h3>React Programming</h3>
                        <hr>
                    </header>
                    <p>프론트엔드개발자 과정 (웹 퍼블리셔)_12기</p>
                    <p>개강일 | 2024-08-01<br>
                        교육기간 | 2024-08-01 ~ 2025-01-31</p>
                </div>
            </section>
            <section>
                <div class="content">
                    <header>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-filetype-cs" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2H8v-1h4a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM3.629 15.29a1.2 1.2 0 0 1-.112-.449h.765a.58.58 0 0 0 .255.384q.105.073.249.114t.32.041q.245 0 .412-.07a.56.56 0 0 0 .255-.193.5.5 0 0 0 .085-.29.39.39 0 0 0-.152-.326q-.153-.12-.463-.193l-.618-.143a1.7 1.7 0 0 1-.54-.214 1 1 0 0 1-.35-.367 1.1 1.1 0 0 1-.124-.524q0-.366.19-.639.191-.272.528-.422t.776-.149q.458 0 .78.152.324.153.5.41.18.255.2.566h-.75a.56.56 0 0 0-.12-.258.6.6 0 0 0-.246-.181.9.9 0 0 0-.37-.068q-.324 0-.512.152a.47.47 0 0 0-.185.384q0 .18.144.3a1 1 0 0 0 .404.175l.621.143q.325.075.566.211t.375.358.134.56q0 .37-.187.656a1.2 1.2 0 0 1-.54.439q-.351.158-.858.158a2.2 2.2 0 0 1-.665-.09 1.4 1.4 0 0 1-.477-.252 1.1 1.1 0 0 1-.29-.375m-2.72-2.23a1.7 1.7 0 0 0-.103.633v.495q0 .369.102.627a.83.83 0 0 0 .299.392.85.85 0 0 0 .478.132.86.86 0 0 0 .4-.088.7.7 0 0 0 .273-.249.8.8 0 0 0 .118-.363h.764v.076a1.27 1.27 0 0 1-.225.674q-.205.29-.551.454a1.8 1.8 0 0 1-.785.164q-.54 0-.914-.217a1.4 1.4 0 0 1-.572-.626Q0 14.756 0 14.188v-.498q0-.569.196-.979a1.44 1.44 0 0 1 .572-.633q.378-.222.91-.222.33 0 .607.097.281.093.49.272a1.32 1.32 0 0 1 .465.964v.073h-.764a.85.85 0 0 0-.12-.38.7.7 0 0 0-.273-.261.8.8 0 0 0-.398-.097.8.8 0 0 0-.475.138.87.87 0 0 0-.302.398Z"/>
                        </svg>
                        <h3>C# Programming</h3>
                        <hr>
                    </header>
                    <p>C# 개발자 과정_19기</p>
                    <p>개강일 | 2024-08-01<br>
                        교육기간 | 2024-08-01 ~ 2025-01-31</p>
                </div>
            </section>
        </div>
    </div>
</section>
<!-- CTA -->
<section id="cta" class="wrapper">
    <div class="inner">
        <h2>그것 Academy</h2>
        <p>그것 Academy의 전 과정은
            NCS(국가직무능력표준)기준을 준수하며
            최대 100%전액 국비지원을 받으실 수 있습니다.<br>
            100% 무료 국비지원 과정!
            전액 국비지원, 훈련장려금 & 훈련수당 월 최대 1,216,000원 (국민취업지원제도 참여 시)
            수료 후 6개월간 취업지원서비스 제공</p>
    </div>
</section>
<!-- Testimonials -->
<section class="wrapper">
    <div class="inner">
        <header class="special">
            <h2>우리 집 개와 고양이를 소개합니다 ㅋ</h2>
            <p>우리 집 개는 우주, 고양이는 냠냠이에요 ㅋ</p>
        </header>
        <div class="testimonials">
            <section>
                <div class="content">
                    <blockquote>
                        <p>ㅋㅋ켘</p>
                    </blockquote>
                    <div class="author">
                        <div class="image">
                            <img height="256" width="256" style="max-width: none;" src="/images/냠냠.jpeg" alt="">
                        </div>
                        <p class="credit">
                            - <strong>Jane Doe</strong> <span>CEO - ABC Inc.</span>
                        </p>
                    </div>
                </div>
            </section>
            <section>
                <div class="content">
                    <blockquote>
                        <p>ㄷㄷㄷㄷ</p>
                    </blockquote>
                    <div class="author">
                        <div class="image">
                            <img height="256" width="256" style="max-width: none;" src="/images/냠냠우주.jpeg" alt="">
                        </div>
                        <p class="credit">
                            - <strong>John Doe</strong> <span>CEO - ABC Inc.</span>
                        </p>
                    </div>
                </div>
            </section>
            <section>
                <div class="content">
                    <blockquote>
                        <p>귀엽 ㅋ</p>
                    </blockquote>
                    <div class="author">
                        <div class="image">
                            <img height="256" width="256" style="max-width: none;" src="/images/space.jpg" alt="">
                        </div>
                        <p class="credit">
                            - <strong>Janet Smith</strong> <span>CEO - ABC Inc.</span>
                        </p>
                    </div>
                </div>
            </section>
        </div>
    </div>
</section>
<!-- Footer -->
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


<!-- Scripts -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/browser.min.js"></script>
<script src="/assets/js/breakpoints.min.js"></script>
<script src="/assets/js/util.js"></script>
<script src="/assets/js/main.js"></script>
</body>
</html>