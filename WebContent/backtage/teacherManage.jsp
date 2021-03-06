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
	
	
	function searchTeacher(){
		$("#dg").datagrid('load',{
			"teacherName":$("#s_teacherName").val(),
			"teacher_no":$("#s_teacher_no").val(),
		});
	}
	
	function deleteTeacher(){
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
				$.post("${pageContext.request.contextPath}/teacher/delete.spring",{ids:ids},function(result){
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
	
	function openTeacherAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加教师基本信息");
		url="${pageContext.request.contextPath}/teacher/save.spring";
	}
	
	
	function saveTeacher(){
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
	
	function openTeacherModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑教师信息");
		$("#teacherName").val(row.teacherName);
		$("#teacher_no").val(row.teacher_no);
		$("#sex").val(row.sex);
		$("#phone").val(row.phone);
		$("#qq").val(row.qq);
		$("#email").val(row.email);
		$("#wechat").val(row.wechat);
		$("#address").val(row.address);
		$("#webaddr").val(row.webaddr);
		$("#photo").val(row.photo);
		$("#pstatus").val(row.pstatus);
		$("#job").val(row.job);
		$("#classID").val(row.classID);
		url="${pageContext.request.contextPath}/teacher/save.spring?id="+row.id;
	}
	
	function resetValue(){
		$("#teacherName").val("");
		$("#teacher_no").val("");
		$("#sex").val("");
		$("#phone").val("");
		$("#qq").val("");
		$("#email").val("");
		$("#wechat").val("");
		$("#address").val("");
		$("#webaddr").val("");
		$("#photo").val("");
		$("#pstatus").val("");
		$("#job").val("");
		$("#classID").val("");
	}
	
	function closeTeacherDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	})
	
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="教师基本信息管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/teacher/list.spring" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="teacher_no" width="150" align="center">教师编号</th>
	 		<th field="teacherName" width="150" align="center" >姓名</th>
	 		<th field="classID" width="150" align="center">授课班级</th>
	 		<th field="sex" width="100" align="center">性别</th>
	 		<th field="phone" width="150" align="center">手机电话</th>
	 		<th field="qq" width="150" align="center">QQ</th>
	 		<th field="email" width="150" align="center">邮箱</th>
	 		<th field="wechat" width="200" align="center">微信</th>
	 		<th field="address" width="350" align="center" >地址</th>
	 		<th field="webaddr" width="250" align="center" >个人网页的地址</th>
	 		<th field="photo" width="150" align="center">个人照片</th>
	 		<th field="pstatus" width="150" align="center" >政治面貌</th>
	 		<th field="job" width="150" align="center" >任教课程</th>	 		

	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openTeacherAddDialog" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openTeacherModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteTeacher()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>

		</div>
		<div>
			&nbsp;教师姓名：&nbsp;<input type="text" id="s_teacherName" size="20" />
			&nbsp;教工编号：&nbsp;<input type="text" id="s_teacher_no" size="20" />	
			<a href="javascript:searchTeacher()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height:450px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>教师姓名：</td>
	 				<td><input type="text" id="teacherName" name="teacherName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>教工编号：</td>
	 				<td><input type="text" id="teacher_no" name="teacher_no" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>性别：</td>
	 				<td><input type="text" id="sex" name="sex" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>联系电话：</td> 
	 				<td><input type="text" id="phone" name="phone" /></td>
	 			</tr>
	 			<tr>
	 				<td>微信：</td>
 				<td><input type="text" id="wechat" name="wechat" />&nbsp;
	 				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 			</tr>
	 			<tr>
	 				<td>家庭地址：</td>
	 				<td colspan="4"><input type="text" id="address" name="address" style="width: 420px"/></td>
	 			</tr>
	 			<tr>
	 				<td>政治面貌：</td>
	 				<td><input type="text" id="pstatus" name="pstatus" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>	 			
	 			</tr>
	 			<tr>
	 				<td>上传个人照片：</td>
	 				<td><input type="file" id="photo" name="photo" /></td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveTeacher()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeTeacherDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>