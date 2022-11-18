<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.dao.BoardDAO" %>

<% request.setCharacterEncoding("utf-8"); %>
<%--
<jsp:useBean id="u" class="com.example.vo.BoardVO" />
<jsp:setProperty property="*" name="u"/>
--%>
<%@ page import="com.example.util.FileUpload" %>
<%@ page import="com.example.vo.BoardVO" %>
<%
    BoardDAO boardDAO = new BoardDAO();
    FileUpload upload = new FileUpload();
    BoardVO u = upload.uploadPhoto(request);

    int i = boardDAO.updateBoard(u);
    response.sendRedirect("posts.jsp");
%>