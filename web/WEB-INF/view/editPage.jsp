<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>
                学生一卡通编辑
            </h3>
            <span>
                您可以在该界面修改学生一卡通的信息!
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
                        编辑一卡通
                    </h4>
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
                                卡号
                            </label>
                            <div class="col-md-3">
                                <input type="text" class="form-control" name="id" value="${user.id}"readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                姓名
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-6">
                                <input type="text" class="form-control required" name="username" value="${user.username}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                性别
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-9">
                                <select name="sex" id="sex" class="form-control required">
                                    <option value="男">
                                        男
                                    </option>
                                    <option value="女">
                                        女
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                出身日期
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-2">
                                <input type="date" class="form-control required" name="birth_date"  id="birth_date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                身份证号码
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control required" name="identify"  value="${user.identify}"
                                       data-rule-required="true" data-rule-rangelength="[18,18]" data-msg-rangelength="字符长度必须为{0}位" data-msg-required="请输入身份证号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                年级
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control required" name="grade" value="${user.grade}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                班级
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control required" name="classes" value="${user.classes}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                入学日期
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-2">
                                <input type="date" class="form-control required" name="enrollment_time"  id="enrollment_time">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                毕业日期
                            </label>
                            <div class="col-md-2">
                                <input type="date" class="form-control" name="graduation_time"  id="graduation_time">
                            </div>
                        </div>
                        <div class="form-actions align-center">
                            <input type="submit" value="提交" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $.fn.serializeObject = function() {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [ o[this.name] ];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
        var sex='${user.sex}'
        if(sex=='男'){$('#sex option:eq(0)').attr('selected','selected')}else {$('#sex option:eq(1)').attr('selected','selected')}
        var birth_date='${user.birth_date}'
        if(birth_date!=null)$('#birth_date').val(birth_date.substring(0,10))
        var enrollment_time='${user.enrollment_time}'
        if(enrollment_time!=null)$('#enrollment_time').val(enrollment_time.substring(0,10))
        var graduation_time='${user.graduation_time}'
        if(graduation_time!=null)$('#graduation_time').val(graduation_time.substring(0,10))
        $("#validate").validate({
            submitHandler: function(){
                    $.ajax({
                    url:"/updateUser",
                    type:"POST",
                    data:JSON.stringify($('form').serializeObject()),
                    contentType:"application/json",
                    dataType:"json",
                    success:function(data){
                        if(data.result=="success"){
                            window.location.href='/student/editPage?id='+'${user.id}';
                        }else {
                            $('#alert1 .alert-danger span').html('修改失败，'+data.message)
                            $('#alert1 .alert-danger').removeClass('hide-default')
                        }
                    }
                });
            }
        });
    })
</script>