package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Addr;
import com.entity.Sysuser;
import com.server.AddrServer;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class AddrController {
	@Resource
	private AddrServer AddrService;
	

	@RequestMapping("admin/addAddr.do")
	public void addAddr(Addr Addr,HttpServletResponse response){
		   Map<String, Object> map=new HashMap<String, Object>();
		   map.put("ftype", Addr.getFtype());
		   System.out.println("uname==="+AddrService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(AddrService.checkUname(map)!=null){
				 obj.put("info", "ok");
			   }else{
				   Addr addr=new Addr();
				   addr.setFtype(Addr.getFtype());
				   addr.setIsdel("1");
				   AddrService.add(addr);
				   obj.put("info", "用户名可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		   
	}
	@RequestMapping("doUpdateAddr.do")
	public String doUpdateAddr(ModelMap map,int id){
		map.put("Addr", AddrService.getById(id));
		return "admin/update_Addr.jsp";
	}
	@RequestMapping("updateAddr.do")
	public String updateAddr(Addr type){
		AddrService.update(type);
		return "redirect:admin/AddrList.do";
	}
//	分页查询
	@RequestMapping("admin/fAddrList.do")
	public String goodList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Sysuser u=(Sysuser)session.getAttribute("user");
		int total=AddrService.getCount(null);
		pageBean.setTotal(total);
		List<Addr> list=AddrService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/list_addr";
	}
//   分页模糊查询
	@RequestMapping("admin/vagueAddrList.do")
	public String vagueAddrList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Sysuser u=(Sysuser)session.getAttribute("user");
		Map amap=new HashMap();
		/*amap.put("uid", u.getId());
		pmap.put("uid", u.getId());*/
		int total=AddrService.getCount(amap);
		pageBean.setTotal(total);
		List<Addr> list=AddrService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/list_Addr.jsp";
	}
	@RequestMapping("admin/deleteAddr.do")
	public String deleteAddr(int id){
		AddrService.delete(id);
		return "redirect:fAddrList.do";
	}
}
