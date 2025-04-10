<%--
  Created by IntelliJ IDEA.
  User: 11-SINF
  Date: 07.04.2025
  Time: 9:02
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
<div id="preloader">
    <div class="loader"></div>
</div>

<div id="popup" class="popup"></div>

<%@ include file="/WEB-INF/views/header.jsp" %>
<main class="siteMain" id="siteMain">
    <div class="siteMain__container container">
        <div class="siteMain__formBox">
            <h2 class="formBox__title">Login</h2>
            <p class="formBox__text">Login to access your travel wise account.</p>

            <form action="${pageContext.request.contextPath}/login" method="POST" id="loginForm">
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="email">Email</label>
                    <input class="inputBox__input" type="email" id="email" name="email" required>
                </div>

                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="password">Password</label>
                    <div class="formBox__passwordBox">
                        <input class="inputBox__input" type="password" id="password" name="password" required>
                        <img class="inputBox__img" onclick="togglePassword(this)"
                             src="${pageContext.request.contextPath}/img/close%20eye.svg" alt="closed eye">
                    </div>
                </div>

                <div class="formBox__agreement formBox__loginAgreement">
                    <div class="agreement__inputBox">
                        <input class="agreement__input checkbox" type="checkbox" id="agreement" name="agreement">
                        <label class="agreement__label" for="agreement">Remember me</label>
                    </div>
                    <div class="agreement__linkBox scaleTransition">
                        <a class="agreement__link" href="${pageContext.request.contextPath}/router?page=reset-password">Forgot
                            password</a>
                    </div>
                </div>

                <button type="submit" class="formBox__submit scaleTransition">Login</button>
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

<%@ include file="/WEB-INF/views/footer.jsp" %>
<script>
    document.getElementById('siteHeader').style.display = 'none';
    document.getElementById('siteMain').style.display = 'none';
    document.getElementById('siteFooter').style.display = 'none';
    document.getElementById('popup').style.display = 'none';

    window.addEventListener('load', function() {
        setTimeout(function() {
            document.getElementById('preloader').classList.add('fade-out');
            document.getElementById('siteHeader').style.display = 'block';
            document.getElementById('siteMain').style.display = 'block';
            document.getElementById('siteFooter').style.display = 'block';
            document.getElementById('popup').style.display = 'block';
            setTimeout(function() {
                document.getElementById('preloader').style.display = 'none';
            }, 500);
        }, 2000);
    });

    function togglePassword(eyeIcon) {
        const passwordInput = eyeIcon.closest(".formBox__passwordBox").querySelector("#password");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            eyeIcon.src = "${pageContext.request.contextPath}/img/open%20eye.svg";
        } else {
            passwordInput.type = "password";
            eyeIcon.src = "${pageContext.request.contextPath}/img/close%20eye.svg";
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
        }, 2100);
        setTimeout(() => {
            popup.classList.remove('success');
        }, 4000);
    } else if (success === 'password_reset') {
        popup.textContent = 'Пароль успешно сброшен! Войдите с новым паролем.';
        setTimeout(() => {
            popup.classList.add('success');
        }, 2100);
        setTimeout(() => {
            popup.classList.remove('success');
        }, 4000);
    } else if (error) {
        popup.textContent = decodeURIComponent(error);
        setTimeout(() => {
            popup.classList.add('error');
        }, 2100);
        setTimeout(() => {
            popup.classList.remove('error');
        }, 4000);
    }

    <% if (request.getAttribute("error") != null) { %>
    popup.textContent = '<%= request.getAttribute("error") %>';
    setTimeout(() => {
        popup.classList.add('error');
    }, 2100);
    setTimeout(() => {
        popup.classList.remove('error');
    }, 4000);
    <% } %>

</script>
</body>
</html>