<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/27
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"
  />
  <title>校园一卡通管理系统</title>
  <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"
  />
  <link href="/assets/css/main.css" rel="stylesheet" type="text/css" />
  <link href="/assets/css/plugins.css" rel="stylesheet" type="text/css" />
  <link href="/assets/css/responsive.css" rel="stylesheet" type="text/css"
  />
  <link href="/assets/css/icons.css" rel="stylesheet" type="text/css" />
  <link href="/assets/css/login.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="/assets/css/fontawesome/font-awesome.min.css">
  <!--[if IE 7]>
  <link rel="stylesheet" href="/assets/css/fontawesome/font-awesome-ie7.min.css">
  <![endif]-->
  <!--[if IE 8]>
  <link href="/assets/css/ie8.css" rel="stylesheet" type="text/css" />
  <![endif]-->
  <script type="text/javascript" src="/assets/js/libs/jquery-1.10.2.min.js">
  </script>
  <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js">
  </script>
  <script type="text/javascript" src="/assets/js/libs/lodash.compat.min.js">
  </script>
  <!--[if lt IE 9]>
  <script src="assets/js/libs/html5shiv.js">
  </script>
  <![endif]-->
  <script type="text/javascript" src="/plugins/uniform/jquery.uniform.min.js">
  </script>
  <script type="text/javascript" src="/plugins/validation/jquery.validate.min.js">
  </script>
  <script type="text/javascript" src="/plugins/nprogress/nprogress.js">
  </script>
  <script type="text/javascript" src="/assets/js/login.js">
  </script>
  <script>
      $(document).ready(function() {
          Login.init()
      });
  </script>
</head>

<body class="login">
<div class="logo">
  <img src="/assets/img/logo.png" alt="logo" />
  <strong>
    校园一卡通管理系统
  </strong></div>
<div class="box">
  <div class="content">
    <form class="form-vertical login-form">
      <h3 class="form-title">
        登录
      </h3>
      <div class="alert fade in alert-danger" style="display: none;">
        <i class="icon-remove close" data-dismiss="alert">
        </i>
        请输入学号和密码！
      </div>
      <div class="alert fade in alert-danger" style="display: none;">
        <i class="icon-remove close" data-dismiss="alert">
        </i>
        学号或密码错误！
      </div>
      <div class="form-group">
        <div class="input-icon">
          <i class="icon-user">
          </i>
          <input type="text" name="username" class="form-control" placeholder="卡号、ID"
                 autofocus="autofocus" data-rule-required="true" data-msg-required="请输入学号"
          />
        </div>
      </div>
      <div class="form-group">
        <div class="input-icon">
          <i class="icon-lock">
          </i>
          <input type="password" name="password" class="form-control" placeholder="密码"
                 data-rule-required="true" data-msg-required="请输入密码."
          />
        </div>
      </div>
      <div class="form-actions">
        <button type="submit" class="submit btn btn-primary pull-right">
          登录
          <i class="icon-angle-right">
          </i>
        </button>
      </div>
    </form>
  </div>
</div>
</body>

</html>
