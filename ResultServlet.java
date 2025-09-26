package com;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/result")
public class ResultServlet extends HttpServlet {

    private int calculateWPM(String userInput, double seconds) {
        if (seconds <= 0) return 0;
        int wordCount = userInput.trim().split("\\s+").length;
        return (int) (wordCount / (seconds / 60));
    }

    private double calculateAccuracy(String original, String typed) {
        if (original == null || original.isEmpty()) return 0;

        int correctChars = 0;
        int minLength = Math.min(original.length(), typed.length());

        for (int i = 0; i < minLength; i++) {
            if (original.charAt(i) == typed.charAt(i)) correctChars++;
        }

        return Math.round(((double) correctChars / original.length()) * 100);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userText = request.getParameter("userInput");
        double timeTaken = Double.parseDouble(request.getParameter("timeTaken"));

        HttpSession session = request.getSession();
        String originalText = (String) session.getAttribute("originalText");

        int wpm = calculateWPM(userText, timeTaken);
        double accuracy = calculateAccuracy(originalText, userText);

        session.removeAttribute("originalText");

        request.setAttribute("wpm", wpm);
        request.setAttribute("accuracy", accuracy);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}
