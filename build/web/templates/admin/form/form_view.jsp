<%-- 
    Document   : form_view
    Created on : 22 Apr, 2020, 2:18:56 PM
    Author     : Nitant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>Document No</th>
                <th>Form Name</th>
                <th>Type</th>
<!--                <th>Institute</th>
                <th>Department</th>
                <th>Subject</th>-->
                <th>Start Date</th>
                <th>End Date</th>
                <th colspan="2">Operation</th>
            </tr>
            
            <c:forEach var="form" items="${requestScope.formList}">
                 <tr>
                     <td><c:out value="${form.getForm_id()}"/></td>
                     <td><c:out value="${form.getName()}"/></td>
                     <td><c:out value="${form.getType()}"/></td>
                  
<!--                     <td><c:out value="${form.getInstitute_id()}"/></td>    
                     <td><c:out value="${form.getDepartment_id()}"/></td>
                     <td><c:out value="${form.getSubject_id()}"/></td>-->
                     <td><c:out value="${form.getTeaching_plan_start()}"/></td>
                     <td><c:out value="${form.getTeaching_plan_end()}"/></td>
                     <td><a href="/ISO/admin/form/update?Document No=<c:out value="${form.getForm_id()}"/>">Update</td>
                     <td><a href="/ISO/admin/form/delete?Document No=<c:out value="${form.getForm_id()}"/>">Delete</td>
                 </tr>
            </c:forEach>
        <table>
        
            <br/><br/><a href="/ISO/admin/form/insert">Add New Form</a>
    </body>
</html>
