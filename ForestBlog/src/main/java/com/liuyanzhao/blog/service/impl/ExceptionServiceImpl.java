package com.liuyanzhao.blog.service.impl;

public class ExceptionServiceImpl extends RuntimeException {

	private static final long serialVersionUID = 1159378798075064030L;

	public ExceptionServiceImpl() {
	}

	public ExceptionServiceImpl(String message) {
		super(message);
	}

	public ExceptionServiceImpl(Throwable cause) {
		super(cause);
	}

	public ExceptionServiceImpl(String message, Throwable cause) {
		super(message, cause);
	}

	public ExceptionServiceImpl(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

}
