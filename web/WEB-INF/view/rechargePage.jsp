<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>
                一卡通充值中心
            </h3>
            <span>
                该界面提供一卡通充值以及交易历史记录查询功能!
              </span>
            <span>
                当前余额：<strong style="font-size: 24px">${money}</strong>元
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
                        充值
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
                                充值金额：
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-3">
                                <label class="radio-inline"><input type="radio" name="radio" value="50" checked>50</label>
                                <label class="radio-inline"><input type="radio" name="radio" value="100" >100</label>
                                <label class="radio-inline"><input type="radio" name="radio" value="300" >300</label>
                                <input type="number" class="form-control ui-spinner-input required" min="1" max="10000" name="money" id="money" onkeyup="NumberCheck(this)" value="50"/>
                                <span class="help-block">
                                    只能输入1-10000的整数，充值单位元！
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                充值方式：
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-3">
                                <label class="radio-inline"><input type="radio" name="type" value="支付宝" checked>支付宝</label>
                                <label class="radio-inline"><input type="radio" name="type" value="微信" >微信</label>
                                <label class="radio-inline"><input type="radio" name="type" value="银行卡" >银行卡</label>
                            </div>
                        </div>
                        <div class="form-actions align-center">
                            <input type="submit" value="提交" class="btn btn-primary">
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
                        交易历史信息查询
                    </h4>
                </div>
                <div class="widget-content">
                    <table id="Datable" class="table table-striped table-bordered table-hover table-checkable">
                        <thead>
                        <tr>
                            <th>交易时间</th>
                            <th>交易前金额</th>
                            <th>交易后金额</th>
                            <th>交易金额</th>
                            <th>交易方式</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${rechargeRecords}" var="rechargeRecord">
                            <tr>
                                <td>${rechargeRecord.time}</td>
                                <td>${rechargeRecord.before_money}</td>
                                <td>${rechargeRecord.end_money}</td>
                                <td>${rechargeRecord.end_money-rechargeRecord.before_money}</td>
                                <td>${rechargeRecord.type}</td>
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
        if(parseInt(num)<1){
            t.value=1;
            return;
        }
        var re=/^\d*$/;
        if(!re.test(num)){
            isNaN(parseInt(num))?t.value=1:t.value=parseInt(num);
        }
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
        $(".form-group:eq(0) input:radio").change(function () {
            $('#money').val($(this).val())
        });
        $("#validate").validate({
            submitHandler: function(){
                var money=$('#money').val()
                var type=$('.form-group:eq(1) input:radio:checked').val()
                var msg='';
                if(type=="支付宝"){
                    msg='支付宝扫二维码完成支付，支付金额：'+money+'元！<img src="/assets/img/pay/zfb.jpg" width="250" height="250">'
                }else if(type=="微信"){
                    msg='微信扫二维码完成支付，支付金额：'+money+'元！<img src="/assets/img/pay/wx.jpg" width="250" height="250">'
                }else
                    msg='请向银行卡账号（6228480402564890018）转账'+money+'元完成本次充值！';
                bootbox.confirm({
                    buttons: {
                        confirm: {
                            label: '已完成支付'
                        },
                        cancel: {
                            label: '取消支付'
                        }
                    },
                    message: msg,
                    callback: function(confirmed) {
                        if(confirmed===true){
                            $.ajax({
                                url:"/recharge",
                                type:"POST",
                                data:JSON.stringify({type:type,money:money}),
                                contentType:"application/json",
                                dataType:"json",
                                success:function(data){
                                    if(data.result=="success"){
                                        window.location.href='/rechargePage';
                                    }else {
                                        bootbox.alert('充值失败，'+data.message)
                                    }
                                }
                            });
                        }
                    },
                    title: "学生一卡通充值确认提示框",
                })
            }
        });
    })
</script>