<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container">
    <div class="crumbs">
        <ul id="breadcrumbs" class="breadcrumb">
            <li>
                <i class="icon-home">
                </i>
                <a href="index.html">
                    控制台
                </a>
            </li>
            <li class="current">
                <a href="pages_calendar.html" title="">
                    日历
                </a>
            </li>
        </ul>
        <ul class="crumb-buttons">
            <li>
                <a href="charts.html" title="">
                    <i class="icon-signal">
                    </i>
                    <span>
                    统计
                  </span>
                </a>
            </li>
            <li class="dropdown">
                <a href="#" title="" data-toggle="dropdown">
                    <i class="icon-tasks">
                    </i>
                    <span>
                    用户
                    <strong>
                      (+3)
                    </strong>
                  </span>
                    <i class="icon-angle-down left-padding">
                    </i>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <a href="form_components.html" title="">
                            <i class="icon-plus">
                            </i>
                            添加新用户
                        </a>
                    </li>
                    <li>
                        <a href="http://envato.stammtec.de/themeforest/melon/tables_dynamic.html"
                           title="">
                            <i class="icon-reorder">
                            </i>
                            查看
                        </a>
                    </li>
                </ul>
            </li>
            <li class="range">
                <a href="#">
                    <i class="icon-calendar">
                    </i>
                    <span>
                  </span>
                    <i class="icon-angle-down">
                    </i>
                </a>
            </li>
        </ul>
    </div>
    <div class="page-header">
        <div class="page-title">
            <h3>
                控制台
            </h3>
            <span>
                早上好, John!
              </span>
        </div>
        <ul class="page-stats">
            <li>
                <div class="summary">
                  <span>
                    新订单
                  </span>
                    <h3>
                        17,561
                    </h3>
                </div>
                <div id="sparkline-bar" class="graph sparkline hidden-xs">
                    20,15,8,50,20,40,20,30,20,15,30,20,25,20
                </div>
            </li>
            <li>
                <div class="summary">
                  <span>
                    我的余额
                  </span>
                    <h3>
                        $21,561.21
                    </h3>
                </div>
                <div id="sparkline-bar2" class="graph sparkline hidden-xs">
                    20,15,8,50,20,40,20,30,20,15,30,20,25,20
                </div>
            </li>
        </ul>
    </div>
    <div class="row row-bg">
        <div class="col-sm-6 col-md-3">
            <div class="statbox widget box box-shadow">
                <div class="widget-content">
                    <div class="visual cyan">
                        <div class="statbox-sparkline">
                            30,20,15,30,22,25,26,30,27
                        </div>
                    </div>
                    <div class="title">
                        客户
                    </div>
                    <div class="value">
                        4 501
                    </div>
                    <a class="more" href="javascript:void(0);">
                        查看更多
                        <i class="pull-right icon-angle-right">
                        </i>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="statbox widget box box-shadow">
                <div class="widget-content">
                    <div class="visual green">
                        <div class="statbox-sparkline">
                            20,30,30,29,22,15,20,30,32
                        </div>
                    </div>
                    <div class="title">
                        反馈
                    </div>
                    <div class="value">
                        714
                    </div>
                    <a class="more" href="javascript:void(0);">
                        查看更多
                        <i class="pull-right icon-angle-right">
                        </i>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3 hidden-xs">
            <div class="statbox widget box box-shadow">
                <div class="widget-content">
                    <div class="visual yellow">
                        <i class="icon-dollar">
                        </i>
                    </div>
                    <div class="title">
                        总共利润
                    </div>
                    <div class="value">
                        $42,512.61
                    </div>
                    <a class="more" href="javascript:void(0);">
                        查看更多
                        <i class="pull-right icon-angle-right">
                        </i>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3 hidden-xs">
            <div class="statbox widget box box-shadow">
                <div class="widget-content">
                    <div class="visual red">
                        <i class="icon-user">
                        </i>
                    </div>
                    <div class="title">
                        访问量
                    </div>
                    <div class="value">
                        2 521 719
                    </div>
                    <a class="more" href="javascript:void(0);">
                        查看更多
                        <i class="pull-right icon-angle-right">
                        </i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="widget box">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        总的点击率(
                        <span class="blue">
                      +29%
                    </span>
                        )
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
                    <div id="chart_filled_blue" class="chart">
                    </div>
                </div>
                <div class="divider">
                </div>
                <div class="widget-content">
                    <ul class="stats">
                        <li>
                            <strong>
                                4,853
                            </strong>
                            <small>
                                Total Views
                            </small>
                        </li>
                        <li class="light hidden-xs">
                            <strong>
                                271
                            </strong>
                            <small>
                                Last 24 Hours
                            </small>
                        </li>
                        <li>
                            <strong>
                                1,025
                            </strong>
                            <small>
                                Unique Users
                            </small>
                        </li>
                        <li class="light hidden-xs">
                            <strong>
                                105
                            </strong>
                            <small>
                                Last 24 Hours
                            </small>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="widget box">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        曲线图
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
                    <div id="chart_simple" class="chart" style="height: 219px;">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="widget box">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        新用户
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
                <div class="widget-content no-padding">
                    <table class="table table-striped table-checkable table-hover">
                        <thead>
                        <tr>
                            <th class="checkbox-column">
                                <input type="checkbox" class="uniform">
                            </th>
                            <th class="hidden-xs">
                                First Name
                            </th>
                            <th>
                                Last Name
                            </th>
                            <th>
                                Status
                            </th>
                            <th class="align-center">
                                Approve
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="checkbox-column">
                                <input type="checkbox" class="uniform">
                            </td>
                            <td class="hidden-xs">
                                Joey
                            </td>
                            <td>
                                Greyson
                            </td>
                            <td>
                          <span class="label label-success">
                            Approved
                          </span>
                            </td>
                            <td class="align-center">
                          <span class="btn-group">
                            <a href="javascript:void(0);" title="Approve" class="btn btn-xs bs-tooltip">
                              <i class="icon-ok">
                              </i>
                            </a>
                          </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-column">
                                <input type="checkbox" class="uniform">
                            </td>
                            <td class="hidden-xs">
                                Wolf
                            </td>
                            <td>
                                Bud
                            </td>
                            <td>
                          <span class="label label-info">
                            Pending
                          </span>
                            </td>
                            <td class="align-center">
                          <span class="btn-group">
                            <a href="javascript:void(0);" title="Approve" class="btn btn-xs bs-tooltip">
                              <i class="icon-ok">
                              </i>
                            </a>
                          </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-column">
                                <input type="checkbox" class="uniform">
                            </td>
                            <td class="hidden-xs">
                                Darin
                            </td>
                            <td>
                                Alec
                            </td>
                            <td>
                          <span class="label label-warning">
                            Suspended
                          </span>
                            </td>
                            <td class="align-center">
                          <span class="btn-group">
                            <a href="javascript:void(0);" title="Approve" class="btn btn-xs bs-tooltip">
                              <i class="icon-ok">
                              </i>
                            </a>
                          </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox-column">
                                <input type="checkbox" class="uniform">
                            </td>
                            <td class="hidden-xs">
                                Andrea
                            </td>
                            <td>
                                Brenden
                            </td>
                            <td>
                          <span class="label label-danger">
                            Blocked
                          </span>
                            </td>
                            <td class="align-center">
                          <span class="btn-group">
                            <a href="javascript:void(0);" title="Approve" class="btn btn-xs bs-tooltip">
                              <i class="icon-ok">
                              </i>
                            </a>
                          </span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="table-footer">
                            <div class="col-md-12">
                                <div class="table-actions">
                                    <label>
                                        Apply action:
                                    </label>
                                    <select class="select2" data-minimum-results-for-search="-1" data-placeholder="Select action...">
                                        <option value="">
                                        </option>
                                        <option value="Edit">
                                            Edit
                                        </option>
                                        <option value="Delete">
                                            Delete
                                        </option>
                                        <option value="Move">
                                            Move
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="widget">
                <div class="widget-header">
                    <h4>
                        <i class="icon-calendar">
                        </i>
                        日历
                    </h4>
                </div>
                <div class="widget-content">
                    <div id="calendar">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="widget">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        订阅
                    </h4>
                    <div class="toolbar no-padding">
                        <div class="btn-group">
                      <span class="btn btn-xs widget-collapse">
                        <i class="icon-angle-down">
                        </i>
                      </span>
                            <span class="btn btn-xs widget-refresh">
                        <i class="icon-refresh">
                        </i>
                      </span>
                        </div>
                    </div>
                </div>
                <div class="widget-content">
                    <div class="tabbable tabbable-custom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab_feed_1" data-toggle="tab">
                                    System
                                </a>
                            </li>
                            <li>
                                <a href="#tab_feed_2" data-toggle="tab">
                                    Activities
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_feed_1">
                                <div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible="0">
                                    <ul class="feeds clearfix">
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-bell">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            You have 2 puzzles to solve.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    Just now
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New user registered.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    20 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li class="hoverable">
                                            <a href="javascript:void(0);">
                                                <div class="col1">
                                                    <div class="content">
                                                        <div class="content-col1">
                                                            <div class="label label-info">
                                                                <i class="icon-bullhorn">
                                                                </i>
                                                            </div>
                                                        </div>
                                                        <div class="content-col2">
                                                            <div class="desc">
                                                                New items are in queue.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">
                                                        25 mins ago
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-danger">
                                                            <i class="icon-warning-sign">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            High CPU load on cluster #2.
                                                            <span class="label label-danger label-mini">
                                        Fix it
                                        <i class="icon-share-alt">
                                        </i>
                                      </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    30 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-warning">
                                                            <i class="icon-bolt">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            Disk space to 85% full.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    45 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New user registered.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    1 hour ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-default">
                                                            <i class="icon-time">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            Time successfully synced.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    1.5 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-bullhorn">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            Download finished.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    1.8 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    2 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-bullhorn">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            Download finished.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    3 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    5 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-bullhorn">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            Download finished.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    5.5 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    7 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-bullhorn">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            Download finished.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    16 hours ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    20 hours ago
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab_feed_2">
                                <div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible="0">
                                    <ul class="feeds clearfix">
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New user registered.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    1 min ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New user registered.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    5 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    10 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New user registered.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    20 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    30 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New user registered.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    40 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    50 mins ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-success">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New user registered.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    1 hour ago
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="content">
                                                    <div class="content-col1">
                                                        <div class="label label-info">
                                                            <i class="icon-plus">
                                                            </i>
                                                        </div>
                                                    </div>
                                                    <div class="content-col2">
                                                        <div class="desc">
                                                            New order received.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">
                                                    1.5 hours ago
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>