<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BeautyBeast</title>
    <!-- css引用 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset5/css/shop-orderhistory-style.css">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- font -->
    <!-- English -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <!-- Chinese -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
</head>

<body>
    <!-- navbar -->
    <nav class="navbar navbar-expand-xl nav-bg">
        <div class="container-fluid" id="navbar">
            <!-- RWD button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- logo -->
            <a class="nav-title" href="<c:url value='/shop'/>">B&B</a>
            <!-- navbar context -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto">
                    <a class="nav-hover-container" href="<c:url value='/shop/class/1'/>">
                        <li class="nav-hover-text">有氧器材</li>
                    </a>
                    <a class="nav-hover-container" href="<c:url value='/shop/class/2'/>">
                        <li class="nav-hover-text">重訓器材</li>
                    </a>
                    <a class="nav-hover-container" href="<c:url value='/shop/class/3'/>">
                        <li class="nav-hover-text">營養補充品</li>
                    </a>
                    <a class="nav-hover-container" href="<c:url value='/shop/class/4'/>">
                        <li class="nav-hover-text">運動服飾</li>
                    </a>
                    <a class="nav-hover-container" href="<c:url value='/shop/orderhistory'/>">
                        <li class="nav-hover-text">我的訂單</li>
                    </a>
                    <!-- cart icon -->
                    <a href="<c:url value='/shop/cart'/>" id="nav-cart-hover-container">
                        <li class="position-relative" id="nav-cart-hover-text" >
                            <i class="fa-solid fa-cart-shopping"></i>
                            <!-- cart hover -->
                            <div class="position-absolute top-100 start-50" id="nav-cart">
                                <!-- cart hover title -->
                                <div class="row nav-cart-title my-2">
                                    <div class="col-5">
                                        <p>商品</p>
                                    </div>
                                    <div class="col-3">
                                        <p>規格</p>
                                    </div>
                                    <div class="col-4 row">
                                        <div class="col-4">
                                            <p>單價</p>
                                        </div>
                                        <div class="col-4">
                                            <p>數量</p>
                                        </div>
                                        <div class="col-4">
                                            <p>總計</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- cart hover context -->
                                <c:forEach var="carts" items="${carts}">
	                            	<div class="row my-2 w-100 mx-0 nav-cart-context">
	                                    <div class="col-5 clearfix nav-cart-height">
	                                        <img src="data:image/png;base64,${carts.products.image_base64}" alt=""
	                                            class="float-start nav-cart-img me-1">
	                                        <p>${carts.products.product_name}</p>
	                                    </div>
	                                    <div class="col-3 nav-cart-height">
	                                        <p>${carts.productSpecifications.spec_name}</p>
	                                    </div>
	                                    <div class="col-4 row nav-cart-height">
	                                        <div class="col-4 cart-text-center">
	                                            <p class="cart-order-price">$${carts.products.price}</p>
	                                        </div>
	                                        <div class="col-4 cart-text-center">
	                                            <p class="cart-order-count">${carts.cart_quantity}</p>
	                                        </div>
	                                        <div class="col-4 cart-text-center">
	                                            <p class="cart-order-sum"></p>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                                <!-- cart hover button -->
                                <div class="d-flex flex-row-reverse" id="nav-cart-button">
                                    <button class="nav-cart-button">查看我的購物車</button>
                                </div>
                            </div>
                        </li>
                    </a>
                    <!-- logout button -->
                    <a class="nav-hover-container" href="/logout">
                        <li class="nav-log nav-hover-text">LOG OUT</li>
                    </a>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid w-75 my-5">
        <!-- order history title -->
        <div class="row oh-title-font mx-0">
            <div class="col-lg-3">
                <p>訂單編號</p>
            </div>
            <div class="col-lg-3">
                <p>訂單金額</p>
            </div>
            <div class="col-lg-3">
                <p>訂購時間</p>
            </div>
            <div class="col-lg-3">
                <p>訂單狀態</p>
            </div>
        </div>
        <hr>
        <!-- order history accordion -->
	    <c:forEach var="orders" items="${orders}" varStatus="ordersLoop">
	        <div class="accordion my-1">
	            <div class="accordiontitle">
	                <div class="row mx-0">
	                    <div class="col-lg-3">
	                        <p class="order_newid"></p>
	                    </div>
	                    <div class="col-lg-3">
	                        <p class="order-total-title"></p>
	                    </div>
	                    <div class="col-lg-3">
	                        <p class="order_date">${orders.order_date}</p>
	                    </div>
	                    <div class="col-lg-3">
	                        <p>${orders.status}</p>
	                    </div>
	                </div>
	            </div>
	            <div class="accordioncontext">
	                <div>
	                    <hr>
	                    <div class="row accordioncontext-title w-100 mx-0">
	                        <div class="col-lg-4">
	                            <p>商品</p>
	                        </div>
	                        <div class="col-lg-8 row">
	                            <div class="col-md-3">
	                                <p>單價</p>
	                            </div>
	                            <div class="col-md-6">
	                                <p>數量</p>
	                            </div>
	                            <div class="col-md-3">
	                                <p>總計</p>
	                            </div>
	                        </div>
	                    </div>
	                    <c:set var="orderTotal" value="0" />
	                    <c:forEach var="orderDetails" items="${orderDetailsWithAllOrders[orders.order_id]}" varStatus="orderDetailsLoop">
		                    <div class="row my-2 w-100 mx-0 accordioncontext-context">
		                        <div class="col-lg-4 cart-height row">
					                <div class="col-4">
					                	<img src="data:image/png;base64,${orderDetails.products.image_base64}" alt="" class="float-start cart-img me-5">
					                </div>
					                <div class="col-8">
					                	<p class="product-name" id="${orderDetails.products.product_id}">${orderDetails.products.product_name}</p>
					                </div>
					            </div>
		                        <div class="col-lg-8 row accordioncontext-height">
		                            <div class="col-md-3 cart-text-center">
		                                <p class="order-price">$${orderDetails.products.price}</p>
		                            </div>
		                            <div class="col-md-6 cart-text-center">
		                                <p class="order-count">${orderDetails.quantity}</p>
		                            </div>
		                            <div class="col-md-3 cart-text-center">
		                                <p class="order-sum">$${orderDetails.products.price * orderDetails.quantity}</p>
		                            </div>
		                        </div>
		                    </div>
		                    <c:set var="orderTotal" value="${orderTotal + orderDetails.products.price * orderDetails.quantity}" />
	                    </c:forEach>
	                    <hr>
	                </div>
	                <div class="row my-2 pe-4 w-100">
	                    <div class="m-3 accordioncontext-context">
	                        <div class="clearfix">
	                            <p class="float-start">小計:</p>
	                            <p class="float-end order-producttotal">$${orderTotal}</p>
	                        </div>
	                        <div class="clearfix">
	                            <p class="float-start">運費:</p>
	                            <p class="float-end order-send">$60</p>
	                        </div>
	                        <hr>
	                        <div class="clearfix">
	                            <p class="float-start">合計:</p>
	                            <p class="float-end order-total">$${orderTotal + 60}</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </c:forEach>
    </div>
    <!-- footer -->
    <footer>
        <div class="container-fluid w-50 footer-bg">
            <div class="row ms-5 pt-5">
                <div class="col-md-4">
                    <p class="footer-font-title">BeautyBeast</p>
                    <ul class="footer-context">
                        <li><a href="../about.html">關於我們</a> </li>
                        <li><a href="/dashboard-elf/elves.html">健康精靈</a> </li>
                        <li><a href="/dashboard-myplan/index.html">健身目標</a> </li>
                        <li><a href="shop-index.html">健康好物</a></li>
                        <li><a href="../contact.html">聯絡我們</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-lg-6"><a href="#facebook"><i
                                    class="fa-brands fa-facebook-f footer-icon m-3"></i></a></div>
                        <div class="col-lg-6"><a href="#linkedin"><i
                                    class="fa-brands fa-linkedin-in footer-icon m-3"></i></a></div>
                        <div class="col-lg-6"><a href="#twitter"><i
                                    class="fa-brands fa-twitter footer-icon m-3"></i></a></div>
                        <div class="col-lg-6"><a href="#twitter"><i
                                    class="fa-brands fa-instagram footer-icon m-3"></i></a></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <img src="/asset5/img/index/B&B_logo.png" alt="" class="footer-logo">
                </div>
                <div class="col-md-12">
                    <p class="footer-font-company">Copyright © 2024 BeautyBeast Website. All rights reserved. </p>
                </div>
            </div>
        </div>
    </footer>
    <!-- javascript引用 -->
    <script src="${pageContext.request.contextPath}/asset5/js/shop-orderhistory-script.js"></script>
    <script>
    	for(i = 0; i < $(".order_newid").length; i++){
    		orderdateFormate = $(".order_date")[i].textContent.replace(/[-:\s]/g, '');
	    	$(".order_newid")[i].textContent = "BB"+ orderdateFormate + ${user_id};		
    	}
    	
    	ot = $(".order-total");
    	ott = $(".order-total-title");
    	for (let x = 0; x < ott.length; x++) {
    		ott[x].textContent = ot[x].textContent;
    	}

    	
    </script>
</body>

</html>