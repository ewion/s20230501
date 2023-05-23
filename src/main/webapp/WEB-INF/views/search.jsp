<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background: rgb(52, 73, 94);">
<c:forEach var="searchItem" items="${searchList}">
	<c:set var="itemObject" value="${searchItem}" />
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapse-${itemObject.BIZ_ID}"
					aria-expanded="true" aria-controls="collapse-${itemObject.BIZ_ID}">
					${itemObject.BIZ_NAME}
				</button>
			</h2>
			<div id="collapse-${searchItem.BIZ_ID}" class="accordion-collapse collapse show"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					${itemObject.BIZ_COM}
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</body>
</html>
<script type="text/javascript">
</script>
