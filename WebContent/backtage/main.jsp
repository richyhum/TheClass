<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>班级管理系统-主页</title>
<link rel="shortcut icon" href="../img/backicon.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/backtage/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
	
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
		url="${pageContext.request.contextPath}/student/modifyPassword.spring?id=${currentStudent.id}";
	}
	
	function closePasswordModifyDialog(){
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var oldPassword=$("#oldPassword").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				if(oldPassword!='${currentStudent.password}'){
					$.messager.alert("系统提示","用户密码输入错误！");
					return false;
				}
				if(newPassword!=newPassword2){
					$.messager.alert("系统提示","确认密码输入错误！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","密码修改成功，下一次登录生效！");
					closePasswordModifyDialog();
				}else{
					$.messager.alert("系统提示","密码修改失败");
					return;
				}
			}
		});
	}
	
	function logout(){
		$.messager.confirm("系统提示","您确定要退出系统吗",function(r){
			if(r){
				window.location.href="${pageContext.request.contextPath}/student/logout.spring";
			}
		});
	}
	

</script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;background-color: #E0ECFF">
	<table style="padding: 5px" width="100%">
		<tr>
			<td width="50%">
				<img src="${pageContext.request.contextPath}/images/backTop.png"/>
			</td>
			<td valign="bottom" align="right" width="50%">
				<font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentStudent.studentName }</font>【${currentStudent.studentName}】
			</td>
		</tr>
	</table>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="margin-top:0px;">
				<img src="${pageContext.request.contextPath}/images/wel.png">
			</div>
		</div>
	</div>
</div>
<div region="west" style="width: 200px" title="导航菜单" split="true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="信息管理" data-options="selected:true,iconCls:'icon-info'" style="padding: 10px">
			<a href="javascript:openTab('班级信息管理','classManage.jsp','icon-class')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-class'" style="width: 150px;">班级信息管理</a>
			<a href="javascript:openTab('学生信息管理','studentManage.jsp','icon-students')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-students'" style="width: 150px;">学生信息管理</a>
			<a href="javascript:openTab('教师信息管理','teacherManage.jsp','icon-teacher')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-teacher'" style="width: 150px;">教师信息管理</a>
			<a href="javascript:openTab('课程信息管理','courseManage.jsp','icon-course')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-course'" style="width: 150px;">课程信息管理</a>
			<a href="javascript:openTab('成绩信息管理','gradeManage.jsp','icon-grade')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-grade'" style="width: 150px;">成绩信息管理</a>
			<a href="javascript:openTab('学生获奖信息管理','awardsManage.jsp','icon-awards')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-awards'" style="width: 150px;">学生获奖信息管理</a>
			<a href="javascript:openTab('学生作品信息管理','worksManage.jsp','icon-works')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-works'" style="width: 150px;">学生作品信息管理</a>
		</div>
		
		<div title="统计分析"  data-options="iconCls:'icon-record'" style="padding:10px;">
			<a href="javascript:openTab('学生成绩分析','gradeAnalysis.jsp','icon-analysis')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-grade'" style="width: 150px;">学生成绩分析</a>
			<a href="javascript:openTab('男女比例分析','sexAnalysis.jsp','icon-sex')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sex'" style="width: 150px;">男女比例分析</a>
		</div>
		
		<div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px">
			<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
			<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
		</div>
	</div>
</div>
<div region="south" style="height: 25px;padding: 5px;" align="center">
	@CopyRight CARMEN
</div>


<div id="dlg" class="easyui-dialog" style="width: 400px;height:250px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 	<form id="fm" method="post">
 		<table cellspacing="8px">
 			<tr>
 				<td>用户名：</td>
 				<td><input type="text" id="studentName" name="studentName" value="${currentStudent.studentName }" readonly="readonly" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>原密码：</td>
 				<td><input type="password" id="oldPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>新密码：</td>
 				<td><input type="password" id="newPassword" name="password" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>确认新密码：</td>
 				<td><input type="password" id="newPassword2"  class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 		</table>
 	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>