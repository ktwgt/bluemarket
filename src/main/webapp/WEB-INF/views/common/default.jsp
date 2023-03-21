<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>    
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="../resources/img/basket.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR:wght@400;700&family=Noto+Serif+KR:wght@700&display=swap" rel="stylesheet">
<title>블루마켓</title>
 <style>
 @font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
   body {
     margin:0px;
     font-family: 'GmarketSansMedium';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
     font-weight: normal;
     font-style: normal;
   }
   header {
     width:1000px;
     height:25px;
     margin:auto;
     font-size:13px;
     position:relative;
   }
   header #left {
       position:relative;
       display:inline-block;
       left:0px;
       top:1px;
       color:#696969;
   }  
   header #right {
       position:relative;
       display:inline-block;
       left:755px;
       top:1px;
       color:#696969;
       height:30px;
   }
   header #star {
       position:relative;
       top:5px;
       width:20px;
       height:20px;
       valign:center;
   }
   header a {
     text-decoration:none;
     color:#696969;
   }
   header #gogaek {
      cursor:pointer;
      display:inline-block;
      height:30px;
   }
   header #gogaeksub {
       padding-left:0px;
     position:absolute;
     left:57px;
     top:14px;
     border:1px solid #cccccc;
     padding:4px;
     z-index:10;
     background:white;
     visibility:hidden;
   }
   header #gogaeksub li {
     list-style-type:none;
     width:100px;
     text-align:left; 
     padding-left:5px;
     line-height:20px; 
   }
   
   nav {
     width:1000px;
     height:120px;
     margin:auto;
   }
   nav a {
      text-decoration:none;
      color:black;
   }
   nav #logo {
      position:relative;
      display:inline-block;
      top:15px;
      left:-15px;
      font-size:30px;
      font-family:'Gugi', cursive;
   }
   nav #logo a{
      color:#4776b4;
   }
   nav #basket {
      position:relative;
      left:10px;
      top:9px;
      width:45px;
      height:45px;      
   }
   
   nav #search {
    position: relative;
    display:inline-block;
    top:8px;
    left:60px;
    width:430px;
    height:40px;
    border:3px solid #4776b4;
    border-radius:5px;
    
   }
   nav #search input[type=text] {
      width:375px;
      height:29px;
    border:none;
    outline:none;
    padding-left:5px;
    padding-top:0px;
    font-family: 'GmarketSansMedium';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
     font-weight: normal;
     font-style: normal;
     font-size:14px;
   }

   
     #searchbtn { 
       position:relative;
       top:5px;
       background:white;
       width:25px;
       height:25px;
       border: 0;
       cursor:pointer;
       
}
   nav #dot {
      position:absolute;
      width:20px;
      height:20px;
      top:8px;
      right:12px;
      margin:0;
   }
   nav #menu1 {
      position:relative;
      display:inline-block;
      top:15px;
      left:119px;
   }
   nav #account {
      width:30px;
      height:30px;
   }
   nav #acc{
      position:relative;
      top:-10px;
      color:black;
      font-size:15px;
   }
   nav #talk {
      width:30px;
      height:30px;
   }
    nav #tal{
      position:relative;
      top:-10px;
      color:black;
      font-size:15px;
   }
    nav #sell {
      width:30px;
      height:30px;
   }
      nav #sel {
      position:relative;
      top:-10px;
      color:black;
      font-size:15px;
      }
      nav #vline {
       position:relative;
       top:-10px;
       color:#696969;
       font-size:12px;
      }
      nav #main {
        padding-left:0px;
        display:inline-block;
        position:relative;
        left:-5px;
        top:17px;
        z-index:9999;
      }
      nav #main > li {
        list-style-type:none;
        display:inline-block;
        width:120px;
        height:35px;
        text-align:center;
        font-weight:500;
        font-size:17px;
      }
      nav #category {
        position:relative;
        left:-15px;
        cursor:pointer;
      }
      nav #m1 {
        position:relative;
        left:100px;
      }
      nav #m1 a:hover {
        color:#4776b4;
        text-decoration:underline;
      }
      nav #m2 {
        position:relative;
        left:200px;
      }
      nav #m2 a:hover {
        color:#4776b4;
        text-decoration:underline;
      }
      nav #m3 {
        position:relative;
        left:300px;
      }
      nav #m3 a:hover {
        color:#4776b4;
        text-decoration:underline;
      }
      nav #m4 {
        position:relative;
        left:400px;
      }
      nav #m4 a:hover {
        color:#4776b4;
        text-decoration:underline;
      }

      nav #category .dae {
      position:absolute;
      width:150px;
      height:500px;
      left:20px;
      top:33px;
      padding-left:15px;
      padding-top:5px;
      background:white;
      list-style-type:none;
      border:1px solid #cccccc;
      text-align:left;
      font-size:14px;
      display:none;
      }
      nav #category .dae > li {
        list-style-type:none;
        width:150px;
        height:30px;
      }
      
      nav #category .dae > li > span a:hover {
         color:#4776b4;
         text-decoration:underline;

      }
      
      nav .dae .jung {
        position:absolute;
        padding-left:15px;
        padding-top:4px;
      left:165px;
      top:-1px;
      width:150px;
      height:500px;
      border:1px solid #cccccc;
      background:white;
      display:none;
      }
      nav .dae .jung > li {
         list-style-type:none;
         width:150px;
         height:30px;
      }
      
    nav .dae .jung > li > span a:hover {
       color:#4776b4;
       text-decoration:underline;
    }
      
      nav .jung .so {
         position:absolute;
         padding-left:15px;
         padding-top:4px;
         left:165px;
         top:-1px;
         width:150px;
         height:500px;
         border:1px solid #cccccc;
         background:white;
         display:none;
      }
      
       nav .jung .so > li {
      list-style-type:none;
      width:150px;
      height:30px;
   }
      nav .jung .so > li > span a:hover {
         color:#4776b4;
         text-decoration:underline;
      }
      
      
   footer {
      width:1000px;
      height:400px;
      margin:auto;
   }
   footer #f1 {
      position:relative;
      display:inline-block;
      left:550px;
      top:-200px;
   }
   footer #f2 {
      position:relative;
      display:inline-block;
      left:-300px;
      top:5px;
   }
   footer #f3 {
      position:relative;
      display:inline-block;
      left:550px;
      top:-140px;
   }   
   
   #floatMenu {
   position: absolute;
   width: 95px;
   height: 250px;
   left:1030px;
   top: 150px;
   z-index:9999;
}
   #floatMenu #float1 {
      border:1px solid black;
      background:white;
      width:95px;
      height:50px;
      text-align:center;
      padding-top:5px;
   }
   #floatMenu #float2 {
      position: relative;
      top:7px;
      border:1px solid #cccccc;
      width:95px;
      height:190px;
      text-align:center;
      padding-top:5px;
      background:white;
   }
   #floatMenu #float3 {
      position: relative;
      top:15px;
      border:1px solid #cccccc;
      width:95px;
      height:30px;
      text-align:center;
      padding-top:5px;
      font-weight:bold;
      cursor:pointer;
      background:white;
   }
   hr {
      border:0px;
      height:0.5px;
      background-color:#eeeeee;
   }

 </style>
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
 window.Kakao.init("a3bfb6ab0dd5e068f7d0caadb4a4e7ac");
   function kakaoLogout() {
       if (!Kakao.Auth.getAccessToken()) {
           console.log('Not logged in.');
           return;
       }
       Kakao.Auth.logout(function(response) {
           alert(response +' logout');
           window.location.href='/myshop/main/main'
       });
   };
   
   function secession() {
       Kakao.API.request({
           url: '/v1/user/unlink',
           success: function(response) {
               console.log(response);
               //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
               window.location.href='/myshop/main/main'
           },
           fail: function(error) {
               console.log('탈퇴 미완료')
               console.log(error);
           },
       });
   };
   function jeul()
   {
      alert("Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.");
   }
   
   
   
   $(function()
   {
      $("#gogaek").mouseover(function()
      {
         $("#gogaeksub").css("visibility","visible");
      });
      $("#gogaek").mouseout(function()
      {
         $("#gogaeksub").css("visibility","hidden");      
      });
               
       $("nav #category").mouseover(function()
       {
          $("nav #category .dae").show();
       });
       
        $("nav #category").mouseout(function()
       {
          $("nav #category .dae").hide();
                  
         for(i=0;i<$(".jung").length;i++)
            $("nav .dae .jung").eq(i).hide();
                  
          for(i=0;i<$(".so").length;i++)
            $("nav .jung .so").eq(i).hide();
       })
               
       $("nav .dae > li").mouseover(function()
       {   
          for(i=0;i<$(".jung").length;i++)
            $("nav .dae .jung").eq(i).hide();
            
         var n=$(this).index();
             $("nav .dae .jung").eq(n).show();
       });
       
        
        // 중분류에 id로 jung1,2,3,4,5부여하여 작동
         $("nav #jung1 > li").mouseover(function()
       {
           for(i=0;i<$(".so").length;i++)
            $("nav #jung1 .so").eq(i).hide();
                  
         var n=$(this).index();
            $("nav #jung1 .so").eq(n).show();
       });
         
         $("nav #jung2 > li").mouseover(function()
        {
              for(i=0;i<$(".so").length;i++)
             $("nav #jung2 .so").eq(i).hide();
                         
           var n=$(this).index();
              $("nav #jung2 .so").eq(n).show();
         });
         $("nav #jung3 > li").mouseover(function()
         {
              for(i=0;i<$(".so").length;i++)
               $("nav #jung3 .so").eq(i).hide();
                               
            var n=$(this).index();
               $("nav #jung3 .so").eq(n).show();
         });
         $("nav #jung4 > li").mouseover(function()
         {
              for(i=0;i<$(".so").length;i++)
               $("nav #jung4 .so").eq(i).hide();
                                
            var n=$(this).index();
               $("nav #jung4 .so").eq(n).show();
         });
         $("nav #jung5 > li").mouseover(function()
         {
              for(i=0;i<$(".so").length;i++)
               $("nav #jung5 .so").eq(i).hide();
                                 
            var n=$(this).index();
               $("nav #jung5 .so").eq(n).show();
         });
         
         $(document).ready(function() {

              // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
              var floatPosition = parseInt($("#floatMenu").css('top'));
              // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

              $(window).scroll(function() {
                 // 현재 스크롤 위치를 가져온다.
                 var scrollTop = $(window).scrollTop();
                 var newPosition = scrollTop + floatPosition + "px";

                 /* 애니메이션 없이 바로 따라감
                  $("#floatMenu").css('top', newPosition);
                  */

                 $("#floatMenu").stop().animate({
                    "top" : newPosition
                 }, 500);

              }).scroll();

           });
         
   });

   var win_width=window.screen.width/2-225;
	var win_height=window.screen.height/2-345;
	
	function go_chating_list()
	{
		open("../chat/chating_list", "",
				"width=550,height=650,left="+win_width+",top="+win_height);
	}
      
 </script>
