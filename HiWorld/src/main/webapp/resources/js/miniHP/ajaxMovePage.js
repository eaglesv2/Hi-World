//사진첩 사이드 불러오기
function getPictureSide() {
	var ajaxSide = {
	        url : "MiniHpPicutreSide.do",
	        async : true,
	        type : "GET",
	        dataType : "html",
	        cache : false
	};
	$.ajax(ajaxSide).done(function(data){
	    $('#sideContents').children().remove();
	    $('#sideContents').html(data);
	});
}
//사진첩 이동
function movePicture(){
	//사이드 불러오기
	getPictureSide();
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpPicture.do',
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(data){
        $('#bodyContents').children().remove();
        $('#bodyContents').html(data);
    });
}

//프로필 사이드 불러오기
function getProfileSide() {
	var ajaxSide = {
            url : "MiniHpDefaultSide.do",
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
	
	 $.ajax(ajaxSide).done(function(result){
	        // Contents 영역 삭제
	        $("#sideContents").children().remove();
	        // Contents 영역 교체
	        $("#sideContents").html("<iframe frameborder='0' width='160' height='440' src="+result+"></iframe>");
	 });
}

function moveProfile() {
	//사이드 불러오기
	getProfileSide();
	
	// 메인 불러오기
    var ajaxMain = {
            url : 'miniHpProfile.do',
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(result){
        // Contents 영역 삭제
        $("#bodyContents").children().remove();
        // Contents 영역 교체
        $("#bodyContents").html(result);
    });
}

//게시판 사이드 불러오기
function getBoardSide() {
	
	var ajaxSide = {
            url : "MiniHpBoardSide.do",
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxSide).done(function(data){
        // Contents 영역 삭제
        $('#sideContents').children().remove();
        // Contents 영역 교체
        $('#sideContents').html(data);
    });
}

//게시판 이동
function moveBoard(){
	//사이드 불러오기
	getBoardSide();
	
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpBoard.do',
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(data){
        // Contents 영역 삭제
        $('#bodyContents').children().remove();
        // Contents 영역 교체
        $('#bodyContents').html(data);
    });
}

//관리탭 불러오기
function getSettingSide() {
	var ajaxSide = {
			url : "MiniHpSettingSide.do",
			async : true,
            type : "GET",
            dataType : "html",
            cache : false
	};
	
	 $.ajax(ajaxSide).done(function(data){
	        // Contents 영역 삭제
	        $('#sideContents').children().remove();
	        // Contents 영역 교체
	        $('#sideContents').html(data);
	    });
}

function moveSetting() {
	getSettingSide();
	
	// 메인 불러오기
    var ajaxMain = {
            url : "miniHpSetting.do?menu=menu7",
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(data){
        // Contents 영역 삭제
        $('#bodyContents').children().remove();
        // Contents 영역 교체
        $('#bodyContents').html(data);
    });
}