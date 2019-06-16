<%--
  Created by IntelliJ IDEA.
  User: minsub
  Date: 2019-06-03
  Time: 오후 5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />

<!DOCTYPE HTML>
<html>
<head>
    <title>SKHU VOTE</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="${R}assets/css/main.css" />
    <script src="http://code.jquery.com/jquery-latest.js"></script>


    <script type="text/javascript">

        function voteCheck() {
            if (confirm('이 후보를 투표하시겠습니까?') == true) {
                return true//확인
            }
            else{   //취소
                return false;
            }
        }

        function abandonmentCheck() {
            if (confirm('정말 기권하시겠습니까') == true) {
                return true//확인
            }
            else{   //취소

                return false;
            }
        }
    </script>

</head>
<body class="homepage is-preload">
<div id="page-wrapper">

    <!-- Header -->
    <%@include file="/WEB-INF/include/menu.jsp"%>

    <!-- Banner -->
    <section id="banner">
        <div class="container">
            <c:if test="${electionType==1}">
                <p><strong>${election.name}대 총 학생회장 선거</strong></p>
            </c:if>
            <c:if test="${electionType==2}">
                <p><strong>${election.name}대 학부대표 선거</strong></p>
            </c:if>
            <c:if test="${electionType==3}">
                <p><strong>전공대표 선거</strong></p>
            </c:if>
        </div>
    </section>

    <!-- Main -->
    <section id="main">
        <div class="container" style="margin-left: 20%;margin-right: auto;">
            <div class="row">
                <c:forEach items="${teamList}" var="team">
                <!-- Content -->
                <div id="content" class="col-8 col-12-medium">

                    <!-- Post -->
                    <article class="box post">
                        <header>
                            <h2><a href="#"><strong>${team.name} 팀</strong></a></h2>
                        </header>
                        <a href="#" class="image featured"><img src="images/pic05.jpg" alt="" /> 팀 메인 사진</a>

                        <p>${team.name} 팀 입니다</p>
                        <ul class="actions">
                            <li><a href="/teamDetail/${electionType}/${team.idx}" class="button icon fa-vcard" >더보기</a></li>
                            <li>
                                <form action="/goForVote" name="vote" method="post" >
                                    <input type="hidden" name="studentidx" value="201432005">
                                    <input type="hidden" name="electionidx" value="${election.idx}">
                                    <input type="hidden"  name="teamidx" value="${team.idx}">
                                    <input type="hidden"  name="abandonment" value="0">
                                    <button type="button"  onclick="voteCheck()==true?submit():false" class="button icon fa-file">투표</button>
                                </form>
                            </li>
                        </ul>
                    </article>
                </div>
                </c:forEach>

            </div>
            <br/><br/><br/><br/>
            <div id="goAbandonment" style="margin-left: 55%">
                <form action="/goForVote" name="abandonment" method="post" >
                    <input type="hidden"  name="studentidx" value="201432005">
                    <input type="hidden"  name="electionidx" value="${election.idx}">
                    <input type="hidden"  name="teamidx">
                    <input type="hidden"  name="abandonment" value="1">
                    <button type="button" onclick="abandonmentCheck()==true?submit():false" class="button icon fa-balance-scale">기권</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <section id="footer">
        <div class="container">
            <header>
                <h2><strong>MyPage</strong></h2>
            </header>
            <div class="row">
                <div class="col-6 col-12-medium">
                    <section>
                        <form method="post" action="#">
                            <div class="row gtr-50">
                                <div class="col-6 col-12-small">
                                    <input name="name" placeholder="Name" type="text" />
                                </div>
                                <div class="col-6 col-12-small">
                                    <input name="email" placeholder="test@mail_name.com" type="text" vlaue=""/>
                                </div>
                                <div class="col-12">
                                    <textarea name="message" placeholder="시스템에 대한 건의 사항 있으면 메일로 보내주세요"></textarea>
                                </div>
                                <div class="col-12">
                                    <br/>
                                    <a href="#" class="form-button-submit button icon fa-envelope">Send Message</a>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>
                <div class="col-6 col-12-medium">
                    <section>
                        <p>투표를 하기전에 내 정보가 정확한지 확인해 주세요!</p>
                        <div class="row">
                            <div class="col-6 col-12-small">
                                <ul class="icons">
                                    <li class="icon fa-home">
                                        이름 : 홍길동<br />
                                    </li>
                                    <li class="icon fa-twitter">
                                        <a href="#">학과 : ------------ </a>
                                    </li>
                                    <li class="icon fa-phone">
                                        전화번호 : 010-0000-0000
                                    </li>

                                </ul>
                            </div>
                            <div class="col-6 col-12-small">
                                <ul class="icons">

                                    <li class="icon fa-dribbble">
                                        <a href="#">학번 : 20-------</a>
                                    </li>

                                    <li class="icon fa-envelope">
                                        <a href="#">이메일 : <br/> MyEmail@ email.com</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-12">
                                <a href="#" class="form-button-submit button ">내 정보수정하러가기</a>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <div id="copyright" class="container">
            <ul class="links">
                <li>&copy; pepero</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
            </ul>
        </div>
    </section>

</div>

<!-- Scripts -->
<script src="${R}assets/js/jquery.min.js"></script>
<script src="${R}assets/js/jquery.dropotron.min.js"></script>
<script src="${R}assets/js/browser.min.js"></script>
<script src="${R}assets/js/breakpoints.min.js"></script>
<script src="${R}assets/js/util.js"></script>
<script src="${R}assets/js/main.js"></script>

</body>
</html>