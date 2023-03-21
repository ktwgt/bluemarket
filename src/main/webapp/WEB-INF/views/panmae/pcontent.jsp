<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        section {
            width:1000px;
            margin:auto;
            margin-top:50px;
        }
        section #title {
            width:1000px;
            height:400px;
            margin:auto;
        }
        section #title > #left {
            width:500px;
            height:400px;
            float:left;
        }
        section #title > #right {
            width:500px;
            height:450px;
            float:right;
            position:relative;
        }
        #pimg{
            width: 100px;
            margin-left: 210px;
            margin-bottom: 50px;
            margin-top: 5px;
        }
        section #content {
            width:1000px;
            height:500px;
            margin:auto;
            margin-top:40px;
        }
        section #mun  {
            width:1000px;
            margin:auto;
            margin-bottom:40px;
        }
        section #mun .inner {
            border-bottom:1px solid #cccccc;
            margin-top:15px;
            padding-bottom:15px;
        }
        section #mun .inner #aa {
            display:inline-block;
            width:40px;
            padding-bottom:2px;
            text-align:center;
            border:none;
            background:#888888;
            color:white;
        }
        section #mun .inner #bb {
            display:inline-block;
            width:40px;
            padding-bottom:2px;
            text-align:center;
            border:none;
            background:#4776b4;
            color:white;
        }
        section #mun .inner #title2 {
            display:inline-block;
            width:790px;
            height:40px;
        }
        section #mun h2 span {
            width:80px;
            height:23px;
            border:1px solid #4776b4;
            font-size:14px;
            font-weight:100;
            margin-left:40px;
            padding:3px;
        }
        section #etc {
            width:1000px;
            margin:auto;
            text-align:center;
            margin-top:50px;
            margin-bottom:30px;
        }
        section #ptitle {
            font-size:20px;
            color:black;
            font-weight:900;
        }
        section #pri {
            font-size:40px;
            color:black;
            font-weight:400;
        }
        section #juk span {
            margin-top:10px;
            display:inline-block;
            width:134px;
            height:16px;
            border:1px solid black;
            border-radius:8px;
            font-size:12px;
            text-align:center;
            padding:2px;
        }
        section #btn {
            margin-top:20px;
        }
        section #pmenu {
            width:1000px;
            height:40px;
            margin:auto;
            text-align:center;
        }
        section #pmenu #pul {
            padding-left:0px;
            background:yellow;
        }
        section #pmenu #pul #pli {
            float:left;
            width:500px;
            height:30px;
            border-top-width:3px;
            margin-left:100px;
            list-style-type:none;
            text-align:center;
            padding-top:10px;
        }
        #pli2{
            float:right;
            width:346px;
            height:50px;
            border-top-width:3px;
            margin-left:0px;
            list-style-type:none;
            text-align:center;
            padding-top:10px;
        }
        #pli3{
            float:left;
            width:246px;
            height:30px;
            border-top-width:3px;
            margin-left:0px;
            list-style-type:none;
            text-align:center;
            padding-top:10px;
        }
        #js{
            color: #999999;
            width: 700px;
            font: 14px "noto sans kr", sans-serif;
        }
        #won{
            font-size: 28px;
            font-weight: 400;
            margin-right: 1px;
            margin-bottom: 4px;
        }
        section #btn span{
            display: inline-block;
            width: 160px;
            height: 40px;
            text-align: center;
            font-weight: 600;
        }
        #gim{
            font:22px "Noto Sans KR", sans-serif;
            color: #ffffff;
            background:#cccccc;
        }
        #bolt{
            font:22px "Noto Sans KR", sans-serif;
            color: #ffffff;
            background:#4776b4;
        }
        #hrs{
            width: 480px;
        }
        #hrs div{
            display: inline-block;
            font-weight: 600;
        }
        #wish{
            margin-right: 20px;
        }
        #readnum{
            margin-right: 250px;
            margin-bottom: 2px;
        }
        #singo{
            font:15px "Noto Sans KR", sans-serif;
            font-weight: 600;
            text-decoration: none;
            margin-top: 4px;
            align:right;
            color: #cccccc;
            display: inline-block;
        }
        #pstate{
            width: 554px;
            height: 131px;
            margin-top: 10px;
        }
        #j{
            color: black;
            margin-left: 20px;
        }
        #s{
            color: black;
            margin-left: 20px;
        }
        #baesong{
            color: #999999;
            width: 700px;
            font: 14px "noto sans kr", sans-serif;
        }
        #b{
            color: mediumpurple;
            margin-left: 21px;
        }
        #location{
            color: #999999;
            width: 700px;
            font: 14px "noto sans kr", sans-serif;
        }
        #l{
            color: black;
            margin-left: 22.5px;
        }
        #hugi{
            margin-top: 50px;
        }
        #eye{
            margin-left: 3px;
        }
		#qqqq
		{
			float:right;
			margin-left:6px;
			margin-top:4px;
		}
        #rproducts{
            width:150px;
            height:150px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script>
        $(function()
        {

            $("#pimg").mouseover(function()
            {
                $("#mainimg").attr("src","../resources/product/${pvo.pimg}");
            });
            $("#pimg").mouseout(function()
            {
                $("#mainimg").attr("src","../resources/product/${pvo.cimg}");
            });
        });

        function singo(panmae_id, singo_userid)
        {
            if(confirm("정말 신고하시겠습니까?"))
            {
                location="singo_insert?panmae_id="+panmae_id+"&singo_userid="+singo_userid;
            }
        }
        
        function comma(num)
        {
            return new Intl.NumberFormat().format(num);
        }

        function ggim()
        {

            var chk = new XMLHttpRequest();
            chk.onload= function()
            {
                if(chk.responseText=="0")
                    alert("찜이 등록되었습니다.");
                else
                    alert("이미 찜한 상품입니다.");

            }
            chk.open("get","wishadd?pid=${pvo.id}&userid=${pvo.userid}&pcode=${pvo.pcode}");
            chk.send();
        }

        var win_width=window.screen.width/2-225;
    	var win_height=window.screen.height/2-330;

    	function go_room_check()
    	{
    		var opponent='${pvo.userid}';
    		
    		open("../chat/room_check?&opponent="+opponent, "",
    				"width=550,height=620,left="+win_width+",top="+win_height);

//    		alert(win_width+"////"+win_height);
//			alert(writer+"/"+opponent);
    	}
    	    	
    	function warning()
    	{
    		alert("로그인이 필요합니다");
    	}

    </script>
    <style>
        section #ggim_move #btn2 {
            display:inline-block;
            width:120px;
            height:20px;
            border:1px solid black;
        }
        .v-line{
            border-left: solid 0.01px;
            height:100%;
            left: 60%;
            position: absolute;
        }
        #muny{
            font-size: 25px;
        }
        #context{
            display: inline-block;
            margin-right: 320px;
            text-align: left;
        }
        #store{
            display: inline-block;

        }
        #storehugi{
            border: solid 0.05px whitesmoke;
        }
        #userid{
            cursor: pointer;
            text-decoration: none;
            color: black;
        }
        #proimg{
            width: 100px;
            height: 100px;
        }
        #proimg2{
            width: 150px;
            height: 74px;
        }
        #deobogi{
            width: 344px;
            height: 50px;
            margin-bottom: 5px;
        }
        #selltime{
            color: black;
            margin-left: 23px;
        }
        #locatime{
            color: #999999;
            width: 700px;
            font: 14px "noto sans kr", sans-serif;
            margin-top: 13px;
        }
		#floatMenu {
   			position: relative;
  			width: 95px;
   			height: 250px;
   			left:1030px;
   			top: -1450px;
   			z-index:9999;
		}
   		#floatMenu #float2 {
      		position: relative;
      		top:7px;
      		border:1px solid #cccccc;
      		width:95px;
      		height:240px;
      		text-align:center;
      		padding-top:10px;
      		background:white;
      		font-size:14px;
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
    </style>
