<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Set New Password - Loginner</title>
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

<main class="siteMain" id="siteMain">
    <div class="siteMain__container container">
        <div class="siteMain__formBox">
            <h2 class="formBox__title">Set New Password</h2>
            <p class="formBox__text">Enter your new password below.</p>

            <% if (request.getAttribute("error") != null) { %>
            <script>
                const popup = document.getElementById('popup');
                popup.textContent = '<%= request.getAttribute("error") %>';
                setTimeout(() => { popup.classList.add('error'); }, 100);
                popup.style.display = 'block';
                setTimeout(() => {
                    popup.classList.remove('error');
                    popup.style.display = 'none';
                }, 3000);
            </script>
            <% } %>

            <form action="${pageContext.request.contextPath}/set-password" method="POST" id="setPasswordForm">
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="password">New Password</label>
                    <div class="formBox__passwordBox">
                        <input class="inputBox__input" type="password" id="password" name="password" required>
                        <img class="inputBox__img" onclick="togglePassword(this)"
                             src="${pageContext.request.contextPath}/img/close%20eye.svg" alt="closed eye">
                    </div>
                </div>
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="passwordConf">Confirm Password</label>
                    <div class="formBox__passwordBox">
                        <input class="inputBox__input" type="password" id="passwordConf" name="passwordConf" required>
                        <img class="inputBox__img" onclick="togglePasswordConf(this)"
                             src="${pageContext.request.contextPath}/img/close%20eye.svg" alt="closed eye">
                    </div>
                </div>
                <button type="submit" class="formBox__submit scaleTransition">Set Password</button>
            </form>
        </div>
    </div>
</main>


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
<script>
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

    function togglePasswordConf(eyeIcon) {
        const passwordConfInput = eyeIcon.closest(".formBox__passwordBox").querySelector("#passwordConf");
        if (passwordConfInput.type === "password") {
            passwordConfInput.type = "text";
            eyeIcon.src = "${pageContext.request.contextPath}/img/open%20eye.svg";
        } else {
            passwordConfInput.type = "password";
            eyeIcon.src = "${pageContext.request.contextPath}/img/close%20eye.svg";
        }
    }

    document.getElementById('setPasswordForm').addEventListener('submit', function (event) {
        const password = document.getElementById('password').value;
        const passwordConf = document.getElementById('passwordConf').value;

        if (password !== passwordConf) {
            event.preventDefault();
            const popup = document.getElementById('popup');
            popup.textContent = 'Passwords do not match!';
            setTimeout(() => { popup.classList.add('error'); }, 100);
            setTimeout(() => {
                popup.classList.remove('error');
            }, 2000);
        }
    });
</script>
</body>
</html>