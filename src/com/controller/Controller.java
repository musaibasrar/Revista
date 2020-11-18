/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.currentIssue.action.CurrentIssueAction;
import com.model.executive.action.ExecutiveAction;
import com.model.personal.action.PersonalAction;
import com.model.user.action.UserAction;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CPEDUR1P5
 */
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String process = request.getParameter("process");
        String action = request.getParameter("action");
        String first = request.getParameter("first");
        String page = request.getParameter("page");
        String criteria = request.getParameter("criteria");
       
        String nextUrl = "";
        
        if (process.equalsIgnoreCase("UserProcess")) {
            nextUrl = new UserAction(request, response).execute(action);
        }else if(process.equalsIgnoreCase("PersonalProcess")){
            nextUrl= new PersonalAction(request, response).execute(action,page);
        }else if(process.equalsIgnoreCase("ExecutiveProcess")){
            nextUrl= new ExecutiveAction(request, response).execute(action);
        }else if(process.equalsIgnoreCase("CurrentIssueProcess")){
            nextUrl= new CurrentIssueAction(request, response).execute(action);
        }else if(process.equalsIgnoreCase("PersonalProcessNextLink")){
            nextUrl= new PersonalAction(request, response).executeNextLink(action,first);
        }else if(process.equalsIgnoreCase("PersonalProcesspages")){
            nextUrl= new PersonalAction(request, response).executePages(page);
        }else if(process.equalsIgnoreCase("Search")){
            nextUrl= new PersonalAction(request, response).execute(action,criteria);
        }

        RequestDispatcher reg = request.getRequestDispatcher(nextUrl);
        response.toString();
        try {
            reg.forward(request, response);
            //reg.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