</head>
<body>
<section>
    <div id="title">
        <div id="left" align="center"> <img src="../resources/product/${pvo.cimg}" id="mainimg" width="400" height="345"> </div>
        <div id="right">
            <form name="pform" id="ggim">
                <input type="hidden" name="pcode" value="${pvo.pcode}">
                <input type="hidden" name="singo_state" value="${pvo.singo_state}">
                <input type="hidden" name="pstate" value="${pvo.pstate}">
                <input type="hidden" name="state" value="${mvo.state}">
                <input type="hidden" name="puserid" value="${pvo.userid}">
                <div id="ptitle">
                	<c:if test="${pvo.singo_state==1}"> <span style="color:red; font-size:18px;"> [거래정지] </span></c:if>
                	 ${pvo.title}
                 </div>
                <div id="pri"> <fmt:formatNumber value="${pvo.price}" pattern="#,###" type="number"/>
                    <span id="won">원</span>
                </div>
                <hr>
                <span id="hrs">
                    <div id="wish"> <img id="heart" src="../resources/img/heart.png">
                        <c:if test="${count}<0">
                            <span id="qqqq"> ${count}==0	</span>
                        </c:if>
                        	<span id="qqqq"> ${count}	</span>
                    </div>
                    <div id="readnum"> <img id="eye" src="../resources/img/eye.png"> <span id="qqqq"> ${pvo.readnum} </span></div>                  
                   	<c:if test="${pvo.singo_state==0 and userid != pvo.userid}">                    
                    	<c:choose>
                    		<c:when test="${pvo.userid!=mvo.userid}">
                     			<div style="cursor: pointer"><img src="../resources/img/alarm.png">
                     				<a onclick="singo('${pvo.id}','${pvo.userid}')" id="singo"> 신고하기</a>
                     			</div>
                    		</c:when>
                    	</c:choose>
					</c:if>                    
                </span>
                <p>
                <div id="pstate">
                    <div id="js">상품상태
                        <c:if test="${pvo.pstate==0}">  <span id="j">중고상품</span></c:if>
                        <c:if test="${pvo.pstate==1}">  <span id="s">새상품</span></c:if>
                    </div>
                    <p>
                    <div id="baesong">배송비
                        <span id="b">배송비별도</span>
                    </div>
                    <p>
                    <div id="location">거래희망지역
                        <span id="l">${pvo.loca}</span>
                    </div>
                    <div id="locatime">거래희망시간
                        <span id="selltime">${fn:substring(pvo.selltime,0,16)}</span>
                    </div>
                </div>                
				<c:if test="${userid!=null and pvo.singo_state==0 and userid != pvo.userid}">
				<c:set var="lee_good" value="1"/>
                <div id="btn">
                    <span id="gim" onclick="ggim()" style="cursor:pointer"> 찜 </span>
                    <span id="bolt" style="cursor:pointer" onclick="go_room_check()"> 블루톡 </span>
                </div>  
                </c:if>  
                <c:if test="${userid == pvo.userid}">
					<c:set var="lee_good" value="2"/>
				</c:if>                
                <c:if test="${lee_good!=1 and lee_good!=2}">
                <div id="btn">
                    <span id="gim" onclick="warning()" style="cursor:pointer"> 찜 </span>
                    <span id="bolt" style="cursor:pointer" onclick="warning()"> 블루톡 </span>
                </div> 
                </c:if>
           </form>
        </div>
    </div>
    <div id="pimg" align="left" >
        <img src="../resources/product/${pvo.pimg} "height="100" width="100" id="subimg" >
    </div>
    <div id="related">연관상품</div>
    <div> 
        <c:forEach  items="${cimg}" var="cmg">
			<a href="readnum?pcode=${cmg.pcode}"><img id="rproducts" src="../resources/product/${cmg.cimg}"></a>
        </c:forEach>
    </div>
    <hr>
    <div id="pmenu">
        <ul id="pul">
            <li id="pli">상품정보<hr id="v-line2"></li>
        </ul>
        <c:if test="${pvo.userid!=userid}">
        <div id="pli2" class="pli"> 상점정보
            <hr>
            <div id="detail">
                <a href="../mypage/shop?userid=${pvo.userid}&ww=0"><img id="store" src="../resources/img/shopopen.png" width="50" height="50"></a>
                <div><a id="userid" href="../mypage/shop?userid=${pvo.userid}&ww=0">${pvo.userid}</a></div>   <!—ㅡmypage 부분 —>
            </div>
            <p>
                	상품 ${countpcode}
            <div>
                <c:forEach  items="${twoimgs}" var="imgs">
                    <img id="proimg" src="../resources/product/${imgs.cimg}">
                </c:forEach>
            </div>
            <div id="deobogi"><a href="plist?pcode=${pvo.pcode}&userid=${pvo.userid}&search=${pvo.userid}">${countpcode}개 더보기</a></div>
            <hr>
          </c:if>
          <c:if test="${pvo.userid==userid}">
        <div id="pli2" class="pli"> 상점정보
            <hr>
            <div id="detail">
                <a href="../mypage/mypage?ww=0"><img id="store" src="../resources/img/shopopen.png" width="50" height="50"></a>
                <div><a id="userid" href="../mypage/mypage?ww=0">${pvo.userid}</a></div> <!-- mypage 부분 -->
            </div>
            <p>
                상품 ${countpcode}
            <div>
                <c:forEach  items="${twoimgs}" var="imgs">
                    <img id="proimg" src="../resources/product/${imgs.cimg}">
                </c:forEach>
            </div>
            <div id="deobogi"><a href="plist?pcode=${pvo.pcode}&userid=${pvo.userid}&search=${pvo.userid}">${countpcode}개 더보기</a></div>
            <hr>
          </c:if>
			<!-- 
            <div id="hugi"> 상품후기 </div>
            <hr id="storehugi">
            <c:forEach items="${rlist}" var="rvo">
                <div> ${rvo.userid}</div>
                <div>
                    <c:forEach begin="1" end="${rvo.star}">
                        <img src="../resources/img/star1.png" width="16">
                    </c:forEach>
                    <c:forEach begin="1" end="${5-rvo.star}">
                        <img src="../resources/img/star2.png" width="16">
                    </c:forEach>
                        ${rvo.writeday}
                </div> <!— 별점출력 div —>
                <div> ${pvo.title}</div>
                <div> <b>${rvo.title}</b></div>
                <div> ${rvo.content}</div>
                <div style="margin-bottom:20px;border-bottom:1px solid #cccccc">&nbsp;</div>
            </c:forEach>
            -->
        </div>
    </div>
    <div id="content">
       	<c:if test="${pvo.singo_state==0}">    
        	<p id="context" style="width: 500px;">${pvo.content}</p>        
    	</c:if>    
    	<c:if test="${pvo.singo_state==1}">    		
    		<p id="context" style="width: 500px; color:red; text-align:center; font-size:18px;"> 신고 처리된 게시글 입니다 </p>
    	</c:if>
    </div>
   <!--
    <div id="mun">
        <h2 id="muny"> 상품문의   <span onclick="munview()"> 문의하기 </span></h2>
        <hr>
        <c:forEach items="${qlist}" var="qvo">
            <div class="inner">
                <c:if test="${qvo.seq==0}">
                    <span id="aa"> 질문 </span>
                </c:if>
                <c:if test="${qvo.seq==1}">
                    <span id="bb">  답변 </span>
                </c:if>
                <span id="title2"> ${pvo.title} </span>
                <span id="writeday2"> ${qvo.writeday} </span>
                <div id="content2"> ${qvo.content}</div>
            </div>
        </c:forEach>
    </div>
    <div id="munwrite">
        <form method="post" action="munwrite">
            <input type="hidden" name="pcode" value="${pvo.pcode}">
            <table width="400" align="center">
                <caption> <h3> 문의등록 </h3> </caption>
                <tr>
                    <td> 상품명 </td>
                    <td> ${pvo.title} </td>
                </tr>
                <tr>
                    <td> 문의내용 </td>
                    <td> <textarea cols="30" rows="8" name="content"></textarea> </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"> <input type="submit" value="문의 저장하기">
                </tr>
            </table>
        </form>
    </div>
      -->
    <div id="floatMenu">
      <div id="float2"> 최근본상품  <p>
         <c:forEach items="${plist2}" var="pvo">
              <a href="pcontent?pcode=${pvo.pcode}"> <img src="../resources/product/${pvo.cimg}" width="50"> </a><p>
           </c:forEach>
      </div>
      <div id="float3" onclick="window.scrollTo(0,0);"> TOP </div>
    </div>
    <script>
        function munview()
        {
            var w=document.documentElement.clientWidth;
            var h=document.documentElement.clientHeight;
            //alert(w+" "+h);
            w=w/2-250;
            h=h/2+document.documentElement.scrollTop-140;

            document.getElementById("munwrite").style.left=w+"px";
            document.getElementById("munwrite").style.top=h+"px";
            document.getElementById("munwrite").style.visibility="visible";
        }
        
        $(function()
        {
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
    </script>
    <style>
        section  #munwrite {
            position:absolute;
            width:500px;
            height:280px;
            border:3px solid black;
            background:white;
            visibility:hidden;
        }
    </style>
</body>
</html>