package com.controller;

import java.io.File;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.FuWu;
import com.entity.Sysuser;
import com.entity.Forder;
import com.server.ForderServer;
import com.server.FuWuServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class ForderController {
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;
	@Resource
	private FuWuServer jzService;
	

//	文件上传
	public String fileUpload(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,String img){
		String path=request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path==="+path);
		System.out.println("file==="+file);
		String fileName=file.getOriginalFilename();
		System.out.println("fileName==="+fileName);
		File targetFile=new File(path,fileName);
		if(!targetFile.exists()){
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String pa=request.getContextPath()+"/upload/"+fileName;
		System.out.println("path==="+pa);
		if(fileName!=null&&!fileName.equals("")){
			img=fileName;
		}else{
			img=null;	
		}
		
		return img;
		
	}
//	预约
	@RequestMapping("addForder.do")
	public String addForder(HttpServletRequest request,Forder yp,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("user");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "redirect:showIndex.do";
		}else{
			yp.setUid(u.getUid());
			yp.setStatus("未完成");
			yp.setIsdel("1");
			yp.setPubtime(time.toString().substring(0, 19));
			orderService.add(yp);
			return "success";
		}

	}

	@RequestMapping("admin/updateForder.do")
	public String updateForder(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,Forder yp,String img){
		
		img=fileUpload(file, request, img);
		/*yp.setImg(img);*/
		orderService.update(yp);
		return "redirect:jianSList.do";
	}
//	分页查询
	@RequestMapping("admin/jianSList.do")
	public String jianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("name", null);
		int total=orderService.getCount(null);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/list_yp";
	}
//	分页查询个人订单信息
	@RequestMapping("showQiuZ.do")
	public String fjianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null||u.equals("")){
			return "redirect:showIndex.do";
		}else{
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> umap=new HashMap<String,Object>();
		Map<String, Object> fmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("uid", u.getUid());
		umap.put("uid", u.getUid());
		fmap.put("utype", "服务员");
		int total=orderService.getCount(umap);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("fwlist", jzService.getAll(null));
		map.put("ulist", userService.getAll(fmap));
		return "myorderlist";
		}
	}
//   分页查询
	@RequestMapping("admin/ForderList.do")
	public String ForderList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Forder yp){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		int total=orderService.getCount(null);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		List<Sysuser> ulist=userService.getAll(null);
		List<FuWu> jzlist=jzService.getAll(null);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("ulist", ulist);
		map.put("jzlist", jzlist);
		session.setAttribute("p", 1);
		return "admin/list_yp";
	}
//	完成
	@RequestMapping("wancheng.do")
	public String luQu(int id,Forder yp){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		yp.setStatus("完成");
		yp.setKid(id);
		yp.setEtime(time.toString().substring(0, 19));
		orderService.update(yp);
		return "success";
	}
//	处理评价
	@RequestMapping("doAddpj.do")
	public String doAddpj(int id,ModelMap map){
		map.put("order", orderService.getById(id));
		return "pj";
	}
//	评价
	@RequestMapping("addpj.do")
	public String addpj(ModelMap map,Forder order){
		order.setStatus("已评价");
		orderService.update(order);
		return "success";
	}
	@RequestMapping("admin/deleteForder.do")
	public String deleteForder(int id){
		orderService.delete(id);
		return "redirect:jianSList.do";
	}
}
