/**
 * @Company:中享思途   
 * @Title:UploadController.java 
 * @Author:wxinpeng   
 * @Date:2020年1月14日 下午4:21:50     
 */
package com.situ.reiz.upload.controller;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.reiz.base.MulitpartParam;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.MultipartUtils;

/** 
 * @ClassName:UploadController 
 * @Description:(上传文件处理)  
 */
@Controller
public class UploadController implements Serializable {
	private static final long serialVersionUID = 1L;

	@ResponseBody
	@RequestMapping("summerupload")
	public String doUplaod4SummerNote(MulitpartParam mulitpartParam, HttpServletRequest request) {
		//String realPath = request.getServletContext().getRealPath("/");
		String realPath = ConfigUtils.FILE_BASE_PATH;
		return MultipartUtils.writeFile(mulitpartParam.getMulitFile(), realPath);
	}

}
