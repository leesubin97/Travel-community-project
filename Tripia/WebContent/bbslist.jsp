<%@page import="dao.PdsDao"%>
<%@page import="dto.PdsDto"%>

<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

   
<% 
	String choice = (String)request.getAttribute("choice");
	String search = (String)request.getAttribute("search"); 

	if(choice == null){
		choice = "";
	}
	if(search == null){
		search = "";
	}

	PdsDao dao = PdsDao.getInstance();

	List<PdsDto> list = (List<PdsDto>)request.getAttribute("list");
	
		
	int len = Integer.parseInt((String)request.getAttribute("len"));

 %>
 
   <%!
// 댓글의 depth와 image를 추가하는 함수   
// depth = 1   ' '->   
// depth = 2   '  '->
 public String arrow(int depth){
 //  String rs = "<img src='./images/arrow.png' width='20px' heiht='20px' />";
   String rs = ">>[답글]";
   String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";   // 여백
   
   String ts = "";
   for(int i = 0;i < depth; i++){
      ts += nbsp;
   }
   
   return depth==0 ? "":ts + rs;   
}

%>
   
<%
	System.out.println(list);
%>

<%
 
System.out.println(list.toString());
System.out.println(list.size());

System.out.println("확인용");


Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
	%>	
	<script>
	alert('로그인 해 주십시오');
	location.href = "login_resist_form.jsp";
	</script>	
	<%
}
mem = (MemberDto)ologin;
%>



<%
 String sbbsPage = (String)request.getAttribute("bbspage");
int bbsPage = 0;
if(sbbsPage != null && !sbbsPage.equals("")){
	bbsPage = Integer.parseInt(sbbsPage);
}
System.out.println("bbspage:" + bbsPage);

String spageNumber = (String)request.getAttribute("pageNumber");
int pageNumber = 0;
if(spageNumber != null && !spageNumber.equals("")){
	pageNumber = Integer.parseInt(spageNumber);
} 
System.out.println("pageNumber:" + pageNumber);



%>  




 <!DOCTYPE html>
 <html lang="en">
<html>

<meta charset="utf-8">
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

<head>

	<!-- 상단 작은 아이콘 -->
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
	<!-- 모바일 사이즈 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

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
	

	
<!-- 스타일 시트 -->
	<link rel="stylesheet" type="text/css" href="css/plugins.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/templete.css">
	<link class="skin" rel="stylesheet" type="text/css" href="css/skin/skin-1.css">

<meta charset="UTF-8">
<title>자유 게시판</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</head>


 <script type="text/javascript">
	$(document).ready(function() {
		
		let search = "<%=search %>";
		if(search == "") return;
		
		let obj = document.getElementById("choice");
		obj.value = "<%=choice %>";
		obj.setAttribute("selected" , "selected");
		
	});

</script> 

<div align="center" >
<br><br>
<!-- 	<div align="center" style="padding-bottom: 3em">
	<b style="font-size: 200% ">자유게시판</b>
	
	</div> -->
	
<!-- 	
<table class="table-hover" style="padding : 1000px; width: 1000px"  >
 -->

<thead>


<!-- <tr>
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
 -->
</thead>

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
					</div>
					</body>
					

<div align="center" style="padding-top: 50px; padding-bottom: 50px ; font-size: 30px">
<h2>forum</h2>

</div>
<table class="table table-striped" style="padding : 1000px; width: 1000px"  >

<thead class="thead-dark">

<tr class="success">
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>


