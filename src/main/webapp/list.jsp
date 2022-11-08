<%@page import="com.tjoeun.service.CartegoryService"%>
<%@page import="com.tjoeun.vo.CategoryList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	
<%
//	테이블에 저장된 전체 카테고리 목록을 얻어와서 CategoryList 클래스의 ArrayList에 저장한 후
//	CategoryList 클래스 객체를 request영역에 저장해서 카테고리 목록을 출력하는 페이지(categoryView.jsp)로 넘겨준다.
	CategoryList categoryList = CartegoryService.getInstance().selectList();
	request.setAttribute("categoryList", categoryList);
	pageContext.forward("categoryView2.jsp");
	
	
%>	

</body>
</html>
