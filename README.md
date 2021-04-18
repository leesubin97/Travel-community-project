# Travel-community-project

## **프로젝트 기획의도**

코로나로인해 위축된 국내관광사업 활성화를 위한 여행지 및 맛집 공유 커뮤니티
국내 여행을 계획중인 사람들에게 도움을 주기 위한 서비스로, 국내에 있는 관광지와 맛집에 대한 DB를 구축하여, 
코로나로 인해 지친 사람들이 더욱 즐거운 국내 여행지를 솔직한 리뷰와 관리자들로부터 추천된 정보들을 활용하여 여행을 계획할 수 있다.


시스템 설계 기술서(프로젝트 정의 및 범위, 각 페이지별 요구기능과 분석)
*프로젝트 정의 및 범위
코로나로 인한 국내 여행 및 국내 관광사업의 위축으로 인해, 코로나가 종료되었을 경우, 위축되었던 관광산업과, 국내 관광지의 원활한 활성화를 위해, 국내 관광지를 관리자멤버들이 직접 가본곳으로 포스팅하여 친절히 안내하고 간단한 정보들을 확인할 수  있는 커뮤니티 시스템이 필요합니다.

기본구성 - 메인페이지, 로그인, 회원가입, 검색기능, 여행지, 맛집, 컨셉별구분페이지, 지역별구분페이지, 자유게시판, Q&A 게시판, 관리자게시판, 공지사항, 지도

개인이 여행을 계획 하기위한 기본적인 정보들을 관리자들이 직접 다녀와본 여행지와 맛집들을 포스팅한 게시물을 통하여, 어느 지역인지, 어느 특징을 가지고 있는지, 각 여행지와 맛집별 어떠한 후기들을 남겼는지를 여행지페이지 및 맛집페이지에 구현하여, 이용자로 하여금 간단명료하게 정보획득을 가능하게 하려 합니다. 

각 이용자는 자신이 이용하려하는 여행지나 맛집에 대한 포스트를 간단히 확인할 수 있으며, 이용했던 여행지나 맛집을 방문했던 기록들을 자유게시판 혹은 Q&A 게시판에 상세히 작성하여 또 다른 사용자나 관리자로 하여금 본인의 요구에 맞는 여행지나 맛집을 선택하는데 큰 기여를 할 수 있습니다.



개발환경
|OS|Windows10|
DB
Oracle 11g, Tomcat
Development Tools
Eclipse
사용기술(언어)
Front-End
Java, Servlet/JSP, EL, JSTL
Back-End
HTML, CSS3, XML, JavaScript, Jquery, Bootstrap, Ajax


## **요구분석(기능)**
**분석내용**



**MainPage**

MainPage에선 여행을 할 목적지,맛집에 대한 간단한 정보들을 출력하여, 클릭 시 List로 이동하여 이용자가 원하는 맛집 혹은 여행지 리스트를 보여준다.이외에도, 우상단에 위치한 회원가입, 로그인페이지로도 이동할 수 있다.

**Login**
**Joi**

회원가입했던 이용자의 정보와 대조하여 로그인을 진행한다. 비 로그인 사용자는 인증이 필요한 MyPage와 Q&A 페이지를 이용할 수 없다
회원가입시, 이용자에게 입력받은 정보를 DB에저장, 로그인 기능에 활용한다..

**각 List**

여행을 계획하는 곳에 대한 여행지나 맛집에 대하여 탐색한다. 어떤 지역에 존재하는지, 어떤 후기가 있는지에 대한 정보를 확인하여 저장된 DB와 대조하여 목록을 출력해준다.
정보를 띄워주는 목록페이지에서는 여행지나 맛집별로 간단한 정보를 나열한 페이지리스트, 우측에 어느 여행지가 어디에 위치해 있는지에 대한 간략한 지도 api를 활용하여
이용자가 한눈에 확인 할 수 있게 도와준다.

**TPList,  MustEat**

각 페이지에서 여행을 하고싶은 지역이나 맛집들에 대한 정보를 얻기위해 이동하며, 각 페이지에서는 그 여행지 혹은 맛집에 대한 간단한 정보들을 얻을 수 있게 한다.
머스트잇 페이지는 사용자가 국내여행지에 대한 맛집 정보를 올릴 수 있고, 사용자가 올릴시 댓글창을 통해 다른 유저와 대화가 가능하다.

**Q&A**

Q&A로 이동하여 관리자에게 궁금한 사항을 직접 질문하고, 답변을 받을 수 있는 기능을 가능하게 한다.


**MyPage**

마이 페이지로 이동하여, 이용자가 가입한 정보에 관련한 사항들을 확인할 수 있다.

**Notice**

국내여행시 코로나 19를 주의 할수 있게 페이지에 코로나맵을 추가하여 유저가 여행시 해당 지역의 확진자 동선을 확인할 수 있다.
관리자만의 공지사항을 작성할수 있다. 사용자가 주의해야할점, 홈페이지 전체 공지사항을 확인가능하다.

**BBSList**

자유게시판으로 이동하여, 이용자가 자유롭게 이미지를 업로드 하고 컨텐츠도 쓸수있으며 거기에 답글까지 작성을 하면서 이용자들끼리 소통을 원활하게 할수있는 게시판이다. 


