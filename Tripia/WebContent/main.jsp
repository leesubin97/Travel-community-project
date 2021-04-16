<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta name="robots" content="" />
	<meta name="description" content="LeMars : Blog HTML Template" />
	<meta name="format-detection" content="telephone=no">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<!-- 위에는 부트스트랩 -->
	
	<!-- 상단 작은 아이콘 -->
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
	
	<!-- 페이지 타이틀 -->
	<title>Tripia</title>
	
	<!-- 모바일 사이즈 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 스타일 시트 -->

<style type="text/css">
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

	
	<style type="text/css">
	
	/* 페이드 타이머 */
	#test {
    animation: fadein 1.5s;
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 1.5s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
    
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}
	</style>
	
	
	<link rel="stylesheet" type="text/css" href="css/plugins.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/templete.css">
	<link class="skin" rel="stylesheet" type="text/css" href="css/skin/skin-1.css">
	
	<!-- Dao Dto 선언 (로그인 세션 활용) -->
	<%-- <%
		MemberDao dao = MemberDao.getInstance();
	  // MemberDto dto = request.getAttribute(name)
	   
	  
	%>
	
	<%
	String id = null;
	Cookie[] cs = request.getCookies();
	
	
	for(Cookie c : cs){
		if(c.getName().equals("id")){
			id = c.getValue();
		}
	}
	if(id == null){//로그아웃후에 main페이지로 주소값을 입력해도 접속되지않게 방지 (로그인페이지호출)
		response.sendRedirect("login_resist_form.jsp");
	}
%> --%>
	
	
	
</head>
<body id="test"><!-- bg -->

<div class="page-wraper">

<div id="loading-area"></div>
	<!-- header -->
    <header class="site-header mo-left header style-1">
		<!-- main header -->
        <div class="sticky-header main-bar-wraper navbar-expand-lg">
        	<!-- 상단을 담는 큰 박스-->
            <div class="main-bar clearfix" style="padding-top: 15px;padding-bottom: 15px;">
            	<!-- 상단바 전체 -->
                <div class="container" style="margin-left : 240px">
					<div class="header-content-bx no-bdr" style="width: 1390px; padding: 0px">
						<!-- 웹사이트 로고 -->
						<div class="logo-header"  style="margin-right: 50px">
							<a href="index.jsp"><img src="images/logo.png" alt=""/></a>
						</div>
						<!-- nav toggle button 버튼 -->
						<button class="navbar-toggler collapsed navicon justify-content-end" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
							<span></span>
							<span></span>
							<span></span>
						</button>
						<!-- main nav 메인 상단바-->
						<div class="header-nav navbar-collapse collapse justify-content-center" id="navbarNavDropdown" style=" margine-right : 50px " >
							<div class="logo-header">
								<a href="index.jsp"><img src="" alt="images/logo-white.png"/></a>
							</div>
							<ul class="nav navbar-nav">	
								<!-- 추천 여행지 -->
								<li>
									<a href="TpList?param=Tplistr">Recommended <i class="fa fa-chevron-down"></i></a>
								</li>
								<!-- 자유게시판  -->
								<li class="has-mega-menu post-slider life-style">
									<a href="bbs?param=bbslist">Forum<i class="fa fa-chevron-down"></i></a>
									</li>
								<!-- 여행지 목록  -->	
								<li>
									<a href="TpList?param=Tplist">Destination<i class="fa fa-chevron-down"></i></a>
									<ul class="sub-menu">
										<li><a href="TpList?param=Tplist1">서울</a></li>
										<li><a href="TpList?param=Tplist2">제주</a></li>
										<li><a href="TpList?param=Tplist3">인천</a></li>
										<li><a href="TpList?param=Tplist4">부산</a></li>
										<li><a href="TpList?param=Tplist5">강원도</a></li>
									</ul>
								
								</li>
								<!-- 트리피아는? -->
								<li>
									<a href="about-us.jsp">Tripia?</a>
									<!-- 공지사항 -->
									<ul class="sub-menu">
										<li><a href="notice?param=list">Notice</a></li>
										
									</ul>
								</li>
								<li>
									<a href="match?param=Matchlist">Find Mate</a> <!-- 매칭 -->
								</li>

								<!-- 로그인 -->
							
								<li>
									
										
									<c:choose>
									<c:when test="${login.id == null}">  
									
									<a href="login_resist_form.jsp">Login</a>
									</c:when>
									
									<c:when test="${login.id != null}">
									${login.id}님 반갑습니다.
									<a href="logout.jsp">Logout</a>
									<a href="member?param=mapageAf&userID=${login.id}">My page</a>
									<a href="qna?param=qnalist">Q&A</a>									
									</c:when>	
									</c:choose>
									
								</li>
							</ul>

					
						
						

				</div>
            </div>
        </div>
	</div>
