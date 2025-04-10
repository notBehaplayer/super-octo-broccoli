<%--
  Created by IntelliJ IDEA.
  User: 11-SINF
  Date: 04.04.2025
  Time: 12:49
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Loginner</title>
    <link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
</head>
<body>
<div id="preloader">
    <div class="loader"></div>
</div>

<%@ include file="/WEB-INF/views/header.jsp" %>

<main class="siteMain" id="siteMain">
    <div class="siteMain__container container">
        <div class="siteMain__sliderBox scaleTransition">
            <img class="sliderBox__img" src="${pageContext.request.contextPath}/img/sign%20up%20image.png"
                 alt="Sign Up Illustration"/>
        </div>

        <div class="siteMain__formBox">
            <h2 class="formBox__title">Sign Up</h2>
            <p class="formBox__text">Let’s get you set up to access your personal account.</p>

            <% if (request.getAttribute("error") != null) { %>
            <p class="error-message" style="color: red;"><%= request.getAttribute("error") %>
            </p>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="POST" id="signupForm">
                <div class="formBox__gridBox">
                    <div class="formBox__inputBox">
                        <label class="inputBox__label" for="firstName">First Name</label>
                        <input class="inputBox__input" type="text" id="firstName" name="firstName"
                               value="${param.firstName}" autocomplete="off" required>
                    </div>
                    <div class="formBox__inputBox">
                        <label class="inputBox__label" for="lastName">Last Name</label>
                        <input class="inputBox__input" type="text" id="lastName" name="lastName"
                               value="${param.lastName}" autocomplete="off" required>
                    </div>
                    <div class="formBox__inputBox">
                        <label class="inputBox__label" for="email">Email</label>
                        <input class="inputBox__input" type="email" id="email" name="email" value="${param.email}"
                               autocomplete="off" required>
                    </div>
                    <div class="formBox__inputBox">
                        <label class="inputBox__label" for="phoneNumber">Phone Number</label>
                        <input class="inputBox__input" type="tel" id="phoneNumber" name="phoneNumber" autocomplete="off"
                               value="${param.phoneNumber}" required>
                    </div>
                </div>
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="password">Password</label>
                    <div class="formBox__passwordBox">
                        <input class="inputBox__input" type="password" id="password" name="password" autocomplete="off"
                               required>
                        <img class="inputBox__img" onclick="togglePassword()"
                             src="${pageContext.request.contextPath}/img/close%20eye.svg" alt="closed eye">
                    </div>
                </div>
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="passwordConf">Confirm Password</label>
                    <div class="formBox__passwordBox">
                        <input class="inputBox__input" type="password" id="passwordConf" name="passwordConf"
                               autocomplete="off" required>
                        <img class="inputBox__img" onclick="togglePasswordConf()"
                             src="${pageContext.request.contextPath}/img/close%20eye.svg" alt="closed eye conf">
                    </div>
                </div>

                <div class="formBox__agreement">
                    <input class="agreement__input checkbox" type="checkbox" id="agreement" name="agreement" required>
                    <label class="agreement__label" for="agreement">
                        I agree to the <a class="agreement__link scaleTransition"
                                          href="${pageContext.request.contextPath}/router?page=terms">Terms</a> and
                        <a class="agreement__link scaleTransition"
                           href="${pageContext.request.contextPath}/router?page=privacy">Privacy Policy</a>
                    </label>
                </div>

                <button type="submit" class="formBox__submit scaleTransition">Create Account</button>
            </form>

            <p class="siteMain__login">Already have an account? <a class="agreement__link scaleTransition"
                                                                   href="${pageContext.request.contextPath}/router?page=login">Login</a>
            </p>
        </div>
    </div>
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

    document.getElementById('signupForm').addEventListener('submit', function (event) {
        const password = document.getElementById('password').value;
        const passwordConf = document.getElementById('passwordConf').value;

        if (password !== passwordConf) {
            event.preventDefault();
            alert('Passwords do not match!');
        }
    });

    function togglePassword() {
        const passwordInput = document.getElementById("password");
        const eyeIcon = passwordInput.closest(".formBox__passwordBox").querySelector(".inputBox__img");

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            eyeIcon.src = "${pageContext.request.contextPath}/img/open%20eye.svg";
        } else {
            passwordInput.type = "password";
            eyeIcon.src = "${pageContext.request.contextPath}/img/close%20eye.svg";
        }
    }

    function togglePasswordConf() {
        const passwordConfInput = document.getElementById("passwordConf");
        const eyeIcon = passwordConfInput.closest(".formBox__passwordBox").querySelector(".inputBox__img");

        if (passwordConfInput.type === "password") {
            passwordConfInput.type = "text";
            eyeIcon.src = "${pageContext.request.contextPath}/img/open%20eye.svg";
        } else {
            passwordConfInput.type = "password";
            eyeIcon.src = "${pageContext.request.contextPath}/img/close%20eye.svg";
        }
    }
</script>
</body>
</html>