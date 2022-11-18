<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.dao.BoardDAO, com.example.vo.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id = request.getParameter("id");
    BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
    <!--<input type="hidden" name="moddate" value="">-->
    <table>
        <tr>
            <td>Category:</td>
            <td><input type="text" name="category" value="<%= u.getCategory()%>"/></td>
        </tr>
        <tr>
            <td>Title:</td>
            <td><input type="text" name="title" value="<%= u.getTitle()%>"/></td>
        </tr>
        <tr>
            <td>Writer:</td>
            <td><input type="text" name="writer" value="<%= u.getWriter()%>"/></td>
        </tr>
        <tr>
            <td>Photo:</td>
            <td><input type="file" name="photo" value="${u.getPhoto()}"/>
        <tr>
            <td>Content:</td>
            <td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td>
        </tr>
        <tr>
            <td>Current Photo:</td>
            <td><c:if test="${u.getPhoto() ne null}"><br/><img width="100" height="100"
                                                             src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}"
                                                             class="photo"></c:if></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Edit Post"/>
                <input type="button" value="Cancel" onclick="history.back()"/></td>
        </tr>
    </table>
</form>

</body>
</html>