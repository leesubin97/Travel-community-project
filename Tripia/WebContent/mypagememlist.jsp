<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en"><head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="keywords" content="">
   <meta name="author" content="">
   <meta name="robots" content="">
   <meta name="description" content="LeMars : Blog HTML Template">
   <meta property="og:title" content="LeMars : Blog HTML Template">
   <meta property="og:description" content="LeMars : Blog HTML Template">
   <meta property="og:image" content="http://lemars.dexignzone.com/xhtml/social-image.png">
   <meta name="format-detection" content="telephone=no">
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


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
%> 
   
   
   <style type="text/css">
#detail {
   width: 400px;
   margin: 20px auto;
   text-align: left;
}
#myPage {
   font-size: 1.1em;
}
#myPage a:hover{
   color: white;
   background: orange;
}
</style>
   
<!-- 위에는 부트스트랩 -->
   
   <!-- 상단 작은 아이콘 -->
   <link rel="icon" href="images/favicon.ico" type="image/x-icon">
   <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
   
   <!-- 페이지 타이틀 -->
   <title>Tripia</title>
   
   <!-- 모바일 사이즈 -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <!-- 스타일 시트 -->
   <link rel="stylesheet" type="text/css" href="css/plugins.css">
   <link rel="stylesheet" type="text/css" href="css/style.css">
   <link rel="stylesheet" type="text/css" href="css/templete.css">
   <link class="skin" rel="stylesheet" type="text/css" href="css/skin/skin-1.css">

</head>
<body id="bg">


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
    <div class="page-content bg-white">
        <!-- Slider Banner -->

      <!-- Slider Banner -->
      <div class="content-block">
            <!-- About Us -->
          
            <div class="image-box" align="center">
               
                <div class="container" align="center" style="background-color: black; color: white;  background-image: url('img/sky.jpg'); background-size: cover;">
               <div class="row" align="center" style="width: 280px;" >             
                  <div>                      
                        <div class="title-sm" style="color: white;">With Tripia</div>
                        <h2 class="title-head" style="color: white;">My Page</h2>
   
                        <h1 style="color: white;">Member List</h1>
                     </div>
                    
                </div>
         </div>            
<!-- About Us End -->
         
<%-- 로그인된 회원의 정보를 클라이언트에게 전달하는 JSP문서 --%>
<%--  => 비로그인상태에서 요청한 경우 에러페이지(error400.jsp)로 이동 [비로그인시GET방식으로 접근시도 가능] --%>
<%--  => [회원정보변경] 클릭 : 회원정보 변경을 위한 비밀번호 입력페이지(modify_confirm.jsp)로 이동 --%>
<%--  => [회원탈퇴] 클릭 : 회원탈퇴를 위한 비밀번호 입력페이지(remove_confirm.jsp)로 이동 --%>


<% 
List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");

int memPage = Integer.parseInt((String)request.getAttribute("memPage"));
System.out.println("memPage:" + memPage);

int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));
System.out.println("pageNumber:" + pageNumber);
%>



<div class="container" style="margin-top: 3em;">
<table class="table table-hover">
        <thead>
       <tr>
         <th scope="col" width="50px">#</th>
         <th scope="col" width="300px">ID</th>
         <th scope="col" width="200px">NAME</th>
         <th scope="col" width="200px">EMAIL</th>
         <th scope="col" width="50px">JOINDATE</th>
         <th scope="col" width="60px">DELETE</th>
        
       </tr>
     </thead>
     <tbody>
    <%
if(list == null || list.size() == 0){
   %>
   <tr>
      <td colspan="3">등록된 회원이 없습니다</td>
   </tr>
   <%
}else{
   
   for(int i = 0;i < list.size(); i++){
      MemberDto member = list.get(i);
      %>
      <tr>
         <th><%=i + 1 %></th>
         <td><%=member.getId() %></td>
         <td><%=member.getName() %></td>
         <td><%=member.getEmail() %></td>
         <td><%=member.getJoinDate() %></td>
         <td><button type="button" class="btn btn-secondary" onclick="location.href='member?param=deleteMem&id=<%=member.getId() %>'">Delete</button></td>      
      </tr>
      <%
      }
}
%>  
     </tbody>
</table>
</div>

 <div align="center">
<!-- 페이징    [1] 2 [3] -->
<%
for(int i = 0;i < memPage; i++){
   if(pageNumber == i){   // 현재 페이지      [1] 2 [3] 
      %>
      <span style="font-size: 15pt; color: #000000; font-weight: bold;">
         <%=i + 1 %>
      </span>&nbsp;
      <%
   }
   else{
      %>      
      <a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
         style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
         [<%=i + 1 %>]
      </a>&nbsp;   
      <%
   }   
}
%>
</div>   
</div><!-- 위에 있는거 중앙정렬 -->       
        </div>
<script type="text/javascript">
function goPage( pageNum ) {
   
   location.href = "member?param=memlist&pageNumber=" + pageNum;   
}

function deleteMem(id) {
   alert("삭제");
   location.href = "member?param=deleteMem&id=" + id;   
}

</script>        


      <!-- contact area END -->
  </div>
    <!-- Content END-->
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
    <button class="scroltop fa fa-chevron-up"></button>
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

</body></html>