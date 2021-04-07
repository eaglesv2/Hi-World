	function pwFind() {
		if($('#hide1').css('display') == 'none'){
			$('#hide').hide();
			$('#hide1').show();
			$('input:radio[name=radio]').prop('checked',false);
		}
	}

	function idFind() {
		if($('#hide').css('display') == 'none'){
			$('#hide1').hide();
			$('#hide').show();
			$('input:radio[name=radio1]').prop('checked',false);
		}
	}
	
var check = 0;
	
function findId() {
	check = 1;
	var UserName = $('input[name=username]').val();
	var UserTel = $('input[name=userTel]').val();
	$.ajax({
		type:"post",
		url:"find_id_pw.do",
		data:{'check' : check, 'UserName' : UserName,'UserTel' : UserTel},
		success: function (find) {
			console.log(find);
		$('.main').hide();
		$('#ImMassege').show();
		$('.findIdview').html(find);
		},
		error: function(find) {
			alert(find);
		}
	});
}

function Pw_Find() {
	check = 2;
	var UserId =$('input[name=userId]').val();
	var UserTel = $('input[name=userTel1]').val();
	$.ajax({
		type:"post",
		url:"find_id_pw.do",
		data:{'check' : check, 'UserID' : UserId,'UserTel' : UserTel},
		success: function (find) {
			console.log(find);
			$('.main').hide();
			$('#ImMassege1').show();
			$('.findIdview').html(find);
		},
		error: function (find) {
			alert(find);
			
		}
	});
}

function Close() {
	window.close();
}

function zoomIn(event) {
    event.target.style.transform = "scale(2.2)";
    event.target.style.zIndex = 1;
    event.target.style.transition = "all 0.5s";
  }

  function zoomOut(event) {
    event.target.style.transform = "scale(1)";
    event.target.style.zIndex = 0;
    event.target.style.transition = "all 0.5s";
  }