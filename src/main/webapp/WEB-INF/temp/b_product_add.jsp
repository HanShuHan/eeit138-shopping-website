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
    <title>Home Page</title>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="${contextRoot}/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css"
          href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8"
            src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
    <!-- jQuery -->
    <script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${contextRoot}/js/adminlte.min.js"></script>
    <link rel="stylesheet" href="${contextRoot}/css/addProduct.css"/>
    <script src="${contextRoot}/js/addProduct.js"></script>
</head>
<body>
<div class="wrapper">
    <!-- 上方導航欄 -->
    <nav
            class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item d-none d-sm-inline-block"><a
                    href="${contextRoot}/index_b" class="nav-link">首頁</a></li>
            <li class="nav-item d-none d-sm-inline-block"><a href="#"
                                                             class="nav-link">聯絡開發人員</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link"
                                    data-widget="fullscreen" href="#" role="button">切換全螢幕</a></li>
        </ul>
    </nav>
    <!-- 結束 -->

    <!-- 左側導航欄 -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- 商標LOGO -->
        <a href="${contextRoot}/index_b" class="brand-link"> <span
                class="brand-text font-weight-light">A-Jen Sport</span> <span
                class="brand-text font-weight-light">商店管理平台</span>
        </a>

        <!-- 導航欄 -->
        <div class="sidebar">
            <!-- 使用者顯示 -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src='<c:url value="/showImage/${sessionScope.adminId}"/>' class="img-circle elevation-2"
                         alt="User Image">
                </div>
                <div class="info">
                    <a href="${contextRoot}/index_b" class="d-block">${sessionScope.ad}</a>
                </div>
            </div>

            <!-- 導航菜單 -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <li class="nav-item">
                        <a href="${contextRoot}/badindex" class="nav-link">管理員/權限</a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextRoot}/bacindex" class="nav-link">會員管理</a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextRoot}/bprindex" class="nav-link">商品管理</a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextRoot}/borindex" class="nav-link">訂單管理</a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextRoot}/viewDiscounts" class="nav-link">活動管理</a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextRoot}/barindex" class="nav-link">文章管理</a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextRoot}/breindex" class="nav-link">訊息管理</a>
                    </li>
                    <li class="nav-item">
                        <a href="${contextRoot}/adlogout" class="nav-link">登出</a>
                    </li>
                </ul>
            </nav>
            <!-- 菜單結束 -->
        </div>
    </aside>
    <!-- 左側導航結束 -->

    <!-- 內容 -->
    <div class="content-wrapper">
        <!-- 標頭 -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">商品管理</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- 標頭結束 -->

        <!-- 主頁內容 -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="background-color: #00ffff;"><b>新增商品</b></h5>
                                <hr>
                                <br>
                                <form:form method="POST" modelAttribute="productBean"
                                           enctype="multipart/form-data">
                                    <!-- <input type="submit" value="新增"><br><br> -->
                                    <label for="name" style="color: blue; font-weight: 700;">名稱:</label>
                                    <form:input type="text" id="name" path="name" style=" font-weight: 700;"
                                                placeholder="商品名稱" required="required" autocomplete="off"/>
                                    <button id="auto-insert-data-btn" type="button" class="btn btn-warning"
                                            style="position: relative; left: 20px;">一鍵新增
                                    </button>
                                    <br><br>
                                    <label for="productStatusId" style="color: orange; font-weight: 700;">上架:</label>
                                    <form:select id="productStatusId" path="productStatusId" style=" font-weight: 700;">
                                        <form:options items="${productStatuses}"/>
                                    </form:select>
                                    <br><br>
                                    <label for="price" style="color: red; font-weight: 700;">價錢:</label>
                                    <form:input type="number" id="price" path="price" style=" font-weight: 700;"
                                                placeholder="商品價錢" required="required" min="1" max="99999"
                                                autocomplete="off"/><span style="color: red"> <b>新台幣</b></span>
                                    <br><br>
                                    <label for="categoryId" style="color: green; font-weight: 700;">類型:</label>
                                    <form:select id="categoryId" path="categoryId" style=" font-weight: 700;">
                                        <form:options items="${categories}" itemLabel="type"/>
                                    </form:select>
                                    <br><br>
                                    <label for="detail1" style="color: olive; font-weight: 700;">商品 簡述:</label><br>
                                    <form:input type="text" name="detail1" id="detail1"
                                                path="detail1" placeholder="商品簡述" required="required"
                                                autocomplete="off"/>
                                    <br><br>
                                    <label for="detail2" style="color: Peru; font-weight: 700;">商品 詳述:</label><br>
                                    <form:textarea type="text" name="detail2" id="detail2"
                                                   path="detail2" placeholder="商品詳述" required="required"
                                                   autocomplete="off"/>
                                    <script>
                                        var editor = CKEDITOR.replace('detail2');
                                        CKFinder.setupCKEditor(editor, 'ckfinder/');
                                    </script>
                                    <br><br>
                                    <label for="image1" style="color: orange;">商品圖片1:</label>
                                    <form:input type="file" name="image1" id="image1"
                                                path="image1" required="required" accept="image/*"/>
                                    <br>
                                    <label for="image2" style="color: orange;">商品圖片2:</label>
                                    <form:input type="file" name="image2" id="image2"
                                                path="image2" required="required" accept="image/*"/>
                                    <br>
                                    <label for="image3" style="color: orange;">商品圖片3:</label>
                                    <form:input type="file" name="image3" id="image3"
                                                path="image3" required="required" accept="image/*"/>
                                    <br>
                                    <input type="submit" class="btn btn-info" value="新增">
                                    <a href='<c:url value="/bprindex"/>'>
                                        <button type="button" class="btn btn-dark">取消</button>
                                    </a>
                                    <div class="pics-row-6">
                                        <div id="image1-container"
                                             class="border-primary square-50 margin-bot-10">
                                            <img src="" alt="" id="img-image1">
                                        </div>
                                        <div id="image2-container"
                                             class="border-primary square-50 margin-bot-10">
                                            <img src="" alt="" id="img-image2">
                                        </div>
                                        <div id="image3-container"
                                             class="border-primary square-50 margin-bot-10">
                                            <img src="" alt="" id="img-image3">
                                        </div>
                                    </div>
                                    <div id="big-image-container" class="">
                                        <img src="" alt="" id="big-image">
                                    </div>

                                </form:form>
                                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                                <script
                                        src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
                                <script>
                                    $(document).ready(function () {
                                        $('#table_id').DataTable();
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 內容結束 -->

    <!-- 尾標 -->
    <footer class="main-footer">
        <!-- 內容 -->
        <strong>Copyright &copy; 2021-2022 <a href="#">EEIT38
            Group 3</a>.
        </strong> All rights reserved.
    </footer>
</div>
<!-- 結束 -->


</body>
</html>