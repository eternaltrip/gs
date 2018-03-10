package com.sofn.agriculture_gateway_tibet.common.exception;

/**
 * 系统应用程序运行异常处理基类
 * @author 何义�?
 * @version 1.0
 * @since 2012-06-25
*/
public abstract class ApplicationException extends Exception {
	
	private static final long serialVersionUID = 1273013356870918302L;

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

    public ApplicationException() {
        super("系统发生错误�?");
    }

    public ApplicationException(String message) {
        super(message);
    }

    public ApplicationException(Throwable cause, String message) {
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

    public abstract String getLogMessage();

    public String getMessage() {
        if(this.message == null) {
            return super.getMessage();
        } else {
            return this.message;
        }
    }

}