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
import com.server.AddrServer;
import com.server.FuWuServer;
import com.server.SysuserServier;
import com.server.ForderServer;
import com.util.PageBean;

@Controller
public class FuWuController {
	@Resource
	private FuWuServer fuWuService;
	@Resource
	private AddrServer addrService;
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;
	
	@RequestMapping("admin/doAddFuWu.do")
	public String doAddFuWu(ModelMap map){
		map.put("adlist", addrService.getAll(null));
		Map<String,Object> umap=new HashMap<String,Object>();
		umap.put("utype", "服务员");
		map.put("ulist", userService.getAll(umap));
		return "admin/add_fuwu";
	}
//	文件上传
	public String fileUpload(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,String img){
		String path=request.getSession().getServletContext().getRealPath("upload");
		String fileName=file.getOriginalFilename();
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
			img="zanwu.jpg";	
		}
		return img;
		
	}
	@RequestMapping("admin/addFuWu.do")
	public String addFuWu(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,FuWu FuWu,String img,HttpSession session){
		System.out.println("ddddd");
		Sysuser u=(Sysuser)session.getAttribute("auser");
		System.out.println("u=-="+u);
		/*if(u==null||u.equals("")){
			return "redirect:alogin.do";
		}else{*/
		img=fileUpload(file, request, img);
		FuWu.setImg(img);
		java.sql.Timestamp time=new Timestamp(System.currentTimeMillis());
		FuWu.setPubtime(time.toString().substring(0, 19));
		FuWu.setIsdel("1");
		//FuWu.setUid(u.getUid()+"");
		fuWuService.add(FuWu);
		return "redirect:FuWuList.do";
		/*}*/
	}
	@RequestMapping("admin/doUpdateFuWu.do")
	public String doUpdateFuWu(ModelMap map,int id){
		map.put("jz", fuWuService.getById(id));
		map.put("adlist", addrService.getAll(null));
		Map<String,Object> umap=new HashMap<String,Object>();
		umap.put("utype", "服务员");
		map.put("ulist", userService.getAll(umap));
		return "admin/update_fuwu";
	}
//	服务详情
	@RequestMapping("showFuWu.do")
	public String showFuWu(ModelMap map,int id){
		map.put("jz", fuWuService.getById(id));
		Map<String,Object> umap=new HashMap<String,Object>();
		Map<String,Object> omap=new HashMap<String,Object>();
		umap.put("utype","服务员" );
		omap.put("fid",id);
		map.put("ulist",userService.getAll(umap));
		map.put("u2list",userService.getAll(null));
		map.put("olist",orderService.getAll(omap));
		map.put("adlist", addrService.getAll(null));
		return "fuwux";
	}
	@RequestMapping("admin/updateFuWu.do")
	public String updateFuWu(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,FuWu FuWu,String img){
		img=fileUpload(file, request, img);
		FuWu.setImg(img);
		fuWuService.update(FuWu);
		return "redirect:FuWuList.do";
	}
	
//	分页查询
	@RequestMapping("fFuWuList.do")
	public String showjianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String, Object>();
		pmap.put("name", null);
		cmap.put("name", null);
		int total=fuWuService.getCount(cmap);
		pageBean.setTotal(total);
		List<FuWu> list=fuWuService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("adlist", addrService.getAll(null));
		session.setAttribute("p", 1);
		return "fwlist";
	}
//	分页查询
	@RequestMapping("admin/FuWuList.do")
	public String jianList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String, Object>();
		pmap.put("name", null);
		cmap.put("name", null);
		int total=fuWuService.getCount(cmap);
		pageBean.setTotal(total);
		List<FuWu> list=fuWuService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("adlist", addrService.getAll(null));
		return "admin/list_fuwu";
	}
//   分页模糊查询
	@RequestMapping("admin/vagueFuWuList.do")
	public String vagueFuWuList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,FuWu cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
       if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
      if(cd.getFid()!=null&&!cd.getFid().equals("")){
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		int total=fuWuService.getCount(cmap);
		pageBean.setTotal(total);
		List<FuWu> list=fuWuService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("adlist", addrService.getAll(null));
		return "admin/list_fuwu";
	}
	
//  分页模糊查询
	@RequestMapping("showfuwu.do")
	public String showFuWu(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,FuWu cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
		System.out.println("name==="+cd.getName());
      if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		
		}
      if(cd.getFid()!=null&&!cd.getFid().equals("")){
   			cmap.put("fid", cd.getFid());
   			pmap.put("fid", cd.getFid());
   		}
		int total=fuWuService.getCount(cmap);
		pageBean.setTotal(total);
		List<FuWu> list=fuWuService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("adlist", addrService.getAll(null));
		return "fwlist";
	}
	
//  分页模糊查询
	@RequestMapping("selectFuWuList.do")
	public String SelectFuWu(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,FuWu cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
		System.out.println("name==="+cd.getName());
      if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		
		}
      if(cd.getFid()!=null&&!cd.getFid().equals("")){
   			cmap.put("fid", cd.getFid());
   			pmap.put("fid", cd.getFid());
   		}
	/*if(cd.getExperience()!=null&&!cd.getExperience().equals("")){
				cmap.put("experience", cd.getExperience());
				pmap.put("experience", cd.getExperience());
			} */
		int total=fuWuService.getCount(cmap);
		pageBean.setTotal(total);
		List<FuWu> list=fuWuService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("adlist", addrService.getAll(null));
		return "fwlist";
	}
	@RequestMapping("admin/deleteFuWu.do")
	public String deleteFuWu(int id){
		fuWuService.delete(id);
		return "redirect:FuWuList.do";
	}
}
