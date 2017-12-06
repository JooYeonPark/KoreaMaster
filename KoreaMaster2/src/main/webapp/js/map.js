$(document).ready(function() {

	$.ajax({ 
		type:'get',
		url: '/jsp/users/map.jsp',
		data : { "userId" : $('#mapUser').val()},
		dataType: 'json',
		success: function(data) { 
			var jsonData = JSON.stringify(data.mapData);
			setMap(jsonData);
		},
		error : function(err){
            alert("에러발생 : "+ err)
         	}
		});
	
	 function setMap( data ){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
            center: new daum.maps.LatLng(35.92634, 127.81517), // 지도의 중심좌표
            level: 14, // 지도의 확대 레벨
            mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류 없애두댐?

        };
			
		var map = new daum.maps.Map(mapContainer, mapOption);
		var positions = JSON.parse(data); 
		
		var imageSrc = '/images/flag.png';
	    
		for (var i = 0; i < positions.length; i ++) {
			
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    

		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: new daum.maps.LatLng(positions[i].latlng1,positions[i].latlng2), // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		    

		}


	}
});