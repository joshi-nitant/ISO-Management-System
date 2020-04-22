<%-- 
    Document   : form_insert
    Created on : 22 Apr, 2020, 2:19:10 PM
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
        <form action="/ISO/admin/form/insert" method="POST">
            <table border="2">
                <tr>
                    <td>Document Number</td>
                    <td><input type="number" name="document_no"></td>
                </tr> 
                <tr>
                    <td>Document Name</td>
                    <td><input type="text" name="name"></td>
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
                            <c:forEach var="formStructure" items="${requestScope.formStructureList}">
                                <option value="${formStructure. getForm_structure_id() }"><c:out value="${formStructure.getName()}"/></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Starting Teaching Plan</td>
                <td><input type="date" name="starting_plan"></td>
                </tr>
                <tr>
                    <td>Ending Teaching Plan</td>
                    <td><input type="date" name="ending_plan"></td>
                </tr>
            </table>
            <br>
            <br>
            <input type="submit" value="Insert">
        </form>
    </body>
</html>
