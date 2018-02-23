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
  <title>校园一卡通管理系统</title>
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
  <link href="/assets/css/icons.css" rel="stylesheet" type="text/css" />
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
  <script type="text/javascript" src="/plugins/validation/jquery.validate.min.js">
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
  <script type="text/javascript" src="/plugins/bootbox/bootbox.min.js">
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
      function updatePwd() {
          bootbox.dialog({
              title : "修改密码",
              message : "<div class='well ' style='margin-top:25px;'><form class='form-horizontal' role='form'><div class='form-group'><label class='col-sm-3 control-label no-padding-right' for='txtNewPwd1'>新密码</label><div class='col-sm-9'><input type='password' id='txtNewPwd1' data-rule-required='true' data-rule-rangelength='[6,16]' data-msg-rangelength='字符长度必须在{0}-{1}之间' data-msg-required='请输入密码' placeholder='请输入新密码' class='col-xs-10 col-sm-5 form-control' /></div></div><div class='space-4'></div><div class='form-group'><label class='col-sm-3 control-label no-padding-right' for='txtNewPwd2'>确认新密码</label><div class='col-sm-9'><input type='password' id='txtNewPwd2'  data-rule-required='true' data-rule-rangelength='[6,16]' data-msg-rangelength='字符长度必须在{0}-{1}之间' data-msg-required='请输入密码' placeholder='再次输入新密码' class='col-xs-10 col-sm-5 form-control' /></div></div></form></div>",
              buttons : {
                  "success" : {
                      "label" : "<i class='icon-ok'></i> 保存",
                      "className" : "btn-sm btn-success",
                      "callback" : function() {
                          var txt2 = $("#txtNewPwd1").val();
                          var txt3 = $("#txtNewPwd2").val();

                          if(txt2 == "" || txt3 == ""){
                              bootbox.alert("新密码不能为空！");
                              return false;
                          }
                          if(txt2 != txt3 ){
                              bootbox.alert("两次输入不一致，请重新输入!");
                              return false;
                          }
                          $.ajax({
                              url:"/updateUser",
                              type:"POST",
                              data:JSON.stringify({password:txt2}),
                              contentType:"application/json",
                              dataType:"json",
                              success:function(data){
                                  if(data.result=="success"){
                                      bootbox.alert('密码修改成功！')
                                  }else {
                                      bootbox.alert('密码修改失败，'+data.message)
                                  }
                              }
                          });
                      }
                  },
                  "cancel" : {
                      "label" : "<i class='icon-info'></i> 取消",
                      "className" : "btn-sm btn-danger",
                      "callback" : function() { }
                  }
              }
          });
      }
      $(document).ready(function() {
          App.init();
          Plugins.init();
          FormComponents.init()
          $.get('/getVersion',function (data) {
              $('.navbar-brand span').html(data.substring(1,data.length-1))
          })
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
      <img src="/assets/img/logo.png" alt="" />
      <strong>
        校园一卡通管理系统
      </strong>(
      <span></span>)
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
          ${rechargePage}
          <li>
            <a href="#" onclick="updatePwd()">
              <i class="icon-user">
              </i>
              修改密码
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