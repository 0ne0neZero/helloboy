package com.liuyanzhao.blog.entity.custom;


import com.liuyanzhao.blog.util.others.Page;

import java.util.List;

/**
 * 用于封装搜索的文章列表，包括文章信息，作者信息，分类信息，标签信息，搜索信息
 * Created by 言曌 on 2017/8/24.
 */
public class ArticleSearchVo {
	//文章信息
	private ArticleCustom articleCustom;
	
	//文章对应的分类
	private List<CategoryCustom> categoryCustomList;
	
	//文章对应的标签
	private List<TagCustom> tagCustomList;

	//作者信息
	private UserCustom userCustom;

	//文章分页信息
	private Page page;

	//搜索关键词
	private String query;

	public String getQuery() {
		return query;
	}

	public UserCustom getUserCustom() {
		return userCustom;
	}

	public void setUserCustom(UserCustom userCustom) {
		this.userCustom = userCustom;
	}

	public void setQuery(String query) {
		this.query = query;
	}


	public ArticleCustom getArticleCustom() {
		return articleCustom;
	}
	
	public void setArticleCustom(ArticleCustom articleCustom) {
		this.articleCustom = articleCustom;
	}

	public List<CategoryCustom> getCategoryCustomList() {
		return categoryCustomList;
	}

	public void setCategoryCustomList(List<CategoryCustom> categoryCustomList) {
		this.categoryCustomList = categoryCustomList;
	}

	public List<TagCustom> getTagCustomList() {
		return tagCustomList;
	}

	public void setTagCustomList(List<TagCustom> tagCustomList) {
		this.tagCustomList = tagCustomList;
	}

	public Page getPage() {
		return page;
	}
	
	public void setPage(Page page) {
		this.page = page;
	}
}
