package com.sofn.agriculture_gateway_tibet.common.util;

import java.io.UnsupportedEncodingException;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class JavaXmlConvertUtil {
	
	public static String javaConvertXML(Object obj){
		XStream xstream = new XStream();
		String xml = xstream.toXML(obj); 
		try {
			xml = new String(Base64Util.encode(xml.getBytes()),"utf-8");
			//xml = xml.replaceAll("/", "-");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return xml.toString();
	}
	
	public static Object xmlConvertJava(String xml){
		XStream xstream = new XStream(new DomDriver());
		String xmlObj = "";
		try {
			//xml = xml.replaceAll("-", "/");
			xmlObj = new String(Base64Util.decode(xml),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return  xstream.fromXML(xmlObj);
	}

	/**
	 * @param args
	 */
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
////		System.out.println("将Java对象转换为xml！\n"); 
//		ResourceParams param = new ResourceParams();
//		param.setObjId(1111l);
//		
//		Function fun = new Function();
//		fun.setBusiCode("UAP-CODE");
//		param.setFunction(fun);
//		
////        XStream xstream = new XStream();
////        xstream.alias("ResourceParams", ResourceParams.class); 
////        String xml = xstream.toXML(param); 
//		String xml = JavaXmlConvertUtil.javaConvertXML(param);
//        System.out.println(xml); 
//        byte[] b = xml.getBytes();
//        ResourceParams obj = (ResourceParams)JavaXmlConvertUtil.xmlConvertJava(new String(b));
//        
//        obj.getBusiCode();
////        System.out.println("\n将xml转换为Java对象�??"); 
////        ResourceParams paramBean = (ResourceParams) xstream.fromXML(xml); 
////        System.out.println(paramBean); 
//	}

}
