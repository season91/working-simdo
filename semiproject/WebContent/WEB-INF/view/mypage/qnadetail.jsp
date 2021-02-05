<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<link rel="stylesheet" href="${context}/resources/css/common/reset.css">
<link rel="stylesheet" href="${context}/resources/css/mypage/qnadetail.css">
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
		<div class="qna_wrap"> 
			<div class="qna-info">
				<div class="qna_head">나의 문의 & 요청</div>
				<div class="qna_title">영화 아가씨 상세정보문의드립니다.</div>
				<div class="qna_info">글번호 1000. 작성시간 : 2021-02-04 14:05</div>
			</div>
			<div class="qna_write_wrap">
				<div class="qna_write_head">문의 내용</div>
				<div class="qna_write_content">아가씨의 시대연도는 어떻게 되는건지 궁금합니다.</div>
			</div>
			<div class="admin_answer_wrap">
				<div class="admin_answer_head">관리자 답변</div>
				<div class="admin_answer_write">관리자의 문의를 확인 중 입니다.</div>
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
	
</body>
</html>