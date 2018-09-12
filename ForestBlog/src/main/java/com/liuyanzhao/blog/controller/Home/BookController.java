package com.liuyanzhao.blog.controller.Home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liuyanzhao.blog.entity.Books;
import com.liuyanzhao.blog.service.BookShelfService;
import com.newmodule.util.PageObject;
import com.newmodule.util.ResultJson;

@Controller
public class BookController {
	@Autowired
	private BookShelfService bookShelfService;
	@RequestMapping("/book")
	public String u() {
		return "bookshelf/book";
	}
	@RequestMapping("/home/index")
	@ResponseBody
	public ResultJson findHomeObjects(){
		//PageObject<Books> page = bookShelfService.findHome();
		ResultJson findHome = bookShelfService.findHome();
		return findHome;
	}
}
