<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List, java.util.ArrayList,vo.AnalysisVO"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>편의점 마스터! 김편복</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- 0522 favicon image(아이콘 이미지)  -->
<link rel="icon" type="image/png" sizes="16x16" href="/pmkim/resources/images/favicon-16x16.png">
<!-- Site Icons -->
<link rel="shortcut icon" href="/pmkim/resources/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="/pmkim/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/style_analysis.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>body{background-color:white;}</style>
<script src="/pmkim/resources/js/htmlwidgets.js"></script>
<link href="/pmkim/resources/css/wordcloud.css" rel="stylesheet" />
<script src="/pmkim/resources/js/wordcloud2-all.js"></script>
<script src="/pmkim/resources/js/hover.js"></script>
<script src="/pmkim/resources/js/wordcloud2.js"></script>
<script src="/pmkim/resources/js/jquery-3.2.1.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset = "utf-8"></script>
<style>
#myGraph rect {
	stroke-width : 1px;
	fill : orange;
}
svg {
	width : 500px;
	height : 220px;
}
.text {
        font-weight: bold;
        color: #ffffff;
         text-shadow: 2px 2px 2px gray; 
}
</style>
</head>

<body>


	<!-- Start Main Top -->
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
						src="resources/images/pmkim_Logo_1.jpg" class="logo" alt=""></a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
						<!-- href는 jsp/html 형식이 아닌, {/매핑명}으로  해주시면돼용! 나중에 고쳐주세요~ -->
						<li class="nav-item"><a class="nav-link" href="map.html">지도</a></li>
						<!--성진오빠파트-->
						<li class="nav-item active"><a class="nav-link"
							href="event.jsp">SNS 이슈</a></li>
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
								src="/pmkim/resources/images/img-pro-01.jpg" class="cart-thumb"
								alt="" /></a>
							<h6>
								<a href="#">Delica omtantur </a>
							</h6>
							<p>
								1x - <span class="price">$80.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="/pmkim/resources/images/img-pro-02.jpg" class="cart-thumb"
								alt="" /></a>
							<h6>
								<a href="#">Omnes ocurreret</a>
							</h6>
							<p>
								1x - <span class="price">$60.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="/pmkim/resources/images/img-pro-03.jpg" class="cart-thumb"
								alt="" /></a>
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
					<h2>SNS ANALYSIS</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Shop</a></li>
						<li class="breadcrumb-item active">The Best Shop</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start Shop Detail  -->
	<div class="shop-detail-box-main">
		<div class="container">
			<div class="row">
				<div class="col-xl-5 col-lg-5 col-md-6">
					<div id="carousel-example-1"
						class="single-product-slider carousel slide" data-ride="carousel" data-interval="false">
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active" id="SE">
							<input type="hidden" class="shop" id="SE">
								<div class="type-lb">
                                <p class="sale">best 1</p>
                           		</div>
								<a href ="/pmkim/analysis">
								<img class="d-block w-100" src="/pmkim/resources/images/seveneleven.png"
									alt="First slide"></a>
							</div>
							<div class="carousel-item" id="GS">
							<input type="hidden" class="shop" id="GS">
								<div class="type-lb">
                                <p class="sale">best 2</p>
                           		</div>
								<img class="d-block w-100"
									src="/pmkim/resources/images/gs25.png" alt="Second slide">
							</div>
							<div class="carousel-item" id="MS">
							<input type="hidden" class="shop" id="MS">
								<div class="type-lb">
                                <p class="sale">best 3</p>
                           		</div>
								<img class="d-block w-100"
									src="/pmkim/resources/images/mini.png" alt="Third slide">
							</div>
							<div class="carousel-item" id="EM">
							<input type="hidden" class="shop" id="EM">
								<div class="type-lb">
                                <p class="sale">best 4</p>
                           		</div>
								<img class="d-block w-100"
									src="/pmkim/resources/images/emart24.png" alt="Fourth slide">
							</div>
							<div class="carousel-item" id="CU" >
							<input type="hidden" class="shop" id="CU">
								<div class="type-lb">
                                <p class="sale">best 5</p>
                           		</div>
								<img class="d-block w-100"
									src="/pmkim/resources/images/cu.png" alt="Fifth slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-example-1"
							role="button" data-slide="prev" id="next-carousel"> <i class="fa fa-angle-left"
							aria-hidden="true"></i> <span class="sr-only">Previous</span>
						</a> 
						<a class="carousel-control-next" href="#carousel-example-1"
							role="button" data-slide="next" id="next-carousel"> <i class="fa fa-angle-right"
							aria-hidden="true"></i> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				
				
				<script>
				
			    	function wordcloud(shop_code){
						var url = "/pmkim/resources/html/"+shop_code+".html";
						$.ajax({
							  url:url,
							  context: document.body,
							  success: function(response){
								//console.log(url);
							    html = response;
							   	//console.log(html);
							    var wordcloud = $('#wordcloud');
							    wordcloud.attr('srcdoc',html);
							  }
							});
					}
				
					function ajax(shop_code){
						var num = document.getElementsByClassName('event_name').length;
						 $.ajax({
					            type :"POST",
					            url :"/pmkim/analysis",  
					            data : {"shop_code" : shop_code
					                   },
					            dataType : "json", 
					            success : function(data){	
					            	//shop name 클릭시 마다 변경
					            	document.getElementsByClassName('shop_name')[0].innerHTML=data[0].shop_name;
					            	document.getElementsByClassName('shop_name')[1].innerHTML=data[0].shop_name;
					            	
					            	//csv 읽고 그래프
					            	
					            	//상품 정보 받아와서 정보 뿌려주기
					               for(var i=0;i<num;i++){
					            	   document.getElementsByClassName('good_name')[i].innerHTML=data[i].good_name;
					            	   document.getElementsByClassName('good_price')[i].innerHTML=data[i].good_price+" 원";
					            	   document.getElementsByClassName('event_name')[i].innerHTML=data[i].event_name;
					            	   document.getElementsByClassName('box-img-hover')[i].innerHTML=
					            		   "<img src='"+data[i].good_img+"' class='img-fluid' alt='Image'>";
					               }
					        },
					        error : function(){
					           alert("프로그램 에러가 발생했습니다.2");
					        }
					     });
					}
					
					function graph(shop_code){
						var filecsv= "/pmkim/resources/csv/senti_data.csv";
						
						$.ajax({
							url: filecsv,
						  	dataType: "text",
						  	success: function(data){
						  		d3.csv(filecsv,function(error,data){
									//console.log(typeof data);
									//console.log(data);
									var dataSet = [ ];
									for(var i=0; i<data.length; i++){
										dataSet.push(data[i][shop_code]);
										//console.log(data[i][shop_code]);
									}
									
									
									var graph = d3.select("#myGraph")
										.selectAll("rect")
										.data(dataSet)
										.enter()
										.append("rect")
										.attr("x",60)
										.attr("y",function(d,i){
											return (i * 60);
										})
										.attr("height","50px")
										.attr("width", "0px");
									
									graph.transition()				
										.delay(function(d, i){
											return i * 1000;		
										})
										.duration(2500)			
										.attr("width", function(d, i){
											return d/3 +"px";		 
										});
									
									
									var text_data = ["LOVE : "+dataSet[0],"Negative : "+dataSet[1]];
									var text = d3.select("svg");
									//console.log(text);
									console.log(text_data);
									text.selectAll("text")
								    .data(text_data)
								    .enter().append("text")
								    .text(function(d) {return d})
								    .attr("class", "text")
								    .transition()				
									.delay(function(d, i){
										return i * 1000;		
									})
									.duration(4000)
								    .attr("x", 70)
								    .attr("y", function(d, i) {return 30+(i*60)})
								    ;
										
								});
						  }
						});
						
					}
					$(document).ready(function(){
						var shop_code = document.getElementsByClassName('shop')[0].id;
			               ajax(shop_code);
			               wordcloud(shop_code);
			               graph(shop_code);
						$("#next-carousel ").click(function(){
							// 그래프 지웟다가 다시 그리려면 svg 내용 지우고 넘겨야함 
							d3.selectAll("svg > *").remove();
							// 시간 지연해줘야 값 받아옴
							setTimeout(function(){
								//클릭하면 shop_code 받아오기
								shop_code = document.getElementsByClassName('carousel-item active')[0].id;
								
								ajax(shop_code);
							     wordcloud(shop_code);
							     graph(shop_code);
							},800);
						}); 
					});
					
				</script>

				
				<div class="col-xl-7 col-lg-7 col-md-6">
					<div class="single-product-details">

						<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 DO YOU LOVE "<span class="shop_name"></span>" ? </h2>
						 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 SNS 포스팅 감성분석 : <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 인스타그램 최신 게시물 5000 개를 감성 분석한 그래프
						 </p>
						 <svg id = "myGraph"></svg>
