<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>
                图书借阅
            </h3>
            <span>
                该界面提供图书借阅、归还与历史信息查询!
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
                        图书借阅
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
                                <img src="/assets/img/book/1.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${books.get(0).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${books.get(0).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">是否借阅：</td>
                                    <td  style="color: #468dee"><input type="checkbox"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <img src="/assets/img/book/2.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${books.get(1).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${books.get(1).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">是否借阅：</td>
                                    <td  style="color: #468dee"><input type="checkbox"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <img src="/assets/img/book/3.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${books.get(2).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${books.get(2).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">是否借阅：</td>
                                    <td  style="color: #468dee"><input type="checkbox"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                <img src="/assets/img/book/4.jpg" width="150" height="200">
                            </label>
                            <table class="col-md-9">
                                <tr>
                                    <td style="width: 70px">名称：</td>
                                    <td  style="color: #468dee">${books.get(3).name}</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">简介：</td>
                                    <td  style="color: #468dee">${books.get(3).description}</td>
                                </tr>
                                <tr>
                                    <td style="width: 70px">是否借阅：</td>
                                    <td  style="color: #468dee"><input type="checkbox"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-actions align-center">
                            <input type="submit" value="确认借阅" class="btn btn-primary">
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
                        图书归还（借书超出七天后，1元/每天每本）
                    </h4>
                </div>
                <div class="widget-content">
                    <table id="Datable" class="table table-striped table-bordered table-hover table-checkable">
                        <thead>
                        <tr>
                            <th>借书ID</th>
                            <th>书名</th>
                            <th>借书时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${borrowCurrentHelpers}" var="borrowCurrentHelper">
                            <tr>
                                <td>${borrowCurrentHelper.bc_id}</td>
                                <td>${borrowCurrentHelper.book_name}</td>
                                <td>${borrowCurrentHelper.date}</td>
                                <td>${borrowCurrentHelper.back}</td>
                                <td><input type="button" onclick="back(${borrowCurrentHelper.bc_id})" value="归还"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="widget box">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        历史信息查询
                    </h4>
                </div>
                <div class="widget-content">
                    <table id="Datable1" class="table table-striped table-bordered table-hover table-checkable">
                        <thead>
                        <tr>
                            <th>归还ID</th>
                            <th>花费</th>
                            <th>书名</th>
                            <th>借书时间</th>
                            <th>还书时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${borrowHistoryHelpers}" var="borrowHistoryHelper">
                            <tr>
                                <td>${borrowHistoryHelper.id}</td>
                                <td>${borrowHistoryHelper.cost}</td>
                                <td>${borrowHistoryHelper.book_name}</td>
                                <td>${borrowHistoryHelper.borrow_date}</td>
                                <td>${borrowHistoryHelper.back_date}</td>
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
    function back(id) {
        bootbox.confirm({
            buttons: {
                confirm: {
                    label: '扫描通过'
                },
                cancel: {
                    label: '扫描不通过'
                }
            },
            message: "请将归还图书放在指定区域，等待系统扫描确认......",
            callback: function(confirmed) {
                if(confirmed===true){
                    $.ajax({
                        url:"/book/back?id="+id,
                        type:"GET",
                        dataType:"json",
                        success:function(data){
                            if(data.result=="success"){
                                bootbox.alert("归还成功！",function () {
                                    window.location.href='/book';
                                })
                            }else {
                                bootbox.alert('归还失败，'+data.message)
                            }
                        }
                    });
                }else {
                    bootbox.alert("图书扫描不通过，请重试！")
                }
            },
        })
    }
    function scrollToLocation() {
        var mainContainer = $('body');
        var scrollTo= $('#Datable');
        mainContainer.animate(
            {
            scrollTop: scrollTo.offset().top - mainContainer.offset().top + mainContainer.scrollTop()
            }, 500);
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
        $('#Datable1').DataTable({
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
                var n1=$('table:eq(0) input').is(':checked')
                var n2=$('table:eq(1) input').is(':checked')
                var n3=$('table:eq(2) input').is(':checked')
                var n4=$('table:eq(3) input').is(':checked')
                if(!n1&&!n2&&!n3&&!n4){bootbox.alert('请至少借阅一本书！');return false}
                bootbox.confirm('是否确认借书？',function (confirmed) {
                        if(confirmed===true){
                            $.ajax({
                                url:"/book/borrow",
                                type:"POST",
                                data:JSON.stringify([n1,n2,n3,n4]),
                                contentType:"application/json",
                                dataType:"json",
                                success:function(data){
                                    if(data.result=="success"){
                                        bootbox.alert("借阅成功！",function () {
                                            window.location.href='/book';
                                        })
                                    }else {
                                        bootbox.alert('借阅失败，'+data.message)
                                    }
                                }
                            });
                        }
                    })

            }
        });
        $.ajax({
            url:"/book/unBack",
            type:"GET",
            dataType:"json",
            success:function(data){
                var msg="";
                if(data.warn>0){
                    msg=data.warn+"本书即将逾期，"
                }
                if(data.bigWarn>0){
                    msg+=data.bigWarn+"本书已逾期扣费中，"
                }
                if(msg!=""){
                    bootbox.alert(msg+"请及时归还！",function () {
                        scrollToLocation()
                    })
                }
            }
        });
    })
</script>