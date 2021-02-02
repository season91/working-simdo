<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<head>
<link rel="stylesheet" href="${context}/resources/css/common/reset.css">
<link rel="stylesheet" href="${context}/resources/css/movie/detail.css">
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
				<div class="genre-view">장르별</div>
				<div class="score-view">
					<a>평점순</a>
				</div>
				<div class="review-view">
					<a>후기순</a>
				</div>
				<form class="search-view">
					<input type="search" class="input_navi-search" name="search">
					<button class="btn_navi-search">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</nav>
	</div>

	<div class="content">
		<div class="mv_info_wrap">
			<div class="mv_info_top-wrap">
				<p class="mv_info_detail">영화 상세 정보</p>
				<div class="mv_info_title">
					<p>내 인생을 망치러 온 나의 구원자</p>
				</div>
			</div>
			<div class="mv_info_middle-wrap">
				<div class="mv_info_top_left mv_info_img">
					<img
						src="https://movie-phinf.pstatic.net/20160523_204/14639851237601hEGQ_JPEG/movie_image.jpg">
				</div>
				<div class="mv_info_top_right">
					<div class="mv_info-title_wrap">
						<div class="mv_info_basic">기본 정보</div>
						<%-- 이부분 해당 영화에 글을썻거나, 찜했으면 색깔 넣어서 표현해주어야 한다.--%>
						<div class="mv_info_btn">
							<button name="like">
								<i class="fas fa-thumbs-up" id="btn_like"></i>
							</button>
							<button name="wish">
								<i class="fas fa-heart" id="btn_wish"></i>
							</button>
							<button name="write-is">
								<i class="fas fa-journal-whills" id="btn_write-is"></i>
							</button>
						</div>
					</div>
					<div class="mv_info_content">
						<p>아가씨 The Handmaiden</p>
						<p>감독 : 박찬욱</p>
						<p>장르 : 스릴러</p>
						<p>제작국가 : 한국</p>
					</div>
					<div class="mv_info_actor">
						주연 배우 정보
						<div class="mv_info_actorlist">
							<div class="actor">
								<img
									src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201408%2F20140825155028107-6430364.jpg">김민희
							</div>
							<div class="actor">
								<img
									src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201805%2F20180529182619381.jpg">김태리
							</div>
							<div class="actor">
								<img
									src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201703%2F20170309160737361.jpg">하정우
							</div>
							<div class="actor">
								<img
									src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201708%2F20170821165401677.jpg">조진웅
							</div>
						</div>

					</div>
					<div class="mv_info_score">
						<p>심도 평점 : 4.5</p>
					</div>
					<div class="mv_info_write">
						<span><a>후기작성</a></span> <span><a>나만의 명대사 작성</a></span> <span><a>번역</a></span>
					</div>

				</div>
			</div>

			<div class="mv_info_bottom-wrap">
				<div class="mv_info_bottom_left">
					<div class="mv_info_simdo-review-wrapper">
						<span class="mv_info_simdo-review">심도 후기</span>
						<div class="mv_review_wrap">
							<div class="mv_review">
								<div class="name">코끼리님</div>
								<div class="review">김민희랑 김태리랑 너무 잘어울리는 영화였어요!</div>
							</div>
						</div>
						<div class="mv_review_wrap">
							<div class="mv_review">
								<div class="name">토끼님</div>
								<div class="review">이런 반전이 있을 줄 전혀 몰랐습니다. 재밌어요!</div>
							</div>
						</div>
						<div class="mv_review_wrap">
							<div class="mv_review">
								<div class="name">추천교수님</div>
								<div class="review">안본눈 삽니다.... 다시 처음부터 또 보고 싶어요ㅠㅠ 비슷한 영화도
									있을지 궁금하네요~</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mv_info_bottom_right">
					<div class="mv_info_simdo-fmsline-wrapper">
						<div class="mv_info_simdo-fmsline">심도 명대사</div>
						<div class="mv_fmsline">
							<div class="mv_review_wrap">
								<div class="mv_review">
									<div class="name">코끼리</div>
									<div class="review">김민희랑 김태리랑 너무 잘어울리는 영화였어요!</div>
								</div>
							</div>
							<div class="mv_review_wrap">
								<div class="mv_review">
									<div class="name">토끼</div>
									<div class="review">이런 반전이 있을 줄 전혀 몰랐습니다. 재밌어요!</div>
								</div>
							</div>
							<div class="mv_review_wrap">
								<div class="mv_review">
									<div class="name">추천교수</div>
									<div class="review">안본눈 삽니다. 다시 처음부터 또 보고 싶어요ㅠㅠ</div>
								</div>
							</div>
						</div>
					</div>
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