<%@ page contentType="text/html;charset=UTF-8" %>
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
                <a class="siteHeader__link" href="${pageContext.request.contextPath}/router?page=home#siteHeader">Home</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link" href="${pageContext.request.contextPath}/router?page=home#siteFeatures">Features</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link" href="${pageContext.request.contextPath}/router?page=home#siteAbout">About</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link" href="${pageContext.request.contextPath}/router?page=home#siteFAQ">F.A.Q.</a>
            </li>
            <li class="siteHeader__item scaleTransition">
                <a class="siteHeader__link" href="${pageContext.request.contextPath}/router?page=home#siteSupport">Support</a>
            </li>
        </ul>

        <div class="siteHeader__authBox">
            <% if (session.getAttribute("userEmail") != null) { %>
            <a href="${pageContext.request.contextPath}/router?page=profile" class="authBox__profile scaleTransition">
                <img src="${pageContext.request.contextPath}/img/profile-icon.svg" alt="Profile" class="profile-icon">
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="authBox__profile scaleTransition">
                <img src="${pageContext.request.contextPath}/img/logout-icon.svg" alt="Logout" class="logout-icon">
            </a>
            <% } else { %>
            <a class="authBox__link scaleTransition" href="${pageContext.request.contextPath}/router?page=login">Login</a>
            <a class="authBox__link scaleTransition" href="${pageContext.request.contextPath}/router?page=signup">Sign up</a>
            <% } %>
        </div>
    </div>
</header>