<%@page import="dao.MustEatDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
 <%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
   %>   
   <script>
   alert('로그인 해 주십시오');
   location.href = "member?param=login";
   </script>   
   <%
}
mem = (MemberDto)ologin;
%> 

<%
String choice = request.getParameter("choice");
String search = request.getParameter("search");
if(choice == null){
   choice = "";
}
if(search == null){
   search = "";
}
%>

  <%  

    MustEatDao dao = MustEatDao.getInstance();
    
    //List<MustEatDto> list = (List<MustEatDto>)request.getAttribute("list");
   
    
    //MemberDto mem= (MemberDto)session.getAttribute("login");
    
  
   
   
    %>


<html>
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mustlist</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
    <link rel="stylesheet" href="cards-gallery/cards-gallery.css">
     <link rel="stylesheet" href="cards-gallery/compact-gallery.css">
    <!-- 위까지 카드 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="keywords" content="" />
   <meta name="author" content="" />
   <meta name="robots" content="" />
   <meta name="description" content="LeMars : Blog HTML Template" />
   <meta property="og:title" content="LeMars : Blog HTML Template" />
   <meta property="og:description" content="LeMars : Blog HTML Template" />
   <meta property="og:image" content="http://lemars.dexignzone.com/xhtml/social-image.png" />
   <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.css"> 
   <link rel = "stylesheet" href="./css/list.css">
   <style type="text/css">
   
   
   </style>
   
<!-- 위에는 부트스트랩 -->

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

   <script type="text/javascript">
   $(document).ready(function() {
   // 검색어 있는 경우   
   let search = ${search };   // Java Script에서 EL tag는 접근이 가능합니다.
   if(search == "") return;
   
   // select
   let obj = document.getElementById("choice");
   obj.value = ${choice };
   obj.setAttribute("selected", "selected");
});
</script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body style="background-color: #fdedec">
 <header class="site-header mo-left header style-1">
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
    
                            
                            <!-- 사이드바 오른쪽 -->
<div class="page-content bg-white">

	<div class="content-block">
	
		<!-- About Us -->
       	<div class="section-full content-inner bg-white">
       	
           <div class="container">
           
			<div class="row">
			
			
             
			<!-- 카드 넣기 -->
			
				<div class="col-xl-9 col-lg-8 col-md-7 col-sm-12 col-12" >
							<div class="section-head text-center">
								<div class="title-sm">With Tripia</div>
								<h2 class="title-head">MUSTEAT</h2>
								<h6 class="title-head">
								<a style="font-size: 30px" href = "MustEat?param=MEWrite">Share your restaurant right now!</a>
								</h6>
							</div>
							
							
							
							<div style="background-color: #f9f5f5" class="blog-post blog-single blog-post-style-2 sidebar">
							
								
							<hr>
							<!-- 메인 게시글 요이땅 -->

<%-- <%
List<TpListDto> list = (List<TpListDto>)request.getAttribute("list");

