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
	
	
	function searchWorks(){
		$("#dg").datagrid('load',{
			"studentName":$("#s_studentName").val(),
			"worksName":$("#s_worksName").val(),
			"teachers":$("#s_teachers").val(),
		});
	}
	
	function deleteWorks(){
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
				$.post("${pageContext.request.contextPath}/works/delete.spring",{ids:ids},function(result){
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
	
	function openWorksAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加学生基本信息");
		url="${pageContext.request.contextPath}/works/save.spring";
	}
	
	
	function saveWorks(){
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
	
	function openWorksModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑学生作品信息");
		$("#worksName").val(row.worksName);
		$("#type").val(row.type);
		$("#memo").val(row.memo);
		$("#startdate").val(row.startdate);
		$("#enddate").val(row.enddate);
		$("#address").val(row.address);
		$("#webaddr").val(row.webaddr);
		$("#teachers").val(row.teachers);
		url="${pageContext.request.contextPath}/works/save.spring?id="+row.id;
	}
	
	function resetValue(){
		$("#worksName").val("");
		$("#type").val("");
		$("#memo").val("");
		$("#startdate").val("");
		$("#enddate").val("");
		$("#address").val("");
		$("#webaddr").val("");
		$("#teachers").val("");
	}
	
	function closeWorksDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	})
	
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="学生作品信息管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/works/list.spring" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="worksName" width="150" align="center">作品名字</th>
	 		<th field="type" width="150" align="center" >作品类型</th>
	 		<th field="studentName" width="150" align="center">学生姓名</th>	 		
	 		<th field="startdate" width="150" align="center">开始作品日</th>
	 		<th field="enddate" width="150" align="center">作品完成日</th>
	 		<th field="webaddr" width="250" align="center" >发布网站</th>
	 		<th field="teachers" width="150" align="center">指导老师</th>
			<th field="memoe" width="300" align="center">作品简介</th>		
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openWorksAddDialog" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openWorksModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteWorks()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>

		</div>
		<div>
			&nbsp;作品名称：&nbsp;<input type="text" id="s_works" size="20" />	
			&nbsp;作者姓名：&nbsp;<input type="text" id="s_studentName" size="20" />
			&nbsp;指导老师：&nbsp;<input type="text" id="s_teachers" size="30" />				
			<a href="javascript:searchWorks()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height:450px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>作品名称：</td>
	 				<td><input type="text" id="worksName" name="worksName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>作者姓名：</td>
	 				<td><input type="text" id="student_no" name="student_no" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>作品类型：</td>
	 				<td><input type="text" id="type" name="type" /></td>
	 			</tr>
	 			<tr>
	 				<td>开始作品日：</td> 
	 					<td><input type="startdate" id="startdate" name="startdate" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>完成作品日：</td>
 						<td><input type="text" id="enddate" name="enddate" />&nbsp;
	 				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 			</tr>
	 			<tr>
	 				<td>作品简介：</td>
	 				<td colspan="4"><input type="text" id="memo" name="memoe" style="width: 420px"/></td>
	 			</tr>

	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveWorks()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeWorksDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>