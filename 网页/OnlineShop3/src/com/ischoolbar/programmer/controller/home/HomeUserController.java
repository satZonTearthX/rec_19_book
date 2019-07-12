package com.ischoolbar.programmer.controller.home;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.common.Account;
import com.ischoolbar.programmer.service.common.AccountService;
import com.ischoolbar.programmer.service.common.OrderService;
import com.ischoolbar.programmer.service.common.ProductCategoryService;
import com.ischoolbar.programmer.service.common.ProductService;
import com.ischoolbar.programmer.service.home.AccimageService;
import com.ischoolbar.programmer.service.home.AddressService;
import com.ischoolbar.programmer.service.home.CartService;
import com.ischoolbar.programmer.util.MenuUtil;

/**
 * ǰ̨�û����Ŀ�����
 * @author Administrator
 *
 */
@RequestMapping("/user")
@Controller
public class HomeUserController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private ProductCategoryService productCategoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private AccimageService accimageService;
	/**
	 * �û�����ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/info",method = RequestMethod.GET)
	public ModelAndView info(ModelAndView model,HttpServletRequest request){
		model.addObject("productCategoryList", MenuUtil.getTreeCategory(productCategoryService.findList(new HashMap<String, Object>())));
		model.addObject("allCategoryId","shop_hd_menu_all_category");
		Account onlineAccount = (Account)request.getSession().getAttribute("account");
		model.addObject("user", onlineAccount);
		model.addObject("currentUser", "current_");
		model.setViewName("home/user/info");
		return model;
	}
	
	/**
	 * �޸�����ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/update_pwd",method = RequestMethod.GET)
	public ModelAndView updatePwd(ModelAndView model){
		model.addObject("productCategoryList", MenuUtil.getTreeCategory(productCategoryService.findList(new HashMap<String, Object>())));
		model.addObject("allCategoryId","shop_hd_menu_all_category");
		model.addObject("currentUser", "current_");
		model.setViewName("home/user/update_pwd");
		return model;
	}
	
	/**
	 * �޸������ύ
	 * @param password
	 * @param newPassword
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update_pwd",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> updatePassword(String password,String newPassword,
			HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		Account onlineAccount = (Account)request.getSession().getAttribute("account");
		ret.put("type", "error");
		if(StringUtils.isEmpty(password)){
			ret.put("msg", "�����벻��Ϊ�գ�");
			return ret;
		}
		if(StringUtils.isEmpty(newPassword)){
			ret.put("msg", "�����벻��Ϊ�գ�");
			return ret;
		}
		if(!onlineAccount.getPassword().equals(password)){
			ret.put("msg", "���������");
			return ret;
		}
		onlineAccount.setPassword(newPassword);
		if(accountService.edit(onlineAccount) <= 0){
			ret.put("msg", "�޸�ʧ�ܣ�����ϵ����Ա��");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	/**
	 * ��������
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/update_info",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> updateInfo(Account account,
			HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		Account onlineAccount = (Account)request.getSession().getAttribute("account");
		ret.put("type", "error");
		if(account == null){
			ret.put("msg", "����д��ȷ����Ϣ");
			return ret;
		}
		if(StringUtils.isEmpty(account.getEmail())){
			ret.put("msg", "�����ַ����Ϊ�գ�");
			return ret;
		}
		if(StringUtils.isEmpty(account.getTrueName())){
			ret.put("msg", "��ʵ��������Ϊ�գ�");
			return ret;
		}
		onlineAccount.setEmail(account.getEmail());
		onlineAccount.setTrueName(account.getTrueName());
		onlineAccount.setSex(account.getSex());
		if(accountService.edit(onlineAccount) <= 0){
			ret.put("msg", "�޸�ʧ�ܣ�����ϵ����Ա��");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	/**
	 * �µ��ɹ�չʾҳ��
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/order_success",method = RequestMethod.GET)
	public ModelAndView orderSuccess(ModelAndView model,Long orderId,HttpServletRequest request){
		model.addObject("productCategoryList", MenuUtil.getTreeCategory(productCategoryService.findList(new HashMap<String, Object>())));
		model.addObject("allCategoryId","shop_hd_menu_all_category");
		model.addObject("currentCart", "current_");
		model.addObject("order", orderService.findById(orderId));
		model.setViewName("home/cart/order_success");
		return model;
	}
	
	@RequestMapping(value = "/accimage",method = RequestMethod.POST)
	public Map<String, String> add(String select,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		ret.put("type", "error");
		if(select == null){
			ret.put("msg", "您没有选择标签");
			return ret;
		}
		Account account=(Account) request.getSession().getAttribute("account");
		if(accimageService.add(account.getId(),select)<=0){
			ret.put("msg", "标签添加失败");
			return ret;
		}
		System.out.println(account.getId());
		ret.put("type", "success");
		return ret;
	}
}