</div>
		<!-- 전체 공통 header 끝 -->

        <!-- main header END -->
    </header>
    

    
    <!-- header END -->
    <!-- Content -->
    <div class="page-content bg-white" style="
    padding-bottom: 0px;
">
        <!-- 메인 배경화면 -->
        <!-- <div class="banner-image style-1 dlab-bnr-inr dlab-bnr-inr-lg overlay-black-light relative">
			<img src="images/banner/toppage.jpg" alt="">
        </div> -->
        
        <!-- Slider Banner -->
        <div class="main-slide">
			<div class="post-slide-show no-radius m-b0">
				<div class="post-slide1 owl-carousel owl-btn-center-lr" data-interval="false">
					<div class="item">
						<div class="blog-card">
							<div class="blog-card-media">
								<img src="images/banner/pic1.png" alt="">
							</div>
						</div>
					</div>
					<div class="item">
						<div class="blog-card">
							<div class="blog-card-media">
								<img src="images/banner/video.gif" alt="">
							</div>
						</div>
					</div>
					<div class="item">
						<div class="blog-card">
							<div class="blog-card-media">
								<img src="images/banner/video2.gif" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
        
        <!--  -->
        
		<!-- 배경의 3개 작은상자 -->
		<div class="section-full trend-panel style-1">
			<div class="container">
				<div class="trend-panel-space">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="category-box-outline m-b30">
								<div class="category-box overlay">
								
									<div class="category-media">
									<!-- 메인 작은 상자 1번째 칸 -->
										<img src="images/category/pic4.png" alt="">
									</div>
									
									<div class="category-info">
										<div class="category-style"><a href="javascript:void(0);">Spring</a>
										<input type="hidden" id="concept" value="벚꽃">
										</div>
										<h4><a href="TpList?param=Tplist6&concept=벚꽃">Cherry Blossom Spots</a></h4>
										<!-- 메인 첫번째 작은상자 바로가기 이동 -->
										<a href="TpList?param=Tplist6&concept=벚꽃" class="category-title">VIEW</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="category-box-outline m-b30">
								<div class="category-box overlay">
									<div class="category-media">
									<!-- 메인 작은 상자 2번째 칸 -->
										<img src="images/category/pic2.png" alt="">
									</div>
									<div class="category-info">
										<div class="category-style"><a href="javascript:void(0);">outdoor</a>
										<input type="hidden" id="concept" value="캠핑">
										</div>
										<h4><a href="TpList?param=Tplist7&concept=캠핑">Camping</a></h4>
										<!-- 메인 두번째 작은상자 바로가기 이동 -->
										<a href="TpList?param=Tplist7&concept=캠핑" class="category-title">VIEW</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="category-box-outline m-b30">
								<div class="category-box overlay">
									<div class="category-media">
									<!-- 메인 작은 상자 3번째 칸 -->
										<img src="images/category/pic3.png" alt="">
									</div>
									<div class="category-info">
										<div class="category-style"><a href="javascript:void(0);">flavor</a></div>
										<h4><a href="MustEat?param=MustEatlist">Popular Restaurant</a></h4>
										<!-- 메인 세번째 작은상자 바로가기 이동 -->
										<a href="MustEat?param=MustEatlist" class="category-title">VIEW</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- Trending end -->
		<!-- inner page banner end -->
		<div class="content-block">
			<!-- load-more-content -->
			<div class="section-full bg-white content-inner-2">
                <div class="container">
                    <div class="row">
                    <!-- 사이드 날씨바 -->
						<div class="col-xl-3 col-lg-4 col-md-5 col-sm-12 col-12">	
							<div class="side-bar p-l30 sticky-top">
						
								<div class="widget widget-newsletter text-center">
									 
									<form class="dzSubscribe dezPlaceAni" action="script/mailchamp.php" method="post">
										

										<div class="news-back form-style">
											<h4 style="color: #F7FE2E; text-shadow:3px 3px 3px rgb(0,0,0);">Tripia</h4>
											<h4 style="color: #F7FE2E; text-shadow:3px 3px 3px rgb(0,0,0);">today's weather</h4>
											
											
											<div class = 'weather'>
											   <div class ='CurrIcon'><img id ="CurrIcon" alt = "" src = ""></div>
											    <div style="font-size: 25px" class = 'CurrTemp'></div>
											    <div style="font-size: 20px" class = 'City'></div>
											    
											    <select  id = "place" style="width:135px;height:35px; font-size: 15px; background-color:#F7FE2E ">
											    	<option value = "">Choose a region </option>
											    	<option value = "Incheon">인천</option>
											    	<option value = "Seoul">서울</option>
											    	<option value = "Busan">부산</option>
											    	<option value = "Gangneung">강릉</option>
											    	<option value = "Namyangju">남양주</option>
											    	<option value = "Jeju">제주</option>
											    	<option value = "Jeju">제주</option>
											    </select>
											    
											</div>
											
											<!-- <div class="input-group">
												<input name="dzEmail" required="required" type="email" class="form-control" placeholder="Your Email">
												<div class="input-group-append">
											<button name="submit" value="Submit" type="submit" class="btn"><i class="la la-paper-plane"></i></button>
										</div>
											</div> -->
											<div class="dzSubscribeMsg"></div>
										</div>
									</form>
								</div>
								<!-- 사이드 날씨바 끝 -->
								<div class="widget widget_gallery gallery-grid-2">
									<h6 class="widget-title"><span>Restaurant</span></h6>
									<ul>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img src="images/gallery/widget-gallery/pic1.jpg" alt="">
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img src="images/gallery/widget-gallery/pic2.jpg" alt="">
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img src="images/gallery/widget-gallery/pic3.jpg" alt="">
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img src="images/gallery/widget-gallery/pic4.jpg" alt="">
												</div>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div><div class="col-xl-9 col-lg-8 col-md-7 col-sm-12 col-12">
							<div class="row sp10">
								<div class="col-lg-6">
									<div class="blog-card post-grid m-b30">
										<div class="blog-card-media">
											<img src="images/blog/pic2.png" alt=""> <!-- 왼쪽상자 -->
										</div>
									</div>
								</div>
								<div class="col-lg-6 d-flex">
									<div class="blog-card center text-center bg-dark m-b30">
										<div class="blog-card-info text-white">
											<div class="title-sm"><a href="javascript:void(0);">COVID-19</a></div>
											<h4 class="title"><a href="#">Collective Quarantine</a></h4>
									 		<!-- 오른쪽상자 -->
											<p>Please be aware of virus transmission when traveling.

