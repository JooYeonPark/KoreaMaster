/**
 * 나의 여행타입 테스트 유효성 검사,
 * 타입 별 우선순위 4개 선별,
 * 완료 시 MyTravelTypeDone.jsp  form으로 페이지 이동,
 * command로 DB 저장하러 parameter 값 전송
 */

$(document).ready(function(){
	$('#finish').click(function() {
		var num = 0;
		var check = 0;
		
		/**
		 * start validity check
		 */
		if(!$('input[name=question_1]').is(":checked")) {
			alert('체크 안댐1');
			num++;
		} else if(!$('input[name=question_2]').is(":checked")) {
			num++;
		} else if(!$('input[name=question_3]').is(":checked")) {
			num++;
		} else if(!$('input[name=question_4]').is(":checked")) {
			num++;
		} else if(!$('input[name=question_5]').is(":checked")) {
			num++;
		} else if(!$('input[name=question_6]').is(":checked")) {
			num++;
		} else if(!$('input[name=question_7]').is(":checked")) {
			num++;
		} else if(!$('input[name=question_8]').is(":checked")) {
			num++;
		} else if(!$('input[name=question_9]').is(":checked")) {
			num++;
		}
		
		if(!$('#test_accept').is(":checked")) {
			check++;
		}
		
		
		/**
		 * start counting type
		 */
		if(num != 0) {
			alert('모든 질문에 답을 해 주셔야합니다. 다시 확인해주세요.');
		} else if(check != 0 ) {
			alert('약관 동의사항을 다시 확인해주세요.')
		} else {
			var nature = 0, experience = 0, culture = 0, leports = 0, history = 0, shopping = 0;
			
			if($('input[name=question_1]:checked').val() == $('#check_1-1').val()) {
				shopping++; culture++; experience++; leports++; history++;
			} else {
				nature[1]++; experience[1]++; leports[1]++; history[1]++;
			}
			
			if($('input[name=question_2]:checked').val() == $('#check_2-1').val()) {
				nature++; history++; culture++;
			} else {
				leports++; experience++; shopping++;
			}
			
			if($('input[name=question_3]:checked').val() == $('#check_3-1').val()) {
				leports++; nature++; culture++; history++;
			} else {
				shopping++; experience++; nature++; culture++; history++;
			}
			
			if($('input[name=question_4]:checked').val() == $('#check_4-1').val()) {
				nature++; culture++; leports++; shopping++;
			} else {
				history++; experience++; culture++; leports++; shopping++;
			}
			
			if($('input[name=question_5]:checked').val() == $('#check_5-1').val()) {
				culture++; nature++; history++; leports++; experience++;
			} else {
				shopping++; nature++; history++; leports++; experience++;
			}
			
			if($('input[name=question_6]:checked').val() == $('#check_6-1').val()) {
				history++; nature++; leports++; experience++; shopping++;
			} else {
				culture++; nature++; leports++; experience++; shopping++;
			}
			
			if($('input[name=question_7]:checked').val() == $('#check_7-1').val()) {
				experience++; culture++; nature++; history++; shopping++;
			} else {
				leports++; nature++; history++; shopping++;
			}
			
			if($('input[name=question_8]:checked').val() == $('#check_8-1').val()) {
				shopping++; nature++; culture++; leports++; history++;
			} else {
				experience++; nature++; culture++; leports++; history++;
			}
			
			if($('input[name=question_9]:checked').val() == $('#check_9-1').val()) {
				culture++; experience++; leports++; history++; shopping++;
			} else {
				nature++; experience++; leports++; history++; shopping++;
			}
			
			
			/**
			 * start type sort
			 */
			var myType = [["leports", leports], ["history", history], ["shopping", shopping], ["nature", nature], ["experience", experience], ["culture", culture]];
			for (var i = 0; i < 5; i++) {
				for (var j = i+1 ; j < 6; j++) {
					if(myType[i][1] > myType[j][1]) {
						var name = myType[i][0];
						var value = myType[i][1];
						
						myType[i][0] = myType[j][0];
						myType[i][1] = myType[j][1];
						
						myType[j][0] = name;
						myType[j][1] = value;
					}
				}
			}
			
			/**
			 *  send data
			 */
			location.href = '/imsi/MyTravelType?cmd=myTravelTypeDone&1=' + myType[5][0] + '&2=' + myType[4][0] + '&3=' + myType[3][0] + '&4=' + myType[2][0];
		}
		
	});
});