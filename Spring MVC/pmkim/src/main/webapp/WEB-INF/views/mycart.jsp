<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.GoodsVO, vo.CartVO, vo.EventVO, vo.MemberVO,vo.GoodsEventShopMemberVO,java.util.List,java.util.ArrayList"%>
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
<title>편의점 마스터, 김편복</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="icon" type="image/png" sizes="16x16"
    href="/pmkim/resources/images/favicon-16x16.png">
<link rel="shortcut icon" href="/pmkim/resources/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="/pmkim/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/style_linda.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/pmkim/resources/css/custom.css">
<link rel="stylesheet" href="/pmkim/resources/css/footerus.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<%
		   List<GoodsEventShopMemberVO> cartList = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("cartList");
		   List<GoodsVO> goodsList = (ArrayList<GoodsVO>) request.getAttribute("goodsList");
		   List<GoodsEventShopMemberVO> gesList = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("gesList");
	%>
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
					<a class="navbar-brand" href="index.html">
					<img src="/pmkim/resources/images/logo.png" class="logo" alt="">
					</a>
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

				<!-- Start Attribute Navigation -->
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
				<span class="input-group-addon close-search"><i	class="fa fa-times"></i></span>
			</div>
		</div>
	</div>
	<!-- End Top Search -->

	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>Shop</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Shop</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->
	
	<!-- Start Shop Page  -->
	<div class="shop-box-inner">
		
		<div class="container">
			<!-- 검색창 -->
			<div class="search-product">
				<form action="/pmkim/cart" method="get">
					<input type="hidden" name="action" value = "search">
					<input class="form-control" name="keyword" placeholder="Search here..." type="text">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
			<!-- 검색 조건 검색 -->
			<div class="row">
				<div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
					<div class="right-product-box">
						<form method="GET" action="/pmkim/cart">
							<div class="product-item-filter row">
								<div class="col-12 col-sm-8 text-center text-sm-left">
										<input type ="hidden" name ="action" value = "sort">
										<div class="toolbar-sorter-right">
											<span>편의점 </span> 
											<select name="shop_code" class="selectpicker show-tick form-control">
												<option value="GS">GS25</option>
												<option value="CU">CU</option>
												<option value="MS">ministop</option>
												<option value="SE">7eleven</option>
												<option value="EM">emart24</option>
											</select>
										</div>
										<br>
										<br>
										<div class="toolbar-sorter-right">
											<span>행사 종류</span> 
											<select name="event_name" class="selectpicker show-tick form-control">
												<option value="1+1">1+1</option>
												<option value="2+1">2+1</option>
												<option value="SALE">Sale</option>
												<option value="Fresh Food">FreshFood</option>
												<option value="PB">PB</option>
											</select>
										</div>
										
									<!-- <p>Showing all 4 results</p> -->
								</div>
								<div class="col-12 col-sm-4 text-center text-sm-right">
									<ul class="nav nav-tabs ml-auto">
										<li><a class="nav-link active" href="#grid-view"
											data-toggle="tab"> <i class="fa fa-th"></i>
										</a></li>
										<li><a class="nav-link" href="#list-view"
											data-toggle="tab"> <i class="fa fa-list-ul"></i>
										</a></li>
									</ul>
									<button type="submit">
										<i class="fa fa-search"></i>
									</button>
								</div>
						</div>
					</form>
						

						<div class="product-categorie-box">
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade show active"
									id="grid-view">
									<div class="row">
									<!-- 상품출력 반복문 -->
									<c:forEach var="vo" items="${ gesList }">
										<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
											<div class="products-single fix">
												<div class="box-img-hover">
													<div class="type-lb">
														<p class="sale">${ vo.shop_name }</p>
													</div>
													<img src= "${ vo.good_img }" class="img-fluid" alt="Image">
													
													<div class="mask-icon">
														<a class="cart" href="/pmkim/cart?action=insert">Add to Cart</a>
													</div>
												</div>
												<div class="why-text">
													<h4>${ vo.good_name }</h4>
													<h5>${ vo.good_price }원</h5>
													<h5>${ vo.event_name }</h5>
												</div>
											</div>
										</div>
										</c:forEach>
										
									</div>
								</div>
							</div>
							<!-- paging -->
							<div id="paging" style="text-align : center; font-size : 16pt;">
								<c:if test="${ pgNum != 1 }">
									<a href ="/pmkim/cart?pgNum=1"> &laquo; </a>
									<a href = "/pmkim/cart?pgNum=${ pgNum - 1 }"> &nbsp; &lt; &nbsp;</a>
								</c:if>
								
								<c:forEach var="num" begin="${ pageStart }" end="${ pageEnd }">
									<a href = "/pmkim/cart?pgNum=${ num }">${ num } &nbsp;</a>
								</c:forEach>
								
								<c:if test="${ nextData }">
									<a href = "/pmkim/cart?pgNum=${ pgNum + 1 }"> &gt; &nbsp;</a>
								</c:if>
								
								<c:if test = "${ pgNum != end }">
								<a href ="/pmkim/cart?pgNum=${ end }"> &raquo; </a>
							</c:if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
				<!-- 여기에 장바구니 들어옴!! -->
					<div class="product-categori">
						
						<div class="filter-sidebar-left">
							<div class="title-left">
								<h3>장바구니</h3>
							</div>
							<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
								<c:forEach var="cvo" items="<%= cartList %>">
									<c:if test = "${cvo.id ==null}">
									"로그인이 필요한 서비스입니다."
									</c:if>
									<div class="list-group-collapse sub-men">
										<a class="list-group-item list-group-item-action"
											href="#sub-men1" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men1">
											${cvo.good_name} 
											<small class="text-muted">(100)</small>
										</a>
										
									</div>
								</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Shop Page -->

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
                     <a><img src="/pmkim/resources/images/haley2.png" class="profile"  alt="" /></a>
                  <h2>Haley Oh</h2>
                  <a href="https://github.com/JihyeHaley"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a> 
                  </div>

                  <!-- Footer 2-->
                  <div class="col-lg-422 mb-5 mb-lg-0">
                     <a><img src="/pmkim/resources/images/seho2.png" class="profile"   alt="" /></a>
                  <h2>Seho Oh </h2>
                  <a href="https://github.com/sehooh5"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a> 
                  </div>

                  <!-- Footer 3-->
                  <div class="col-lg-422 mb-5 mb-lg-0">
                     <a><img src="/pmkim/resources/images/linda2.png" class="profile" alt="" /></a>
                     <h2>Linda Eom </h2>
                     <a href="https://github.com/GyuyoungEom"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
                  </div>

                  <!-- Footer 4-->
                  <div class="col-lg-422 mb-5 mb-lg-0">
                     <a><img src="/pmkim/resources/images/oliver2.png" class="profile"  /></a>
                     <h2>Oliver Yoo </h2>
                     <a href="https://github.com/SeongjinOliver"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
                  </div>
               </div>
            </div>


            <div class="row">
               <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="footer-widget">
                     <h4>About 편마 김편복</h4>
                     <p>편의점 마스터! 김편복  데이터, 위치기반을 활용한 편의점 상품 추천 서비스</p>
                     <p>편의점에서 점심을 간단히 먹고 싶은 김편복씨는 자신의 위치에서 먹고자하는  상품 어느 편의점에서 행사를 하는지 알고 싶은데 알 수 있는 방법이 없다!! 이럴때 필요한 서비스는 "<b>편마 김편복</b>"</p>
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
                              <i class="fas fa-map-marker-alt"></i>
                              		주소: 서울특별시 강남구 테헤란로 212 <br>(역삼동 718-5번지)<br> (우) 06220
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
			All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By
			: <a href="https://html.design/">html design</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="/pmkim/resources/js/jquery-3.2.1.min.js"></script>
	<script src="/pmkim/resources/js/popper.min.js"></script>
	<script src="/pmkim/resources/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="/pmkim/resources/js/jquery.superslides.min.js"></script>
	<script src="/pmkim/resources/js/bootstrap-select.js"></script>
	<script src="/pmkim/resources/js/inewsticker.js"></script>
	<script src="/pmkim/resources/js/bootsnav.js"></script>
	<script src="/pmkim/resources/js/images-loded.min.js"></script>
	<script src="/pmkim/resources/js/isotope.min.js"></script>
	<script src="/pmkim/resources/js/owl.carousel.min.js"></script>
	<script src="/pmkim/resources/js/baguetteBox.min.js"></script>
	<script src="/pmkim/resources/js/jquery-ui.js"></script>
	<script src="/pmkim/resources/js/jquery.nicescroll.min.js"></script>
	<script src="/pmkim/resources/js/form-validator.min.js"></script>
	<script src="/pmkim/resources/js/contact-form-script.js"></script>
	<script src="/pmkim/resources/js/custom.js"></script>
</body>

</html>