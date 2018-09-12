package com.liuyanzhao.blog.service;

import java.util.List;

import com.liuyanzhao.blog.entity.custom.FrontUser;

public interface FrontUserService {

	List<FrontUser> findUserNameByName(String userName);

	int userRegister(FrontUser frontuser);

	FrontUser getUserName(String userName);

}
