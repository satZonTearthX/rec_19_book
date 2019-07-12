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
 * ������Ʒ���������
 * @author Administrator
 *
 */
@RequestMapping("/admin/shopproduct")
@Controller
public class ShopproductController {
	
	@Autowired
	private ShopproductService shopproductService;
	
	
	/**
	 * ������Ʒ�б�ҳ
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("shopproduct/list");//��jsp��
		return model;
	}
	
	/**
	 * ��ѯ������Ʒ�б�
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
		User user=(User) request.getSession().getAttribute("admin");//��ȡ�����е�ǰ��¼�ĺ�̨�û�
		//System.out.println(user.getId());
		Map<String, Object> ret = new HashMap<String, Object>();//��ý���ļ�ֵ��
		Map<String, Object> queryMap = new HashMap<String, Object>();//��ѯ�����ļ�ֵ��
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
	 * ��ӵ�����Ʒ
	 * @param shopproduct
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> add(Shopproduct shopproduct){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(shopproduct == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�ĵ�����Ʒ��Ϣ");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getName())){
			ret.put("type", "error");
			ret.put("msg", "����д������Ʒ����");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getStock())){
			ret.put("type", "error");
			ret.put("msg", "����д������Ʒ���");
			return ret;
		}
		
		if(StringUtils.isEmpty(shopproduct.getPrice())){
			ret.put("type", "error");
			ret.put("msg", "����д������Ʒ�۸�");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getISBN())){
			ret.put("type", "error");
			ret.put("msg", "����д������Ʒ���к�");
			return ret;
		}
		
		if(isExist(shopproduct.getName(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "�õ�����Ʒ���Ѵ���!");
			return ret;
		}
		
		if(shopproductService.add(shopproduct) <= 0){
			ret.put("type", "error");
			ret.put("msg", "���ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ�!");
		return ret;
	}
	
	/**
	 * �༭������Ʒ
	 * @param shopproduct
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(Shopproduct shopproduct){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(shopproduct == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�ĵ�����Ʒ��Ϣ");
			return ret;
		}
		if(StringUtils.isEmpty(shopproduct.getName())){
			ret.put("type", "error");
			ret.put("msg", "����д������Ʒ����");
			return ret;
		}
		if(isExist(shopproduct.getName(), shopproduct.getId())){
			ret.put("type", "error");
			ret.put("msg", "���û����Ѵ���!");
			return ret;
		}
		if(shopproductService.edit(shopproduct) <= 0){
			ret.put("type", "error");
			ret.put("msg", "���ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "�༭�ɹ�!");
		return ret;
	}
	
	
	/**
	 * ɾ��������Ʒ
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Long id){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ��Ҫɾ������Ʒ");
			return ret;
		}
		try {
			if(shopproductService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "ɾ��ʧ�ܣ�����ϵ����Ա!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "ɾ��ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		
		ret.put("type", "success");
		ret.put("msg", "ɾ���ɹ�!");
		return ret;
	}
	
	
	/**
	 * ����û����Ƿ����
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
