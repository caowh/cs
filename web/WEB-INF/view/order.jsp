<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>
                食堂就餐
            </h3>
            <span>
                该界面提供购餐与历史信息查询!
              </span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="widget box">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        食堂购餐
                    </h4>
                    <div class="toolbar no-padding">
                        <div class="btn-group">
                                  <span class="btn btn-xs widget-collapse">
                                    <i class="icon-angle-down">
                                    </i>
                                  </span>
                        </div>
                    </div>
                </div>
                <div class="widget-content">
                    <div class="tab-content" id="alert1">
                        <div class="alert alert-danger hide-default">
                            <i class="icon-remove close" data-dismiss="alert">
                            </i>
                            <span></span>
                        </div>
                        <div class="alert alert-success hide-default">
                            <i class="icon-remove close" data-dismiss="alert">
                            </i>
                            <span></span>
                        </div>
                    </div>
                    <form class="form-horizontal row-border" id="validate">
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <img src="/assets/img/food/1.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${foods.get(0).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">价格（元）：</td>
                                    <td  style="color: #468dee">${foods.get(0).price}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${foods.get(0).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">剩余数量：</td>
                                    <td  style="color: #468dee">${foods.get(0).leftCount}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">购买数量：</td>
                                    <td><input type="number" class="form-control" min="0" style="width: 100px" onkeyup="NumberCheck(this)"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <img src="/assets/img/food/2.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${foods.get(1).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">价格（元）：</td>
                                    <td  style="color: #468dee">${foods.get(1).price}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${foods.get(1).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">剩余数量：</td>
                                    <td  style="color: #468dee">${foods.get(1).leftCount}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">购买数量：</td>
                                    <td><input type="number" class="form-control" min="0" style="width: 100px" onkeyup="NumberCheck(this)"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <img src="/assets/img/food/3.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${foods.get(2).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">价格（元）：</td>
                                    <td  style="color: #468dee">${foods.get(2).price}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${foods.get(2).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">剩余数量：</td>
                                    <td  style="color: #468dee">${foods.get(2).leftCount}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">购买数量：</td>
                                    <td><input type="number" class="form-control" min="0" style="width: 100px" onkeyup="NumberCheck(this)"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <img src="/assets/img/food/4.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${foods.get(3).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">价格（元）：</td>
                                    <td  style="color: #468dee">${foods.get(3).price}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${foods.get(3).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">剩余数量：</td>
                                    <td  style="color: #468dee">${foods.get(3).leftCount}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">购买数量：</td>
                                    <td><input type="number" class="form-control" min="0" style="width: 100px" onkeyup="NumberCheck(this)"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-actions align-center">
                            <input type="submit" value="确认购买" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="widget box">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        购餐历史信息查询
                    </h4>
                </div>
                <div class="widget-content">
                    <table id="Datable" class="table table-striped table-bordered table-hover table-checkable">
                        <thead>
                        <tr>
                            <th>订单ID</th>
                            <th>详情</th>
                            <th>消费时间</th>
                            <th>金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.msg}</td>
                                <td>${order.time}</td>
                                <td>${order.cost}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function NumberCheck(t){
        var num = t.value;
        var re=/^\d*$/;
        if(!re.test(num)){
            isNaN(parseInt(num))?t.value=0:t.value=parseInt(num);
        }
    }
    function accMul(arg1,arg2){

        var m=0,s1=arg1.toString(),s2=arg2.toString();

        try{m+=s1.split(".")[1].length}catch(e){}

        try{m+=s2.split(".")[1].length}catch(e){}

        return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)

    }
    function accAdd(arg1,arg2){

        var r1,r2,m;

        try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}

        try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}

        m=Math.pow(10,Math.max(r1,r2));

        return (accMul(arg1,m)+accMul(arg2,m))/m;

    }
    $(document).ready(function () {
        $('#Datable').DataTable({
            language:{
                sProcessing : "处理中...",
                sLengthMenu : "显示 _MENU_ 项结果",
                sZeroRecords : "没有匹配结果",
                sInfo : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                sInfoEmpty : "显示第 0 至 0 项结果，共 0 项",
                sInfoFiltered : "(由 _MAX_ 项结果过滤)",
                sInfoPostFix : "",
                sSearch : "",
                searchPlaceholder : "关键字搜索",
                sUrl : "",
                sEmptyTable : "表中数据为空",
                sLoadingRecords : "载入中...",
                sInfoThousands : ",",
                oPaginate : {
                    sFirst : "首页",
                    sPrevious : "上页",
                    sNext : "下页",
                    sLast : "末页"
                },
                oAria : {
                    sSortAscending : ": 以升序排列此列",
                    sSortDescending : ": 以降序排列此列"
                }
            },
            order:[0,'desc']
        });
        $("#validate").validate({
            submitHandler: function(){
                var money=0;
                var n1=$('table:eq(0) input').val()
                var price1=$('table:eq(0) tr:eq(1) td:eq(1)').html()
                if(n1!=""&&n1>0)money=accAdd(money,accMul(price1,n1));
                var n2=$('table:eq(1) input').val()
                var price2=$('table:eq(1) tr:eq(1) td:eq(1)').html()
                if(n2!=""&&n2>0)money=accAdd(money,accMul(price2,n2));
                var n3=$('table:eq(2) input').val()
                var price3=$('table:eq(2) tr:eq(1) td:eq(1)').html()
                if(n3!=""&&n3>0)money=accAdd(money,accMul(price3,n3));
                var n4=$('table:eq(3) input').val()
                var price4=$('table:eq(3) tr:eq(1) td:eq(1)').html()
                if(n4!=""&&n4>0)money=accAdd(money,accMul(price4,n4));
                if(money==0){bootbox.alert('请先选择一项，填写购买数量！');return false}
                bootbox.confirm('您共需花费'+money+'元，是否确认购买？',function (confirmed) {
                        if(confirmed===true){
                            $.ajax({
                                url:"/order/buy",
                                type:"POST",
                                data:JSON.stringify([n1,n2,n3,n4]),
                                contentType:"application/json",
                                dataType:"json",
                                success:function(data){
                                    if(data.result=="success"){
                                        window.location.href='/order';
                                    }else {
                                        bootbox.alert('够餐失败，'+data.message)
                                    }
                                }
                            });
                        }
                    })

            }
        });
    })
</script>