MemberDto mem = (MemberDto)session.getAttribute("login");
if(mem == null){
	response.sendRedirect("login_resist_form.jsp");
	%>
	<script type="text/javascript">
	location.href = "";
	</script>
	<%
}
%> --%>

		<!-- 추천게시판 -->

				 <section class="gallery-block compact-gallery">
            <div class="container">
                <div class="heading">
                    <h2>Post ranking</h2>
                </div>
                <div class="row no-gutters">
                
                	<c:if test="${empty listrank }">		
							<div align="center">
								<p>아직 추천 게시물이 없습니다.</p>
								</div>
						
					</c:if>	
                
                
                	<c:if test="${not empty listrank }">
                	
                	
                	<c:forEach var="dto" items="${listrank}" varStatus="i">
           
                	
                <br><br><br><br>
                
                    <div style="width: 300px; height: 250px;"class="col-md-6 col-lg-4 item" onclick="MustEat?param=Mustdetail&seq=${dto.seq}" style="width: 300px; height: 250px; ">
                       
                     
                         <a class="lightbox"  href="./upload/${dto.newFilename}"> 
                            <img  style="width: 300px; height: 250px; " src="./upload/${dto.newFilename}" alt="Card Image"   class="img-fluid image scale-on-hover" >
                        	 <span class="description" onclick="MustEat?param=Mustdetail&seq=${dto.seq}">
                            <span onclick="location.href='MustEat?param=Mustdetail&seq=${dto.seq}'" class="description-heading"  style="font-size: 23px">${i.index + 1}위<br><br>${dto.place}</span>
                            <span class="description-body" style="font-size: 23px">${dto.title}</span>
                     		
                        
                        </span>
                        
               				
                        </a> 
                       
                        
                    </div>
                    </c:forEach>
                    </c:if>
                   
                </div><!-- row끝 -->
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
        <script>
            baguetteBox.run('.compact-gallery', { animation: 'slideIn'});
        </script>
        
        


							<div class="" style="margin-bottom: 0px">
								<div class="aufx blog-user " style="border-radius: 15px; padding: 0px">
								<section class="gallery-block cards-gallery" >
								    <div class="container">
								        <div class="heading">
								          <!-- <h2>Cards Gallery</h2> -->
								          <h2> ALL Post </h2>
								        </div>
									
										<div class="row">
												
										<c:if test="${empty list }">		
												<div align="center">
												<p>아직  게시물이 없습니다.</p>
												</div>
										
										</c:if>		
													
													<c:if test="${not empty list }">
													<c:forEach var="dto" items="${list}" varStatus="i">
													
													<div class="col-md-6 col-lg-4" style="width: 250px; height: 400px; margin-bottom: 100px"  >
														<div class="card border-0 transform-on-hover" style="width: 250px; height: 450px;">
															<a class="lightbox" href="./upload/${dto.newFilename}">
									                			<img  style="width: 250px; height: 200px;" src="./upload/${dto.newFilename}" alt="Card Image" class="card-img-top">
									                		</a>
									                		<div class="card-body">
									                		<p style="color:#f87567">${dto.place}</p>
										                        <h6>
											                        <a href="MustEat?param=Mustdetail&seq=${dto.seq}">
																		${dto.title}
											                        </a>
										                        </h6>
										                        <c:set var="content" value = "${dto.content}"/>
										                   <p class="text-muted card-text">${fn:substring(content,0,35)}..</p>
										                        <p><b>Writer</b>&nbsp;&nbsp;${dto.name}</p>
	                          
								                                  
								                                   <p><b>page views</b>&nbsp;&nbsp;${dto.readcount}</p>
								                                   <%-- <p>${i.index + 1 + (pageNumber * 10)}</p> --%>
										                        
										                        
										                        
										                        
										                    </div>
														</div>
													</div><br><br><br><br>
													</c:forEach>
													</c:if> 											
	
								    	</div>
									</div>
								</section>
								
							</div>
							<br><br>
							<br><br>
							<br><br>
																						
												<div align="center" style="margin-left: 280px;">																	
						<div align="center" class="container">
						<ul class="pagination">
						 <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<c:if test="${bbsPage != 0}">
						
							<c:forEach begin="0" end="${bbsPage -1}" varStatus="i">
							   <c:choose>
							       <c:when test="${pageNumber == i.index}">
							       <!-- 첫번째 페이징 --> <li class="page-item"><a class="page-link">${i.index + 1}</a> </li>
							         
							       </c:when>
							       <c:when test="${pageNumber != i.index}">
							         <!-- 다음페이징 --><li class="page-item"><a href="#none"  onclick="goPage(${i.index})">${i.index + 1}</a></li>
							       </c:when>
							    </c:choose>
							</c:forEach>
							
							</c:if>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>
						</div>	
												<br><br>

												<script type="text/javascript">
													function searchBbs() {
														let choice = document.getElementById("choice").value;
														let search = document.getElementById("search").value;
													//	alert(choice);
													//	alert(search);
														
														location.href = "TpList?param=Tplist&choice=" + choice + "&search=" + search;
													}
													function goPage( pageNumber ) {
														let choice = document.getElementById("choice").value;
														let search = document.getElementById("search").value;
														
													//	alert(choice);
													//	alert(search);
														
														location.href = "TpList?param=Tplist&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;	
													}
													</script>
						</div>										
					</div>
				</div>
				
					<div class="col-xl-3 col-lg-4 col-md-5 col-sm-12 col-12">	
							<div class="side-bar p-l30 sticky-top">
							
										<!-- 검색바 -->
										<h6 class="widget-title"><span>search</span></h6>
										 <div class="form-group">
						                    <label for="exampleSelect1"></label>
						                    <select id="choice" class="form-control" id="exampleSelect1">
						                      <option value="title" >제목</option>
						                      <option value="content">내용</option>
						                      <option value="writer" >작성자</option>
						                     
						                    </select>
                  							</div>
						
										
							
										<form class="form-inline my-2 my-lg-0">
						                    <input style="width: 128px" class="form-control mr-sm-2" id="search" type="text" placeholder="Search"
						                    value="${search }">
						                    <button type="button" class="btn btn-secondary my-2 my-sm-0"  onclick="searchBbs()">Search</button>
						                  </form>
											<br><br>
							
								<div class="widget widget-newsletter text-center">
									<form class="dzSubscribe dezPlaceAni" action="script/mailchamp.php" method="post">
										<div class="news-back form-style">
											<h4 style="color: #F7FE2E; text-shadow:3px 3px 3px rgb(0,0,0);">Tripia</h4>
											<h4 style="color: #F7FE2E; text-shadow:3px 3px 3px rgb(0,0,0);">today's weather</h4>
											<div class = 'weather'>
											   <div class ='CurrIcon'><img id ="CurrIcon" alt = "" src = ""></div>
											    <div style="font-size: 20px" class = 'CurrTemp'></div>
											    <div style="font-size: 20px" class = 'City'></div>
											    
											    <select  id = "place" style="width:135px;height:35px; font-size: 15px; background-color:#F7FE2E ">
											    	<option value = "">Choose a region </option>
											    	<option value = "Incheon">인천</option>
											    	<option value = "Seoul">서울</option>
											    	<option value = "Busan">부산</option>
											    	<option value = "Jeju">제주</option>
											    	<option value = "Gangneung">강릉</option>
											    	<option value = "Sokcho">속초</option>
											    	<option value = "Gyeongju">경주</option>
											    	<option value = "Yeosu">여수</option>
											    	<option value = "Ulsan">울산</option>
											    	<option value = "Daejeon">대전</option>
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
								
								<script type="text/javascript">

 var place;/// = $("#place option:selected").val();

