<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
	<h2>게시판 목록</h2>
	<table style="border:1px solid #ccc">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.idx }</td>
							<td class="title"><a href="/first/sample/openBoardDetail.do?IDX=${row.idx}" name="title">${row.title }</a></td>
							<td>${row.hit_cnt }</td>
							<td>${row.crea_dtm }</td>
						</tr>	
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
    <a href="#this" class="btn" id="write">글쓰기</a>
    <%@ include file="/WEB-INF/include/include-body.jsp" %>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#write").on("click", function(e){
    			e.preventDefault();
    			fn_openBoardWrite();
    		});
    	});
    	
    	function fn_openBoardWrite(){
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do'/>");
    		comSubmit.submit();
    	}
    </script>
</body>
</html>