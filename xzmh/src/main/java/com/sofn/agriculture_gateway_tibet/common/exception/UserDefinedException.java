package com.sofn.agriculture_gateway_tibet.common.exception;

/**
 * 系统业务逻辑接口处理异常�?
 * @author 何义�?
 * @version 1.0
 * @since 2012-06-26
*/
public class UserDefinedException extends BaseException {
  
	private static final long serialVersionUID = 3714824623267150012L;
	
    public UserDefinedException(Throwable ex, String message) {
        super(message, ex);
//    	super(ex, message);
    }
    
    public UserDefinedException(Throwable ex, int errorCode) {
//        super(ex.getMessage(), ex);
//    	super(ex,ex.getMessage());
//        setErrorCode(errorCode);
    }
    
    public UserDefinedException(String message, int errorCode) {
        super(message);
        setErrorCode(errorCode);
    }

    public UserDefinedException(String message) {
        super(message);
    }

    public String getLogMessage() {
        return this.getMessage();
    }

    public String getWebMessage() {
        return this.getMessage();
    }

}
