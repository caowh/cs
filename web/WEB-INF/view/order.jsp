<%@ page contentType="text/html;charset=UTF-8" %>
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
                                    <td  style="color: #468dee">${foods.get(0).left}</td>
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
                                    <td  style="color: #468dee">${foods.get(1).left}</td>
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
                                    <td  style="color: #468dee">${foods.get(2).left}</td>
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
                                    <td  style="color: #468dee">${foods.get(3).left}</td>
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
                    <div class="tab-content" id="alert2">
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
    $(document).ready(function () {
        $("#validate").validate({
            submitHandler: function(){
                var money=0;
                var n1=$('table:eq(0) input').val()
                if(n1!=""&&n1>0)money+=15.5*n1;
                var n2=$('table:eq(1) input').val()
                if(n2!=""&&n2>0)money+=9.9*n2;
                var n3=$('table:eq(2) input').val()
                if(n3!=""&&n3>0)money+=9.9*n3;
                var n4=$('table:eq(3) input').val()
                if(n4!=""&&n4>0)money+=22*n4;
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
                                        bootbox.alert('够餐成功！')
                                        window.location.href='/order';
                                    }else {
                                        $('#alert1 .alert-danger span').html('够餐失败，'+data.message)
                                        $('#alert1 .alert-danger').removeClass('hide-default')
                                    }
                                }
                            });
                        }
                    })

            }
        });
    })
</script>