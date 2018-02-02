<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>
                学生一卡通添加
            </h3>
            <span>
                您可以在该界面对学生一卡通进行单个或者批量添加!
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
                        单个添加
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
                        </div>
                        <div class="alert alert-success hide-default">
                            <i class="icon-remove close" data-dismiss="alert">
                            </i>
                        </div>
                    </div>
                    <form class="form-horizontal row-border" id="validate">
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                姓名
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-6">
                                <input type="text" class="form-control required" name="username"/>
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
                                <select name="sex" class="form-control required">
                                    <option value="男" selected>
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
                                <input type="date" class="form-control required" name="birth_date">
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
                                <input type="text" class="form-control required" name="identify"
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
                                <input type="text" class="form-control required" name="grade">
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
                                <input type="text" class="form-control required" name="classes">
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
                                <input type="date" class="form-control required" name="enrollment_time">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                毕业日期
                            </label>
                            <div class="col-md-2">
                                <input type="date" class="form-control" name="graduation_time">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">
                                状态
                                <span class="required">
                                          *
                                        </span>
                            </label>
                            <div class="col-md-9">
                                <select name="status" class="form-control required">
                                    <option value="0" selected>
                                        在校
                                    </option>
                                    <option value="1">
                                        离校
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-actions align-center">
                            <input type="button" id="submit" value="提交" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#validate").validate();
        //发送表单ajax请求
        $('#submit').on('click',function(){
            $.ajax({
                url:"/student/add",
                type:"POST",
                data:JSON.stringify($('form').serializeObject()),
                contentType:"application/json",
                dataType:"json",
                success:function(data){
                    console.log(data)
                }
            });
        });

        /**
         * 自动将form表单封装成json对象
         */
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
    })
</script>