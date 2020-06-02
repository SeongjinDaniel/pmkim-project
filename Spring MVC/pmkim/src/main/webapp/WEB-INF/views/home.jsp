<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import = "vo.GoodsEventShopMemberVO,java.util.List,java.util.ArrayList"
%>
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
    <title>편마, 김편복</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="icon" type="image/png" sizes="16x16" href="/pmkim/resources/images/favicon-16x16.png">
    <link rel="apple-touch-icon" href="/pmkim/resources/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/pmkim/resources/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="/pmkim/resources/css/style.css">
    <link rel="stylesheet" href="/pmkim/resources/css/style_nav.css">
    <link rel="stylesheet" href="/pmkim/resources/css/footerus.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/pmkim/resources/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/pmkim/resources/css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<%   
		    //List<GoodsEventShopMemberVO> onelist = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("onelist");
			//List<GoodsEventShopMemberVO> twolist = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("twolist");
			//List<GoodsEventShopMemberVO> pblist = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("pblist");
%>
	<c:set var="sessionMemberName" value="${ sessionScope.name }"/>
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
							<c:when test="${msg eq 'success' || !empty sessionMemberName}">
								<a href="/weet/upload.do" style="margin-top:45px;margin-right:30px;">Upload</a>
								
								<a style="margin-top:45px;text-decoration: none;"> ${sessionMemberName}님&nbsp;
											<img src="/pmkim/resources/images/star.png" style="width:16px;">&nbsp;:&nbsp;1</a>
								
								<a href="/pmkim/logout"><button type="button">Logout</button></a>
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
    
    <!-- Start login popup -->
    <div class="container">
		<!-- <button type="button" class="btn btn-info btn-round" data-toggle="modal" data-target="#loginModal">
		    Login
		</button>   -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			
		  <div class="modal-dialog modal-dialog-centered" role="document" >
		    <div class="modal-content" >
		      <div class="modal-header border-bottom-0">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body border-bottom-0">
		      	<div class="form-title text-center"><!--  style="margin-left:auto; margin-right:auto;" -->
					<img src="/pmkim/resources/images/pmkim_Logo_1.jpg" /> 	
				</div>
				<br>
				
		        <div class="form-title text-center">
		          <h4><b>Login</b></h4>
		        </div>
		        <div class="d-flex flex-column text-center">
		        
		          <form method="post" action="/pmkim/login" id="frmSignin">
		            <div class="form-group">
		              <input type="text" class="form-control" name="customer_id" placeholder="Your id...">
		            </div>
		            <div class="form-group">
		              <input type="password" class="form-control" name="customer_pwd" placeholder="Your password...">
		            </div>
		            <button type="submit" class="btn btn-info btn-block btn-round" id="btnLogin">Login</button> <!-- '/weet/signinCheck.do' -->
		          </form>
		          
		          <!-- <div class="text-center text-muted delimiter">or use a social network</div> -->
		          <div class="d-flex justify-content-center social-buttons">
		            <!-- <button type="button" id="btnGoogleSignin" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Google"
		           		onclick="
		           			gauth.signIn().then(function(){
								console.log('gauth.signIn()');
								checkLoginStatus();
								location.reload(true);
							});
						" data-dismiss="modal">
		          		<img src="/pmkim/resources/images/btn_google_light_normal_ios.svg">
		          	</button> -->
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer d-flex justify-content-center ">
			        <div class="signup-section text-center">Not a member yet? 
			        	<a href="/pmkim/signup">Sign Up</a>.
			        </div>
			        <button type="button" class="btn btn-default text-center" data-dismiss="modal">Close</button>
			        <!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#signupModal">Open Modal</button> -->
		      </div>
		    </div>
		      
		  </div>
		</div>
		
	</div>
		<!-- End login popup -->
    

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="/pmkim/resources/images/banner-01.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/pmkim/resources/images/banner-02.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/pmkim/resources/images/banner-03.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Freshshop</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->

    <!-- Start Categories  -->
    <div class="categories-shop">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/pmkim/resources/images/categories_img_01.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/pmkim/resources/images/categories_img_02.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/pmkim/resources/images/categories_img_03.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Lorem ipsum dolor</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Categories -->
	
	<div class="box-add-products">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12">
					<div class="offer-box-products">
						<img class="img-fluid" src="/pmkim/resources/images/add-img-01.jpg" alt="" />
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12">
					<div class="offer-box-products">
						<img class="img-fluid" src="/pmkim/resources/images/add-img-02.jpg" alt="" />
					</div>
				</div>
			</div>
		</div>
	</div>




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

	<!-- product!!!!!!!!!!!!! --!>

    <!-- Start Blog  -->
    <div class="latest-blog">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>latest blog</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <div class="blog-img">
                            <img class="img-fluid" src="/pmkim/resources/images/blog-img.jpg" alt="" />
                        </div>
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3>Fusce in augue non nisi fringilla</h3>
                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                            </div>
                            <ul class="option-blog">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <div class="blog-img">
                            <img class="img-fluid" src="/pmkim/resources/images/blog-img-01.jpg" alt="" />
                        </div>
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3>Fusce in augue non nisi fringilla</h3>
                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                            </div>
                            <ul class="option-blog">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <div class="blog-img">
                            <img class="img-fluid" src="/pmkim/resources/images/blog-img-02.jpg" alt="" />
                        </div>
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3>Fusce in augue non nisi fringilla</h3>
                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                            </div>
                            <ul class="option-blog">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog  -->

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
    <script src="/pmkim/resources/js/form-validator.min.js"></script>
    <script src="/pmkim/resources/js/contact-form-script.js"></script>
    <script src="/pmkim/resources/js/custom.js"></script>
</body>

</html>