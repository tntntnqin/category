<%@page import="com.tjoeun.vo.CategoryVO"%>
<%@page import="com.tjoeun.service.CartegoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>test    얌얌    </div>
<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="vo" class="com.tjoeun.vo.CategoryVO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>
	${vo}
	
<%
	CartegoryService service = CartegoryService.getInstance();
//	수정할 카테고리 이름을 수정 완료 메세지에 표시하기 위해서 수정하기 전에 수정할 카테고리를 얻어온다.
	CategoryVO original = service.getInstance().selectByIdx(vo.getIdx());
	//	out.println(original);

// 수정 버튼이 클릭되면 해당 카테고리를 수정한다.
	service.categoryUpdate(vo);


//	수정 메세지를 출력하고 카테고리 목록을 얻어오는 페이지(list.jsp)를 호출한다.
	out.println("<script>");
	out.println("alert('" + original.getCategory() + " 카테고리를 " +vo.getCategory() + " 카테고리로 수정했습니다.')");
	out.println("location.href='list.jsp'");
	out.println("</script>");
%>
</body>
</html>
