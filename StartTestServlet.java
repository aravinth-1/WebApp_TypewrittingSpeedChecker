package com;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import java.io.IOException;
import java.util.Random;

@WebServlet("/start")
public class StartTestServlet extends HttpServlet {

    private static final String[] WORDS = {
        "java", "web", "programming", "keyboard", "speed", 
        "typing", "test", "computer", "developer", "netbeans",
        "application", "server", "browser", "internet", "project"
    };

    private String getRandomText(int wordCount) {
        Random rand = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < wordCount; i++) {
            sb.append(WORDS[rand.nextInt(WORDS.length)]);
            if (i < wordCount - 1) sb.append(" ");
        }
        return sb.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String text = getRandomText(15);
        HttpSession session = request.getSession();
        session.setAttribute("originalText", text);
        request.setAttribute("displayText", text);
        request.getRequestDispatcher("/test.jsp").forward(request, response);
    }
}