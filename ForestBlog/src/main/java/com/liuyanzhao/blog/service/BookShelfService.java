package com.liuyanzhao.blog.service;

import java.util.List;

import com.liuyanzhao.blog.entity.Books;
import com.newmodule.util.PageObject;
import com.newmodule.util.ResultJson;

public interface BookShelfService {
	
	//查询所有书籍
	List<Books> findObjects();
	//查询总记录数
	int totalCount();
	//插入一本书
	int insert(Books book);
	//删除书籍一本或者多本
	int deleteObjects(Integer... ids);
	/**删除一条数据*/
	int deleteObjectOne(Integer id);
	//模糊查询
	List<Books> mohuFind(String name);
	//更新操作
	int updateObject(Books book);
	//分页查询
	PageObject<Books> findPageObjects(String name,Integer pageCurrent);
	ResultJson findHome();
	
}
