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
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <style>
        .menu {
            font-size: 20px;
        }

        #big-head, #cart-img {
            width: 20px;
            height: 20px;
        }
    </style>
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
                    <li><a href="${contextRoot}/">Home</a></li>
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
                    <li class="active"><a href="${contextRoot}/contact">Contact</a></li>
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
    <li class="breadcrumb-item active">聯絡我們</li>
</ol>
<!--當前位址提示 -->
<!-- 聯絡我主區塊 -->
<section class="ab-info-main py-5">
    <div class="container py-3">
        <h3 class="tittle text-center"><span class="sub-tittle">Find Us</span> Contact Us</h3>
        <div class="row contact-main-info mt-5">
            <div class="col-md-6 contact-right-content">
                <form action="MailTo:kung1739@gmail.com" method="post" Enctype="Text/Plain">
                    <input type="text" name="Name" placeholder="Name" required="required">
                    <input type="email" class="email" name="Email" placeholder="Email" required="required">
                    <input type="text" name="Phone no" placeholder="Phone" required="required">
                    <textarea name="Message" placeholder="Message" required="required"></textarea>
                    <div class="read mt-3">
                        <input type="submit" value="Submit">
                    </div>
                </form>
            </div>
            <div class="col-md-6 contact-left-content">
                <div class="address-con">
                    <h4 class="mb-2"> Phone</h4>
                    <p>+886 098 8907 998</p>
                    <p>+886 098 8907 998</p>
                </div>
                <div class="address-con my-4">
                    <h4 class="mb-2"> Email </h4>
                    <p>AJen@sport.com</p>
                </div>
                <div class="address-con mb-4">
                    <h4 class="mb-2"> Fax</h4>

                    <p>(02) 2223-0088</p>
                </div>
                <div class="address-con">
                    <h4 class="mb-2"> Location </h4>

                    <p>Taiwan, Taipei City</p>
                </div>

            </div>

        </div>
        <div class="map-fo mt-lg-5 mt-4">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.0045591582802!2d121.5412233140526!3d25.033919344450794!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!2z6LOH5bGV5ZyL6Zqb6IKh5Lu95pyJ6ZmQ5YWs5Y-4!5e0!3m2!1szh-TW!2stw!4v1647271457510!5m2!1szh-TW!2stw"
                    allowfullscreen></iframe>
        </div>
    </div>
</section>

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
<script>
    function validatelogin() {
        var account = document.getElementById("accountL");
        let acspstr = document.getElementById("acsp");
        let x = account.value;
        if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(x) && /^[^\s]*$/.test(x)) {
        } else {
            acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">無效用戶名`;
            return false;
        }
    }

    function validateAdmin() {
        var account = document.getElementById("accountA");
        let acspstr = document.getElementById("adsp");
        let x = account.value;
        if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(x) && /^[^\s]*$/.test(x)) {
        } else {
            acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">無效用戶名`;
            return false;
        }
    }

    function checkAC() {
        var account = document.getElementById("accountR");
        let accountstr = account.value;
        let acspstr = document.getElementById("acr");
        if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(accountstr) && /^[^\s]*$/.test(accountstr)) {
            acspstr.innerHTML = ``;
        } else {
            acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入至少有一個英數字，八碼以上帳號`;
        }
    }

    function checkPW() {
        var pwd = document.getElementById("pwd");
        let pwdstr = pwd.value;
        let pwspstr = document.getElementById("pwsp");
        if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(pwdstr)) {
            pwspstr.innerHTML = ``;
        } else {
            pwspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入至少一個英文數字特殊字元，八碼以上密碼。`;
        }
    }

    function checkPWR() {
        var pwd = document.getElementById("pwd");
        var pwdcheck = document.getElementById("pwdcheck");
        let pwdstr = pwd.value;
        let pwdckstr = pwdcheck.value;
        let pwcspstr = document.getElementById("pwck");
        if (pwdstr === pwdckstr) {
            pwcspstr.innerHTML = ``;
        } else {
            pwcspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">密碼不符。`;
        }
    }

    function checkNM() {
        var name = document.getElementById("aname");
        let nmstr = name.value;
        let nmspstr = document.getElementById("nmsp");
        if (/^[\u4e00-\u9fa5]{2,}$/.test(nmstr)) {
            nmspstr.innerHTML = ``;
        } else {
            nmspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入兩個字以上的中文字`;
        }
    }

    function checkMail() {
        var mail = document.getElementById("mail");
        let mailstr = mail.value;
        let mailpstr = document.getElementById("mailsp");
        var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (pattern.test(mailstr)) {
            mailpstr.innerHTML = ``;
        } else {
            mailpstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入合法郵件`;
        }
    }

    function validateRegister() {
        var account = document.getElementById("accountR");
        let accountstr = account.value;
        var pwd = document.getElementById("pwd");
        var pwdcheck = document.getElementById("pwdcheck");
        let pwdstr = pwd.value;
        let pwdckstr = pwdcheck.value;
        var name = document.getElementById("aname");
        let nmstr = name.value;
        var mail = document.getElementById("mail");
        let mailstr = mail.value;
        var patternA1 = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
        var patternA2 = /^[^\s]*$/;
        var patternP = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
        var patternN = /^[\u4e00-\u9fa5]{2,}$/;
        var patternM = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        let rsp = document.getElementById("rsp");
        if (patternA1.test(accountstr) &&
            patternA2.test(accountstr) &&
            patternP.test(pwdstr) &&
            patternN.test(nmstr) &&
            patternM.test(mailstr) &&
            pwdstr === pwdckstr) {
        } else {
            rsp.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">註冊資訊有誤，請檢察。`;
            return false;
        }
    }
</script>
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
</body>
</html>