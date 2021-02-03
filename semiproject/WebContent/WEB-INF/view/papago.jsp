<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<body>


	<h2>번역테스트</h2>
	<h3>번역전</h3>
	<input type="text" name="fms" id="fms">
	<button onclick="translation()">전송</button>

	<h3>번역후</h3>
	<div class="trans">번역된값:</div>

<script type="text/javascript" src="${context}/resources/js/papago.js">
 
</script>
</body>
</html>