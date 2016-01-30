<%@page import="com.surelution.vms.Vehicle"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>车辆常规保养记录</title>

<script type="text/javascript">
    
</script>
</head>
<body>
	<div class="body">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					常规保养登记 <small></small>
				</h1>
			</section>
			<section class="content">
			   <div class="box box-info">
                  <div class="box-header with-border">
                     <h4 class="box-title">车辆查询</h4>
                  </div>
                  <div class="box-body">
                      <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.carNO" default="车牌号" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                  <input type="text" name="carNO" value="${params.carNO }" class="form-control">
	                               </div>
	                            </dd>
	                        </dl>
	                        
	                <fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: '查询')}" />
					</fieldset>
                  </div>
                </div>
                
                <table class="table table-bordered  table-striped">
                    <thead>
                         <tr>
                            <th><g:message code="chepaihao" default="车牌号"/></th>
                            <th><g:message code="chexing" default="车型"/></th>
                            <th><g:message code="xinghao" default="厂牌型号"/></th>
                            <th><g:message code="zhuangtai" default="状态"/></th>
                            <th><g:message code="weixiu" default="维修状态"/></th>
                            <th><g:message code="caozuo" default="操作"/></th>
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                               <g:link rel="external" action="showItem" class="btn btn-default"  data-toggle="modal" data-target="#customerModal">保养</g:link>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="modal" id="customerModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>
			</section>
   </div>
  </div>
</body>
</html>