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
<body>
<div id="popup" class="popup"></div>

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

            <form action="${pageContext.request.contextPath}/router?page=profile" method="POST" id="signupForm">
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="email">Email</label>
                    <input class="inputBox__input" type="email" id="email" name="email" required>
                </div>

                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="password">Password</label>
                    <div class="formBox__passwordBox">
                        <input class="inputBox__input" type="password" id="password" name="password" required>
                        <img class="inputBox__img" onclick="togglePassword()"
                             src="${pageContext.request.contextPath}/img/close%20eye.svg"
                             alt="closed eye">
                    </div>
                </div>

                <div class="formBox__agreement formBox__loginAgreement">
                    <div class="agreement__inputBox">
                        <input class="agreement__input checkbox" type="checkbox" id="agreement" name="agreement"
                               required>
                        <label class="agreement__label" for="agreement">Remember me</label>
                    </div>
                    <div class="agreement__linkBox scaleTransition">
                        <a class="agreement__link" href="${pageContext.request.contextPath}/router?page=reset-password">Forgot
                            password</a>
                    </div>
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

<script>
    function togglePassword() {
        const passwordInput = document.getElementById("password");
        const eyeIcon = document.querySelector(".inputBox__img");

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            eyeIcon.src = "${pageContext.request.contextPath}/img/open%20eye.svg"
        } else {
            passwordInput.type = "password";
            eyeIcon.src = "${pageContext.request.contextPath}/img/close%20eye.svg"
        }
    }

    const urlParams = new URLSearchParams(window.location.search);
    const success = urlParams.get('success');
    const error = urlParams.get('error');
    const popup = document.getElementById('popup');

    if (success === 'true') {
        popup.textContent = 'Регистрация прошла успешно!';
        setTimeout(() => {
            popup.classList.add('success');
        }, 100);
        popup.style.display = 'block';
        setTimeout(() => {
            popup.classList.remove('success');
        }, 3000);
    } else if (error) {
        popup.textContent = decodeURIComponent(error);
        setTimeout(() => {
            popup.classList.add('error');
        }, 100);
        popup.style.display = 'block';
        setTimeout(() => {
            popup.classList.remove('error');
        }, 3000);
    }
</script>
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