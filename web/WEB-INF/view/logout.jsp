<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>校园一卡通管理系统</title>
</head>
<body>
<h1>你已经成功从系统退出，<span style="color: #00acee" id="time">5</span>s后返回登录页面！</h1>
    <script>
        window.onload=function(){
            setInterval(function () {
                var time=document.getElementById("time")
                time.innerHTML-=1
                if(time.innerHTML==0){
                    window.location.href="/login.jsp";
                }
            },1000)
        }
    </script>
</body>
</html>