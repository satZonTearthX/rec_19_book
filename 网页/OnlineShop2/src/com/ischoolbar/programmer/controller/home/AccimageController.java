package com.ischoolbar.programmer.controller.home;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.common.Account;
import com.ischoolbar.programmer.entity.common.Product;
import com.ischoolbar.programmer.entity.home.Favorite;
import com.ischoolbar.programmer.service.common.AccountService;
import com.ischoolbar.programmer.service.common.ProductCategoryService;
import com.ischoolbar.programmer.service.common.ProductService;
import com.ischoolbar.programmer.service.home.FavoriteService;
import com.ischoolbar.programmer.util.MenuUtil;

/**
 * ǰ̨�ղؿ�����
 * @author Administrator
 *
 */
@RequestMapping("/accimage")
@Controller
public class AccimageController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private ProductCategoryService productCategoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private FavoriteService favoriteService;
	
	/**
	 * 提交选择的标签
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Favorite favorite,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		Account onlineAccount = (Account)request.getSession().getAttribute("account");
		ret.put("type", "error");
		if(favorite == null){
			ret.put("msg", "选择正确添加的商品");
			return ret;
		}
		if(favorite.getProductId() == null){
			ret.put("msg", "请选择要添加的商品");
			return ret;
		}
		Product product = productService.findById(favorite.getProductId());
		if(product == null){
			ret.put("msg", "商品不存在！");
			return ret;
		}
		//根据商品与用户去查询该商品是否已经被添加到收藏
		Map<String, Long> queryMap = new HashMap<String, Long>();
		queryMap.put("userId", onlineAccount.getId());
		queryMap.put("productId", product.getId());
		Favorite existFavorite = favoriteService.findByIds(queryMap);
		if(existFavorite != null){
			//表示已经添加到
			ret.put("msg", "商品已被添加到收藏!");
			return ret;
		}
		favorite.setImageUrl(product.getImageUrl());
		favorite.setName(product.getName());
		favorite.setPrice(product.getPrice());
		favorite.setUserId(onlineAccount.getId());
		favorite.setCreateTime(new Date());
		if(favoriteService.add(favorite) <= 0){
			ret.put("msg", "添加失败联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
}
