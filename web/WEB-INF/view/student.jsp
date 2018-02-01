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
                            <a href="#" id="searchA" class="btn btn-primary">
                                查询
                            </a>
                            <a href="#" id="execA" class="btn btn-primary">
                                执行
                            </a>
                            <a href="#" id="moveA" class="btn btn-primary">
                                移动
                            </a>
                            <a href="#" id="deleteA" class="btn btn-danger">
                                删除
                            </a>
                        </div>
                    </div>
                </div>
                <div class="form-wizard">
                    <div class="form-body">
                        <div class="tab-content">
                            <div class="alert alert-danger hide-default">
                                <button class="close" data-dismiss="alert">
                                </button>
                                您填写的不完善，请再次确认
                            </div>
                            <div class="alert alert-success hide-default">
                                <button class="close" data-dismiss="alert">
                                </button>
                                填写正确
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
                    }
                    $('#userTable').dataTable().fnAddData(data,true);
                }
            }
        })

    })
</script>