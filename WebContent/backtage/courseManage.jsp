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
	
	
	function searchCourse(){
		$("#dg").datagrid('load',{
			"courseName":$("#s_courseName").val(),
			"teacherName":$("#s_teacherName").val(),
		});
	}
	
	function deleteCourse(){
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
				$.post("${pageContext.request.contextPath}/course/delete.spring",{ids:ids},function(result){
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
	
	function openCourseAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加课程基本信息");
		url="${pageContext.request.contextPath}/course/save.spring";
	}
	
	
	function saveCourse(){
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
	
	function openCourseModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑课程信息");
		$("#courseName").val(row.courseName);
		$("#hours").val(row.hours);
		$("#credit").val(row.credit);
		$("#dailyper").val(row.dailyper);
		$("#examper").val(row.examper);
		$("#syllabus").val(row.syllabus);
		$("#teachingplan").val(row.teachingplan);
		$("#courseware").val(row.courseware);
		url="${pageContext.request.contextPath}/course/save.spring?id="+row.id;
	}
	
	function resetValue(){
		$("#courseName").val("");
		$("#hours").val("");
		$("#credit").val("");
		$("#dailyper").val("");
		$("#examper").val("");
		$("#syllabus").val("");
		$("#wechat").val("");
		$("#teachingplan").val("");
		$("#courseware").val("");
	}
	
	function closeCourseDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	})
	
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="课程信息管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/course/list.spring" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="courseName" width="150" align="center">课程名称</th>
	 		<th field="hours" width="150" align="center" >总课时</th>
	 		<th field="credit" width="150" align="center">课程绩点</th>
	 		<th field="dailyper" width="300" align="center">平时成绩百分比</th>
	 		<th field="examper" width="300" align="center">期末成绩百分比</th>
	 		<th field="syllabus" width="300" align="center">教学大纲（在服务器上的地址）</th>
	 		<th field="teachingplan" width="300" align="center">授课计划（在服务器上的地址）</th>
	 		<th field="courseware" width="300" align="center">课件（在服务器上的地址）</th> 		

	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openCourseAddDialog" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openCourseModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteCourse()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>

		</div>
		<div>
			&nbsp;课程名称：&nbsp;<input type="text" id="s_courseName" size="20" />
			&nbsp;授课教师：&nbsp;<input type="text" id="s_teacherName" size="20" />	
			<a href="javascript:searchCourse()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height:450px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>课程名称：</td>
	 				<td><input type="text" id="courseName" name="courseName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>总课时：</td>
	 				<td><input type="text" id="hours" name="hours" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>课程绩点：</td>
	 				<td><input type="text" id="credit" name="credit" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>授课计划：</td> 
	 				<td><input type="text" id="teachingplan" name="teachingplan" /></td>
	 			</tr>
	 			<tr>
	 				<td>平时成绩百分比：</td>
 					<td><input type="text" id="dailyper" name="dailyper" />&nbsp;
	 				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>考试成绩百分比：</td> 
	 				<td><input type="text" id="examper" name="examper" /></td>
	 			</tr>
	 			<tr>
	 				<td>课件：</td>
 					<td><input type="text" id="courseware" name="courseware" />&nbsp;
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveCourse()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeCourseDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>