Like you've been trying so far

I hope that you will continue to comply with the quarantine regulations.
I ask you once again.</p>
											<div class="">
												<ul class="social-link-round">
													<li class="link-ic"><a href="https://www.cdc.go.kr/index.es?sid=a2" class="btn-link share"><i class="la la-share-alt"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							<div class="row sp10" style="width:1000px">
						<!--지도시작  -->		
						<!-- <h3 style="aline:center">Find your utopia!</h3> -->
						<div class="wrap">

						<div class="map_wrap">
							    <div id="map" style="width: 848px; height: 475px; position: relative; overflow: hidden; margin-left: 10px; background: url(&quot;http://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);"><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;http://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;http://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute; left: 278px; top: -373px;"><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L14/-1/-2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -1194px; top: 933px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L14/-1/-1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -682px; top: 933px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map0.daumcdn.net/map_2d/2103dor/L14/-1/0.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -170px; top: 933px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map1.daumcdn.net/map_2d/2103dor/L14/-1/1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 342px; top: 933px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L14/-1/2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 854px; top: 933px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L14/0/-2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -1194px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L14/0/-1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -682px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map0.daumcdn.net/map_2d/2103dor/L14/0/0.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -170px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map1.daumcdn.net/map_2d/2103dor/L14/0/1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 342px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L14/0/2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 854px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L14/1/-2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -1194px; top: -91px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L14/1/-1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -682px; top: -91px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map0.daumcdn.net/map_2d/2103dor/L14/1/0.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -170px; top: -91px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map1.daumcdn.net/map_2d/2103dor/L14/1/1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 342px; top: -91px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L14/1/2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 854px; top: -91px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 512px; height: 512px;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L13/0/-1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -427px; top: 677px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/2103dor/L13/0/0.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -171px; top: 677px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/2103dor/L13/0/1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 85px; top: 677px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L13/0/2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 341px; top: 677px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L13/0/3.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 597px; top: 677px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L13/1/-1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -427px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/2103dor/L13/1/0.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -171px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/2103dor/L13/1/1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 85px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L13/1/2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 341px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L13/1/3.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 597px; top: 421px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L13/2/-1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -427px; top: 165px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/2103dor/L13/2/0.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -171px; top: 165px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/2103dor/L13/2/1.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 85px; top: 165px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/2103dor/L13/2/2.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 341px; top: 165px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/2103dor/L13/2/3.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 597px; top: 165px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 848px; height: 475px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -1974px; top: -577px; width: 4240px; height: 2375px;" viewBox="0 0 4240 2375"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);"><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 232px; top: 704px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(10px, 36px, 47px, 0px); top: -10px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 232px; top: 681px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(56px, 36px, 93px, 0px); top: -56px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 134px; top: 457px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(102px, 36px, 139px, 0px); top: -102px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 263px; top: 592px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(148px, 36px, 185px, 0px); top: -148px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 257px; top: 649px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(194px, 36px, 231px, 0px); top: -194px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 245px; top: 692px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(240px, 36px, 277px, 0px); top: -240px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 239px; top: 685px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(286px, 36px, 323px, 0px); top: -286px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 194px; top: 513px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(332px, 36px, 369px, 0px); top: -332px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 191px; top: 607px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(378px, 36px, 415px, 0px); top: -378px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 243px; top: 691px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(424px, 36px, 461px, 0px); top: -424px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 178px; top: 591px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(470px, 36px, 507px, 0px); top: -470px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 240px; top: 689px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(516px, 36px, 553px, 0px); top: -516px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 225px; top: 699px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(562px, 36px, 599px, 0px); top: -562px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 240px; top: 697px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(608px, 36px, 645px, 0px); top: -608px; left: 0px; width: 36px; height: 691px;"></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 230px; top: 701px; display: block;"><img draggable="false" src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(654px, 36px, 691px, 0px); top: -654px; left: 0px; width: 36px; height: 691px;"></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);"><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;"><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 58px;"></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">64km</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;"><img src="http://t1.daumcdn.net/mapjsapi/images/m_bi_b.png" alt="Kakao 지도로 이동" style="float: left; width: 32px; height: 10px; border: none;"></a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div>
							    
							
							    <div id="menu_wrap" class="bg_white">
							        <div class="option">
							            <div>
							                <form onsubmit="searchPlaces(); return false;">
							                    키워드 : <input type="text" value="부산바다" id="keyword" size="15"> 
							                    <button type="submit">검색하기</button> 
							                </form>
							            </div>
							        </div>
							        <hr>
							        <ul id="placesList"><li class="item"><span class="markerbg marker_1"></span><div class="info">   <h5>부산바다</h5>    <span>부산 서구 원양로 1</span>   <span class="jibun gray">부산 서구 암남동 762</span>  <span class="tel"></span></div></li><li class="item"><span class="markerbg marker_2"></span><div class="info">   <h5>부산실내바다낚시터</h5>    <span>부산 북구 효열로 275</span>   <span class="jibun gray">부산 북구 금곡동 55-2</span>  <span class="tel">051-362-3338</span></div></li><li class="item"><span class="markerbg marker_3"></span><div class="info">   <h5>부산바다횟집</h5>    <span>강원 원주시 금불3길 13</span>   <span class="jibun gray">강원 원주시 단계동 830-2</span>  <span class="tel">033-735-8289</span></div></li><li class="item"><span class="markerbg marker_4"></span><div class="info">   <h5>부산바다장어</h5>    <span>경북 포항시 북구 법원로51번길 24-5</span>   <span class="jibun gray">경북 포항시 북구 장성동 1542-13</span>  <span class="tel">054-255-7992</span></div></li><li class="item"><span class="markerbg marker_5"></span><div class="info">   <h5>부산바다장어</h5>    <span>울산 중구 태화로 299</span>   <span class="jibun gray">울산 중구 태화동 36-18</span>  <span class="tel">052-243-4170</span></div></li><li class="item"><span class="markerbg marker_6"></span><div class="info">   <h5>부산바다축제</h5>    <span>부산 해운대구 중동</span>  <span class="tel">051-888-3393</span></div></li><li class="item"><span class="markerbg marker_7"></span><div class="info">   <h5>부산핫바다704 부산대본점</h5>    <span>부산 금정구 금정로60번길 31</span>   <span class="jibun gray">부산 금정구 장전동 293-161</span>  <span class="tel">1577-0515</span></div></li><li class="item"><span class="markerbg marker_8"></span><div class="info">   <h5>부산바다장어</h5>    <span>경북 영주시 구성로349번길 10</span>   <span class="jibun gray">경북 영주시 영주2동 531-13</span>  <span class="tel"></span></div></li><li class="item"><span class="markerbg marker_9"></span><div class="info">   <h5>부산 자갈치바다장어 산꼼장어</h5>    <span>대구 북구 학정로106길 5</span>   <span class="jibun gray">대구 북구 학정동 928-1</span>  <span class="tel">053-326-2181</span></div></li><li class="item"><span class="markerbg marker_10"></span><div class="info">   <h5>부산바다마라톤</h5>    <span>부산 해운대구 APEC로 55</span>   <span class="jibun gray">부산 해운대구 우동 1500</span>  <span class="tel"></span></div></li><li class="item"><span class="markerbg marker_11"></span><div class="info">   <h5>부산원조바다장어숯불구이</h5>    <span>경북 구미시 인동남길 8</span>   <span class="jibun gray">경북 구미시 진평동 1036-4</span>  <span class="tel"></span></div></li><li class="item"><span class="markerbg marker_12"></span><div class="info">   <h5>바다양푼이동태탕 부산연천점</h5>    <span>부산 연제구 과정로283번길 1</span>   <span class="jibun gray">부산 연제구 연산동 370-1</span>  <span class="tel">051-851-0203</span></div></li><li class="item"><span class="markerbg marker_13"></span><div class="info">   <h5>김해뒷통구이&amp;해물바다 부산본점</h5>    <span>부산 강서구 명지국제6로318번길 32</span>   <span class="jibun gray">부산 강서구 명지동 3378-4</span>  <span class="tel">051-205-9298</span></div></li><li class="item"><span class="markerbg marker_14"></span><div class="info">   <h5>바다양푼이동태탕 부산용당점</h5>    <span>부산 남구 신선로 311</span>   <span class="jibun gray">부산 남구 용당동 179-1</span>  <span class="tel">051-628-5248</span></div></li><li class="item"><span class="markerbg marker_15"></span><div class="info">   <h5>바다양푼이동태탕 부산구평점</h5>    <span>부산 사하구 감천항로 153</span>   <span class="jibun gray">부산 사하구 구평동 178-11</span>  <span class="tel">051-263-7774</span></div></li></ul>
							        <div id="pagination"><a href="#" class="on">1</a><a href="#">2</a><a href="#">3</a></div>
										    </div>
										</div>
																		
							
								
								
							</div></div>
							
		<!--  -->					
							
							
		<!--  -->					
							
							<div class="sep-bottom">
							<div class="row">
								<div class="col-lg-4">
									<div class="blog-card post-grid grid-style m-b30">
										<div class="blog-card-media">
											<img src="images/blog/pic01.gif" alt="">
										</div>
										<div class="blog-card-info">
											<div class="title-sm"><a href="javascript:void(0);">Work</a></div>
											<h5 class="font-20"><a href="post-quote.html">Our creativity.</a></h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="blog-card post-grid grid-style m-b30">
										<div class="blog-card-media">
											<img src="images/blog/pic02.gif" alt="">
										</div>
										<div class="blog-card-info">
											<div class="title-sm"><a href="javascript:void(0);">Life</a></div>
											<h5 class="font-20"><a href="post-left-sidebar.html">Exotic Culture.</a></h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="blog-card post-grid grid-style m-b30">
										<div class="blog-card-media">
											<img src="images/blog/pic03.gif" alt="">
										</div>
										<div class="blog-card-info">
											<div class="title-sm"><a href="javascript:void(0);">Space</a></div>
											<h5 class="font-20"><a href="post-full-width.html">Global Network.</a></h5>
										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					<hr>
					
					</div>
			   </div>
			</div>
		</div>
	</div>
