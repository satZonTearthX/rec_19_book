<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
 <link rel="stylesheet" href="../resources/home/css/shop_manager.css" type="text/css" />
 <link rel="stylesheet" href="../resources/home/css/shop_form.css" type="text/css" />
 <link rel="stylesheet" href="../resources/home/css/style.css" />
<!-- 我的个人中心 -->
	<div class="shop_member_bd clearfix">
		<%@include file="../common/user_menu.jsp"%>
		
		<!-- 右边购物列表 -->
		<div class="shop_member_bd_right clearfix">
			
			<div class="shop_meber_bd_good_lists clearfix">
				<div class="title"><h3>基本信息&nbsp&nbsp&nbsp&nbsp&nbsp完善个人信息，获得精准推荐！</h3></div>
				<div class="clear"></div>
				<div class="shop_home_form">
					<form athion="" name="" class="shop_form" method="post">
						<ul>
							<li><label>用户名称：</label>${user.name }</li>
							<li><label>电子邮件：</label><input type="text" id="email" class="email form-text" value="${user.email }" /></li>
							<li><label>真实姓名：</label><input type="text" id="true-name" class="truename form-text" value="${user.trueName }" /></li>
							<li><label>年龄：</label><input type="text" id="age" value="${user.age }" /></li>
							<li><label>性别:</label>
								<input type="radio" class="mr5" name="sex" value="0" <c:if test="${user.sex == 0 }">checked</c:if> />保密
								<input type="radio" class="ml10 mr5" name="sex" value="1" <c:if test="${user.sex == 1 }">checked</c:if> />男
								<input type="radio" class="ml10 mr5" name="sex" value="2" <c:if test="${user.sex == 2 }">checked</c:if> />女
							</li>
							<li class="bn"><label>&nbsp;</label><input type="button" onClick="editInfo()" class="form-submit" value="保存修改" /></li>
						</ul>
					</form>
				
				<div class="title"><h2 id="choosecat">选择您喜欢的类别</h2></div>
				<div id="cats" class="order-evaluation-checkbox">	
					<ul class="clearfix">
						<c:forEach items="${productCategoryList }" var="productCategory">
							<li id="cat_${productCategory.id }" class="order-evaluation-check">${productCategory.text }<i class="iconfont icon-checked"></i></li>	
						</c:forEach>
					</ul>
				</div>
				<input type="button" id="regaccimage" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
				
			</div>
			
		</div>
	
		</div>
		
		<!-- 右边购物列表 End -->

	</div>
	<div class="clear"></div>
	<%@include file="../common/footer.jsp"%>
</body>
<script>
	$(document).ready(function(){
		
	});
	function editInfo(){
		var email = $("#email").val();
		var trueName = $("#true-name").val();
		var sex = $("input[type='radio']:checked").val();
		if(email == ''){
			alert('请填写邮箱!');
			return;
		}
		if(trueName == ''){
			alert('请填写真实姓名!');
			return;
		}
		if(sex == '' || sex == null || sex == 'undefined'){
			alert('请选择性别!');
			return;
		}
		$.ajax({
			url:'update_info',
			type:'POST',
			data:{email:email,trueName:trueName,sex:sex},
			dataType:'json',
			async:false,
			success:function(data){
				if(data.type == 'success'){
					alert('更新成功!');
					//window.location.href = 'index';
				}else{
					alert(data.msg);
				}
			}
		});
	}
	var select_cat1;
	$(".order-evaluation-check").click(function(){
	    if($(this).hasClass('checked')){
	        //当前为选中状态，需要取消
	        $(this).removeClass('checked');
	        select_cat1 = select_cat1.replace(this.id.slice(4)+",", "");
	        alert(select_cat1);
	    }else{
	        //当前未选中，需要增加选中
	        $(this).addClass('checked');
	        //alert(this.id);
	        if(select_cat1!=undefined){
		       	select_cat1=select_cat1+","+this.id.slice(4);
	        }else{
	        	select_cat1=this.id.slice(4);
	        }
	        alert(select_cat1);
	    }
	});
	//提交
	$("#regaccimage").click(function(){
		
		var select1 = select_cat1;
		$.ajax({
			url:'accimage',
			type:'POST',
			data:{select:select1},
			dataType:'json',
			success:function(data){
				if(data.type == 'success'){
					
				}else{
					alert(data.msg);
				}
			}
			
		});
		alert('提交成功!');
		
	});
</script>
</html>