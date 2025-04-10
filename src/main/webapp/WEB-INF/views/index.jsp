<%--
  Created by IntelliJ IDEA.
  User: 11-SINF
  Date: 04.04.2025
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home - Loginner</title>
    <link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
</head>
<body>

<div id="preloader">
    <div class="loader"></div>
</div>


<%@ include file="/WEB-INF/views/header.jsp" %>
<main class="siteMain" id="siteMain">
    <section class="siteHero" id="siteHero">
        <div class="siteHero__container container">
            <div class="siteHero__textBox">
                <h1 class="siteHero__title">Your Secure Gateway to Account Access</h1>
                <p class="siteHero__text">Loginner makes logging in simple and secure. Instantly access and manage your account — every user is safely registered into the database upon login. Fast. Reliable. Effortless.</p>
                <a class="siteHero__link scaleTransition" href="${pageContext.request.contextPath}/router?page=login">Get started</a>
            </div>
            <div class="siteHero__imgBox scaleTransition">
                <img class="siteHero__img" src="${pageContext.request.contextPath}/img/site%20main%20img.jpg" alt="lil good fjdsk"/>
            </div>
        </div>
    </section>

    <section class="siteFeatures" id="siteFeatures">
        <div class="siteFeatures__container container">
            <div class="siteFeatures__textBox">
                <h1 class="siteFeatures__title">Why Loginner?</h1>
                <p class="siteFeatures__text">We’ve built a tool that helps developers and teams integrate secure login and user management into their projects — quickly and effortlessly.</p>
            </div>

            <ul class="siteFeatures__list">
                <li class="siteFeatures__item scaleTransition">
                    <img class="siteFeatures__benefitImg" src="${pageContext.request.contextPath}/img/lightning%20image.svg" alt="item img">
                    <h2 class="siteFeatures__benefitTitle">Instant Access</h2>
                    <p class="siteFeatures__benefitText">Connect to PostgreSQL in seconds with a simple setup.</p>
                </li>
                <li class="siteFeatures__item scaleTransition">
                    <img class="siteFeatures__benefitImg" src="${pageContext.request.contextPath}/img/gear%20image.svg" alt="item img">
                    <h2 class="siteFeatures__benefitTitle">User-Friendly Interface</h2>
                    <p class="siteFeatures__benefitText">Manage data easily with intuitive JSP pages.</p>
                </li>
                <li class="siteFeatures__item scaleTransition">
                    <img class="siteFeatures__benefitImg" src="${pageContext.request.contextPath}/img/Monitor%20image.svg" alt="item img">
                    <h2 class="siteFeatures__benefitTitle">Security</h2>
                    <p class="siteFeatures__benefitText">Keep your data safe with Jakarta’s encrypted connections.</p>
                </li>
                <li class="siteFeatures__item scaleTransition">
                    <img class="siteFeatures__benefitImg" src="${pageContext.request.contextPath}/img/shield%20image.svg" alt="item img">
                    <h2 class="siteFeatures__benefitTitle">Flexibility</h2>
                    <p class="siteFeatures__benefitText">Customize Loginner to fit your workflow effortlessly.</p>
                </li>
            </ul>
        </div>
    </section>
</main>

<%@ include file="/WEB-INF/views/footer.jsp" %>

<script>
    document.getElementById('siteHeader').style.display = 'none';
    document.getElementById('siteMain').style.display = 'none';
    document.getElementById('siteFooter').style.display = 'none';

    window.addEventListener('load', function() {
        setTimeout(function() {
            document.getElementById('preloader').classList.add('fade-out');
            document.getElementById('siteHeader').style.display = 'block';
            document.getElementById('siteMain').style.display = 'block';
            document.getElementById('siteFooter').style.display = 'block';
            setTimeout(function() {
                document.getElementById('preloader').style.display = 'none';
            }, 500);
        }, 2000);
    });
</script>
</body>
</html>
