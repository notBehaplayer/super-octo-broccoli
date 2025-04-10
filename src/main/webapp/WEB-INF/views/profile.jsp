<%--
  Created by IntelliJ IDEA.
  User: Behaplayer
  Date: 08.04.2025
  Time: 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile - Loginner</title>
    <link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
</head>
<body>
<%
    String name = (String) session.getAttribute("userName");
    String email = (String) session.getAttribute("userEmail");
%>

<div id="preloader">
    <div class="loader"></div>
</div>

<%@ include file="/WEB-INF/views/header.jsp" %>
<main class="siteMain" id="siteMain">
    <section class="siteProfile" id="siteProfile">
        <div class="siteMain__container siteHero__container siteProfile__container container">
            <div class="siteHero__textBox siteProfile__textBox">
                <h1 class="formBox__title siteProfile__title">Welcome, <%=name%>!</h1>
                <p class="formBox__text"><%=email%></p>
            </div>
        </div>
    </section>
</main>

<%@ include file="/WEB-INF/views/footer.jsp" %>

<script>
    document.getElementById('siteHeader').style.display = 'none';
    document.getElementById('siteMain').style.display = 'none';
    document.getElementById('siteFooter').style.display = 'none';

    window.addEventListener('load', function () {
        setTimeout(function () {
            document.getElementById('preloader').classList.add('fade-out');
            document.getElementById('siteHeader').style.display = 'block';
            document.getElementById('siteMain').style.display = 'block';
            document.getElementById('siteFooter').style.display = 'block';
            setTimeout(function () {
                document.getElementById('preloader').style.display = 'none';
            }, 500);
        }, 2000);
    });
</script>
</body>
</html>
