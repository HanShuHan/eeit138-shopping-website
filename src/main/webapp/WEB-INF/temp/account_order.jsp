<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contact Page</title>
    <!-- Style-CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css" type="text/css" media="all"/>
    <!-- font-awesome-icons -->
    <link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900"
          rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="${contextRoot}/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
    <link rel="stylesheet" href="${contextRoot}/css/loginPage.css"/>
    <script src="${contextRoot}/js/loginPage.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
        .invoice {
            background: #fff;
            padding: 20px
        }

        .invoice-company {
            font-size: 20px
        }

        .invoice-header {
            margin: 0 -20px;
            background: #f0f3f4;
            padding: 20px
        }

        .invoice-date,
        .invoice-from,
        .invoice-to {
            display: table-cell;
            width: 1%
        }

        .invoice-from,
        .invoice-to {
            padding-right: 20px
        }

        .invoice-date .date,
        .invoice-from strong,
        .invoice-to strong {
            font-size: 16px;
            font-weight: 600
        }

        .invoice-date {
            text-align: right;
            padding-left: 20px
        }

        .invoice-price {
            background: #f0f3f4;
            display: table;
            width: 100%
        }

        .invoice-price .invoice-price-left,
        .invoice-price .invoice-price-right {
            display: table-cell;
            padding: 20px;
            font-size: 20px;
            font-weight: 600;
            width: 75%;
            position: relative;
            vertical-align: middle
        }

        .invoice-price .invoice-price-left .sub-price {
            display: table-cell;
            vertical-align: middle;
            padding: 0 20px
        }

        .invoice-price small {
            font-size: 12px;
            font-weight: 400;
            display: block
        }

        .invoice-price .invoice-price-row {
            display: table;
            float: left
        }

        .invoice-price .invoice-price-right {
            width: 25%;
            background: #2d353c;
            color: #fff;
            font-size: 28px;
            text-align: right;
            vertical-align: bottom;
            font-weight: 300
        }

        .invoice-price .invoice-price-right small {
            display: block;
            opacity: .6;
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 12px
        }

        .invoice-footer {
            border-top: 1px solid #ddd;
            padding-top: 10px;
            font-size: 10px
        }

        .invoice-note {
            color: #999;
            margin-top: 80px;
            font-size: 85%
        }

        .invoice > div:not(.invoice-footer) {
            margin-bottom: 20px
        }

        .btn.btn-white, .btn.btn-white.disabled, .btn.btn-white.disabled:focus, .btn.btn-white.disabled:hover, .btn.btn-white[disabled], .btn.btn-white[disabled]:focus, .btn.btn-white[disabled]:hover {
            color: #2d353c;
            background: #fff;
            border-color: #d9dfe3;
        }

        .menu {
            font-size: 20px;
        }

        #big-head, #cart-img {
            width: 20px;
            height: 20px;
        }

    </style>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- jQuery -->
    <script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${contextRoot}/js/adminlte.min.js"></script>
    <script src="${contextRoot}/js/shop.js"></script>
    <script src="${contextRoot}/js/cart-pages/myCart.js"></script>

</head>
<body>
<!-- 置頂區塊 -->
<div class="main-banner inner" id="home">
    <!-- 上標 -->
    <header class="header">
        <div class="container-fluid px-lg-5">
            <!-- 導航 -->
            <nav class="py-4">
                <div id="logo">
                    <h1><a href="${contextRoot}/">A-Jen Sport</a></h1>
                </div>
                <label for="drop" class="toggle">Menu</label>
                <input type="checkbox" id="drop"/>
                <ul class="menu mt-2">
                    <li class="active"><a href="${contextRoot}/">Home</a></li>
                    <li><a href="${contextRoot}/about">About</a></li>
                    <li><a href="${contextRoot}/blog">Blog</a></li>
                    <li><a href="${contextRoot}/shop">Products</a>
                        <label for="drop-2" class="toggle">Products</label>
                        <input type="checkbox" id="drop-2"/>
                        <ul>
                            <li><a href="${contextRoot}/shop">All</a></li>
                            <c:forEach var="category" items="${categoriesList}" varStatus="status">
                                <li>
                                    <a href="${contextRoot}/shop?type${status.count}=${category.type}">
                                        <c:out value="${category.type}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li><a href="${contextRoot}/contact">Contact</a></li>
                    <li>
                        <c:choose>
                            <c:when test="${sessionScope.accountId == null}">
                                <a href="${contextRoot}/register"> Register/Login </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${contextRoot}/account?id=${sessionScope.accountId}">
                                    <img id="cart-img" src="${contextRoot}/css/images/member.png"
                                         width="9"
                                         data-user_id="${sessionScope.accountId}"
                                         data-web_url="${pageContext.request.contextPath}">
                                    <span><c:out value="${sessionScope.ac}"/></span>
                                </a>
                                <a href="${contextRoot}/logout"><span>|LogOut</span></a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li>
                        <c:choose>
                            <c:when test="${sessionScope.accountId == null}">
                                <a href="${contextRoot}/register">
                                    <img id="cart-img" src="${contextRoot}/css/images/cart2.svg">
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/myCartList/accountId/${sessionScope.accountId}'/>">
                                    <img id="cart-img" src="${contextRoot}/css/images/cart2.svg"
                                         data-user_id="${sessionScope.accountId}">
                                </a>
                                <span id="show-number-in-cart" style="color: yellow;">
										<c:if test="${sessionScope.numberInCart > 0}">
                                            <b><c:out value="${sessionScope.numberInCart}"/></b>
                                        </c:if>
									</span>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </nav>
            <!-- //導航 -->
        </div>
    </header>
    <!-- //上標 -->

