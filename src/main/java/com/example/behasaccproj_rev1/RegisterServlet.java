package com.example.behasaccproj_rev1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "beh123mut1195");
            String sql = "INSERT INTO users (first_name, last_name, email, phone_number, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, phoneNumber);
            pstmt.setString(5, password);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                // Успешная регистрация: перенаправляем с параметром success
                response.sendRedirect(request.getContextPath() + "/router?page=login&success=true");
            } else {
                // Ошибка: перенаправляем с параметром error
                response.sendRedirect(request.getContextPath() + "/router?page=login&error=Ошибка+регистрации");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Ошибка с сообщением об исключении
            String errorMessage = java.net.URLEncoder.encode("Ошибка: " + e.getMessage(), "UTF-8");
            response.sendRedirect(request.getContextPath() + "/router?page=login&error=" + errorMessage);
        }
    }
}