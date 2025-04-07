<%--
  Created by IntelliJ IDEA.
  User: 11-SINF
  Date: 07.04.2025
  Time: 9:02
  To change this template use File | Settings | File Templates.
  <% String firstName = request.getParameter("firstName");%>
  <%=firstName%>
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in - Loginner</title>
    <link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
</head>
<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String password = request.getParameter("password");
    String passwordConf = request.getParameter("passwordConf");
%>

<body>
<header class="siteHeader" id="siteHeader">
    <div class="siteHeader__container container">
        <div class="siteHeader__imgBox scaleTransition">
            <a class="siteHeader__linkBox" href="${pageContext.request.contextPath}/">
                <img class="siteHeader__img" src="${pageContext.request.contextPath}/img/logo.svg" alt="Loginner Logo"/>
                <h1 class="siteHeader__title">Loginner</h1>
            </a>
        </div>
    </div>
</header>
<main class="siteMain" id="siteMain">
    <div class="siteMain__container container">


        <div class="siteMain__formBox">
            <h2 class="formBox__title">Login</h2>
            <p class="formBox__text">Login to access your travel wise account.</p>

            <% if (request.getAttribute("error") != null) { %>
            <p class="error-message" style="color: red;"><%= request.getAttribute("error") %>
            </p>
            <% } %>

            <form action="${pageContext.request.contextPath}/router?page=login" method="POST" id="signupForm">
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="email">Email</label>
                    <input class="inputBox__input" type="email" id="email" name="email" value="${param.email}" required>
                </div>

                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="password">Password</label>
                    <input class="inputBox__input" type="password" id="password" name="password" required>
                </div>

                <div class="formBox__agreement">
                    <input class="agreement__input checkbox" type="checkbox" id="agreement" name="agreement" required>
                    <label class="agreement__label" for="agreement">Remember me</label>
                </div>

                <button type="submit" class="formBox__submit scaleTransition">Create Account</button>
            </form>

            <p class="siteMain__login">Don't have an account? <a class="agreement__link scaleTransition"
                                                                 href="${pageContext.request.contextPath}/router?page=signup">Sign
                up</a>
            </p>
        </div>

        <div class="siteMain__sliderBox scaleTransition">
            <img class="sliderBox__img" src="${pageContext.request.contextPath}/img/log%20in%20image.jpg"
                 alt="Sign Up Illustration"/>
        </div>
    </div>
</main>
</body>
</html>


<%--    <ul>--%>
<%--        <li>Your credentials:</li>--%>
<%--        <li>Your first name: <%=firstName%></li>--%>
<%--        <li>Your last name: <%=lastName%></li>--%>
<%--        <li>Your email: <%=email%></li>--%>
<%--        <li>Your phone number: <%=phoneNumber%></li>--%>
<%--        <li>Your password: <%=password%></li>--%>
<%--    </ul>--%>