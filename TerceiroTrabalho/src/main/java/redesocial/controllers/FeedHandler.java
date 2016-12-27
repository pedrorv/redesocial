/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package redesocial.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import redesocial.db.DatabaseDAO;
import redesocial.db.Post;

/**
 *
 * @author pedroreis
 * 
 * 
 * Regex adaptada da resposta do usuário anubhava
 * http://stackoverflow.com/questions/19909579/find-and-replace-all-newline-or-breakline-characters-with-n-in-a-string-platf
 * 
 * 
 */
@WebServlet(urlPatterns = {"/user/feed"})
public class FeedHandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        
        try {
            
            HttpSession session = request.getSession();
            int userID = (int) session.getAttribute("id");
            int offset = Integer.parseInt(request.getParameter("offset"));
            int limit = Integer.parseInt(request.getParameter("limit"));
                        
            ArrayList<Post> feed = (new DatabaseDAO()).getFeed(userID, offset, limit);
            
            String JSON = "[";
            
            for (int i = 0; i < feed.size(); i++) {
                JSON += "{";
                JSON += "\"id\": " + feed.get(i).getId() + ",";
                JSON += "\"username\": \"" + feed.get(i).getUsername() + "\",";
                JSON += "\"post\": \"" + feed.get(i).getPost().replaceAll("(\\r|\\n|\\r\\n)", "\\\\n") + "\",";
                JSON += "\"date\": \"" + feed.get(i).getDate() + "\"}";
                if (i != feed.size() - 1) {
                    JSON += ",";
                }
            }           
            JSON += "]";
            
            response.getWriter().write(JSON);         
        } catch (Exception e) {
            response.getWriter().write("{ \"error\": true }");
        }
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
