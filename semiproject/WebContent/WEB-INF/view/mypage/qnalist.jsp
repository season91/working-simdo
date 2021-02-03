<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<head>
<link rel="stylesheet" href="${context}/resources/css/common/reset.css">
<link rel="stylesheet" href="${context}/resources/css/mypage/qnalist.css">
<link rel="stylesheet" href="${context}/resources/css/all.css">

</head>
<body>
	
	<div class="header-wrapper">
		<header class="header-section">
			<a class="top-logo-text"><img class="top-logo-img"
				style="width: 20vh; margin-left: 5%" alt="logo"
				src="/resources/image/logo.png"></a>
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<%-- 비로그인 상태 --%>
					<div class="top-right" style="width: 20vh">
						<a class="top_user top_join" href="/user/login.do">로그인</a> <a
							class="top_user" href="/user/join.do">회원가입</a>
					</div>
				</c:when>
				<c:otherwise>
					<%-- 로그인 상태 --%>
					<div class="top-right" style="width: 40vh">
						<a class="top_user top_join" href="/mypage/mypage.do">마이페이지</a> <a
							class="top_user" href="/comm/noticelist.do">커뮤니케이션</a> <a
							class="top_user" href="/user/logout.do">로그아웃</a>
					</div>
				</c:otherwise>
			</c:choose>
		</header>

		<nav class="navi">
			<div class="navi-wrapper">
				<div class="nation-view">영화 달력</div>
				<div class="genre-view">영화 후기</div>
				<div class="score-view">찜목록</div>
				<div class="review-view">회원 정보 변경</div>
				<div class="my-qnalist-view"><a>나의 문의 & 요청</a></div>
			</div>
		</nav>
	</div>
	
	<div class="content">
		<div>나의 문의 요청!</div>
		<table>
		
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="movie" items="${res}">
				<%-- score 글번호 releaseDate 작성일자 mvTitle 글제목 --%>
				<tr>
					<td>${movie.score}</td>
					<td>${movie.mvTitle}</td>
					<td>${movie.releaseDate}</td>
				</tr>
			</c:forEach>
			
		</table>
		<div>페이지번호 
		<c:forEach var="i" begin="1" end="${requestScope.end}" step="1">
			<a href="/mypage/qnalist.do?page=${i}"><c:out value="${i}"/></a>
		</c:forEach>
		</div>
	</div>
	
	<footer class="bottom">
		<div class="bottom_main">
			<h2>SIMDO:WM</h2>
		</div>
		<div class="bottom_content">
			<div class="bottom_left">
				<p>상호 주식회사 심도</p>
				<p>사업자 등록번호:123-45-67890</p>
				<p>주소:대한민국</p>
				<address>TEL:031)111-1212</address>
			</div>
			<div class="bottom_right">
				<a href="/aboutus/">ABOUT US</a><br> <a href="/고객페이지/">
					고객페이지</a><br> <a href="/마이페이지/"> 마이페이지</a><br> <a
					href="/내정보관리/"> 내정보관리</a><br>

			</div>
		</div>
	</footer>

	<script type="text/javascript" src="${context}/resources/js/mypage/qnalist.js"></script>
</body>
</html>