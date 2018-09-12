package com.liuyanzhao.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.liuyanzhao.blog.entity.Books;

public interface BookShelfMapper {
	/**查询所有数据*/
	List<Books> findObjects();
	/**添加数据*/
	int insert(Books book);
	/**查询总记录数*/
	int totalCount();
	/**删除数据*/
	int deleteObjects(@Param("ids")Integer... ids);
	/**删除一条数据*/
	int deleteObjectOne(Integer id);
	/**模糊查询 */
	List<Books> mohuFind(@Param("name") String name);
	/**更新操作*/
	int updateObject(Books book);
	/**分页查询*/
	List<Books> findPageObjects(
			@Param("name")String name,
			@Param("startIndex")Integer startIndex,
			@Param("pageSize")Integer pageSize);
	List<Books> findHome();
	
}
