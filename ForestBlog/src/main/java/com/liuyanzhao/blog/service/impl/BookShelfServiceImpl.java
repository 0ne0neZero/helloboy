package com.liuyanzhao.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.liuyanzhao.blog.entity.Books;
import com.liuyanzhao.blog.mapper.BookShelfMapper;
import com.liuyanzhao.blog.service.BookShelfService;
import com.newmodule.util.PageObject;
import com.newmodule.util.ResultJson;
@Service //交给sprig管理
public class BookShelfServiceImpl implements BookShelfService {
	
	@Autowired//自动注入
	private BookShelfMapper bookShelfMapper;
	
	@Override
	public List<Books> findObjects() {
		List<Books> books = bookShelfMapper.findObjects();
		if(books==null)
			throw new IllegalArgumentException("没有找到书籍");
		return books;
	}
	/**模糊查询*/
	@Override
	public List<Books> mohuFind(String name) {
		List<Books> mhbook = bookShelfMapper.mohuFind(name);
		if(mhbook==null) {
			throw new IllegalArgumentException("没有找到书籍");
		}
		return mhbook;
	}
	@Override
	public int insert(Books book) {
		System.out.println(book.getImageUrl()+"service");
		if(book.getBookName()==null)
			new IllegalArgumentException("书名不能为空");
		int rows = bookShelfMapper.insert(book);
		if(rows==0)
			throw new IllegalArgumentException("添加失败");
		return rows;
	}

	@Override
	public int deleteObjects(Integer... ids) {
		System.out.println("service层的ids="+ids);
		//1.验证参数不为null者空
		if(StringUtils.isEmpty(ids))
		throw new IllegalArgumentException("请选择一个");	
		//2.执行删除操作
		int rows;
		try {
			rows=bookShelfMapper.deleteObjects(ids);
		} catch (Exception e) {
			e.printStackTrace();
			//3.发出报警信息,(例如给运维人员发短信)
			throw new ExceptionServiceImpl("系统故障,正在恢复中");
		}
		//4.对结果进行验证
		if(rows==0) {
			throw new ExceptionServiceImpl("记录可能已经不存在");
		}
		return rows;
	}

	@Override
	public int totalCount() {
		int totalCount = bookShelfMapper.totalCount();
		return totalCount;
	}

	@Override
	public int deleteObjectOne(Integer id) {
		if(StringUtils.isEmpty(id))
			throw new IllegalArgumentException("请选择一个");	
			//2.执行删除操作
			int rows;
			try {
				rows=bookShelfMapper.deleteObjectOne(id);
			} catch (Exception e) {
				e.printStackTrace();
				//3.发出报警信息,(例如给运维人员发短信)
				throw new ExceptionServiceImpl("系统故障,正在恢复中");
			}
			//4.对结果进行验证
			if(rows==0) {
				throw new ExceptionServiceImpl("记录可能已经不存在");
			}
			return rows;
	}
	//更新操作
	@Override
	public int updateObject(Books book) {
		if(book==null) {
			throw new IllegalArgumentException("对象不能为空");
		}
		if(StringUtils.isEmpty(book.getBookName())) {
			throw new IllegalArgumentException("书名不能为空");
		}
		if(StringUtils.isEmpty(book.getBookAuthor())){
			throw new IllegalArgumentException("作者不能为空");
		}
		int rows = bookShelfMapper.updateObject(book);
		if(rows==0) {
			System.out.println("此记录可能已经不存在");
		}
		return rows;
	}
	@Override
	public PageObject<Books> findPageObjects(String name, Integer pageCurrent) {
		//1.1验证pageCurrent的合法性，
		if(pageCurrent==null||pageCurrent<1){
			throw new IllegalArgumentException("当前页码不正确");
		}
		//2.基于条件查询总记录数
		//2.1) 执行查询
		int rowCount=bookShelfMapper.totalCount();
		if(rowCount==0){
			try{
				throw new com.newmodule.util.ServiceException("系统没有查到对应记录");
			}catch (com.newmodule.util.ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//3.1)定义pageSize
		int pageSize = 5;
		int startIndex = (pageCurrent-1)*pageSize;
		//3.3)执行当前数据的查询操作
		List<Books> records = 
			bookShelfMapper.findPageObjects(name, startIndex, pageSize);
		//4.对分页信息以及当前页记录进行封装
		//4.1)构建PageObject对象
		PageObject<Books> pageObject = new PageObject<>();
		pageObject.setPageCurrent(pageCurrent);//当前页
		pageObject.setPageSize(pageSize);//页面大小
		pageObject.setRowCount(rowCount);//总行数
		pageObject.setRecords(records);//详细信息
		
		return pageObject;
	}
	@Override
	public ResultJson findHome() {
		List<Books> list = bookShelfMapper.findHome();
		return new ResultJson(list);
	}
	

}
