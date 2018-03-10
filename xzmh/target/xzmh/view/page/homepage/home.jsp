<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page
	import="com.sofn.agriculture_gateway_tibet.common.handler.HostServerHandler"%>
<%
	String path = HostServerHandler.hostPath() + "/";
%>
<!DOCTYPE>
<html>
<head>
<title>国家农产品质量安全监管追溯信息网</title>
</head>
<body>
<body>
	<div>
		<!--主体 begin-->
		<div class="main_body">
			<div class="main_left">
				<!--首页轮播图 begin-->
				<div class="slide_box">
					<!--焦点图-->
					<div id="slide_content" class="slide_content"
						style="margin-right: 8px">
						<div id="slide_pic" class="slide_pic">
							<div class="slide_item" style="display: none;">
								<a href="#"> <img src="images/1.jpg" style="opacity: 1;">
								</a> <span class="shadow"> <a target="_blank" href="#"
									title="中心召开2015年度工作总结暨表彰大会">中心召开2015年度工作总结暨表彰大会</a>
								</span>
							</div>
							<div class="slide_item" style="display: none;">
								<a href="#"> <img src="images/2.jpg" style="opacity: 1;">
								</a> <span class="shadow"> <a target="_blank" href="#"
									title="成都住房公积金管理中心“廉洁承诺进大厅”摄影作品获二等奖">成都住房公积金管理中心“廉洁承诺进大厅”摄..</a>
								</span>
							</div>
							<div class="slide_item" style="display: none;">
								<a href="#"> <img src="images/3.jpg" style="opacity: 1;">
								</a> <span class="shadow"> <a target="_blank" href="#"
									title="成都住房公积金管理中心“廉洁承诺进大厅”摄影作品获二等奖">成都住房公积金管理中心“廉洁承诺进大厅”摄..</a>
								</span>
							</div>
						</div>
						<div class="slide_btn_group">
							<div class="slide_btn" id="slide_btn">
								<a href="javascript:void(0)" hidefocus="true" target="_self"
									class="current"> <i>1</i>
								</a> <a href="javascript:void(0)" hidefocus="true" target="_self"
									class=""> <i>2</i>
								</a> <a href="javascript:void(0)" hidefocus="true" target="_self"
									class=""> <i>3</i>
								</a>
								<!-- <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>4</i></a> -->
							</div>
						</div>
					</div>
					<script type="text/javascript">
						Qfast.add('widgets', {
							path : "./js/terminator2.2.min.js",
							type : "js",
							requires : [ 'fx' ]
						});
						Qfast(false, 'widgets', function() {
							K.tabs({
								id : 'slide_content', //焦点图包裹id
								conId : "slide_pic", //** 大图域包裹id
								tabId : "slide_btn",
								tabTn : "a",
								conCn : '.slide_item', //** 大图域配置class
								auto : 1, //自动播放 1或0
								effect : 'scrollLeft', //效果配置
								eType : 'click', //** 鼠标事件
								pageBt : true,//是否有按钮切换页码
								bns : [ '.prev', '.next' ],//** 前后按钮配置class
								interval : 3000
							//** 停顿时间
							})
						});
						$(".slide_item").each(
								function(index, ele) {
									if (index == 0) {
										$(this).find("a").attr("href",
												"http://www.baidu.com");
										$(this).find("img").attr("src",
												"images/1.jpg");
									} else if (index == 1) {
										$(this).find("a").attr("href",
												"http://www.360.com");
										$(this).find("a").find("img").attr(
												"src", "images/1.jpg");
									} else if (index == 2) {
										$(this).find("a").attr("href",
												"http://www.weibo.com");
										$(this).find("img").attr("src",
												"images/1.jpg");
									} else if (index == 3) {
										$(this).find("a").attr("href",
												"http://www.weibo.com");
										$(this).find("img").attr("src",
												"images/1.jpg");
									} else if (index == 4) {
										$(this).find("a").attr("href",
												"http://www.weibo.com");
										$(this).find("img").attr("src",
												"images/1.jpg");
									}
								})
					</script>
					<!--焦点图end-->
				</div>
			</div>
			<div class="main_right bg" style="height: 320px;">
				<div class="zurk">
					<div class="main-tit current-tit">农产品追溯查询</div>
					<div class="search">
						<input type="text" class="search-inp" placeholder="请输入追溯码" />
					</div>
					<button class="search-btn">
						<span style="color: #FFF; font-size: 18px;">查&nbsp;&nbsp;询</span>
					</button>

				</div>
			</div>
			<div class="clearfix"></div>
			<div class="news">
				<div class="main_left">
					<!--资讯 通知 begin-->
					<div class="info_notify" style="height: 334px">
						<div id="info" class="info">
							<!--栏目名字-->
							<div class="lm_title">
								<div class="lm_name">
									<a class="tit" href="#">新闻资讯</a> <a class="more mt20" href="#">更多>></a>
								</div>
							</div>
							<!--栏目名字 end-->
							<div class="lm_rt_content">
								<ul>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
									<li><a href="#" target="" class="wz_title"
										title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a> <span>[03-12]</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="main_right">
					<!--登录栏目 begin-->
					<div class="lst_rt " style="height: 334px">
						<!--栏目名字-->
						<div class="lm_title clearfix" style="padding-top: 20px;">
							<div class="main-tit">
								<a href="#">西藏自治区追溯平台快捷入口</a>
							</div>
						</div>
						<div class="pt_link">
							<a href="#"> <img src="images/rk1.jpg" alt="" />
							</a>
							<div class="content" style="background: #eefff5;">
								<a href="#"
									style="color: #303934; font-size: 16px; font-weight: 900;">企业追溯平台</a>
								<a href="#" style="color: #5f6c63; font-size: 12px;">企业追溯平台用于企业采集登记农产品追溯信息</a>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="pt_link">
							<a href="#"> <img src="images/rk2.jpg" alt="" />
							</a>
							<div class="content" style="background: #ebfaff;">
								<a href="#"
									style="color: #303934; font-size: 16px; font-weight: 900;">政府监管平台</a>
								<a href="#" style="color: #5f6c63; font-size: 12px;">政府监管平台用于农业主管部门监管农产品追溯情况</a>
							</div>
						</div>
						<div class="clearfix"></div>
						<!--栏目名字 end-->
						<!-- <div class="lm_rt_content">
                                <ul style="margin-left:22px;">
                                    <li>
                                        <a href="#" target="" class="wz_title" title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a>
                                        <span>[03-12]</span>
                                    </li>
                                    <li>
                                        <a href="#" target="" class="wz_title" title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a>
                                        <span>[03-12]</span>
                                    </li>
                                    <li>
                                        <a href="#" target="" class="wz_title" title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a>
                                        <span>[03-12]</span>
                                    </li>
                                    <li>
                                        <a href="#" target="" class="wz_title" title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a>
                                        <span>[03-12]</span>
                                    </li>
                                    <li>
                                        <a href="#" target="" class="wz_title" title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a>
                                        <span>[03-12]</span>
                                    </li>
                                    <li>
                                        <a href="#" target="" class="wz_title" title="猪肉需求继续疲软 3月份住家或上演一幕戏剧">猪肉需求继续疲软 3月份住家或上演一幕戏剧</a>
                                        <span>[03-12]</span>
                                    </li>
                                </ul>
                            </div> -->
					</div>
					<!--登录栏目 end-->
				</div>
			</div>
			<div class="clearfix"></div>




			<div class="show">
				<div class="main_left">
					<!--资讯 通知 begin-->
					<div class="info_notify" style="height: 372px">
						<div id="info" class="info">
							<!--栏目名字-->
							<div class="lm_title">
								<div class="lm_name">
									<a class="tit" href="#">行业动态</a> <a href="#" class="more mt20">更多>></a>
								</div>
							</div>
							<!--栏目名字 end-->
							<div class="qiye">
								<div class="qiye-item">
									<p>
										<a href="#">四川蒙顶山跃华茶业集团有限公司</a>
									</p>
									<div class="qiye-item-dl">
										<img src="images/item1.jpg" alt="" /> <span>跃华集团始建于1994年，经过十多年的传承积累，开拓奋进，现今已成为省级扶贫龙头企业</span>
									</div>
								</div>
								<div class="qiye-item">
									<p>
										<a href="#">四川蒙顶山跃华茶业集团有限公司</a>
									</p>
									<div class="qiye-item-dl">
										<img src="images/item1.jpg" alt="" /> <span>跃华集团始建于1994年，经过十多年的传承积累，开拓奋进，现今已成为省级扶贫龙头企业</span>
									</div>
								</div>
								<div class="qiye-item">
									<p>
										<a href="#">四川蒙顶山跃华茶业集团有限公司</a>
									</p>
									<div class="qiye-item-dl">
										<img src="images/item1.jpg" alt="" /> <span>跃华集团始建于1994年，经过十多年的传承积累，开拓奋进，现今已成为省级扶贫龙头企业</span>
									</div>
								</div>
								<div class="qiye-item">
									<p>
										<a href="#">四川蒙顶山跃华茶业集团有限公司</a>
									</p>
									<div class="qiye-item-dl">
										<img src="images/item1.jpg" alt="" /> <span>跃华集团始建于1994年，经过十多年的传承积累，开拓奋进，现今已成为省级扶贫龙头企业</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="main_right">
					<!--登录栏目 begin-->
					<div class="lst_rt " style="height: 372px">
						<!--栏目名字-->
						<div class="lm_title clearfix" style="padding-top: 20px;">
							<div class="main-tit">
								<a href="#">发律法规</a>
							</div>
							<a class="more" href="#">黑名单</a>
						</div>
						<!--栏目名字 end-->
						<div class="lm_rt_content">
							<ul style="margin-left: 22px;">
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
								<li class="h34"><a href="#" target="" class="wz_title"
									title="四川圣康蛋鸡养殖专业合作社">四川圣康蛋鸡养殖专业合作社</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	
</body>
</body>


</html>