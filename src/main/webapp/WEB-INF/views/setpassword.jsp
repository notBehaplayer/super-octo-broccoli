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
<div id="preloader">
    <div class="loader"></div>
</div>

<div id="popup" class="popup"></div>

<%@ include file="/WEB-INF/views/header.jsp" %>

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
                }, 4000);
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
            setTimeout(() => { popup.classList.add('error'); }, 3100);
            setTimeout(() => {
                popup.classList.remove('error');
            }, 4000);
        }
    });
</script>
</body>
</html>