package com.example.behasaccproj_rev1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/router")
public class RouterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
        if (page == null || page.isEmpty()) {
            page = "home";
        }

        String jspPath = switch (page) {
            case "home" -> "/WEB-INF/views/index.jsp";
            case "about" -> "/WEB-INF/views/about.jsp";
            case "signup" -> "/WEB-INF/views/signup.jsp";
            case "login" -> "/WEB-INF/views/login.jsp";
            case "terms" -> "/WEB-INF/views/terms.jsp";
            case "privacy" -> "/WEB-INF/views/privacy.jsp";
            default -> "/WEB-INF/views/error.jsp";
        };

        request.getRequestDispatcher(jspPath).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}