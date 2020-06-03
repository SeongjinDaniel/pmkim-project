<%@page import="vo.GoodsEventShopMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "vo.MemberVO, java.util.List"
	import = "vo.GoodsEventShopMemberVO"%>	
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>편마 김편복</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- favicon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/pmkim/resources/images/favicon-16x16.png">
<!-- Site Icons -->
<!-- <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"> -->
<!-- <link rel="apple-touch-icon" href="images/apple-touch-icon.png"> -->

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/bootstrap.min_map.css">
<!-- Site CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/styleMap.css">
<link rel="stylesheet" href="/pmkim/resources/css/style_nav.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- kakao map -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da9ee51fb08b7986257790a5d30ebc55&libraries=services,clusterer,drawing"></script>
</head>

<body>
	<%
		String keyword = (String) request.getAttribute("searchKeyword");
		String keywordProduct = (String) request.getAttribute("searchProduct");
		//List<MemberVO> memberList = (List<MemberVO>) request.getAttribute("memberList");
		//GoodsEventShopMemberVO mapAlgorithmDB = 
		//		(GoodsEventShopMemberVO) request.getAttribute("mapAlgorithmDB");
	%>
	<c:set var="sessionMemberId" value="${ sessionScope.id }"/>
    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="/pmkim/main"><img src="/pmkim/resources/images/pmkim_Logo_1.jpg" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/home">Home</a></li> <!-- href는 jsp/html 형식이 아닌, {/매핑명}으로  해주시면돼용! 나중에 고쳐주세요~ -->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/map">지도</a></li> <!--성진오빠파트-->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/theme">테마</a></li> <!-- 세호-->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/event">행사</a></li> <!-- 지혜파트-->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/cart">만원의 행복</a></li> <!-- 규영언니파트♡ -->
                        <!-- <li class="nav-item active"><a class="nav-link" data-toggle="modal" data-target="#loginModal" href="/pmkim/#">로그인</a></li>	                        
						<li class="nav-item active"><a class="nav-link" href="/pmkim/signup">회원가입</a></li> -->
						<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
						<c:choose>
							<c:when test="${msg eq 'success' || !empty sessionMemberId}">
								<li class="nav-item active"><a class="nav-link" id="userView" href="/pmkim/ownerpage"><img src="/pmkim/resources/images/star.png" style="width:13px;">${sessionMemberId}님</a></li>
								<li class="nav-item active"><a class="nav-link" id="logout" href="/pmkim/logout"><b>Logout</b></a></li>
								
							</c:when>
							<c:when test="${msg eq 'fail' || msg eq 'logout' || msg eq '' || msg eq null}">
								<li class="nav-item active"><a class="nav-link" id="login" data-toggle="modal" data-target="#loginModal" href="/pmkim/#">로그인</a></li>
								<li class="nav-item active"><a class="nav-link" id="signup" href="/pmkim/signup">회원가입</a></li>	
						    </c:when>
						</c:choose>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
			
            </div>
            
            <!-- Login -->
           
			<!-- Login End-->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

	<!-- Start Top Search -->
	<div class="top-search">
		<div class="container">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
				<input type="text" class="form-control" placeholder="Search">
				<span class="input-group-addon close-search"><i
					class="fa fa-times"></i></span>
			</div>
		</div>
	</div>
	<!-- End Top Search -->

	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>MAP</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="">Home</a></li>
						<li class="breadcrumb-item active">Map</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start About Page  -->
	<div class="about-box-main">
		<div class="container">
			<form action="/pmkim/map" method="GET">
				<div class="row my-5">
					<div class="col-sm col">
						<div class="service-block-inner">
							<h3>검색할 상품을 적어보세요!</h3>
								<input class="form-control" name="searchProduct"
									placeholder="Write product..." type="text">
						</div>
					</div>
				</div>
				<div class="search-product">
						<input class="form-control" name="searchKeyword"
							placeholder="Search here..." type="text">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
				</div>
			</form>
			<div id="productList"></div>
			<div id="map" style="width: 100%; height: 500px;"></div>
			<div id="printName"></div>
			<script>

				//var goodId = ${mapAlgorithmDB.good_id}
				//console.log(goodId);
				//console.log(mapAlgorithmDBList.getGood_id);

				// 카카오 맵에서 넘어 오는 편의점명 -> CU, GS25, 세븐일레븐, 이마트24, 미니스톱
				const EMART24 = "EM", CU = "CU", GS25 = "GS", SEVENELEVEN = "SE", MINISTOP = "MS";
				var keyword = '<%=keyword%>';
				var productName = '<%=keywordProduct%>';
				var sumProductName = new Array();

				//console.log(productName);

				// alert('<%=keywordProduct%>');
				// console.log('<%=keywordProduct%>');

				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
                // 키워드 장소 검색할 때 필요한 부분!!
                var infowindow = new kakao.maps.InfoWindow({zIndex:1});

				var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
				var printGoodName = [], printEventName = [], printLength = 0;
				var storeName = [], printProduct = [];
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨 
			    }; 
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
                //-------------------------------------------------------------------------------------------

				var lat, lon;
				var curPositionFlag = false;
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
					
					// GeoLocation을 이용해서 접속 위치를 얻어옵니다
					navigator.geolocation.getCurrentPosition(function(position) {
						lat = position.coords.latitude, // 위도
						lon = position.coords.longitude; // 경도
						
						// var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
						//     message = '<div style="padding:5px;">편의점 명을 정확히 기재해주세요!</div>'; // 인포윈도우에 표시될 내용입니다
						
						// //마커와 인포윈도우를 표시합니다   
						// oneDisplayMarker(locPosition, message);
					});
					
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
					var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
						message = '현재 위치를 찾을 수 없어요..'
						
					oneDisplayMarker(locPosition, message);
				}

                if(keyword == "null" || keyword == "" || keyword == "내위치" || keyword == "내 위치"){
					curPositionFlag = true;
                }else{ // keyword 있을시

					if(/서울/.test(keyword)){
						console.log("서울 키워드다!");
					}else{
						console.log("서울 키워드가 아니다!")
					}
                	                    
                }
				if(curPositionFlag == true){
					//console.log(curPositionFlag);
					//----------------------------------------------------------
					//현재위치 기반으로 편의점 검색!!! 
					ps.keywordSearch("편의점", placesSearchCB, {
						// LatLng : 중심 좌표. 특정 지역을 기준으로 검색한다.
						location: new kakao.maps.LatLng(lat, lon)
					});
					//----------------------------------------------------------
				}else{
					//console.log(curPositionFlag);
					//console.log("키워드: " + keyword);
					// 키워드로 장소를 검색합니다
                    //ps.keywordSearch(keyword, placesSearchCB);
					ps.keywordSearch(keyword, placesSearchCB, {
						// LatLng : 중심 좌표. 특정 지역을 기준으로 검색한다.
						location: new kakao.maps.LatLng(lat, lon)
					});
				}
                //kakao 메서드 start------------------------
				// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function oneDisplayMarker(locPosition, message) {
                    // locPosition 다름
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({  
				        map: map, 
				        position: locPosition
				    }); 
				    
				    var iwContent = message, // 인포윈도우에 표시할 내용
				        iwRemoveable = true;
		
				    // 인포윈도우를 생성합니다
				    var infowindow = new kakao.maps.InfoWindow({
				        content : iwContent,
				        removable : iwRemoveable
				    });
				    
				    // 인포윈도우를 마커위에 표시합니다 
				    infowindow.open(map, marker);
				    
				    // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);      
				}
				var markerImage;
				
                // 키워드 검색 완료 시 호출되는 콜백함수 입니다
                function placesSearchCB (data, status, pagination) {
                    if (status === kakao.maps.services.Status.OK) {

                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표를 추가합니다
                        var bounds = new kakao.maps.LatLngBounds();

                        for (var i=0; i<data.length; i++) {
							// 추가!!
							// data[i].place_name 해당하지 않는 곳은 제외하기!
							var str = data[i].place_name; 
							var pass1 = str.search("이마트");
							var pass2 = str.search("이마트에브리데이");
							var nopass1 = str.search("이마트24");
							var nopass2 = str.search("emart24");
							// 추후 gs칼텍스, gs건설 등 제외하기!!
							
							// 클릭시 상품명과 이벤트명 이용!
							storeName[i] = str;
							//console.log("storeNameIndex: " + storeName.indexOf(storeName[i]));
							
							// 추가!!
 	 						var res = str.split(" ");
							// ex) cu, gs25 등..
							var shop_code = res[0];
							if(shop_code == '이마트24') shop_code = EMART24;
							else if(shop_code == 'GS25') shop_code = GS25;
							else if(shop_code == '세븐일레븐') shop_code = SEVENELEVEN;
							else if(shop_code == '미니스톱') shop_code = MINISTOP;
							else if(shop_code == 'CU') shop_code = CU;
							// ex) 테헤란로점, 종로1가점 등..
							var shop_name_detail = res[1];
							//console.log("--------------------------------");
							//console.log("shop_code : " + shop_code);
							//console.log("shop_name_detail : " + shop_name_detail);

							//map algorithm start
							if(productName == undefined || productName == null || productName == ""){
							}else{
								//console.log("shop_code:"+shop_code,
											//"shop_name_detail: "+shop_name_detail);
								$.ajax({
									url:"/pmkim/map",
									type:'post',
									data: {
											"shop_code":shop_code,
											"shop_name_detail":shop_name_detail},
									dataType: "text",
									async: false,
									success:function(data){
										//console.log(data);
										if(data == "success"){
											//console.log("success");
											
											// success면 카카오 맵에서 나온 편의점이 있다 라는것!!
											// 이제 부터는 이 편의점에 해당 상품이 행사하는지를 확인해서 
											// 마커로 맵에 알려주면 끄~읏!
											var event_name = null, good_name = null;
											var resultName = getEventName(shop_code, productName);
											//console.log("resultName: "+resultName);
											$.each(resultName, function(idx, val) {
												console.log("good_name11: " + val.good_name);
												console.log("good_event11: " + val.event_name);
												if(good_name == null) good_name = val.good_name + " ";
												if(event_name == null) event_name = val.event_name + " ";

												if(val.good_name != null) good_name += val.good_name + " ";
												if(val.event_name != null) event_name += val.event_name + " ";
											});
											//console.log("event_name + good_name: " + resultName);
											//console.log("typeof: "+typeof(resultName));
											
											//console.log(resultName);
											if(isEmpty(good_name) || isEmpty(event_name)){
												//console.log("1231-"+good_name);
												//console.log("1231-"+event_name)
											}else{
												//console.log("1231-"+good_name);
												//console.log("1231-"+event_name)
												//console.log("resultName " + "is not empty");
												var resGoodName = good_name.split(" ");
												var resEventName = event_name.split(" ");
												
												printProduct[i] = new Array(resGoodName.length);
												for(var j = 0; j < resGoodName.length; j++){
													// 모든 상품들을 여기서 출력할수 있음
													if(!isEmpty(resGoodName[j]) || !isEmpty(resEventName[j])){
														//printProduct[i][j] = removeDuplicatesArray(resGoodName[j] + ": " + resEventName[j]);
														printProduct[i][j] = resGoodName[j] + ": " + resEventName[j];
														console.log("printProduct -- " + printProduct[i][j]);
													}
													
												}
												//출력용 변수
												printLength = resGoodName.length;
												printGoodName = resGoodName;
												printEventName = resEventName;
												// To do list !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
												// 대표적으로 처음에 나오는 상품 기준으로 지도에 보여주기로함!!
												// 해당 지점 마커를 클릭하면 상세 하게 지도 밑에 출력하기로하자!!
												good_name = resGoodName[0];
												event_name = resEventName[0];
											}
											markerImage = null; // 행사 상품만 새로운 Image를 마커로 나타내기 위해!! 
											var imageSrc = null;
											if(isEmpty(event_name) || isEmpty(good_name)){
												console.log("nothing event_name or good_name");							
											}else{
												//console.log("event_name + good_name: " + event_name + ", " + good_name);
												//console.log("shop_code: " + shop_code);
												// 맵에 event 마커 등록!! ↓↓↓↓↓↓↓↓↓
												//--------------------------------------------------------------------------------------
												 // 마커의 이미지 주소입니다.
												if(event_name == '1+1' && shop_code == SEVENELEVEN){
													imageSrc = '/pmkim/resources/images/map/7eleven_1+1.png';
												}else if(event_name == '2+1' && shop_code == SEVENELEVEN){
													imageSrc = '/pmkim/resources/images/map/7eleven_2+1.png';
												}else if(event_name == '1+1' && shop_code == CU){
													imageSrc = '/pmkim/resources/images/map/cu_1+1.png';
												}else if(event_name == '2+1' && shop_code == CU){
													imageSrc = '/pmkim/resources/images/map/cu_2+1.png';
												}else if(event_name == '1+1' && shop_code == EMART24){
													imageSrc = '/pmkim/resources/images/map/emart24_1+1.png';
												}else if(event_name == '2+1' && shop_code == EMART24){
													imageSrc = '/pmkim/resources/images/map/emart24_2+1.png';
												}else if(event_name == '1+1' && shop_code == GS25){
													imageSrc = '/pmkim/resources/images/map/GS25_1+1.png';
												}else if(event_name == '2+1' && shop_code == GS25){
													imageSrc = '/pmkim/resources/images/map/GS25_2+1.png';
												}else if(event_name == '1+1' && shop_code == MINISTOP){
													imageSrc = '/pmkim/resources/images/map/ministop_1+1.png';
												}else if(event_name == '2+1' && shop_code == MINISTOP){
													imageSrc = '/pmkim/resources/images/map/ministop_2+1.png';
												}
												// 마커이미지의 크기입니다
												imageSize = new kakao.maps.Size(64, 69),
												// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
												imageOption = {offset: new kakao.maps.Point(27, 69)}; 
												// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
												markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
											}
										
										}else{
											console.log("fail");
										}
									},
									error:function(jqXHR, textStatus, errorThrown){ //
										console.log("에러 발생!! \n textStatus: " + textStatus + " errorThrown: " + errorThrown + " jqXHR: "  + jqXHR);
									}
						    	});
							}
							
							if(nopass1 >= 0 || nopass2 >= 0){
								//console.log("+");
							}else{
								//console.log("-");
								if(pass1 != -1 || pass2 != -1){
									continue;
								}
							}
							
                            searchDisplayMarker(data[i]);
							var location = new kakao.maps.LatLng(data[i].y, data[i].x); 
                            bounds.extend(location);

							//search 좌표 -> 주소
							searchDetailAddrFromCoords(location, function(result, status) {
								if (status === kakao.maps.services.Status.OK) {
									var detailAddr = !!result[0].road_address ? '도로명주소 : ' + result[0].road_address.address_name : '';
									detailAddr += '\n\r지번 주소 : ' + result[0].address.address_name;
									//console.log(detailAddr);
								}
							});
                        }       
						//-------------//-------------//-------------//-------------//-------------//-------------      
                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                        map.setBounds(bounds);
                    } 
                }

                // 지도에 마커를 표시하는 함수입니다
                function searchDisplayMarker(place) {
                    //new kakao.maps.LatLng(place.y, place.x)  다름
                    // 마커를 생성하고 지도에 표시합니다
					var marker = new kakao.maps.Marker({
							map: map,
							position: new kakao.maps.LatLng(place.y, place.x),
							image: markerImage // // 마커이미지 설정
                    	});
					
					// 마커에 클릭이벤트를 등록합니다	
                    kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                        
                        //console.log("test"+place.place_name);
						// printGoodName = resGoodName;
						// printEventName = resEventName;
						// printLength
						document.getElementById('printName').innerHTML = "";
						var idx = storeName.indexOf(place.place_name);
						
						// 상품 정보 보여주기
						for(var i = 0; i < printLength; i++){
							console.log("loggggg("+i+"): "+ printProduct[idx][i]);
							if(i == printLength - 1){
								if(!isEmpty(printProduct[idx][i])){
									document.getElementById('printName').innerHTML += printProduct[idx][i];
								}
							}else{
								if(!isEmpty(printProduct[idx][i])){
									document.getElementById('printName').innerHTML += printProduct[idx][i] + ", ";
								}
							}

							// var id = "ctl03_Tabs1";
							// var lastFive = id.substr(id.length - 5); // => "Tabs1"
							// var lastChar = id.substr(id.length - 1); // => "1"
						}
						var reName = document.getElementById('printName').innerHTML;
						var lastChar = reName.substr(reName.length - 2);
						var lastCharDel;
						if(lastChar == ', '){
							lastCharDel = reName.substr(0, reName.length - 2);
							document.getElementById('printName').innerHTML = lastCharDel;
							console.log("del----"+lastCharDel);
						}else{
							document.getElementById('printName').innerHTML
						}
						
						
						

						//console.log("test"+place.place_name);
                        infowindow.open(map, marker);
                    });
	
                }

				function searchDetailAddrFromCoords(coords, callback) {
					// 좌표로 법정동 상세 주소 정보를 요청합니다
					geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}
                //kakao 메서드 end------------------------
                function getEventName(shop_code, good_name){
                	var result;
                	//console.log("getEventName shop_code : " + shop_code);
                	//console.log("getEventName good_name : " + good_name);
                	//console.log("---------");
                	$.ajax({
						url:"/pmkim/map/data",
						type:'post',
						data: {
								"shop_code":shop_code,
								"good_name":good_name},
						dataType: "json",
						//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						async: false,
						success:function(data){
							result = data;
							//var productName = new Set();
							//document.getElementById('productList').innerHTML = "검색된 상품: "
							
							//var temp;
							$.each(data, function(idx, val) {
								//console.log(idx + " " + val.good_name);
								console.log(idx + " " + val.event_name);
								//document.getElementById('productList').innerHTML += "<p id='result_name'>"+ val.good_name + "</p>";
								//if(temp == null) sumProductName = val.good_name;
								//else 
								if(sumProductName == null) sumProductName = val.good_name;
								else sumProductName.push(val.good_name.trim());
								
							});
							
							sumProductName = removeDuplicatesArray(sumProductName);
							sumProductName.forEach( v => {
									document.getElementById('productList').innerHTML += v + " ";
							});

							//sumProductName = Array.from(new Set(sumProductName));
							var filterSet;
							filterSet = removeDuplicatesArray(sumProductName);
							
							sumProductName = Array.from(new Set(sumProductName));
							//removeDuplicatesArray(sumProductName);
							//sumProductName
							document.getElementById('productList').innerHTML = "검색된 상품명: ";
							if(sumProductName != null){
								filterSet.forEach( v => {
									document.getElementById('productList').innerHTML += v + " ";
								});
							}
							
							// document.getElementById('productList').innerHTML = "검색된 상품: "
							// sumProductName.forEach( v => { 
							// 	console.log("productName2: "+v);
							// 	document.getElementById('productList').innerHTML += v + " ";
							// });


						},
						error:function(jqXHR, textStatus, errorThrown){ //
							console.log("function 에러 발생!! \n textStatus: " + textStatus + " errorThrown: " + errorThrown + " jqXHR: "  + jqXHR);
						}
			    	});
                	return result;
				}
				function removeDuplicatesArray(arr) {
					var tempArr = [];
					for (var i = 0; i < arr.length; i++) {
						if (tempArr.length == 0) {
							tempArr.push(arr[i]);
						} else {
							var duplicatesFlag = true;
							for (var j = 0; j < tempArr.length; j++) {
								if (tempArr[j].toLowerCase() == arr[i].toLowerCase()) {
									duplicatesFlag = false;
									break;
								}
							}
							if (duplicatesFlag) {
								tempArr.push(arr[i].toLowerCase());
								//console.log("duplicated : " + arr[i]);
							}
						}
					}
					return tempArr;
				}

				function isEmpty(str){
					if(typeof str == "undefined" || str == null || str == "")
						return true;
					else
						return false ;
				}
			</script>
			<div class="row my-4">
				<div class="col-12"></div>
			</div>
		</div>
	</div>
	<!-- End About Page -->

	<!-- 20200521_oliver.yoo -->
	<!-- Start Footer  -->
	<footer>
		<div class="footer-main">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>챗봇(Coming Soon)</h3>

						</div>
					</div>

				</div>
				<hr>

				<div class="container text-centers">
					<div class="row">
						<!-- Footer 1-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/haley.png" class="profile"  alt="" /></a>
						<h2>Haley Oh</h2>
						<a href="https://github.com/JihyeHaley"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a> 
						</div>

						<!-- Footer 2-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/seho.png" class="profile"   alt="" /></a>
						<h2>Seho Oh </h2>
						<a href="https://github.com/sehooh5"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a> 
						</div>

						<!-- Footer 3-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/linda.png" class="profile" alt="" /></a>
							<h2>Linda Eom </h2>
							<a href="https://github.com/GyuyoungEom"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
						</div>

						<!-- Footer 4-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/oliver.png" class="profile"  /></a>
							<h2>Oliver Yoo </h2>
							<a href="https://github.com/SeongjinOliver"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-widget">
							<h4>About 편마 김편복</h4>
							<p>편의점 마스터! 김편복
								데이터, 위치기반을 활용한 편의점 상품 추천 서비스</p>
							<p>편의점에서 점심을 간단히 먹고 싶은 김편복씨는 자신의 위치에서 먹고자하는
								상품 어느 편의점에서 행사를 하는지 알고 싶은데 알 수 있는 방법이 없다!!
								이럴때 필요한 서비스는 "<b>편마 김편복</b>"</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link">
							<h4>Information</h4>
							<ul>
								<li><a href="#/pmkim/main">HOME</a></li>
								<li><a href="#/pmkim/map">지도</a></li>
								<li><a href="#/pmkim/theme">테마</a></li>
								<li><a href="#/pmkim/event">행사</a></li>
								<li><a href="#/pmkim/cart">장바구니</a></li>
								<li><a href="#/pmkim/mypage">마이페이지</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link-contact">
							<h4>Contact Us</h4>
							<ul>
								<li>
									<p>
										<i class="fas fa-map-marker-alt"></i>주소: 서울특별시 강남구 
										테헤란로 212 <br>(역삼동 718-5번지)<br> (우) 06220
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-phone-square"></i>Phone: <a
											href="tel:+81-1029852154">+82-10 2985 2154</a>
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-envelope"></i>Email: <a
											href="mailto:ohhojh@gmail.com">ohhojh@gmail.com</a>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer  -->

	<!-- Start copyright  -->
	<div class="footer-copyright">
		<p class="footer-company">
			© PMKIM CORP. ALL RIGHTS RESERVED &copy; 2020 <a href="#PMKIM">PMKIM</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="resources/js/jquery.superslides.min.js"></script>
	<script src="resources/js/bootstrap-select.js"></script>
	<script src="resources/js/inewsticker.js"></script>
	<script src="resources/js/bootsnav.js"></script>
	<script src="resources/js/images-loded.min.js"></script>
	<script src="resources/js/isotope.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/baguetteBox.min.js"></script>
	<script src="resources/js/form-validator.min.js"></script>
	<script src="resources/js/contact-form-script.js"></script>
	<script src="resources/js/custom.js"></script>
</body>

</html>
	