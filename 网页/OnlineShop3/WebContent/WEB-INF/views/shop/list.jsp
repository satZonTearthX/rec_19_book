<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        <div class="wu-toolbar-search">
            <label>店铺名:</label><input id="search-name" class="wu-text" style="width:100px">
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td width="60" align="right">店铺名:</td>
                <td><input type="text" name="shopname" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺主人名:</td>
                <td><input type="text" name="username" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺主人名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺主人ID:</td>
                <td><input type="text" name="user_id" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺主人ID'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺电话:</td>
                <td><input type="text" name="telephone" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺电话'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺位置:</td>
                <td><input type="text" name="position" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺位置'" /></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
            <tr>
                <td width="60" align="right">店铺名:</td>
                <td><input type="text" id="edit-shopname" name="shopname" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺主人名:</td>
                <td><input type="text" id="edit-username" name="username" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺主人名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺主人ID:</td>
                <td><input type="text" name="user_id" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺主人ID'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺电话:</td>
                <td><input type="text" name="telephone" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺电话'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">店铺位置:</td>
                <td><input type="text" name="position" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写店铺位置'" /></td>
            </tr>
        </table>
    </form>
<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
<script type="text/javascript">

	/**
	*  添加记录
	*/
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','添加成功！','info');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 修改记录
	*/
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelections');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				var ids = '';
				for(var i=0;i<item.length;i++){
					ids += item[i].id + ',';
				}
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{ids:ids},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加店铺信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            }
        });
	}
	
	/**
	* 打开修改窗口
	*/
	function openEdit(){
		//$('#edit-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		if(item.length > 1){
			$.messager.alert('信息提示','请选择一条数据进行修改！','info');
			return;
		}
		item = item[0];
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "修改店铺信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#edit-id").val(item.id);
            	$("#edit-shopname").val(item.shopname);
            	$("#edit-username").val(item.username);
            	$("#edit-user_id").val(item.user_id);
            	$("#edit-telephone").val(item.telephone);
            	$("#edit-position").val(item.position);
            	
            }
        });
	}	
	
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {shopname:$("#search-name").val()};
		$('#data-datagrid').datagrid('reload',option);
	});
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:true,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'shopname',title:'店铺名称',width:180,sortable:true},
			{ field:'username',title:'店铺主人名称',width:180,sortable:true},
			{ field:'user_id',title:'店铺主人ID',width:180,sortable:true},
			{ field:'telephone',title:'店铺电话',width:180,sortable:true},
			{ field:'position',title:'店铺位置',width:180,sortable:true},
			/* { field:'createTime',title:'注册时间',width:200,formatter:function(value,index,row){
				return format(value);
			}}, */
		]]
	});
</script>