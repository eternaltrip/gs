/*
 * RestfulRequestException.java
 * @author 张光�?
 * @since 2012-9-3
 * Copyright (c) 2012, aostarit All Rights Reserved.
 * @version 2.0
 */
package com.sofn.agriculture_gateway_tibet.common.exception;

/**
 *
 * @author 张光�?
 * @since 2012-9-3
 * @version 2.0
 */
public class RestfulRequestException extends BaseException {

	private static final long serialVersionUID = 7292194304905632184L;
	
	public RestfulRequestException() {
		super();
	}

	public RestfulRequestException(String s) {
		super(s);
	}
	public RestfulRequestException(Throwable root) {
		super( root );
	}

	public RestfulRequestException(String message, Throwable root) {
		super( message, root );
	}
}