<tbody>
<%
	if(list == null || list.size() == 0 ){
%>
	<tr>
	
		<td colspan="4">자료가 없습니다</td>
	</tr>
<%
	}else{
		for(int i = 0 ; i < list.size(); i++){
			PdsDto pds = list.get(i);		
%>		
	<tr>
		<%-- <th><%=i + 1 %></th> --%>
		<td align="left"><b><%=(i+1) + pageNumber*10 %></b></td>
		<td>
			<%
			if(pds.getDel() == 0){
			%>
			<%=arrow( pds.getDepth() ) %>
			<a href="bbs?param=filedetail&seq=<%=pds.getSeq() %>">
			 <%= pds.getTitle() %>
			</a>
			<%
			}else{
			%>
			<font color="#ff00000">******** 이글은 삭제되었습니다.</font>
			<%
			}
			%>
			</td>
			 <td align="left"><%=pds.getId() %></td> 	 
			 <td><%=pds.getWdate() %></td>
				<td><%=pds.getReadcount() %></td>
			</tr>
			
			
			
			
						
		<%-- <tr align="left" height="5">
			<th><%=i+1+pageNumber*10 %></th>
			<td><%=pds.getId() %></td>
			<td>
				<a href="bbs?param=filedetail&seq=<%=pds.getSeq() %>">
					
					<%=pds.getTitle() %>
				</a>
			</td>
			<td>
				 <input type="hidden"  name="btndown" value="파일"
					onclick="location.href='filedown?filename=<%=pds.getNewfilename() %>&seq=<%=pds.getSeq() %>'">         
				<%=pds.getWdate() %>
			</td>
			<td><%=pds.getReadcount() %></td>
		</tr> --%>


<%
		}
	}



%>



</tbody>
</thead>
</table>



 
<div align="center" >
<!-- 페이징 	[1] 2 [3] -->
<!--  뻬이찡테스토 -->
<%
for(int i = 0 ;i < bbsPage ; i++){
	if(pageNumber == i){	// 현재 페이지		[1] 2 [3] 
		%>
			<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
				<%=i + 1 %>
			</span>&nbsp;
		<%
	}else{
		%>		
		
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]
		</a>&nbsp;	
		<%
	}	
	%>
	<%
}
%>
</div> 
 
 </hearder>
 
<div style="padding-bottom: 3em; padding-top: 2em;">
	<button type="button" class="btn btn-light" onclick="goWrite()">Write</button>
</div>

<!--  <div>		
<button type="button" class="btn btn-light" onclick="searchBbs()">Search</button>	

	</div>  -->
</div>


<table>
<tr>

	<td align="right">
	 <div class="col-sm-3">
				<select id="choice"  class="form-select form-select-sm" size="1" aria-label="size 1 select example">
				<!-- <li data-original-index="0" class="selected"><a tabindex="0" class="" style="" data-tokens="title"><span class="text">1 </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>
				<li data-original-index="1" class="selected"><a tabindex="1" class="" style="" data-tokens="content"><span class="text">2 </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>
				<li data-original-index="2" class="selected"><a tabindex="2" class="" style="" data-tokens="write"><span class="text">3 </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li> -->
					 <option value="title">제목 </option>
					<option value="content">내용 </option>
					<option value="writer">작성자</option>
				</select> 
		<!-- </div> -->
	</td>
	
	
	<td align="center">
			<!-- <div class="col-sm-8" >		 -->
			<input class="form-control form-control-sm" onkeyup="enter()" type="text" id="search" value="" aria-label=".form-control-sm example" size="1px">
			<!-- </div> -->
	</td>
	
	<td>
					
		<button type="button" class="btn btn-light" onclick="searchBbs()" >Search</button>	
		
	</td>	
	
</tr>
</table>
<%-- <input type="text" id="search" value="<%=search %>"> --%>
<!-- <button type="button" onclick="searchBbs()">Search</button> -->

<!-- </div>  -->
 



<br>
<!-- 
<div align="center">
	<input type="button" value="글쓰기" onclick="goWrite()">
</div>

 -->
 <br><br>
 


<script type="text/javascript">
function searchBbs() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
//	alert(choice);
//	alert(search);
	
	location.href = "bbs?param=bbslist&choice=" + choice + "&search=" + search;
}


function goWrite() {
	location.href = "bbs?param=filewrite";
}


function goPage( pageNum ) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "bbs?param=bbslist&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;	
}
function enter() {
	   if (window.event.keyCode == 13) {
	      let choice = document.getElementById("choice").value;
	      let search = document.getElementById("search").value;
	   //   alert(choice);
	   //   alert(search);
	   
	   location.href = "bbs?param=bbslist&choice=" + choice + "&search="+search ;
	   }
	}


</script>

  
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
<!-- JAVASCRIPT FILES ========================================= -->
<script src="js/jquery.min.js"></script><!-- JQUERY.MIN JS -->
<!-- <script src="plugins/bootstrap/js/popper.min.js"></script>BOOTSTRAP.MIN JS 
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>BOOTSTRAP.MIN JS -->
<script src="plugins/bootstrap-select/bootstrap-select.min.js"></script><!--FORM JS -->
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

