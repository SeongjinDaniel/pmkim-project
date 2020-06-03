<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>문의내역</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="icon" type="image/png" sizes="16x16" href="/pmkim/resources/images/favicon-16x16.png">
    <link rel="apple-touch-icon" href="/pmkim/resources/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/pmkim/resources/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="/pmkim/resources/css/style_ask.css">
    <link rel="stylesheet" href="/pmkim/resources/css/style_nav.css">
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
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

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

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Contact Us</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active"> Contact Us </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Contact Us  -->
    <div class="contact-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-form-right">
                        <h2>직접 문의하기</h2>
                        <p>직접 문의하기를 통해 문의사항을 남겨주세요.</p>
                        <p>질문이나 상담을 원하시면 전화 또는 메일로 문의 부탁 드립니다.</p>
                        <form id="contactForm">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="이름" required data-error="Please enter your name">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" placeholder="고객님의 이메일을 입력하세요.." id="email" class="form-control" name="name" required data-error="Please enter your email">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="subject" name="name" placeholder="주제" required data-error="Please enter your Subject">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea class="form-control" id="message" placeholder="문의 사항을 남겨보세요" rows="4" data-error="Write your message" required></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="submit-button text-center">
                                        <button class="btn hvr-hover" id="submit" type="submit">Send Message</button>
                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
				<div class="col-lg-4 col-sm-12">
                    <div class="contact-info-left">
                        <h2>연락 정보</h2>
                        <p>문의 사항에 대해서 최대한 성실하게 답해 드리겠습니다. 고객님의 궁금증이 해결되게 최대한 노력하겠습니다. 감사합니다.</p>
                        <ul>
                            <li>
                                <p><i class="fas fa-map-marker-alt"></i>주소: <br>서울 강남구 테헤란로212<br> </p>
                            </li>
                            <li>
                                <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+82-1085083026">+82-1085083026</a></p>
                            </li>
                            <li>
                                <p><i class="fas fa-envelope"></i>Email: <a href="mailto:yoosngj@gmail.com">yoosngj@gmail.com</a></p>
                            </li>
                        </ul>
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
         <div class="container3">
            <div class="row">
               <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="footer-top-box">
                     <h3>챗봇(Coming Soon)</h3>
                  </div>
               </div>
            </div>
            <br><br>
            <div class="row">
               <div class="col-lg-4 col-md-12 col-sm-12">
                  <div class="footer-top-box">
                     <h3>We are One ; 곰돌이 감자 </h3>
                  </div>
               </div>
            </div>

            <div class="container text-centers">
               <div class="row">
                  <!-- Footer 1-->
                  <div class="col-lg-422 mb-5 mb-lg-0">
                     <a><img src="/pmkim/resources/images/haley.png" class="profile"  alt="" /></a><br>
                     <a href="https://github.com/JihyeHaley"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
                     <a class="result-text">Haley Oh</a><br>
                     <a class="result-text">You know? I'm 팀장4;)</a><br>
                  <a class= "profile-text">has kinda professional language skills English, Chinese, Japanese. Currently working and studying for full-stack developing skills</a>
                  
                  </div>

                  <!-- Footer 2-->
                  <div class="col-lg-422 mb-5 mb-lg-0">
                     <a><img src="/pmkim/resources/images/seho.png" class="profile"   alt="" /></a><br>
                     <a href="https://github.com/sehooh5"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
                     <a class="result-text">Seho Oh </a><br>
                     <a class="result-text">You know? I'm 팀장1;)</a><br>
                     <a class= "profile-text">is one of the treasurous in gomgam since he has professional analysis skills based on R selenium. His main major was Design. Amazing!</a>
                  
                  </div>

                  <!-- Footer 3-->
                  <div class="col-lg-422 mb-5 mb-lg-0">
                     <a><img src="/pmkim/resources/images/linda.png" class="profile" alt="" /></a><br>
                     <a href="https://github.com/GyuyoungEom"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
                     <a class="result-text">Linda Eom </a><br>
                     <a class="result-text">You know? I'm 팀장3;)</a><br>
                     <a class= "profile-text">without her, this work could not be achieved... haha He is superwomen among us. Her diction is based on Austrailia, and she is familiar at super power on everything..!!!! </a>
                  </div>

                  <!-- Footer 4-->
                  <div class="col-lg-422 mb-5 mb-lg-0">
                     <a><img src="/pmkim/resources/images/oliver.png" class="profile"  /></a><br>
                     <a href="https://github.com/SeongjinOliver"><img src="/pmkim/resources/images/gitprof.png" class="git_img"/></a>
                     <a class="result-text">Oliver Yoo </a><br>
                     <a class="result-text">You know? I'm 팀장1;)</a><br>
                     <a class= "profile-text">is amazing man because he is familiar with back-frond end, DB, Spring, and Java, C... Cannot count all LOL. Surprise thing is he is even studying himself at every night despite project season :)</a>
                     
                     
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
                     <ul class="result-text">
                        <li><a href="#/pmkim/home" >HOME</a></li>
                        <li><a href="#/pmkim/map">지도</a></li>
                        <li><a href="#/pmkim/theme">테마</a></li>
                        <li><a href="#/pmkim/event">행사</a></li>
                        <li><a href="#/pmkim/cart">장바구니</a></li>
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
         All Rights Jihye Oh. &copy; 2020 <a href="#">PM, KIM</a> Design By GomGam
      </p>
   </div>
   <!-- End copyright  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>