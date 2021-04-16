<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dto.MemberDto"%>
 <%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
	%>	
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>	
	<%
}
mem = (MemberDto)ologin;
request.setAttribute("mem", mem);

QnaDto qna = (QnaDto)request.getAttribute("qna");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MatchWrite</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <!-- 부트 -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta name="robots" content="" />
	<meta name="description" content="LeMars : Blog HTML Template" />
	<meta property="og:title" content="LeMars : Blog HTML Template" />
	<meta property="og:description" content="LeMars : Blog HTML Template" />
	<meta property="og:image" content="http://lemars.dexignzone.com/xhtml/social-image.png" />
	<meta name="format-detection" content="telephone=no">
  
  
	<!-- 상단 작은 아이콘 -->
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
	
	<!-- 페이지 타이틀 -->
	<title>Tripia</title>
	
	<!-- 모바일 사이즈 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 스타일 시트 -->
	<link rel="stylesheet" type="text/css" href="css/plugins.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/templete.css">
	<link class="skin" rel="stylesheet" type="text/css" href="css/skin/skin-1.css">
	
	<!-- 이전에 사용했던 시트 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha256-YLGeXaapI0/5IgZopewRJcFXomhRMlYYjugPLSyNjTY=" crossorigin="anonymous" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./css/business-casual.min0406.css" rel="stylesheet">
</head>




<body>
 <header class="site-header mo-left header style-1">
      <!-- main header -->
        <div class="sticky-header main-bar-wraper navbar-expand-lg">
            <div class="main-bar clearfix ">
                <div class="container">
               <div class="header-content-bx no-bdr">
                  <!-- 웹사이트 로고 -->
                  <div class="logo-header">
                     <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
                  </div>
                  <!-- nav toggle button 버튼 -->
                  <button class="navbar-toggler collapsed navicon justify-content-end" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                     <span></span>
                     <span></span>
                     <span></span>
                  </button>
                  <!-- main nav 메인 상단바-->
                  <div class="header-nav navbar-collapse collapse justify-content-center" id="navbarNavDropdown">
                     <div class="logo-header">
                        <a href="index.jsp"><img src="" alt="images/logo-white.png"/></a>
                     </div>
                     <ul class="nav navbar-nav">   
                        <!-- 홈 -->
                        <li class="active">
                           <a href="index.jsp">홈 <i class="fa fa-chevron-down"></i></a>
                        </li>
                        <!-- 추천 여행지 -->
                        <li>
                           <a href="#">추천 여행지 <i class="fa fa-chevron-down"></i></a>
                        </li>
                        <!-- 자유게시판  -->
                        <li class="has-mega-menu post-slider life-style">
                           <a href="#">자유게시판<i class="fa fa-chevron-down"></i></a>
                           </li>
                        <!-- 여행지 목록  -->   
                        <li>
                           <a href="#">여행지 목록<i class="fa fa-chevron-down"></i></a>
                           <ul class="sub-menu">
                              <li><a href="#">여행지1</a></li>
                              <li><a href="#">여행지2</a></li>
                              <li><a href="#">여행지3</a></li>
                              <li><a href="#">여행지4</a></li>
                              <li><a href="#">여행지5</a></li>
                              <li><a href="#">여행지6</a></li>
                              <li><a href="#">여행지7</a></li>
                           </ul>
                        
                        </li>
                        <!-- 트리피아는? -->
                        <li>
                           <a href="about-us.html">트리피아는?</a>
                        </li>
                        <!-- 로그인 -->
                        <li>
                           <a href="#">로그인</a>
                        </li>
                     </ul>

                     <!-- 건의사항 오른쪽 미니 소셜 아이콘 -->
                     <div class="social-menu">
                        <ul>
                           <li><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                           <li><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                           <li><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
                           <li><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="extra-nav">
                     <div class="extra-cell">
                        <ul>
                           <li><a href="#" class="site-button-link"><i class="fa fa-facebook"></i></a></li>
                           <li><a href="#" class="site-button-link"><i class="fa fa-twitter"></i></a></li>
                           <li><a href="#" class="site-button-link"><i class="fa fa-pinterest-p"></i></a></li>
                           <li><a href="#" class="site-button-link"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            </div>
        </div>
        <!-- main header END -->
    </header>



<h1 class="site-heading text-center text-white d-none d-lg-block">
    <span class="site-heading-upper text-primary mb-3">QNA BOARD</span>
    <span class="site-heading-lower">ask me anything</span>
   
  </h1>

  <section class="page-section cta">
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <div class="cta-inner text-center rounded">
            <h4 class="section-heading mb-4">
              <span class="section-heading-upper">QNA</span>
              <br>
             
            </h4>
            <p class="mb-0">문의 내역</p>
            <br>
          <!-- write -->
         <div align = "center" class = "container">
<br><br>


	

<table class="table table-hover">
	<col width = "200"><col width = "500">

	<tr>
	<th>ID</th>
	<td>${qna.id }</td>
</tr>

<tr>
	<th>TITLE</th>
	<td>${qna.title }</td>
</tr>

<tr>
	<th>DATE</th>
	<td>${qna.wdate }</td>
</tr>

<tr>
	<th>HITS</th>
	<td>${qna.readcount }</td>
</tr>

<tr>
	<th>CONTENT</th>
	<td>
	<textarea rows="20" cols="50" readonly="readonly" style="border:none">${qna.content }</textarea>
	</td>
</tr>


</table>


<br><br>

	<h3><b>ANSWER</b></h3>

<form action="qna" method="post">
<input type="hidden" name="param" value="answerAf">
<input type="hidden" name="seq" value="<%=qna.getSeq() %>">

<table class="table table-hover">
<col width = "200"><col width = "500">
<tr>
	<th>ID</th>
	<td>
		<input type="text" name="id" value="<%=mem.getId() %>" readonly="readonly" size="51" style="border:none">
	</td>
</tr>

<tr>
	<th>TITLE</th>
	<td>
		<input type="text" name="title" style="border:none" size="51" >
	</td>
</tr>

<tr>
	<th>CONTENT</th>
	<td>
	<textarea rows="20" cols="50" name="content" style="border:none" ></textarea>
	</td>
</tr>
</table>
	<div align="center" style="padding-bottom: 2em;">
		<button type="submit" class="btn btn-light">reply</button>
	</div>
</form>




</div>
					          
					          
					          </div>
					          
        </div><!-- 상자 안 -->
      </div>
    </div>
  </section>
<!-- footer -->
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

  <!-- Bootstrap core JavaScript -->
  <script src="./vendor/jquery/jquery.min.js"></script>
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



</body>
</html>