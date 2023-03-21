<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 탭 메뉴 스타일 -->
 <style>
 	.container {
 		 /* height:900px; 탭 내부 높이 조절*/ 
 	}
 	@font-face {
    	font-family: 'MICEGothic Bold';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    	font-weight: 700;
    	font-style: normal;
	}
	/* 탭 메뉴 전체 */
	.container{
		width: 1000px;
		margin: 0 auto;
	}
	/* 탭 메뉴 ul의 tabs 클래스 */
	ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
		width:1000px;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
		width:300px;
	}
	ul.tabs li.current{
		background: #4667B4;
		color: white;
	}
	.tab-content{
		display: none;
		/*background: #ededed; 탭 내용부분 배경색*/
		padding: 15px;
		margin-top:30px;
	}
	.tab-content.current{
		display: inherit; /* 부모요소의 display속성을 따라감 */
	}
	section #proline {
		border:0px;
		height:1px;
		background-color:#cccccc;
		margin-top:100px;
	}
	/* 일정달력 클래스. 카테고리 아래로 보내기 */ 
	.fc-event {
  		z-index: 0;
	}
	#mygumae {
		margin-top:50px;
	}
	 section td span {
     border:none;
     padding:2px;
     cursor:pointer;
   }
     a {
     	color:black;
     }
 </style>
</head>

<section>
	<hr id="proline"> <!-- 프로필 밑 탭 메뉴 위 라인 -->
	

		<!-- 2번 탭 내 글 보기 -->
	
			<form id="mypanmae">
				<table width="900" align="center" id="mypanmae">
      			<tr><h4>판매글</h4></tr>
      			
      			<tr>
      				<td>판매물품</td>
      				<td>제목</td>
      				<td>판매가격</td>
      				<td>판매등록일</td>
      				<td>판매상태</td>
      			</tr>
      			<c:forEach items="${plist}" var="pvo">
      			<c:if test="${plist.size()==0}">
					<td colspan="6" align="center">판매내역이 없습니다.</td>
	  			</c:if>
	  			
       			<tr>
         			<td> <img src="../resources/product/${pvo.cimg}" width="100"></td>
         			<td> ${pvo.title} </td>
         			<td> <fmt:formatNumber value="${pvo.price}" type="number"/> </td>
         			<td> ${pvo.writeday} </td>
         			<!-- 현재 판매상태 -->		
         			<c:if test="${pvo.sstate==0}">
         				<c:set var="sstate" value="판매중"/>
         			</c:if>

         			<c:if test="${pvo.sstate==1}">
           				<c:set var="sstate" value="예약중"/>
         			</c:if>
         			<c:if test="${pvo.sstate==2}">
           				<c:set var="sstate" value="판매완료"/>
         			</c:if>
         			<td> ${sstate} </td>
       			</tr>
      			</c:forEach>
     			</table>
     		</form>
     		 <script>
	  			function mdelete_check(url){
					var answer;
					//페이지를 이동하기 전에 confirm()을 사용해 다시 한번 확인한다.
					//확인을 선택하면 answer에  true, 취소를 선택하면 false 값이 들어간다.
					answer = confirm("정말 삭제하시겠습니까?");
					//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
					if(answer == true){
						location = url;
					}
				}
	  </script>
     		
		</div>
		
	</div>
</section>
</body>
</html>