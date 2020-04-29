/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.admin.controllers.form;

import com.admin.dao.Dao;
import com.admin.dao.DepartmentDao;
import com.admin.dao.FormDao;
import com.admin.dao.FormStructureDao;
import com.admin.dao.InstituteDao;
import com.admin.dao.SubjectDao;
import com.iso.admin.models.Department;
import com.iso.admin.models.Form;
import com.iso.admin.models.FormStructure;
import com.iso.admin.models.Institute;
import com.iso.admin.models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nitant
 */
@WebServlet(name = "FormUpdateServlet", urlPatterns = {"/admin/form/update"})
public class FormUpdateServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         int document_number = Integer.parseInt(request.getParameter("Document No"));
        Dao instituteDao = new InstituteDao();
        Dao departmentDao = new DepartmentDao();
        Dao subjectDao = new SubjectDao();
        Dao formStructureDao = new FormStructureDao();
     
        ArrayList<Institute> instituteList =  (ArrayList<Institute>)instituteDao.view();
        ArrayList<Department> departmentList =  (ArrayList<Department>)departmentDao.view();
        ArrayList<Subject> subjectList =  (ArrayList<Subject>)subjectDao.view();
        ArrayList<FormStructure> formStructureList = (ArrayList<FormStructure>)formStructureDao.view();
        
        request.setAttribute("instituteList",instituteList);
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("subjectList",subjectList);
        request.setAttribute("formStructureList",formStructureList);
        
        FormDao formDao = new FormDao();
        Form form = formDao.viewSpecific(document_number);
        request.setAttribute("form", form);
        request.getRequestDispatcher("/templates/admin/form/form_update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
       try {
        int document_number = Integer.parseInt(request.getParameter("document_no"));
        String name = request.getParameter("name");
        int institute_id = Integer.parseInt(request.getParameter("institute"));
        int department_id = Integer.parseInt(request.getParameter("department"));
        int subject_id = Integer.parseInt(request.getParameter("subject"));
        int form_structure = Integer.parseInt(request.getParameter("type"));
        Date startingPlan = new SimpleDateFormat("YYYY-MM-dd").parse(request.getParameter("starting_plan"));
        Date endingPlan = new SimpleDateFormat("YYYY-MM-dd").parse(request.getParameter("ending_plan"));
        String type="";
        
        if(form_structure==1){
            type="Lecture";
        }else if(form_structure==2){
            type="Lab";
        }
        Dao formDao = new FormDao();
        
        Form form = new Form(document_number,name,type,institute_id,department_id, subject_id, form_structure, startingPlan, endingPlan);
        formDao.update(form);
        response.sendRedirect("/ISO/admin/form");
        } catch (ParseException ex) {
            Logger.getLogger(FormInsertServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }
    
}
