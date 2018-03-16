package com.sofn.agriculture_gateway_tibet.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sofn.agriculture_gateway_tibet.controller.BaseController.RETURN_STATE_INFO;
import com.sofn.agriculture_gateway_tibet.service.SysUserService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * 后台管理控制
 * 
 * @author Administrator
 *
 */

@Controller
@RequestMapping("/sys")
public class SysManageController extends BaseController {

	@Autowired
	private SysUserService sysUserService;

	/**
	 * 后台管理首页
	 * 
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping()
	public Object sysMainPage(ModelAndView modelAndView) {
		modelAndView.addObject("sys", "sys manage test info");
		modelAndView.setViewName("sysmanage/main");
		return modelAndView;
	}

	/**上传图片
	 * 
	 * @param request
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public Object upload(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
		
		Map<String , Object> retVal = new HashMap();
		
		// 如果文件不为空，写入上传路径
		if (!file.isEmpty()) {
			// 上传文件路径
			String path = request.getServletContext().getRealPath("/" + UPLOAD_PATH);
			String origFileName = file.getOriginalFilename().toLowerCase();
			
			File filepath = new File(path);
			
			// 判断路径是否存在，如果不存在就创建一个
			if (!filepath.exists()) {
				filepath.mkdirs();
			}
			//重新定义filename
			String fileName = System.currentTimeMillis() + origFileName.substring(origFileName.lastIndexOf("."), origFileName.length());
			
			//绝对路径
			String realPath = path + "/" + fileName;
			
			if(compressPictures(file.getInputStream() , realPath)) {
				retVal.put(RETURN_STATE, RETURN_STATE_INFO.success.name());
				retVal.put(RETURN_MESS, UPLOAD_SUCCESS );
				retVal.put("path", UPLOAD_PATH + "/" + fileName );
			}else {
				retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
				retVal.put(RETURN_MESS, UPLOAD_FAILED );
			}
			
		} else {
			retVal.put(RETURN_STATE, RETURN_STATE_INFO.failed.name());
			retVal.put(RETURN_MESS, "文件不能为空！");
		}
		return retVal;
	}
	
	
	/**压缩图片
	 * @param file 图片文件输入流
	 * @param realPath 真实路径（包括文件名）
	 * @return
	 */
	public Boolean compressPictures(InputStream file , String realPath) {
		
		try {
			Thumbnails.of(file).scale(1f).outputQuality(0.25f).toFile(realPath);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
}
