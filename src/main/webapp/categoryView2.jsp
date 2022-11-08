<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 프로젝트2</title>
<!-- 부트스트랩 5 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./js/formCheck.js" defer="defer"></script>

</head>
<body class="p-3">
	
	<h1 class="m-3">Category Project</h1><br/>
	<!-- 메인 카테고리 입력 -->
	<!-- 제이쿼리를 이용한 메인 카테고리 폼 체크 -->
	<form id="form" class="row m-3" action="insert.jsp" method="post">
		<div class="col-md-3">
			<input id="category" class="form-control" type="text" name="category"/>
		</div>
		<div class="col-md-2">
			<input 
				class="btn btn-secondary btn-sm" 
				type="submit" 
				value="메인 카테고리 만들기"
				style="font-size: 18px;"/>
		</div>
	</form>
	<hr style="color: red"/>
	
	<!-- 서브 카테고리 개수만큼 반복하며 카테고리 목록을 출력하고 서브 카테고리를 입력받는다. -->
	<c:forEach var="vo" items="${categoryList.list}"><!-- 향상된 for var에 변수 형태명 items에 반복할 객체  -->
		
		<!-- 서브 카테고리를 입력하는 모든 폼에 다른 name속성을 지정해야 식별이 가능하므로 폼 이름을 만든다. -->
		<c:set var="formName" value="form${vo.idx}"></c:set>
		
		<!-- 제이쿼리를 이용한 서브 카테고리 입력 폼 체크 -->
		<form class="sub_form row m-1" action="reply.jsp" method="post" name="${formName}">
			
			<!-- idx, gup, lev, seq를 표시하는 텍스트 상자는 텍스트가 완료되면 모두 hidden으로 처리한다. -->
			<div class="col-md-4">
				<input type="hidden" name="idx" value="${vo.idx}" size="1"/>
				<input type="hidden" name="gup" value="${vo.gup}" size="1"/>
				<input type="hidden" name="lev" value="${vo.lev}" size="1"/>
				<input type="hidden" name="seq" value="${vo.seq}" size="1"/>
				<!-- 카테고리 레벨(lev)에 따른 들여쓰기를 한다. -->
				<c:if test="${vo.lev > 0}">
					<c:forEach var="i" begin="1" end="${vo.lev}" step="1">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<img alt="화살표" src="./images/arrow.png" width="20" height="15"/>
				</c:if>
				<c:if test="${vo.deleteCheck == 'YES'}">
					삭제된 카테고리
				</c:if>
				<c:if test="${vo.deleteCheck != 'YES'}">
					<c:if test="${vo.deletereport >= 5}">
						신고로 삭제된 카테고리
					</c:if>
					<c:if test="${vo.deletereport < 5}">
						<span>${vo.category}&nbsp;(신고:&nbsp;${vo.deletereport}회)</span>						
					</c:if>
				</c:if>
			</div>
			
			<c:if test="${vo.deletereport < 5}">
				<div class="col-md-3">
					<input class="sub_category form-control" type="text" name="category"/>
				</div>
			</c:if>	
				
			<div class="col-md-5">
			<c:if test="${vo.deletereport < 5}">
				<input class="btn btn-outline-secondary btn-sm" type="submit" value="서브 카테고리 만들기" style="font-size: 16px;"/>
				<c:if test="${vo.deleteCheck =='YES'}">
					<input class="btn btn-outline-danger btn-sm" type="button" value="삭제" disabled="disabled"/>
					<%-- <input class="btn btn-outline-success btn-sm" type="button" value="복구" onclick="location.href='restore.jsp?idx=${vo.idx}'"/>	 --%>			
					<input class="btn btn-outline-success btn-sm" type="button" value="복구" onclick="mySubmitRestore(${formName})"/>				
				</c:if>
				<c:if test="${vo.deleteCheck !='YES'}">
					<input class="btn btn-outline-danger btn-sm" type="button" value="삭제" onclick="mySubmitDelete(${formName})"/>
					<%-- <input class="btn btn-outline-success btn-sm" type="button" value="삭제" onclick="location.href='delete.jsp?idx=${vo.idx}'"/>	 --%>			
					<input class="btn btn-outline-success btn-sm" type="button" value="복구" disabled="disabled"/>
				</c:if>
					<input class="btn btn-outline-success btn-sm" type="button" value="수정" onclick="mySubmitUpdate(${formName})"/>				
					<!-- 하나의 폼에서 두번의 submit을 수행하기 위해 하나는 자바스크립트 함수를 만들어서 사용 -->
					<input class="btn btn-outline-secondary btn-sm" type="button" value="신고" onclick="mySubmitReport(${formName})"/>	
				</c:if>		
			</div>
		</form>
	</c:forEach>
	
	
</body>
</html>