<!-- 						<div class="price-box-bar">
							<div class="cart-and-bay-btn">
								<a class="btn hvr-hover" data-fancybox-close="" href="#">Best 상품</a>
								
								<a class="btn hvr-hover" data-fancybox-close="" href="#">Best 상품 그래프</a>
								
								<a class="btn hvr-hover" data-fancybox-close="" href="#">감성분석 그래프</a>
							</div>
						</div> -->
					</div>
					
				</div>
						
			</div>
			
			

			<div class="row my-5">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>SNS 에서 가장 인기가 많은 <span class="shop_name"></span> 상품은?</h1>
						<p>최근 SNS 포스팅에서 가장 많이 노출된 상품 리스트</p>
					<p align="center" id="wordcloud_p">
			<iframe id="wordcloud" width = "100%" height = "350" srcdoc="" style="border:none">
			</iframe>
			</p>
					</div>
					
					<div class="featured-products-box owl-carousel owl-theme">
						<div class="item">
									<div class="type-lb">
                               		<p class="event_name"></p>
                           			</div>
							<div class="products-single fix">
								<div class="box-img-hover">
								<!-- image들어오는곳 -->
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="products-single fix">
								<div class="box-img-hover">
									
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
						<div class="item">
						<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="products-single fix">
								<div class="box-img-hover">
									
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="products-single fix">
								<div class="box-img-hover">
									
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="products-single fix">
								<div class="box-img-hover">
									
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="products-single fix">
								<div class="box-img-hover">
									
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="products-single fix">
								<div class="box-img-hover">
									
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
						<div class="item">
						<div class="type-lb">
                                <p class="event_name"></p>
                           	</div>
							<div class="products-single fix">
								<div class="box-img-hover">
								
								</div>
								<div class="why-text">
									<h4 class="good_name"></h4>
									<h5 class="good_price"></h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- End Cart -->

	<!-- Start Instagram Feed  -->
	<div class="instagram-box">
		<div class="main-instagram owl-carousel owl-theme">
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-01.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-02.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-03.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-04.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-05.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-06.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-07.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-08.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-09.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="/pmkim/resources/images/instagram-img-05.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Instagram Feed  -->


	<!-- Start Footer  -->
	<footer>
		<div class="footer-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Business Time</h3>
							<ul class="list-time">
								<li>Monday - Friday: 08.00am to 05.00pm</li>
								<li>Saturday: 10.00am to 08.00pm</li>
								<li>Sunday: <span>Closed</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Newsletter</h3>
							<form class="newsletter-box">
								<div class="form-group">
									<input class="" type="email" name="Email"
										placeholder="Email Address*" /> <i class="fa fa-envelope"></i>
								</div>
								<button class="btn hvr-hover" type="submit">Submit</button>
							</form>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Social Media</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<ul>
								<li><a href="#"><i class="fab fa-facebook"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-linkedin"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-google-plus"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-pinterest-p"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-whatsapp"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-widget">
							<h4>About Freshshop</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link">
							<h4>Information</h4>
							<ul>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Customer Service</a></li>
								<li><a href="#">Our Sitemap</a></li>
								<li><a href="#">Terms &amp; Conditions</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Delivery Information</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link-contact">
							<h4>Contact Us</h4>
							<ul>
								<li>
									<p>
										<i class="fas fa-map-marker-alt"></i>Address: Michael I. Days
										3756 <br>Preston Street Wichita,<br> KS 67213
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-phone-square"></i>Phone: <a
											href="tel:+1-888705770">+1-888 705 770</a>
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-envelope"></i>Email: <a
											href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a>
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
			All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By
			: <a href="https://html.design/">html design</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->

	<script src="/pmkim/resources/js/popper.min.js"></script>
	<script src="/pmkim/resources/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="/pmkim/resources/js/jquery.superslides.min.js"></script>
	<script src="/pmkim/resources/js/bootstrap-select.js"></script>
	<script src="/pmkim/resources/js/inewsticker.js"></script>
	<script src="/pmkim/resources/js/bootsnav.js."></script>
	<script src="/pmkim/resources/js/images-loded.min.js"></script>
	<script src="/pmkim/resources/js/isotope.min.js"></script>
	<script src="/pmkim/resources/js/owl.carousel.min.js"></script>
	<script src="/pmkim/resources/js/baguetteBox.min.js"></script>
	<script src="/pmkim/resources/js/form-validator.min.js"></script>
	<script src="/pmkim/resources/js/contact-form-script.js"></script>
	<script src="/pmkim/resources/js/custom.js"></script>
	
</body>

</html>