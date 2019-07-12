package com.ischoolbar.programmer.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.Role;
import com.ischoolbar.programmer.entity.admin.Shop;
import com.ischoolbar.programmer.entity.admin.User;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.admin.RoleService;
import com.ischoolbar.programmer.service.admin.ShopService;
import com.ischoolbar.programmer.service.admin.UserService;

/**
 * 店铺管理控制器
 * @author 
 *
 */
@RequestMapping("/admin/shop")
@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;// 页面还没有
	
	/**
	 * 店铺列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		model.addObject("shopList", shopService.findList(queryMap));
		model.setViewName("shop/list");
		return model;
	}
	
	/**
	 * 查询店铺列表
	 * @param page
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(
			@RequestParam(name="shopname",required=false,defaultValue="") String shopname,Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("shopname", shopname);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", shopService.findList(queryMap));
		ret.put("total", shopService.getTotal(queryMap));
		return ret;
	}
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Shop shop){
		Map<String, String> ret = new HashMap<String, String>();
		if(shop == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的店铺信息！");
			return ret;
		}
		if(StringUtils.isEmpty(shop.getShopname())){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺名！");
			return ret;
		}
		if(shop.getAuthorname() == null){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺主人名称！");
			return ret;
		}
		if(isExist(shop.getShopname(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "该店铺名已经存在，请重新输入！");
			return ret;
		}
		if(shopService.add(shop) <= 0){
			ret.put("type", "error");
			ret.put("msg", "店铺添加失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "店铺添加成功！");
		return ret;
	}
	
	/**
	 * 编辑店铺
	 * @param shop
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Shop shop){
		Map<String, String> ret = new HashMap<String, String>();
		if(shop == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的店铺信息！");
			return ret;
		}
		if(StringUtils.isEmpty(shop.getShopname())){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺名！");
			return ret;
		}
		if(shop.getAuthorname() == null){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺主人名称！");
			return ret;
		}
		if(isExist(shop.getShopname(), shop.getId())){
			ret.put("type", "error");
			ret.put("msg", "该店铺名已经存在，请重新输入！");
			return ret;
		}
		if(shopService.edit(shop) <= 0){
			ret.put("type", "error");
			ret.put("msg", "店铺添加失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "店铺添加成功！");
		return ret;
	}
	
	/**
	 * 批量删除店铺
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(String ids){
		Map<String, String> ret = new HashMap<String, String>();
		if(StringUtils.isEmpty(ids)){
			ret.put("type", "error");
			ret.put("msg", "选择要删除的数据！");
			return ret;
		}
		if(ids.contains(",")){
			ids = ids.substring(0,ids.length()-1);
		}
		if(shopService.delete(ids) <= 0){
			ret.put("type", "error");
			ret.put("msg", "店铺删除失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "店铺删除成功！");
		return ret;
	}
	
	/**
	 * 判断该店铺名是否存在
	 * @param shopname
	 * @param id
	 * @return
	 */
	private boolean isExist(String shopname,Long id){
		Shop shop = shopService.findByShopname(shopname);
		if(shop == null)return false;
		if(shop.getId().longValue() == id.longValue())return false;
		return true;
	}
}

