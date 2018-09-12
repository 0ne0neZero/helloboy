package com.liuyanzhao.blog.mapper.custom;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liuyanzhao.blog.entity.custom.JuZiMiDesc;

public interface JzdMapperCustom {

	void insertFirst(@Param("list") List<JuZiMiDesc> list);

}
