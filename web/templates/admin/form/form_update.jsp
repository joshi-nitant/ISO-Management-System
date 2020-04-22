<%-- 
    Document   : form_update
    Created on : 22 Apr, 2020, 2:19:19 PM
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
        <form action="/ISO/admin/form/update" method="POST">
            <table border="2">
                <tr>
                    <td>Document Number</td>
                    <td><input type="number" name="document_no" value="<c:out value="${requestScope.form.getForm_id()}"/>"></td>
                </tr> 
                <tr>
                    <td>Document Name</td>
                    <td><input type="text" name="name" value="<c:out value="${requestScope.form.getName()}"/>"></td>
                </tr>
                <tr>
                    <td>Institute</td>
                    <td>
                        <select name="institute">
                            <c:forEach var="institute" items="${requestScope.instituteList}">
                               
                                <option value="${institute.getInstitute_id()}"><c:out value="${institute.getName()}"/></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <select name="department">
                             <c:forEach var="department" items="${requestScope.departmentList}">
                                <option value="${department.getDepartment_id()}"><c:out value="${department.getName()}"/></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Subject</td>
                    <td>
                        <select name="subject">
                            <c:forEach var="subject" items="${requestScope.subjectList}">
                                <option value="${subject.getSubject_id()}"><c:out value="${subject.getSubject_name()}"/></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                  <tr>
                    <td>Type</td>
                    <td>
                        <select name="type">
                            <option value="<c:out value="${requestScope.form.getForm_structure_id()}"/>" selected><c:out value="${requestScope.form.getType()}"/></option>
                            <c:forEach var="formStructure" items="${requestScope.formStructureList}">
                                <option value="${formStructure.getForm_structure_id() }"><c:out value="${formStructure.getName()}"/></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Starting Teaching Plan</td>
                    <td><input type="date" name="starting_plan" value="<c:out value="${requestScope.form.getTeaching_plan_start()}"/>"></td>
                </tr>
                <tr>
                    <td>Ending Teaching Plan</td>
                    <td><input type="date" name="ending_plan" value="<c:out value="${requestScope.form.getTeaching_plan_end()}"/>"></td>
                </tr>
            </table>
            <br>
            <br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>
