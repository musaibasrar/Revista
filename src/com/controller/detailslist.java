/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.personal.dao.PersonalDetailsDAO;
import com.model.personal.dto.PersonalDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CPEDUR1P5
 */
public class detailslist extends HttpServlet {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
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
        System.out.println("In detailslist");
        String parameterFrom = request.getParameter("alphabet");
        System.out.println("In the detailslist with alphabet as "+parameterFrom);
        response.setContentType("text/html;charset=UTF-8");
         System.out.println("In detailslist");
        PrintWriter out = response.getWriter();
        this.httpSession = request.getSession();
        List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsAjax(parameterFrom);
        List<PersonalDetails> listPrint = new PersonalDetailsDAO().readListOfObjectsAjaxPrint(parameterFrom);
        System.out.println("In list");
        System.out.println("item in the list is "+list);
          httpSession.setAttribute("PersonalDetailsListAdvance", list);
          httpSession.setAttribute("PersonalDetailsListAdvancePrint", listPrint);
        System.out.println("In detailslist");
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        try {
            out.write("<count>" + list.size() + "</count>");
            System.out.println("The size of the list is "+list.size());
        } catch (Exception e) {
            out.write("<count>0</count>");
        } finally {
            out.flush();
            out.close();
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
