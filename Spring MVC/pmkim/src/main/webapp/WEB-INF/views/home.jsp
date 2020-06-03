<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%   
		    //List<GoodsEventShopMemberVO> onelist = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("onelist");
			//List<GoodsEventShopMemberVO> twolist = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("twolist");
			//List<GoodsEventShopMemberVO> pblist = (ArrayList<GoodsEventShopMemberVO>) request.getAttribute("pblist");
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
		              <input type="text" class="form-control" name="id" placeholder="Your id...">
		            </div>
		            <div class="form-group">
		              <input type="password" class="form-control" name="pw" placeholder="Your password...">
		            </div>
		            <button type="submit" class="btn btn-info btn-block btn-round" id="btnLogin" style="background-color:#0F694D">Login</button> <!-- '/weet/signinCheck.do' -->
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




<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