</div>
</div>
		<!--  -->
		
		
		<!--  -->
	<br><br>
		
	<!-- Footer -->
    <footer class="site-footer">
      <div class="footer-top" style="padding-bottom:0px; padding-top:50px">
         <div class="container" style="height:350px;">
            <div class="row">
               <div class="col-xl-3 col-lg-2 col-md-6 d-md-none d-lg-block">
                  <div class="widget">
                     <img src="images/logo-white.png" style="width: 144px; height: 75px; alt="" />
                  </div>
               </div>
               <div class="col-xl-3 col-lg-4 col-md-6">
                  <h6 class="m-b30 footer-title"><span>🤝 Partnership</span></h6>
                  <div class="widget recent-posts-entry">
                     <div class="widget-post-bx">
                        <div class="widget-post clearfix">
                           <div class="dlab-post-media"> <img src="images/blog/recent-blog/pic1.png" alt=""> </div>
                           <div class="dlab-post-info">
                              <div class="dlab-post-header">
                                 <h6 class="post-title"><a href="https://www.airbnb.co.kr/">Airbnb</a></h6>
                              </div>
                              <div class="dlab-post-meta">
                                 <ul>
                                    <li class="post-date">Convenient shared housing.</li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="widget-post-bx">
                        <div class="widget-post clearfix">
                           <div class="dlab-post-media"> <img src="images/blog/recent-blog/pic2.jpg" alt=""> </div>
                           <div class="dlab-post-info">
                              <div class="dlab-post-header">
                                 <h6 class="post-title"><a href="https://www.tripadvisor.co.kr/">Tripadvisor</a></h6>
                              </div>
                              <div class="dlab-post-meta">
                                 <ul>
                                    <li class="post-date">Friendly travel assistant.</li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="widget-post-bx">
                        <div class="widget-post clearfix">
                           <div class="dlab-post-media"> <img src="images/blog/recent-blog/pic3.jpg" alt=""> </div>
                           <div class="dlab-post-info">
                              <div class="dlab-post-header">
                                 <h6 class="post-title"><a href="pic3.jpg">Hotels Combined</a></h6>
                              </div>
                              <div class="dlab-post-meta">
                                 <ul>
                                    <li class="post-date">Worldwide hotel price comparison.</li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6">
                  <h6 class="m-b30 footer-title"><span>TRIPIA VIDEO🎞️</span></h6>
                  <a class="video widget relative popup-youtube overlay-black-middle" href="images/footer-video.mp4">
                     <img src="images/footer-video.gif" alt=""/>
                     <span class="play-video"><i class="la la-play"></i></span>
                  </a>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-12">
                  <h6 class="m-b30 footer-title"><span>Subscribe</span></h6>
                  <ul class="d-flex widget-social-ic">
                     <li><a href="https://www.facebook.com/profile.php?id=100065663813068" class="site-button-link"><i class="fa fa-facebook"></i></a></li>
                     <li><a href="https://www.instagram.com/travel_with_tripia/" class="site-button-link"><i class="fa fa-instagram"></i></a></li>
    					<br>
    				
                  </ul>
                  <br>
                  Service number : 02-483-1983 / 010-5473-1843 <br><br>
                  Company : 23, Baekbeom-ro, Mapo-gu, Seoul, Republic of Korea, Plaza 3F <br><br>
             	  CEO : Su Bin Lee 
               </div>
            </div>
         </div>
      </div>
      <div class="footer-bottom">
         <div class="container">
            <div class="row">
               <div class="col-12 text-center">
                  <span>Copyright © 2021 Tripia.</span>
               </div>
            </div>
         </div>
      </div>
   </footer>
    <button class="scroltop fa fa-chevron-up" ></button>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c765d356014b8164374e21a1abcc0ed8&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>


