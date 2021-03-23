//사진첩 이동
function movePicture(url){
	
    // 메인 불러오기
    var ajaxMain = {
            url : url,
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
    
    //사이드(폴더) 불러오기
	var ajaxSide = {
            url : "MiniHpPicutreSide.do",
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


