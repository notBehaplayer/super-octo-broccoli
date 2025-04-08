<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Result</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
</head>
<body>
<h2>Результат регистрации</h2>
<% if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %>
</p>
<% } else { %>
<p>Регистрация успешна!</p>
<a href="${pageContext.request.contextPath}/router?page=login">Войти</a>
<% } %>
</body>
</html>