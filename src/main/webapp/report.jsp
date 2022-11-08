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

<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="vo" class="com.tjoeun.vo.CategoryVO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>
	<%-- ${vo} --%>
	
<%
	CartegoryService service = CartegoryService.getInstance();
//	신고한 카테고리 이름을 신고 완료 메세지에 표시하기 위해서 신고하기 전에 신고할 카테고리를 얻어온다.
	CategoryVO original = service.selectByIdx(vo.getIdx());
//	신고 버튼이 클릭되면 deletereport 필드값을 1 더해준다
		service.report(vo.getIdx());

		out.println("<script>");
		out.println("alert('" + original.getIdx() + "번 카테고리를 신고했습니다.')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
/*
	if(original.getDeletereport() >= 4) {
		service.deleteCheck(original.getIdx());	
		out.println("<script>");
		out.println("alert('" + original.getIdx() + "번 카테고리는 신고로 삭제되었습니다.')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
	} else {
	//	신고 메세지를 출력하고 카테고리 목록을 얻어오는 페이지(list.jsp)를 호출한다.
		service.report(original.getIdx());	
		out.println("<script>");
		out.println("alert('" + original.getIdx() + "번 카테고리를 신고했습니다.')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
	}
*/
%>
</body>
</html>