package com.sofn.agriculture_gateway_tibet.common.exception;

public class JspException  extends Exception {

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    protected Throwable cause;	
    
    protected String message;	//错误描述信息

    protected int errorCode;	//系统错误编码

    public void setMessage(String message) {
        this.message = message;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public JspException() {
        super("系统发生错误�?");
    }

    public JspException(String message) {
        super(message);
    }

    public JspException(Throwable cause, String message) {
        super(message);
        this.cause = cause;
    }

    public Throwable initCause(Throwable cause) {
        this.cause = cause;
        return cause;
    }

    public Throwable getCause() {
        return cause;
    }

    public String getMessage() {
        if(this.message == null) {
            return super.getMessage();
        } else {
            return this.message;
        }
    }
}
