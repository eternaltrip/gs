package com.sofn.agriculture_gateway_tibet.common.exception;

/**
 * 系统应用程序同步异常处理基类
 * @author 何义�?
 * @version 1.0
 * @since 2012-06-25
*/
public class SynchronizeException extends ApplicationException {
    private static final long serialVersionUID = 3114800741236140348L;
    
    public SynchronizeException(Throwable ex) {
        this.initCause(ex);
    }

    public String getLogMessage() {
        return null;
    }

    public String getWebMessage() {
        return null;
    }
}
