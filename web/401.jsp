<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>校园一卡通管理系统</title>
    <meta charset="utf-8">
</head>
<body>
<h1>对不起，你没有权限访问，<span style="color: #00acee" id="time">5</span>s后返回原页面！</h1>
    <script>
        window.onload=function(){
            setInterval(function () {
                var time=document.getElementById("time")
                time.innerHTML-=1
                if(time.innerHTML==0){
                    window.history.back();
                }
            },1000)
        }
    </script>
</body>
</html>