<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<link rel="stylesheet" href="${context}/resources/css/common/reset.css">
<link rel="stylesheet" href="${context}/resources/css/movie/search.css">
<link rel="stylesheet" href="${context}/resources/css/all.css">
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
						<a class="top_user top_join" href="/mypage/mypage.do">마이페이지</a> 
						<a class="top_user" href="/comm/noticelist.do">커뮤니케이션</a> <a
							class="top_user" href="/user/logout.do">로그아웃</a>
					</div>
				</c:otherwise>
			</c:choose>
		</header>
		
		<nav class="navi">
			<div class="navi-wrapper">
				<div class="nation-view">나라별</div>
				<div class="genre-view">장르별</div>
				<div class="score-view">
					<a>평점순</a>
				</div>
				<div class="review-view">
					<a>후기순</a>
				</div>
				<form class="search-view" action="/movie/searchview.do">
					<input type="search" class="input_navi-search" name="search" placeholder="영화제목을 검색하세요.">
					<button class="btn_navi-search">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</nav>
	</div>
		<div class="content">
			<div class="mv_view_title">검색결과 입니다.</div>
			<div class="mv_wrapper">
			<c:forEach var="movie" items="${res}" varStatus="status">
				<div class="mv_view_list">
					<div class="mv_view_img"><img src="${movie.poster}"></div>
					<div class="mv_view_text">
						<p class="mv_title">${movie.mvTitle}</p>
						<p class="mv_info">${movie.nation} / ${movie.director} 감독</p>
						<a class="mv_readmore" href="/movie/detailview.do" name="title" value="rere">더보기</a>
					</div>
				</div>
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

	<script type="text/javascript"
		src="${context}/resources/js/movie/movie.js"></script>
	
</body>
</html>