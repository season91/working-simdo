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
	<c:choose>
		<c:when test="${empty res}">
		<div>상세정보를 눌러주세요.</div>
		</c:when>
		<c:otherwise>
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
					<div class="mv_info_basic_content">
						<p>아가씨 The Handmaiden</p>
						<p>감독 : 박찬욱</p>
						<p>장르 : 스릴러</p>
						<p>제작국가 : 한국</p>
						<p>상영시간 : ${res.runtime}</p>
						<p>관람등급 : </p>
					</div>
					<div class="mv_info_plot">
						<p>줄거리<p>
						<div class="mv_info_plot_content">
							어릴 적 부모를 잃고 후견인 이모부(조진웅)의 엄격한 보호 아래 살아가는 귀족 아가씨(김민희). 그녀에게 백작이 추천한 새로운 하녀가 찾아온다. 매일 이모부의 서재에서 책을 읽는 것이 일상의 전부인 외로운 아가씨는  순박해 보이는 하녀에게 조금씩 의지하기 시작한다.   하지만 하녀의 정체는 유명한 여도둑의 딸로, 장물아비 손에서 자란 소매치기 고아 소녀 숙희(김태리). 막대한 재산을 상속받게 될 아가씨를 유혹하여 돈을 가로채겠다는 사기꾼 백작(하정우)의 제안을 받고 아가씨가 백작을 사랑하게 만들기 위해 하녀가 된 것. 드디어 백작이 등장하고, 백작과 숙희는 자신만의 방식으로 아가씨의 마음을 흔들기 시작하는데…   돈과 마음을 뺏기 위해 서로 속고 속이는 매혹적인 그들의 이야기가 시작된다!
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
		</c:otherwise>
	</c:choose>
		
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