<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - Loginner</title>
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
            <h2 class="formBox__title">Reset Password</h2>
            <p class="formBox__text">Enter your email to reset your password.</p>

            <% if (request.getAttribute("error") != null) { %>
            <script>
                const popup = document.getElementById('popup');
                popup.textContent = '<%= request.getAttribute("error") %>';
                setTimeout(() => { popup.classList.add('error'); }, 100);
                setTimeout(() => {
                    popup.classList.remove('error');
                }, 4000);
            </script>
            <% } %>

            <form action="${pageContext.request.contextPath}/reset-password" method="POST" id="resetPasswordForm">
                <div class="formBox__inputBox">
                    <label class="inputBox__label" for="email">Email</label>
                    <input class="inputBox__input" type="email" id="email" name="email" required>
                </div>
                <button type="submit" class="formBox__submit scaleTransition">Reset Password</button>
            </form>

            <p class="siteMain__login">
                Remembered your password? <a class="agreement__link scaleTransition" href="${pageContext.request.contextPath}/router?page=login">Login</a>
            </p>
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
</script>
</body>
</html>