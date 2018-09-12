package com.liuyanzhao.blog.entity;

import java.util.List;

public class BooksContainerCount {

	private Integer totalCount;
	private List<Books> books;
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public List<Books> getBooks() {
		return books;
	}
	public void setBooks(List<Books> books) {
		this.books = books;
	}
	
	

}