$(document).ready(function(){
	
	$("#place").change(function(){
	
	//	alert($("#place option:selected").val());
	    place = $("#place option:selected").val();
		let weather = 'http://api.openweathermap.org/data/2.5/weather?q='+ place +'&appid=0da614b3fe6226c81e152090ea42602a&units=metric'
	
	    $.ajax({
	        url: weather,
	        dataType: 'json',
	        type: 'GET',
	        success: function(data){
	        	
	            var $Icon = (data.weather[0].icon);
	            var $Temp = Math.floor(data.main.temp) + 'º';
	            var $city = data.name;
	
	             $('#CurrIcon').attr("src",'http://openweathermap.org/img/wn/'+ $Icon + '@2x.png');
	             $('.CurrTemp').html($Temp);
	             $('.City').html($city);
	             
	             //prepand, append
	        }
	    });
	});
});

</script>
								
								
								
								
								
								<div class="widget widget_gallery gallery-grid-2">
									<h6 class="widget-title"><span>travel</span></h6>
									<ul>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img style="width: 107.22px; height: 107.22px;" src="images/gallery/widget-gallery/adsf.jpg" alt="">
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img style="width: 107.22px; height: 107.22px;" src="images/gallery/widget-gallery/jeju.jpg" alt="">
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img style="width: 107.22px; height: 107.22px;" src="images/gallery/widget-gallery/summer.jpg" alt="">
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="dlab-post-thum dlab-img-overlay1 dlab-img-effect">
													<img style="width: 107.22px; height: 107.22px;" src="images/gallery/widget-gallery/beach.jpg" alt="">
												</div>
											</a>
										</li>
									</ul>
								</div>
								
							
								
							</div>
						</div>
					
					
					
						
					
</div>

</div>

      
      
   
               
               

              
    
							
							
			
						
					</div>
					</div>
					</div>

    
    
    
   





    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script>
        baguetteBox.run('.cards-gallery', { animation: 'slideIn'});
    </script>
    
    <script type="text/javascript">
   function searchBbs() {
   let choice = document.getElementById("choice").value;
   let search = document.getElementById("search").value;
//   alert(choice);
//   alert(search);
   
   location.href = "MustEat?param=MustEatlist&choice=" + choice + "&search=" + search;
}

   function goPage( pageNum ) {
   let choice = document.getElementById("choice").value;
   let search = document.getElementById("search").value;
   
   location.href = "MustEat?param=MustEatlist&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;   
}

</script>
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
</body>
</html>