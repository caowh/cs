<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>
                学生一卡通管理
            </h3>
            <span>
                您可以在该界面对学生一卡通进行添加、删除、挂失等操作!
              </span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <form class="form-horizontal" id="sample_form" action="#">
                <div class="form-actions fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <a href="/student/addPage" class="btn btn-primary">
                                添加
                            </a>
                            <a href="#" id="deleteA" class="btn btn-danger">
                                删除
                            </a>
                        </div>
                    </div>
                </div>
                <div class="form-wizard">
                    <div class="form-body">
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
                            <div class="tab-pane active">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="widget box">
                                            <div class="widget-content">
                                                <table id="userTable" class="table table-striped table-bordered table-hover table-checkable">
                                                    <thead>
                                                    <tr>
                                                        <th class="checkbox-column">
                                                            <input type="checkbox" class="uniform">
                                                        </th>
                                                        <th>卡号</th>
                                                        <th>姓名</th>
                                                        <th>性别</th>
                                                        <th>出生日期</th>
                                                        <th>身份证号码</th>
                                                        <th>年级</th>
                                                        <th>班级</th>
                                                        <th>入学时间</th>
                                                        <th>毕业时间</th>
                                                        <th>状态</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>
    </div>
</div>
<script>
    function updateStatus(id,status) {
        $.ajax({
            type: "post",
            contentType: "application/json; charset=utf-8",
            url: "/updateUser",
            data: JSON.stringify({
                id:id,
                status:status
            }),
            dataType: "json",
            success: function (data) {
                if(data.result=="success"){
                    window.location.href='/student'
                }else {
                    $('#alert1 .alert-danger span').html('挂失失败，'+data.message)
                    $('#alert1 .alert-danger').removeClass('hide-default')
                }
            }
        })
    }
    Date.prototype.Format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1,         //月份
            "d+" : this.getDate(),          //日
            "h+" : this.getHours(),          //小时
            "m+" : this.getMinutes(),         //分
            "s+" : this.getSeconds(),         //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S" : this.getMilliseconds()       //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }

    $(document).ready(function () {
        $('#userTable').DataTable({
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
            order : [],
            columns: [
                {data:"check",className : "checkbox-column",orderable : false},
                {data:'id'},
                {data:'username'},
                {data:'sex'},
                {data:'birth_date'},
                {data:'identify'},
                {data:'grade'},
                {data:'classes'},
                {data:'enrollment_time'},
                {data:'graduation_time'},
                {data:'status'},
                {data:'option'},
            ]
        });
        $.ajax({
            type: "post",
            contentType: "application/json; charset=utf-8",
            url: "/userList",
            data: JSON.stringify({
                admin:2
            }),
            dataType: "json",
            success: function (data) {
                if(data.length>0){
                    for(var i=0;i<data.length;i++){
                        data[i]['check']='<input type="checkbox" class="uniform">';

                        if(data[i]['birth_date']!=null)data[i]['birth_date']=new Date(data[i]['birth_date']).Format("yyyy-MM-dd");
                        if(data[i]['enrollment_time']!=null)data[i]['enrollment_time']=new Date(data[i]['enrollment_time']).Format("yyyy-MM-dd");
                        if(data[i]['graduation_time']!=null)data[i]['graduation_time']=new Date(data[i]['graduation_time']).Format("yyyy-MM-dd");
                        if(data[i]['status']==1){
                            data[i]['status']='正常';
                            data[i]['option']='<a href="/student/editPage?id='+data[i]['id']+'">编辑</a>&nbsp;&nbsp;<a href="#" onclick="updateStatus('+data[i]['id']+',2)">挂失</a>';
                        }
                        else {
                            data[i]['status']='已挂失';
                            data[i]['option']='<a href="/student/editPage?id='+data[i]['id']+'">编辑</a>&nbsp;&nbsp;<a href="#" onclick="updateStatus('+data[i]['id']+',1)">取消挂失</a>';
                        }
                    }
                    $('#userTable').dataTable().fnAddData(data,true);
                }
            }
        })
        $('#deleteA').click(function () {
            var table=$('#userTable').dataTable()
            var nTrs=table.fnGetNodes()
            var ids=[]
            for(var i = 0; i < nTrs.length; i++){
                if($(nTrs[i]).find('.checked').length==1){
                    ids.push(table.fnGetData(nTrs[i]).id)
                }
            }
            if(ids.length>0){
                bootbox.confirm("当前选择"+ids.length+"位一卡通用户，确认删除吗?",function(confirmed){
                    if(confirmed===true){
                        $.ajax({
                            type: "post",
                            contentType: "application/json; charset=utf-8",
                            url: "/deleteUserByIds",
                            data: JSON.stringify(ids),
                            dataType: "json",
                            success: function (data) {
                                if(data.result=="success"){
                                    window.location.href='/student'
                                }else {
                                    $('#alert1 .alert-danger span').html('删除失败，'+data.message)
                                    $('#alert1 .alert-danger').removeClass('hide-default')
                                }
                            }
                        })
                    }
                })
            }else {
                bootbox.alert('请至少选择一个卡号删除！')
            }
        })
    })
</script>