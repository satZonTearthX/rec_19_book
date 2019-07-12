package com.ischoolbar.programmer.controller.home;

import java.util.ArrayList;
import java.util.Date;
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

import com.ischoolbar.programmer.entity.admin.Shop;
import com.ischoolbar.programmer.entity.common.Account;
import com.ischoolbar.programmer.entity.home.Accimage;
import com.ischoolbar.programmer.service.common.AccountService;
import com.ischoolbar.programmer.service.common.ProductCategoryService;
import com.ischoolbar.programmer.service.common.ProductService;
import com.ischoolbar.programmer.service.home.AccimageService;
import com.ischoolbar.programmer.util.MenuUtil;

/**
 * ǰ̨��ҳ������
 * @author Administrator
 *
 */
@RequestMapping("/home")
@Controller
public class IndexController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private ProductCategoryService productCategoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private AccimageService accimageService;
	
	/**
	 * ǰ̨��ҳҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public ModelAndView index(ModelAndView model){
		model.addObject("productCategoryList", MenuUtil.getTreeCategory(productCategoryService.findList(new HashMap<String, Object>())));
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 5);
		queryMap.put("orderBy", "createTime");
		queryMap.put("sort", "desc");
		model.addObject("lastProductList", productService.findList(queryMap));
		queryMap.put("orderBy", "sellNum");
		model.addObject("sellProductList", productService.findList(queryMap));
		model.addObject("allCategoryClass","shop_hd_menu_hover");
		model.addObject("currentHome", "current_");
		model.setViewName("home/index/index");
		return model;
	}
	
	/**
	 * �û���¼ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public ModelAndView login(ModelAndView model){
		model.addObject("title", "�û���¼");
		model.setViewName("home/index/login");
		return model;
	}
	
	/**
	 * �û���¼ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/register",method = RequestMethod.GET)//controller路径
	public ModelAndView register(ModelAndView model){
		model.addObject("title", "�û�ע��");
		model.addObject("productCategoryList", MenuUtil.getTreeCategory(productCategoryService.findList(new HashMap<String, Object>())));
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 5);
		queryMap.put("orderBy", "createTime");
		queryMap.put("sort", "desc");
		model.addObject("lastProductList", productService.findList(queryMap));
		queryMap.put("orderBy", "sellNum");
		model.addObject("sellProductList", productService.findList(queryMap));
		model.addObject("allCategoryClass","shop_hd_menu_hover");
		model.addObject("currentHome", "current_");
		model.setViewName("home/index/register");//jsp路径
		return model;
	}
	
	/**
	 * �ύע����Ϣ
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> register(Account account,String code,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		ret.put("type", "error");
		if(account == null){
			ret.put("msg", "����д��ȷ���û���Ϣ");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("msg", "����д�û���");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			ret.put("msg", "����д����");
			return ret;
		}
		if(StringUtils.isEmpty(account.getEmail())){
			ret.put("msg", "����д����");
			return ret;
		}
		if(StringUtils.isEmpty(code)){
			ret.put("msg", "����д��֤��");
			return ret;
		}
		Object codeObject = request.getSession().getAttribute("userRegisterCpacha");
		if(codeObject == null){
			ret.put("msg", "��֤���ѹ��ڣ���ˢ��ҳ�������!");
			return ret;
		}
		if(!code.equalsIgnoreCase((String)codeObject)){
			ret.put("msg", "��֤�����!");
			return ret;
		}
		 Account findByName = accountService.findByName(account.getName());
		if(findByName != null){
			ret.put("msg", "���û����Ѵ���!");
			return ret;
		}
		account.setStatus(1);
		account.setCreateTime(new Date());
		if(accountService.add(account) <= 0){
			ret.put("msg", "ע��ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	/**
	 * �ύע����Ϣ
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> login(Account account,String code,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		ret.put("type", "error");
		if(account == null){
			ret.put("msg", "����д��ȷ���û���Ϣ");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("msg", "����д�û���");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			ret.put("msg", "����д����");
			return ret;
		}
		if(StringUtils.isEmpty(code)){
			ret.put("msg", "����д��֤��");
			return ret;
		}
		Object codeObject = request.getSession().getAttribute("userLoginCpacha");
		if(codeObject == null){
			ret.put("msg", "��֤���ѹ��ڣ���ˢ��ҳ�������!");
			return ret;
		}
		if(!code.equalsIgnoreCase((String)codeObject)){
			ret.put("msg", "��֤�����!");
			return ret;
		}
		Account findByName = accountService.findByName(account.getName());
		if(findByName == null){
			ret.put("msg", "���û���������!");
			return ret;
		}
		if(!account.getPassword().equals(findByName.getPassword())){
			ret.put("msg", "�������!");
			return ret;
		}
		if(findByName.getStatus() == 0){
			ret.put("msg", "���û��ѱ����ᣬ����ϵ����Ա!");
			return ret;
		}
		request.getSession().setAttribute("userLoginCpacha", null);
		request.getSession().setAttribute("account", findByName);
		ret.put("type", "success");
		return ret;
	}
	@RequestMapping(value = "/accimage",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(String select,HttpServletRequest request){
		System.out.println("123456");
		System.out.println(select);
		
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
