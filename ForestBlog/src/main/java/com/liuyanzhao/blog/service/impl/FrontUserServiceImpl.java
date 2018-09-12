package com.liuyanzhao.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liuyanzhao.blog.entity.custom.FrontUser;
import com.liuyanzhao.blog.mapper.custom.FrontUserMapperCustom;
import com.liuyanzhao.blog.service.FrontUserService;
@Service
public class FrontUserServiceImpl implements FrontUserService {
	
	@Autowired
	private FrontUserMapperCustom frontUserMapper;
	
	@Override
	public List<FrontUser> findUserNameByName(String userName) {
		
		List<FrontUser> list = frontUserMapper.findUser(userName);
		return list;
	}

	@Override
	public int userRegister(FrontUser frontuser) {
		int num = frontUserMapper.insertUser(frontuser);
		return num;
	}

	@Override
	public FrontUser getUserName(String userName) {
		FrontUser frontUser = frontUserMapper.selectUserPassword(userName);
		return frontUser;
	}

}
