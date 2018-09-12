package com.liuyanzhao.blog.entity;

import java.io.Serializable;
import java.util.Date;

public class Books implements Serializable {
	
	private static final long serialVersionUID = -2764127732965551486L;
	
	private Integer bookId;
	private String bookName;
	private String bookAuthor;
	private Date bookPostTime;
	private String imageUrl;


	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}


	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public Date getBookPostTime() {
		return bookPostTime;
	}

	public void setBookPostTime(Date bookPostTime) {
		this.bookPostTime = bookPostTime;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}
	
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "Books [bookId=" + bookId + ", bookName=" + bookName + ", bookAuthor=" + bookAuthor + ", bookPostTime="
				+ bookPostTime + ", imageUrl=" + imageUrl + "]";
	}

	
}
