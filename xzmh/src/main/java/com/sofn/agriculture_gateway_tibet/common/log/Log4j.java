package com.sofn.agriculture_gateway_tibet.common.log;

/**
 * 日志处理工厂�?
 * @author 何义�?
 * @version 1.0
 * @since 2012-06-25
*/
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public final class Log4j {
    private Log4j() {}

    private static Logger instance = null;

    /**
     * source log4j.properties
     * @return Logger
     */
    public static Logger getInstance() {
    	Logger instance = Logger.getRootLogger();
        return instance;
    }
    
    public static Logger getInstance(Class obj) {
    	Logger instance = Logger.getLogger(obj);
        return instance;
    }

    /**
     * @param properties String
     * @return Logger
     */
    public static Logger getInstance(String properties) {
        PropertyConfigurator.configure(properties);
        return instance;
    }

}
