<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>우리동네</title>
</head>

<body>
<section style="height:600px;">
	<div id="bmap" style="text-align:center;">
		<form onsubmit="searchPlaces(); return false;">
           	 주변의 물품을 찾아보세요!<br> <input type="text" placeholder="주소 뒷부분만 입력하세요!" value="중앙로 1193" id="keyword" size="15" style="width:250px;height:25px;border:2px solid #4776b4;">    
    	</form>
    </div>
    <p>
	<div id="map" style="width:1000px;height:500px;margin:auto;border:2px solid #4776b4;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85cbf88a0279dd073f7f6ee1134d6d41&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {
        	center: new kakao.maps.LatLng(37.65307, 126.77662), // 지도의 중심좌표
        	level: 3 // 지도의 확대 레벨
    	};
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	 	// 주소로 좌표를 검색합니다
	    geocoder.addressSearch(keyword, function(result, status) {

	        // 정상적으로 검색이 완료됐으면 
	        if (status === kakao.maps.services.Status.OK) {

	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    	map.setCenter(coords);
	        }     
	    });
	}
	
	<c:forEach items="${plist}" var="pvo">
	
	// 주소로 좌표를 검색합니다++++
	geocoder.addressSearch('${pvo.loca}', function(result, status) {

    	// 정상적으로 검색이 완료됐으면 
     	if (status === kakao.maps.services.Status.OK) {

        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        	// 결과값으로 받은 위치를 마커로 표시합니다
        	var marker = new kakao.maps.Marker({
            	map: map,
            	position: coords
        	});
        
     		// 마커에 클릭이벤트를 등록합니다
        	kakao.maps.event.addListener(marker, 'click', function() {
        		location.href = '../panmae/pcontent?pcode=${pvo.pcode}';
        	});

        	// 인포윈도우로 장소에 대한 설명을 표시합니다
        	var infowindow = new kakao.maps.InfoWindow({
        		<c:if test="${fn:contains(pvo.pcode,'p01')}"> // 여성의류
            		content: '<div style="width:150px;text-align:center;padding:6px 0;border:2px solid green;">${pvo.title}</div>'
            	</c:if>
        		<c:if test="${fn:contains(pvo.pcode,'p02')}"> // 남성의류
            		content: '<div style="width:150px;text-align:center;padding:6px 0;border:2px solid red;">${pvo.title}</div>'
            	</c:if>
        		<c:if test="${fn:contains(pvo.pcode,'p03')}"> // 신발
            		content: '<div style="width:150px;text-align:center;padding:6px 0;border:2px solid yellow;">${pvo.title}</div>'
            	</c:if>
        		<c:if test="${fn:contains(pvo.pcode,'p04')}"> // 가방
            		content: '<div style="width:150px;text-align:center;padding:6px 0;border:2px solid black;">${pvo.title}</div>'
            	</c:if>
        		<c:if test="${fn:contains(pvo.pcode,'p05')}"> // 시계/쥬얼리
            		content: '<div style="width:150px;text-align:center;padding:6px 0;border:2px solid pink;">${pvo.title}</div>'
            	</c:if>
        	});
        	infowindow.open(map, marker);

        	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        	map.setCenter(coords);
    	}
     	
	});
	</c:forEach>
</script>
</section>
</body>
</html>