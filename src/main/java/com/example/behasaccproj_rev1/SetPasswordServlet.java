package com.example.behasaccproj_rev1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;

public class SetPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = (String) request.getSession().getAttribute("resetEmail");
        String password = request.getParameter("password");

        if (email == null) {
            request.setAttribute("error", "Сессия истекла. Пожалуйста, начните сброс пароля заново.");
            request.getRequestDispatcher("/WEB-INF/views/resetpassword.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "beh123mut1195");
            String sql = "UPDATE users SET password = ? WHERE email = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, password);
            pstmt.setString(2, email);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().removeAttribute("resetEmail");
                response.sendRedirect(request.getContextPath() + "/router?page=login&success=password_reset");
            } else {
                request.setAttribute("error", "Ошибка при обновлении пароля");
                request.getRequestDispatcher("/WEB-INF/views/setpassword.jsp").forward(request, response);
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Ошибка: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/setpassword.jsp").forward(request, response);
        }
    }
}