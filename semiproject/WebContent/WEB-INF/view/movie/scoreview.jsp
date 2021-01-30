<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<head>
<link rel="stylesheet" href="${context}/resources/css/common/reset.css">
<link rel="stylesheet" href="${context}/resources/css/movie/score.css">
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
				<div class="nation-view">나라별</div>
				<div class="year-view">연도별</div>
				<div class="score-view">
					<a>평점순</a>
				</div>
				<div class="review-view">
					<a>후기순</a>
				</div>
				<div class="search-view">
					<input type="search" class="input_navi-search" name="search">
					<button class="btn_navi-search">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</nav>
	</div>


	<div class="content">
		<div class="mv_view_title">심도 후기별 조회 결과입니다.</div>
		<div class="mv_wrapper">
			<%-- 여기서부터검색결과가 출력되는 것 --%>
			<div class="mv_list_wrap">
				<div class="mv_list_left-wrap">
					<div class="mv_list_top-wrap">
						<div class="mv_title">작은 아씨들</div>
						<div class="mv_btn-more">MORE</div>
					</div>
					<div class="mv_list_middle-wrap">
						<span>심도들의 후기</span>
					<%-- 후기결과도 여기에 더붙는다. --%>
						<div class="mv_reviewlist_wrap">
							<div class="name">코끼리님</div>
							<div class="reivew">네 자매간 각각 다른 가치관이 재미있었고 제가 장녀라 그런지 메그를 특히 응원하게 되었어요! 모든 K장녀 화이팅입니다!</div>
						</div>
					</div>
					<div class="mv_list_bottom-wrap">
						<span>심도들의 기억에 남는 명대사</span>
						<div class="mv_fmslinelist_wrap">
							<div class="name">칸타타님</div>
							<div class="reivew">Women, they have minds, and they have souls, as well as just hearts. And they've got ambition, and they've got talent, as well as beauty, and I'm so sick of people saying that love is just all a woman is fit for. I'm so sick of it!</div>
						</div>
					</div>
				</div>
				
				<div class="mv_list_right-wrap">
					<img src="https://movie-phinf.pstatic.net/20200309_102/1583733575200NVLwA_JPEG/movie_image.jpg">
				</div>
			</div>
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