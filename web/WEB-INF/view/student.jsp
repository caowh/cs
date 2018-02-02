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
                            <a href="/student/add" class="btn btn-primary">
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
        // 对Date的扩展，将 Date 转化为指定格式的String
        // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
        // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
        // 例子：
        // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
        // (new Date()).Format("yyyy-M-d h:m:s.S")   ==> 2006-7-2 8:9:4.18
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
                        if(data[i]['birth_date']!=null)data[i]['birth_date']=new Date(data[i]['birth_date']).Format("yyyy-MM-dd");
                        if(data[i]['enrollment_time']!=null)data[i]['enrollment_time']=new Date(data[i]['enrollment_time']).Format("yyyy-MM-dd");
                        if(data[i]['graduation_time']!=null)data[i]['graduation_time']=new Date(data[i]['graduation_time']).Format("yyyy-MM-dd");
                    }
                    $('#userTable').dataTable().fnAddData(data,true);
                }
            }
        })

    })
</script>