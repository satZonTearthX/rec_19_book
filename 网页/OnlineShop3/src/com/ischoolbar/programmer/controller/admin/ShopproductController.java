 package com.ischoolbar.programmer.controller.admin;

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
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.User;
import com.ischoolbar.programmer.entity.common.Shopproduct;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.common.ShopproductService;

/**
 * 店铺商品管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/shopproduct")
@Controller
public class ShopproductController {
	
	@Autowired
	private ShopproductService shopproductService;
	
	
	/**
	 * 店铺商品列表页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("shopproduct/list");//和jsp连
		return model;
	}
	
	/**
	 * 查询店铺商品列表
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(@RequestParam(name="name",defaultValue="")String name,
			@RequestParam(name="stock",defaultValue="")Integer stock,
			@RequestParam(name="price",defaultValue="")String price,
			@RequestParam(name="isbn",defaultValue="")String isbn,
				Page page,HttpServletRequest request  //
			){
		User user=(User) request.getSession().getAttribute("admin");//获取缓冲中当前登录的后台用户
		//System.out.println(user.getId());
		Map<String, Object> ret = new HashMap<String, Object>();//获得结果的键值对
		Map<String, Object> queryMap = new HashMap<String, Object>();//查询条件的键值对
		queryMap.put("shopid",user.getId());//
		queryMap.put("name", name);
		queryMap.put("stock", stock);
		queryMap.put("price", price);
		queryMap.put("isbn", isbn);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", shopproductService.findList(queryMap));
		ret.put("total", shopproductService.getTotal(queryMap));
		return ret;
	}
	
	
	/**
	 * 添加店铺商品
	 * @param shopproduct
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> add(Shopproduct shopproduct){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(shopproduct == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的店铺商品信息");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺商品名称");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getStock())){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺商品库存");
			return ret;
		}
		
		if(StringUtils.isEmpty(shopproduct.getPrice())){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺商品价格");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getISBN())){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺商品序列号");
			return ret;
		}
		
		if(isExist(shopproduct.getName(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "该店铺商品名已存在!");
			return ret;
		}
		
		if(shopproductService.add(shopproduct) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 编辑店铺商品
	 * @param shopproduct
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(Shopproduct shopproduct){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(shopproduct == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的店铺商品信息");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写店铺商品名称");
			return ret;
		}
		if(isExist(shopproduct.getName(), shopproduct.getId())){
			ret.put("type", "error");
			ret.put("msg", "该用户名已存在!");
			return ret;
		}
		if(shopproductService.edit(shopproduct) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "编辑成功!");
		return ret;
	}
	
	
	/**
	 * 删除店铺商品
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Long id){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "请选择要删除的商品");
			return ret;
		}
		try {
			if(shopproductService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "删除失败，请联系管理员!");
			return ret;
		}
		
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
	
	
	/**
	 * 检查用户名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	private boolean isExist(String name,Long id){
		Shopproduct shopproduct = shopproductService.findByName(name);
		if(shopproduct == null)return false;
		if(shopproduct.getId().longValue() == id.longValue())return false;
		return true;
	}
}
