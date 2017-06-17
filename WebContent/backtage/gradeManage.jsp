<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

	var url;
	
	$(function(){
	
	
	function searchGrade(){
		$("#dg").datagrid('load',{
			"studentName":$("#s_studentName").val(),
			"dailygrade":$("#s_dailygrade").val(),
			"examgrade":$("#s_examgrade").val(),
			"finalgrade":$("#s_finalgrade").val(),
		});
	}
	
	function deleteGrade(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/grade/delete.spring",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
		
	}
	
	function openGradeAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加学生成绩基本信息");
		url="${pageContext.request.contextPath}/grade/save.spring";
	}
	
	
	function saveGrade(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功");
					$("#dg").datagrid("reload");
					resetValue();
					$("#dlg").dialog("close");
			//		$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败");
					return;
				}
			}
		});
	}
	
	function openGradeModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑学生信息");
		$("#dailygrade").val(row.dailygrade);
		$("#examgrade").val(row.examgrade);
		$("#finalgrade").val(row.finalgrade);
		url="${pageContext.request.contextPath}/grade/save.spring?id="+row.id;
	}
	
	function resetValue(){
		$("#dailygrade").val("");
		$("#examgrade").val("");
		$("#finalgrade").val("");
	}
	
	function closeGradeDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	})
	
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="学生成绩管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/grade/list.spring" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<!-- <th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="150" align="center">学号</th>
	 		<th field="name" width="150" align="center" >姓名</th>
	 		<th field="classID" width="150" align="center">所在班级</th>
	 		<th field="sex" width="100" align="center">性别</th>
	 		<th field="phone" width="150" align="center">手机电话</th>
	 		<th field="qq" width="150" align="center">QQ</th>
	 		<th field="email" width="150" align="center">邮箱</th>
	 		<th field="wechat" width="200" align="center">微信</th>
	 		<th field="address" width="350" align="center" >地址</th>
	 		<th field="webaddr" width="250" align="center" >个人网页的地址</th> -->
	 		<th field="dailygrade" width="150" align="center">平时成绩</th>
	 		<th field="examgrade" width="150" align="center" >考试成绩</th>
	 		<th field="finalgrade" width="150" align="center" >总成绩</th>	 		

	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openGradeAddDialog" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openGradeModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	<!--	<a href="javascript:deleteGrade()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a> -->

		</div>
		<div>
			&nbsp;学生姓名：&nbsp;<input type="text" id="s_studentName" size="20" />
			&nbsp;平时成绩：&nbsp;<input type="text" id="s_dailygrade" size="20" />	
			&nbsp;考试成绩：&nbsp;<input type="text" id="s_examgrade" size="20" />
			&nbsp;总成绩：&nbsp;<input type="text" id="s_finalgrade" size="20" />
			<a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height:450px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>学生姓名：</td>
	 				<td><input type="text" id="studentName" name="studentName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>学号：</td>
	 				<td><input type="text" id="student_no" name="student_no" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>平时成绩：</td>
	 				<td><input type="text" id="dailygrade" name="dailygrade" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>期末成绩：</td> 
	 				<td><input type="text" id="examgrade" name="examgrade" /></td>
	 			</tr>
	 			<tr>
	 				<td>总成绩：</td>
 				<td><input type="text" id="finalgrade" name="finalgrade" />&nbsp;
	 				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 			</tr>	 			
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeGradeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>