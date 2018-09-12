package com.liuyanzhao.blog.mapper.custom;

import java.util.List;

import com.liuyanzhao.blog.entity.custom.FrontUser;

public interface FrontUserMapperCustom {

	List<FrontUser> findUser(String userName);

	int insertUser(FrontUser frontuser);

	FrontUser selectUserPassword(String userName);

}
