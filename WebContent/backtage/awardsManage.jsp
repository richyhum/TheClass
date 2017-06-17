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
	
	
	function searchAwards(){
		$("#dg").datagrid('load',{
			"awardsName":$("#s_awardsName").val(),
			"students":$("#s_students").val(),
			"teachers":$("#s_teachers").val(),
		});
	}
	
	function deleteAwards(){
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
				$.post("${pageContext.request.contextPath}/awards/delete.spring",{ids:ids},function(result){
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
	
	function openAwardsAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加获奖基本信息");
		url="${pageContext.request.contextPath}/awards/save.spring";
	}
	
	
	function saveAwards(){
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
	
	function openAwardsModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑学生获奖信息");
		$("#awardsName").val(row.awardsName);
		$("#type").val(row.type);
		$("#students").val(row.students);
		$("#teachers").val(row.teachers);
		$("#department").val(row.department);
		$("#level").val(row.level);
		$("#amount").val(row.amount);
		$("#windate").val(row.windate);
		$("#memo").val(row.memo);
		$("#honor").val(row.honor);
		url="${pageContext.request.contextPath}/awards/save.spring?id="+row.id;
	}
	
	function resetValue(){
		$("#awardsName").val("");
		$("#type").val("");
		$("#students").val("");
		$("#teachers").val("");
		$("#department").val("");
		$("#level").val("");
		$("#amount").val("");
		$("#windate").val("");
		$("#memo").val("");
		$("#honor").val("");
	}
	
	function closeAwardsDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	})
	
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="学生获奖信息管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/awards/list.spring" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="awardsName" width="300" align="center" >获奖头衔</th>
	 		<th field="type" width="150" align="center">获奖类型</th>
	 		<th field="students" width="300" align="center">获奖学生</th>
	 		<th field="teachers" width="300" align="center">指导老师</th>
	 		<th field="department" width="300" align="center">发奖部门</th>
	 		<th field="level" width="150" align="center">获奖等级</th>
	 		<th field="amount" width="200" align="center">获奖数量</th>
	 		<th field="windate" width="150" align="center" >获奖日期</th>
	 		<th field="memoe" width="250" align="center" >获奖简介</th>
	 		<th field="honor" width="150" align="center">荣誉证书</th> 		

	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openAwardsAddDialog" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openAwardsModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteAwards()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>

		</div>
		<div>
			&nbsp;获奖头衔：&nbsp;<input type="text" id="s_awardsName" size="20" />
			&nbsp;获奖学生：&nbsp;<input type="text" id="s_students" size="20" />	
			&nbsp;指导老师：&nbsp;<input type="text" id="s_teachers" size="20" />
			<a href="javascript:searchAwards()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height:450px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>获奖学生：</td>
	 				<td><input type="text" id="studentName" name="studentName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>获奖头衔：</td>
	 				<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>获奖类型：</td>
	 				<td><input type="text" id="type" name="type" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>指导老师：</td> 
	 				<td><input type="text" id="teachers" name="teachers" /></td>
	 			</tr>
	 			<tr>
	 				<td>发奖部门：</td>
 				<td><input type="text" id="department" name="department" />&nbsp;
	 				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 			</tr>
	 			<tr>
	 				<td>获奖简介：</td>
	 				<td colspan="4"><input type="text" id="memo" name="memo" style="width: 420px"/></td>
	 			</tr>
	 			<tr>
	 				<td>获奖等级：</td>
	 				<td><input type="text" id="level" name="level" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>	 			
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>获奖数量：</td> 
	 				<td><input type="text" id="amount" name="amount" /></td>
	 			</tr>
	 			<tr>
	 				<td>荣誉证书：</td>
	 				<td><input type="file" id="photo" name="photo" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>获奖日期：</td> 
	 				<td><input type="text" id="windate" name="windate" /></td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveAwards()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeAwardsDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>