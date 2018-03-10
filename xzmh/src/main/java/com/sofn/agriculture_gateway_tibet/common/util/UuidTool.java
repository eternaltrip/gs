package com.sofn.agriculture_gateway_tibet.common.util;

import java.util.UUID;

public class UuidTool {
	
	public String uuid;

	public String getUuid() {
		uuid = UUID.randomUUID().toString().replace("-", "");  
		return uuid;
	}
}
