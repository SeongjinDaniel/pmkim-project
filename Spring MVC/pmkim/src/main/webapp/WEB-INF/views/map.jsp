<%@page import="vo.GoodsEventShopMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "vo.MemberVO, java.util.List"
	import = "vo.GoodsEventShopMemberVO"%>	

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
		GoodsEventShopMemberVO mapAlgorithmDB = 
				(GoodsEventShopMemberVO) request.getAttribute("mapAlgorithmDB");
	%>
	<header class="main-header">
		<!-- Start Navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-menu" aria-controls="navbars-rs-food"
						aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="index.html"><img
						src="/pmkim/resources/images/pmkim_Logo_1.jpg" class="logo" alt=""></a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
						<!-- href는 jsp/html 형식이 아닌, {/매핑명}으로  해주시면돼용! 나중에 고쳐주세요~ -->
						<li class="nav-item"><a class="nav-link" href="/pmkim/map">지도</a></li>
						<!--성진오빠파트-->
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown">테마</a>
							<!-- 세호오빠가 원하는 li에다가 href해주세요!-->
							<ul class="dropdown-menu">
								<li><a href="shop.html">Sidebar Shop</a></li>
								<li><a href="shop-detail.html">Shop Detail</a></li>
								<li><a href="cart.html">Cart</a></li>
								<li><a href="checkout.html">Checkout</a></li>
								<li><a href="my-account.html">My Account</a></li>
								<li><a href="wishlist.html">Wishlist</a></li>
							</ul></li>
						<li class="nav-item active"><a class="nav-link"
							href="event.jsp">행사</a></li>
						<!-- 지혜파트-->
						<li class="nav-item"><a class="nav-link" href="mycart.jsp">장바구니</a></li>
						<!-- 규영언니파트♡ -->
					</ul>
				</div>
				<!-- /.navbar-collapse -->

				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="#"> <i
								class="fa fa-shopping-bag"></i> <span class="badge">3</span>
								<p>My Cart</p>
						</a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->
			</div>
			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<li class="cart-box">
					<ul class="cart-list">
						<li><a href="#" class="photo"><img
								src="resources/images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Delica omtantur </a>
							</h6>
							<p>
								1x - <span class="price">$80.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="resources/images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Omnes ocurreret</a>
							</h6>
							<p>
								1x - <span class="price">$60.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="resources/images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Agam facilisis</a>
							</h6>
							<p>
								1x - <span class="price">$40.00</span>
							</p></li>
						<li class="total"><a href="#"
							class="btn btn-default hvr-hover btn-cart">VIEW CART</a> <span
							class="float-right"><strong>Total</strong>: $180.00</span></li>
					</ul>
				</li>
			</div>
			<!-- End Side Menu -->
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
			<div id="map" style="width: 100%; height: 500px;"></div>
			<script>

				//var goodId = ${mapAlgorithmDB.good_id}
				//console.log(goodId);
				//console.log(mapAlgorithmDBList.getGood_id);

				// 카카오 맵에서 넘어 오는 편의점명 -> CU, GS25, 세븐일레븐, 이마트24, 미니스톱
				const EMART24 = "EM", CU = "CU", GS25 = "GS", SEVENELEVEN = "SE", MINISTOP = "MS";
				var keyword = '<%=keyword%>';
				var productName = '<%=keywordProduct%>';

				//console.log(productName);

				// alert('<%=keywordProduct%>');
				// console.log('<%=keywordProduct%>');

				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
                // 키워드 장소 검색할 때 필요한 부분!!
                var infowindow = new kakao.maps.InfoWindow({zIndex:1});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
					console.log(curPositionFlag);
					//----------------------------------------------------------
					//현재위치 기반으로 편의점 검색!!! 
					ps.keywordSearch("편의점", placesSearchCB, {
						// LatLng : 중심 좌표. 특정 지역을 기준으로 검색한다.
						location: new kakao.maps.LatLng(lat, lon)
					});
					//----------------------------------------------------------
				}else{
					console.log(curPositionFlag);
					console.log("키워드: " + keyword);
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
							console.log("shop_code : " + shop_code);
							console.log("shop_name_detail : " + shop_name_detail);

							//map algorithm start
							if(productName == undefined || productName == null || productName == ""){
							}else{
								console.log("shop_code:"+shop_code,
											"shop_name_detail: "+shop_name_detail);
								$.ajax({
									url:"/pmkim/map",
									type:'post',
									data: {
											"shop_code":shop_code,
											"shop_name_detail":shop_name_detail},
									dataType: "text",
									async: false,
									success:function(data){
										console.log(data);
										if(data == "success"){
											console.log("success");
										}else{
											console.log("fail");
										}
									},
									error:function(jqXHR, textStatus, errorThrown){ //
										console.log("에러 발생!! \n textStatus: " + textStatus + " errorThrown: " + errorThrown + " jqXHR: "  + jqXHR);
									}
						    	});
							}
							

							// //클릭 상품 저장
							// function add(good_id){
							// 	$.ajax({
							// 		type :"post",
							// 		url :"/pmkim/cart",  
							// 		data : {"action" : "insert",
							// 			"good_id" : good_id},
							// 		dataType : "json",   // text, xml, html, script, json, jsonp 가능 
							// 		success : function(data){   
							// 		if(data=="1"){

							// 			var key = [];         //id값 담을 변수 선언
							// 			var num = document.getElementsByClassName('good_id').length
							// 			for(var i=0; i<num; i++){
							// 				key[i] = document.getElementsByClassName('good_id')[i].value;
							// 			}
							// 			var good_name = document.getElementsByClassName('good_name')[key.indexOf(good_id)].innerHTML;
							// 			var good_img = document.getElementsByClassName('img-fluid')[key.indexOf(good_id)].getAttribute('src');

							// 			document.getElementById('cart-View').innerHTML = "<p id='result_name'>"+ good_name + "</p> <br>"+"<img src = '"+good_img+"' class ='img-fluid'>";

							// 		}else{
							// 			alert("상품이 선택되지 않았습니다.");
							// 		}
							// 		},
							// 		error : function(){
							// 		alert("프로그램 에러가 발생했습니다.");
							// 		}
							// 	});
								
							// }
							
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
							position: new kakao.maps.LatLng(place.y, place.x) 
                    	});
					
					// 마커에 클릭이벤트를 등록합니다	
                    kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
						//console.log("test"+place.place_name);
                        infowindow.open(map, marker);
                    });
	
                }

				function searchDetailAddrFromCoords(coords, callback) {
					// 좌표로 법정동 상세 주소 정보를 요청합니다
					geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}
                //kakao 메서드 end------------------------
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