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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"
  />
  <title>Bootstrap3响应式后台管理系统模版MeAdmin</title>
  <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"
  />
  <!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="/plugins/jquery-ui/jquery.ui.1.10.2.ie.css"
  />
  <![endif]-->
  <link href="/assets/css/main.css" rel="stylesheet" type="text/css" />
  <link href="/assets/css/plugins.css" rel="stylesheet" type="text/css" />
  <link href="/assets/css/responsive.css" rel="stylesheet" type="text/css"
  />
  <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="/assets/css/fontawesome/font-awesome.min.css">
  <!--[if IE 7]>
  <link rel="stylesheet" href="/assets/css/fontawesome/font-awesome-ie7.min.css">
  <![endif]-->
  <!--[if IE 8]>
  <link href="/assets/css/ie8.css" rel="stylesheet" type="text/css" />
  <![endif]-->
  <script type="text/javascript" src="/assets/js/libs/jquery-1.10.2.min.js">
  </script>
  <script type="text/javascript" src="/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js">
  </script>
  <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js">
  </script>
  <script type="text/javascript" src="/assets/js/libs/lodash.compat.min.js">
  </script>
  <!--[if lt IE 9]>
  <script src="/assets/js/libs/html5shiv.js">
  </script>
  <![endif]-->
  <script type="text/javascript" src="/plugins/touchpunch/jquery.ui.touch-punch.min.js">
  </script>
  <script type="text/javascript" src="/plugins/event.swipe/jquery.event.move.js">
  </script>
  <script type="text/javascript" src="/plugins/event.swipe/jquery.event.swipe.js">
  </script>
  <script type="text/javascript" src="/assets/js/libs/breakpoints.js">
  </script>
  <script type="text/javascript" src="/plugins/respond/respond.min.js">
  </script>
  <script type="text/javascript" src="/plugins/cookie/jquery.cookie.min.js">
  </script>
  <script type="text/javascript" src="/plugins/slimscroll/jquery.slimscroll.min.js">
  </script>
  <script type="text/javascript" src="/plugins/slimscroll/jquery.slimscroll.horizontal.min.js">
  </script>
  <!--[if lt IE 9]>
  <script type="text/javascript" src="/plugins/flot/excanvas.min.js">
  </script>
  <![endif]-->
  <script type="text/javascript" src="/plugins/sparkline/jquery.sparkline.min.js">
  </script>
  <script type="text/javascript" src="/plugins/datatables/jquery.dataTables.min.js">
  </script>
  <script type="text/javascript" src="/plugins/datatables/DT_bootstrap.js">
  </script>
  <script type="text/javascript" src="/plugins/daterangepicker/moment.min.js">
  </script>
  <script type="text/javascript" src="/plugins/daterangepicker/daterangepicker.js">
  </script>
  <script type="text/javascript" src="/plugins/blockui/jquery.blockUI.min.js">
  </script>
  <script type="text/javascript" src="/plugins/fullcalendar/fullcalendar.min.js">
  </script>
  <script type="text/javascript" src="/plugins/noty/jquery.noty.js">
  </script>
  <script type="text/javascript" src="/plugins/noty/layouts/top.js">
  </script>
  <script type="text/javascript" src="/plugins/noty/themes/default.js">
  </script>
  <script type="text/javascript" src="/plugins/uniform/jquery.uniform.min.js">
  </script>
  <script type="text/javascript" src="/plugins/select2/select2.min.js">
  </script>
  <script type="text/javascript" src="/assets/js/app.js">
  </script>
  <script type="text/javascript" src="/assets/js/plugins.js">
  </script>
  <script type="text/javascript" src="/assets/js/plugins.form-components.js">
  </script>
  <script>
      $(document).ready(function() {
          App.init();
          Plugins.init();
          FormComponents.init()
      });
  </script>
  <script type="text/javascript" src="/assets/js/custom.js">
  </script>
  <script type="text/javascript" src="/assets/js/demo/pages_calendar.js">
  </script>
</head>

<body>
<header class="header navbar navbar-fixed-top" role="banner">
  <div class="container">
    <ul class="nav navbar-nav">
      <li class="nav-toggle">
        <a href="javascript:void(0);" title="">
          <i class="icon-reorder">
          </i>
        </a>
      </li>
    </ul>
    <a class="navbar-brand" href="/index">
      <img src="/assets/img/logo.png" alt="logo" />
      <strong>
        Me
      </strong>
      Admin
    </a>
    <a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom"
       data-original-title="左侧菜单控制">
      <i class="icon-reorder">
      </i>
    </a>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown user">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <i class="icon-male">
          </i>
          <span class="username">
                ${username}
              </span>
          <i class="icon-caret-down small">
          </i>
        </a>
        <ul class="dropdown-menu">
          <li>
            <a href="pages_user_profile.html">
              <i class="icon-user">
              </i>
              我的资料
            </a>
          </li>
          <li class="divider">
          </li>
          <li>
            <a href="/logout">
              <i class="icon-key">
              </i>
              退出
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</header>
<div id="container">
  <div id="sidebar" class="sidebar-fixed">
    <div id="sidebar-content">
      <ul id="nav">
        ${nav}
      </ul>
      <div class="sidebar-widget align-center">
        <div class="btn-group" data-toggle="buttons" id="theme-switcher">
          <label class="btn active">
            <input type="radio" name="theme-switcher" data-theme="bright">
            <i class="icon-sun">
            </i>
            白天
          </label>
          <label class="btn">
            <input type="radio" name="theme-switcher" data-theme="dark">
            <i class="icon-moon">
            </i>
            夜晚
          </label>
        </div>
      </div>
    </div>
    <div id="divider" class="resizeable">
    </div>
  </div>
  <div id="content">
    <jsp:include page="${content}.jsp"></jsp:include>
  </div>
</div>

</body>

</html>