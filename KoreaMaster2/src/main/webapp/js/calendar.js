$(document).ready(function() {

	$.ajax({ 
		type:'get',
		url: '/jsp/users/CalendarAjax.jsp',
		data : { "userId" : $('#userIdImsi').val()},
		dataType: 'json',
		success: function(data) { 
			var jsonData = JSON.stringify(data.trip);
			setCalendar(jsonData);
		},
		error : function(err){
            alert("에러발생 : "+ err)
         	}
		});
	
	 function setCalendar( data ){
	$('#calendar').fullCalendar({
		header : {
			left: 'prev',
			center:'title',
			right:'next today'
		},
		defaultDate: '2017-11-11',
//		locale:"ko",			// 한글 사용시 주석 풀기
		editable: false,
		eventLimit: true,
		eventDrop : function(event){
			
			var id = event.id;
			var title = event.title;
			var start = event.start._i;
			var end = event.end._i;
			
		},
		events: eval(data)
	});
	
	}
});