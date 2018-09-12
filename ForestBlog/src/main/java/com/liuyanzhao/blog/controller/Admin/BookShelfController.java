package com.liuyanzhao.blog.controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.liuyanzhao.blog.entity.Books;
import com.liuyanzhao.blog.entity.BooksContainerCount;
import com.liuyanzhao.blog.service.BookShelfService;
import com.newmodule.util.PageObject;
import com.newmodule.util.ResultJson;

@Controller
public class BookShelfController {
	
	@Autowired
	private BookShelfService bookShelfService;
	@RequestMapping("/admin/bookshelf/doFindPageObjects")
	@ResponseBody
	public ResultJson doFindPageObjects(
			String name,Integer pageCurrent) {
		System.out.println("name="+name+","+"pageCurrent="+pageCurrent);
		PageObject<Books> pageObjects = 
				bookShelfService.findPageObjects(name, pageCurrent);
		
		return new ResultJson(pageObjects);
		
	}
	
	@RequestMapping(value="/admin/bookshelf",produces="text/html;charset=utf-8")
	public ModelAndView fansq(){
		
		List<Books> books = bookShelfService.findObjects();
		int totalCount = bookShelfService.totalCount();
//		List<BooksContainerCount> book = new ArrayList<>();
		BooksContainerCount bcc = new BooksContainerCount();
		bcc.setBooks(books);
		bcc.setTotalCount(totalCount);
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("books", bcc);
		mv.setViewName("Admin/bookshelf/index");
		
		return mv;
	}
	//模糊查询
	@RequestMapping(value="/admin/bookshelf/search",method = RequestMethod.POST)
	public ModelAndView mhFind(HttpServletRequest request) {
		String parameter = request.getParameter("query");
		//System.out.println("name="+parameter);
		List<Books> mohuFind = bookShelfService.mohuFind(parameter);
		System.out.println(mohuFind.toString());
		ModelAndView mv = new ModelAndView();
		mv.addObject("mhfind", mohuFind);
		mv.setViewName("Admin/bookshelf/search");
		return mv;
		
	}
	@RequestMapping(value="/admin/bookshelf/insert")
	public String insert(){
		
		return "Admin/bookshelf/insert";
	}
	@RequestMapping(value="/admin/bookshelf/insertSubmit",method = RequestMethod.POST)
	public String insertSubmit(Books book) {
		System.out.println(book.getImageUrl());
		bookShelfService.insert(book);
		return "redirect:/admin/bookshelf";//重定向时的地址要写注解定义的地址,不能写真实地址
	}
	//删除一个书籍
	@RequestMapping(value="/admin/bookshelf/doDeleteObjectOne/{id}",method = RequestMethod.POST)
	public ResultJson doDeleteObject(@PathVariable("id")Integer id) {
		bookShelfService.deleteObjectOne(id);
		return new ResultJson("delete ok");
		
	}
	//批量删除
	@RequestMapping(value="/admin/bookshelf/doDeleteObjects",method=RequestMethod.POST)
	public ResultJson doDeleteObjects(Integer... ids) {
		System.out.println(ids+"ids");
		bookShelfService.deleteObjects(ids);
		return new ResultJson("delete ok");
		
	}
	//更新书籍
	@RequestMapping(value="admin/bookshelf/doUpdateObject")
	public String updateObject(Books book) {
		System.out.println(book.getBookName());
		System.out.println(book.getImageUrl());
		int rows = bookShelfService.updateObject(book);
		return null;
		
	}
	
}
