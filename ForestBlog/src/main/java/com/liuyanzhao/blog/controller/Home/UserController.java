package com.liuyanzhao.blog.controller.Home;

import com.liuyanzhao.blog.entity.custom.FrontUser;
import com.liuyanzhao.blog.service.FrontUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import com.newmodule.util.ResultJson;
@Controller
public class UserController {
	
	@Autowired
	private FrontUserService frontUserService;

	@RequestMapping("/user/{userName}")
	@ResponseBody
	public ResultJson getUser(@PathVariable("userName") String userName){
		System.out.println(userName);
		FrontUser frontUser = frontUserService.getUserName(userName);
		
		return new ResultJson(frontUser);
	}

	//输入用户名后失去焦点时的验证
	@RequestMapping("/findUserNameByName/{zcname}")
	@ResponseBody
	public ResultJson getUserName(@PathVariable("zcname") String userName){
		
		List<FrontUser> list = frontUserService.findUserNameByName(userName);
		if(list.size()==0) {
			return new ResultJson("此用户名未被注册");
		}else {
			
			return new ResultJson("用户名已存在");
		}
		
	}
	//注册
	@RequestMapping("/zcregister")
	@ResponseBody
	public ResultJson register(@RequestBody FrontUser frontuser) {

		//System.out.println(frontuser.getUserName());
		//System.out.println(frontuser.getPassword());
		int num = frontUserService.userRegister(frontuser);
		if(num != 1) {
			return new ResultJson("注册失败!请重试");
		}
		return new ResultJson("注册成功!");
		
	}
}
