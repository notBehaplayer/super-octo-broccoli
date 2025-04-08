<%--
  Created by IntelliJ IDEA.
  User: 11-SINF
  Date: 07.04.2025
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Privacy - Loginner</title>
    <link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
</head>
<body>
<header class="siteHeader" id="siteHeader">
    <div class="siteHeader__container container">
        <div class="siteHeader__imgBox scaleTransition">
            <a class="siteHeader__linkBox" href="${pageContext.request.contextPath}/">
                <img class="siteHeader__img" src="${pageContext.request.contextPath}/img/logo.svg" alt="Loginner Logo"/>
                <h1 class="siteHeader__title">Loginner</h1>
            </a>
        </div>

        <ul class="siteHeader__list">
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link">Home</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link">Features</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link">About</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link">F.A.Q.</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link">Support</a>
            </li>
        </ul>

        <div class="siteHeader__authBox">
            <a class="authBox__link scaleTransition" href="${pageContext.request.contextPath}/router?page=login">Login</a>
            <a class="authBox__link scaleTransition" href="${pageContext.request.contextPath}/router?page=signup">Sign up</a>
        </div>
    </div>
</header>
<main class="siteMain" id="siteMain"></main>

<footer class="siteFooter" id="siteFooter">
    <div class="siteFooter__container siteHeader__container container">
        <div class="siteHeader__imgBox scaleTransition">
            <a class="siteHeader__linkBox" href="${pageContext.request.contextPath}/">
                <img class="siteHeader__img" src="${pageContext.request.contextPath}/img/logo.svg" alt="Loginner Logo"/>
                <h1 class="siteHeader__title">Loginner</h1>
            </a>

            <h1 class="imgBox__title">© 2025 Loginner. All rights reserved.</h1>
        </div>
    </div>
</footer>
</body>
</html>