<!-- JAVASCRIPT FILES ========================================= -->
<script src="js/jquery.min.js"></script><!-- JQUERY.MIN JS -->
<script src="plugins/bootstrap/js/popper.min.js"></script><!-- BOOTSTRAP.MIN JS -->
<script src="plugins/bootstrap/js/bootstrap.min.js"></script><!-- BOOTSTRAP.MIN JS -->
<script src="plugins/bootstrap-select/bootstrap-select.min.js"></script><!-- FORM JS -->
<script src="plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script><!-- FORM JS -->
<script src="plugins/magnific-popup/magnific-popup.js"></script><!-- MAGNIFIC POPUP JS -->
<script src="plugins/counter/waypoints-min.js"></script><!-- WAYPOINTS JS -->
<script src="plugins/counter/counterup.min.js"></script><!-- COUNTERUP JS -->
<script src="plugins/imagesloaded/imagesloaded.js"></script><!-- IMAGESLOADED -->
<script src="plugins/masonry/masonry-3.1.4.js"></script><!-- MASONRY -->
<script src="plugins/masonry/masonry.filter.js"></script><!-- MASONRY -->
<script src="plugins/owl-carousel/owl.carousel.js"></script><!-- OWL SLIDER -->
<script src="js/custom.js"></script><!-- CUSTOM FUCTIONS  -->
<script src="js/dz.carousel.js"></script><!-- SORTCODE FUCTIONS -->
<script src="js/dz.ajax.js"></script><!-- CONTACT JS  -->
</body>
</html>
