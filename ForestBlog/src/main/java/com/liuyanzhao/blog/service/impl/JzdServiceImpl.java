package com.liuyanzhao.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liuyanzhao.blog.entity.custom.JuZiMiDesc;
import com.liuyanzhao.blog.mapper.custom.JzdMapperCustom;
import com.liuyanzhao.blog.service.JzdService;
@Service
public class JzdServiceImpl implements JzdService {
	
	@Autowired
	private JzdMapperCustom jzdMapper;

	@Override
	public void insertJZD(List<JuZiMiDesc> list) {
		
		jzdMapper.insertFirst(list);
		
	}

}