</div>
<!--//置頂區塊-->
<!--當前位址提示-->
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="${contextRoot}/">Home</a>
    </li>
    <li class="breadcrumb-item active">訂單管理</li>
</ol>
<!--當前位址提示 -->
<!-- 主區塊 -->
<section class="ab-info-main py-md-5 py-4">
    <div class="container">
        <div class="col-md-12">
            <div class="invoice">
                <!-- begin invoice-company -->
                <div class="invoice-company text-inverse f-w-600">
                    訂單管理
                </div>
                <!-- end invoice-company -->
                <!-- begin invoice-header -->
                <div class="invoice-header">
                    <div class="invoice-from">
                        <small>會員資訊</small>
                        <address class="m-t-5 m-b-5">
                            <strong class="text-inverse"><c:out value="${account.ac}"></c:out></strong><br>
                            <c:out value="${account.aname}"></c:out><br>
                        </address>
                    </div>
                </div>
                <!-- end invoice-header -->
                <!-- begin invoice-content -->
                <div class="invoice-content">
                    <!-- begin table-responsive -->
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <c:forEach items="${OrderBeans}" var="OrderBean" varStatus="s">
                                <thead>
                                <tr>
                                    <th>訂單序號</th>
                                    <th class="text-center" width="10%">訂單價格</th>
                                    <th class="text-center" width="10%">付款狀態</th>
                                    <th class="text-right" width="20%">貨運狀態</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <span class="text-inverse">${OrderBean.merchantTradeNo}</span><br>
                                        <small><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
                                                               value="${OrderBean.merchantTradeDate}"></fmt:formatDate></small>
                                    <td class="text-center">${OrderBean.totalAmount}</td>
                                    <td class="text-center">${OrderBean.tradeDesc}</td>
                                    <td class="text-right">${OrderBean.rtnMsgL}</td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <!-- end table-responsive -->
                    <!-- begin invoice-price -->
                    <!-- end invoice-price -->

                </div>
                <!-- end invoice-content -->
                <!-- begin invoice-note -->
                <div class="invoice-note">
                    <a href="${contextRoot}/account?id=${sessionScope.accountId}">
                        <button type="button" class="btn btn-primary">回前頁</button>
                    </a>
                </div>
                <!-- end invoice-note -->
                <!-- begin invoice-footer -->
                <div class="invoice-footer">
                    <p class="text-center m-b-5 f-w-600">
                        Thank you for your purchase
                    </p>
                    <p class="text-center">
                        <span class="m-r-10"><i class="fa fa-fw fa-lg fa-globe"></i> lochalhost:8080/A-Jen/index</span>
                        <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone-volume"></i> T:02-6631-6666</span>
                        <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i> eeit38@gmail.com</span>
                    </p>
                </div>
                <!-- end invoice-footer -->
            </div>
        </div>
    </div>
</section>
<!-- //contact -->
<!-- 聯絡我主區塊 -->
<!-- 標底 -->
<footer>
    <div class="container">
        <div class="row footer-top">
            <div class="col-lg-4 footer-grid_section_w3layouts">
                <p class="col-md-10">© 2022 A-Jen Sport. All rights reserved | Design by
                    <a href="https://www.ispan.com.tw/longterm/JJEEITT">資展國際 EEIT138.</a>
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- //標底 -->
</body>
</html>