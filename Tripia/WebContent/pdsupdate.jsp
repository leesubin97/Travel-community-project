<%@page import="dao.PdsDao"%>
<%@page import="dto.PdsDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>


    <%
MemberDto mem = (MemberDto)session.getAttribute("login");

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

/* PdsDto dto= (PdsDto)request.getAttribute("dto"); */

 PdsDto dto = PdsDao.getInstance().getPds(seq); 
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta name="robots" content="" />
	<meta name="description" content="LeMars : Blog HTML Template" />
	<meta property="og:title" content="LeMars : Blog HTML Template" />
	<meta property="og:description" content="LeMars : Blog HTML Template" />
	<meta property="og:image" content="http://lemars.dexignzone.com/xhtml/social-image.png" />
	<meta name="format-detection" content="telephone=no">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 상단 작은 아이콘 -->
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
	
	
	<!-- 페이지 타이틀 -->
	<title>Tripia</title>
	
	<!-- 모바일 사이즈 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 스타일 시트 -->
	
	
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
	
	
	
	
	
</head>
<body id="test">

<div class="page-wraper"></div>
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
					
<!-- 날씨끝 -->

<div  align="center" style="padding-top: 30px">
	<!-- <b>자유게시판</b> -->
</div>
<div align="center" style="padding-top: 30px">
<form action="fileupdate?param=updatePds" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

<h2>revise</h2>

<table border="1" class="table table-bordered"style="padding : 1000px; width: 550px" >



<col width="200"><col width="500">
<thead class="thead-dark">


<tr>
	<th>아이디</th>
	<td>
		<%=dto.getId() %>
		<input type="hidden" name="id" value="<%=dto.getId() %>">
		<input type="hidden" name="name" value="<%=dto.getName() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="30" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>업로드파일</th>
	<td>
		<input type="text" name="oldfile" size="30" readonly="readonly" value="<%=dto.getFilename() %>">
		<input type="hidden" name="oldnewfile" size="30" value="<%=dto.getNewfilename() %>">
	</td>
</tr>
<tr>
	<th>변경할 파일 업로드</th>
	<td>
	<input type="file" name="newfileload" class="btn btn-light"  style="widows: 400px" > 
	<!-- <div class="form-group">
	<label for="InputSubject1"></label> -->
	<%-- <input id="fileInput" filestyle="btn"  name="newfileload" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
	<div class="bootstrap-filestyle input-group">
	 	<input type="text" id="userfile" class="form-control" name="userfile" disabled="" value="<%=dto.getNewfilename() %>"> 
		<span class="group-span-filestyle input-group-btn" tabindex="0">
			<label for="fileInput" class="btn btn-default">
				<span class="glyphicon fa fa-upload"></span>
			</label> --%>
<!-- 		</span>
	</div>
</div> -->
	
	</td>	
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="35" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>

</thead>

</table>

		<input type="submit" value="수정완료" class="btn btn-light">
	<br><br>
	
</form>

</div>



 
    <!-- header END -->
    <!-- Content -->

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
                  <span>Copyright © 2020 DexignZone.</span>
               </div>
            </div>
         </div>
      </div>
   </footer>
    <!-- Footer END-->
    <button class="scroltop fa fa-chevron-up" ></button>
</div>

</div>
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