</head>
  <decorator:head/>
<body>
   <header>
      <div id="left">
         <a href="javascript:jeul();"><img src="../resources/img/star.png" id="star">즐겨찾기</a>
      </div> 
         
    <div id="right">
       <c:if test="${userid == null}">
        <a href="../login/login"> 로그인/회원가입 </a> |
       </c:if>
    
       <c:if test="${userid != null && userid != 'admin' }"> 
        ${name}님 |
        <a href="../login/logout"> 로그아웃 </a> |
          </c:if>
          
          <c:if test="${userid == 'admin'}">
             <a href="../admin/admin_page">관리하기</a> |
          <a href="../login/logout"> 로그아웃 </a> |
          </c:if>
           
          <div id="gogaek"> 고객센터 ▼
          <ul id="gogaeksub">
             <li><a href="../gongji/gongji"> 공지사항 </a></li>
             <li><a href="../qna/qna">자주하는 질문</a></li>
          </ul>
       </div>    
   </div>
<!--
<div id="floatMenu">
   <div id="float1"> 찜한상품 </div>
   <div id="float2"> 최근본상품 </div>
   <div id="float3" onclick="window.scrollTo(0,0);"> TOP </div>
</div>
--> 

   </header>  <!-- 로그인,회원가입 -->
   
   <hr>
   
   <nav>
     
   
      <div id="logo"><a href="../main/main"><img src="../resources/img/basket.png" id="basket"> 블루마켓 </a></div> 
    
    <div id="search">
        <form id="main_search" method="post" action="../main/pro_search">
         <input type="hidden" name="clk" value="1">
         <input type="hidden" name="page" value="1">
         <input type="text" name="search" placeholder="어떤 상품을 찾으시나요 ?">
         <button type="submit" id="searchbtn">
         	<img src="../resources/img/dot.png" width="25" height="25">
         </button>
      </form>
   </div>
      
   <div id="menu1">
   <a href="../mypage/mypage?ww=0"><img src="../resources/img/account.png" id="account"><span id="acc">내상점</span></a> <span id="vline">|</span> 
   <c:if test="${userid!=null}">
		<span onclick="go_chating_list()" style="cursor:pointer;"><img src="../resources/img/talk.png" id="talk"><span id="tal"> 블루톡</span></span> <span id="vline">|</span>
	</c:if>
	
	<c:if test="${userid==null}">
		<span style="cursor:pointer;"><img src="../resources/img/talk.png" id="talk"><span id="tal"> 블루톡</span></span> <span id="vline">|</span>
	</c:if>
    <a href="../panmae/pnew"><img src="../resources/img/sell.png" id="sell"><span id="sel">판매하기</span></a>
   </div>
      
   <ul id="main">
      <li id="category">≡ 카테고리
         <ul class="dae">
          <li><span><a href="../panmae/plist?pcode=p01">여성의류</a></span>
                  <ul class="jung" id="jung1">
                  <li> <span> <a href="../panmae/plist?pcode=p0101"> 패딩/점퍼</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p010101">롱패딩</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010102">숏패딩</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010103">블루종/항공점퍼</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010104">기타(패딩/점퍼)</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0102"> 블라우스</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p010201">긴팔 블라우스</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010202">반팔 블라우스</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010203">민소매 블라우스</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010204">기타(블라우스)</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0103"> 셔츠</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p010301">솔리드 셔츠</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010302">스트라이프 셔츠</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010303">체크 셔츠</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p010304">청/데님 셔츠</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0104">기타</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p010401">기타(여성의류)</a></span></li>
                    </ul>
                  </li>              
               </ul>               
            </li>         
         <li><span><a href="../panmae/plist?pcode=p02">남성의류</a></span>
                  <ul class="jung" id="jung2">
                  <li> <span> <a href="../panmae/plist?pcode=p0201"> 패딩/점퍼</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p020101">롱패딩</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p020102">숏패딩</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p020103">블루종/항공점퍼</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p020104">기타(패딩/점퍼)</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0202">코트</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p020201">겨울 코트</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p020202">봄/가을 코트</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0203"> 맨투맨</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p020301">맨투맨 등</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p020302">맨투맨 등</a></span></li>
                    </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0204">후드티/후드집업</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p020401">후드티/후드집업 등</a></span></li>
                    </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0205">티셔츠</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p020501">긴팔 티셔츠</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p020502">반팔 티셔츠</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p020503">민소매 티셔츠</a></span></li>
                     </ul>
                  </li>               
                  </ul>               
               </li>
               <li><span><a href="../panmae/plist?pcode=p03">신발</a></span>
                  <ul class="jung" id="jung3">
                  <li> <span> <a href="../panmae/plist?pcode=p0301">스니커즈</a></span>
                     <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p030101">스니커즈 등</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0302">남성화</a></span>
                    <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p030201">샌들/슬리퍼</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p030202">구두/로퍼</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p030203">워커/부츠</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p030204">기타(남성화)</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0303">여성화</a></span>
                    <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p030301">샌들/슬리퍼</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p030302">구두</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p030303">단화/플랫슈즈</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p030304">워커/부츠</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p030305">기타(여성화)</a></span></li>
                     </ul>
                  </li>     
               </ul>               
               </li>
            <li><span><a href="../panmae/plist?pcode=p04">가방</a></span>
                  <ul class="jung" id="jung4">
                  <li> <span> <a href="../panmae/plist?pcode=p0401">여성가방</a></span>
                  <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p040101">클러치백</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040102">숄더백</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040103">크로스백</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040104">토트백</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040105">백팩</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040106">기타(가방)</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0402">남성가방</a></span>
                  <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p040201">클러치백</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040202">숄더백</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040203">크로스백</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040204">브리프케이스</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040205">백팩</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040206">기타(가방)</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0403">여행용</a></span>
                  <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p040301">캐리어</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p040302">기타(여행용)</a></span></li>
                    </ul>
                  </li>                       
               </ul>               
               </li>
            <li><span><a href="../panmae/plist?pcode=p05">시계/쥬얼리</a></span>
                  <ul class="jung" id="jung5">
                  <li> <span> <a href="../panmae/plist?pcode=p0501">시계</a></span>
                  <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p050101">남성시계</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p050102">여성시계</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p050103">기타(시계)</a></span></li>
                     </ul>
                  </li>
                  <li> <span> <a href="../panmae/plist?pcode=p0502">쥬얼리</a></span>
                  <ul class="so">
                        <li> <span> <a href="../panmae/plist?pcode=p050201">귀걸이/피어싱</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p050202">목걸이/펜던트</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p050203">팔찌/발찌</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p050204">반지</a></span></li>
                        <li> <span> <a href="../panmae/plist?pcode=p050205">기타(쥬얼리)</a></span></li>
                     </ul>
                  </li>                       
               </ul>            
               </li>
            <li>패션/액세서리 </li>            
            <li>디지털/가전 </li>
            <li>스포츠/레저 </li>
            <li>차량/오토바이 </li>
            <li>스타굿즈 </li>
            <li>키덜트 </li>
            <li>예술/희귀/수집품</li>
         </ul>    
      </li>
      <li id="m2"><a href="../want/list">구해요!</a></li>
      <li id="m3"><a href="../event/eventlist">이벤트</a></li>
      <li id="m4"><a href="../bmap/bmap">우리동네</a></li>   
   </ul>     

   </nav> <!-- 로고, 검색창, 메뉴1번, 카테고리 있는곳 -->
  
  <hr>
   
   <decorator:body/>
   
   <hr>
   <footer> 
   <div id="f1">
      <div style="color:#5f5f5f;font-weight:900;font-size:18px;">고객센터</div>
       <span style="color:#5f5f5f;font-weight:900;font-size:30px;">1644-0207</span> <br>
       <span style="color:#696969;font-size:12px;line-height:25px;">운영시간9시 -18시(주말/공휴일 휴무,점심시간 12 -13시)</span> <br>
       <span> 
          <a href="" style="color:#696969;font-size:12px;">공지사항</a>
          <a href="" style="color:#696969;font-size:12px;">1:1 문의하기</a>
          <a href="" style="color:#696969;font-size:12px;">자주 묻는 질문</a>
       </span>
   </div>
   
   <div id="f2">
      <div style="color:#5f5f5f;font-weight:900;font-size:18px;">블루마켓(주) 사업자정보</div>
         <span style="color:#696969;font-size:12px;line-height:25px;">대표이사:임현진, 김태웅 | 개인정보보호책임자:이원영</span> <br>
         <span style="color:#696969;font-size:12px;line-height:25px;">사업자등록번호:112-65-13415 | 통신판매업신고:2023-서울송파-2241</span> <br>
         <span style="color:#696969;font-size:12px;line-height:25px;">호스팅서비스 제공자:Amazon Web Services (AWS)</span> <br>
         <span style="color:#696969;font-size:12px;line-height:25px;"> EMAIL:admin@bluemarket.co.kr | FAX:02-123-1245</span> <br>
         <span style="color:#494949;font-size:12px;line-height:25px;">주소:서울특별시 서초구 서초대로 38길 12, 7, 10층(서초동, 마제스타시티, 힐스테이트 서리풀)</span>
         <br>
         <br>
      <div style="color:#5f5f5f;font-weight:900;font-size:18px;">블루마켓 오프라인점</div>
         <span style="color:#494949;font-size:12px;line-height:25px;">블루마켓(주)삼송스타필드점 | 최형택 | 345-12-32526</span> <br>
         <span style="color:#494949;font-size:12px;line-height:25px;">경기 고양시 덕양구 고양대로 1955</span> <br><br>
         <span style="color:#494949;font-size:12px;line-height:25px;">블루마켓(주)현대백화점 일산점 | 최형택 | 345-12-32526</span> <br>
         <span style="color:#494949;font-size:12px;line-height:25px;">경기 고양시 일산서구 호수로 817 현대백화점킨텍스점</span> <br>
   </div>
   
   <div id="f3">
      <div style="color:#5f5f5f;font-weight:900;font-size:18px;">국민은행 채무지급보증안내</div>
         <span style="color:#696969;font-size:12px;">
            블루마켓㈜는 “BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT Lab 2”,  <br>
            “BGZT  컬렉션” 상점이 판매한 상품에 한해, 고객님이 현금 결제한 금액에 대해    <br>
            우리은행과 채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다.
         </span> <br> <br>
         <span style="color:#696969;font-size:12px;">Ⓒ Bluemarket. Inc All rights reserved.</span>
   </div>
   </footer> <!-- 사이트관련 내용 -->
<script>
   <c:if test="${userid != null }"> 
     document.getElementById("right").style.left="736px";
    document.getElementById("gogaeksub").style.left="75px";
    </c:if>
</script>
</body>
</html>