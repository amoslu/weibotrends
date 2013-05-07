<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="weibo4j.model.User" %>
<%@ page import="weibotrends.WeiboTops" %>
<%
	User user = (User)session.getAttribute("user");
	WeiboTops wt = (WeiboTops)request.getAttribute("weiboTops");
	String userId = null;
	String screenName = null;
	if (user!=null){
		userId = user.getId();
		screenName = user.getName();
	}else if (wt!=null && wt.getUserConfig().getAccessToken()!=null){
		userId = wt.getUserConfig().getUserId();
		screenName = wt.getUserConfig().getName();
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width" />

<title>微博趋势 - 最新热点
<%
	if (screenName!=null){
		out.println(" - " + screenName);
	}
%>
</title> 
<link rel="shortcut icon" href="/favicon.ico" />
<link rel="apple-touch-icon" href="apple-touch-icon.png" />
<link rel="alternate" type="application/rss+xml" title="RSS"href="/weibotops?m=rss<%=userId==null?"":"&userId="+userId %>" />
 
<link href="/css/base.css" rel="stylesheet" type="text/css" /> 
<link href="/css/skin_default/skin.css" rel="stylesheet" type="text/css" /> 
<link href="/css/mobi_friendly.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 9]>
　<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->


    
</head> 
<body id="home" class="own"> 
	<div id="wrapper"> 
    	<div class="wrapper-in"> 
			<!-- header --> 
			<div id="header"> 
				<div class="nav"> 
					<div class="inner-nav" id="xwbInnerNav"> 
						<span class="defined-link"> 
							<a target="_blank" href="http://weibo.com/">新浪微博</a> 
							| <a target="_blank" href="http://weiba.weibo.com/">微吧</a> 
							| <a target="_blank" href="http://q.weibo.com/">微群</a> 
						</span> 
						<div class="nav-right"> 

							<form class="search-box skin-bg" onsubmit="return false" id="xwb_search_form"> 
								<input class="search-btn skin-bg" type="submit" value="" id="xwb_trig"/> 
								<input class="search-input"  type="text" value="搜索微博/找人"  id="xwb_inputor"/> 
							</form>

							<span class="user-link"> 
							<%
							if (user!=null){
							%>
								<a  href="http://weibo.com/<%=user.getId()%>" target="_blank"><%=user.getName()%></a> 
								| <a href="/weibotops?m=logout">退出</a> 
							<%
							}else{
							%>
							<a href="/weibotops?m=login">登录</a> 
							<%
							}
							%>
							</span> 
						</div> 
					</div> 
					<div class="nav-bg"></div> 
				</div> 
			 
				<div class="inner-header"> 
					<a class="logo" href="/index.php?m=pub">
					  <!--<img id="logo" src="/var/data/logo/default_logo.png"/>-->
					  <img id="logo" width="140px" src="/weibo.png"/>
					</a> 
			 
					<div class="menu"> 
						<ul> 
							<li><a hideFocus="true" class="menu-pub" href="http://hot.weibo.com/" target="_blank">微博广场</a></li> 
							<li><a hideFocus="true" class="menu-user" href="http://weibo.com/" target="_blank">微博首页</a></li> 
							<li><a hideFocus="true" class="menu-home" href="/weibotops?m=list">最新热推</a></li> 
							<%
							if(user!=null){
							%>
							<li><a hideFocus="true" class="menu-weibo" href="http://weibo.com/<%=user.getId()%>/profile" target="_blank">我的微博</a></li> 
							<%
							}else{
							%>
							<li><a hideFocus="true" class="menu-weibo" href="/weibotops?m=login" >微博登录</a></li> 
							<%
							}
							%>
						</ul> 
						<div class="menu-bg skin-bg"></div> 
						<div class="menu-arrow skin-bg"></div> 
					</div> 
				</div>  
			</div> 
			<!-- end header --> 
			
			<div id="container"> 
				<div class="sidebar"> 
				<%
					if (user!=null){
				%>
					<div class="user-preview"> 
						<div class="user-info"> 
							<a class="user-pic" href="http://weibo.com/<%=user.getId()%>" target="_blank">
								<img src="<%=user.getProfileImageUrl()%>" title="<%=user.getName()%>" /></a> 
							<div class="user-intro"> 
								<strong><%=user.getName()%></strong> 
								<p class="icon-bg icon-male"><%=user.getLocation()%></p> 
							</div> 
						</div> 
						<p><%=user.getDescription()%></p> 
					</div>  
				<%
					}
				%>
  					<div class="user-sidebar"> 
						<div class="sidebar-head">敬请关注</div> 
						<ul> 
							<li> 
								<a href="http://weibo.com/1862386965" title="微博趋势"  target="_blank">
									<img src="http://tp2.sinaimg.cn/1862386965/50/1296452915/1" alt="微博趋势" title="你们有相同的话题" /></a> 
								<p><a href="http://weibo.com/1862386965" target="_blank">微博趋势</a></p> 
								<!-- a class="sub-link" rel="e:fl,u:1862386965,t:2" href="#">关注他</a  --> 
							</li> 
						</ul>
						<p>
							<img src="/mobile-friendly.jpg" width="148" height="105" alt="Mobile friendly." title="本网站使用移动终端也能正常浏览"></img>
						</p>
						<p>&nbsp;</p>
						<p>
							<a href="/weibotops?m=rss<%=userId==null?"":"&userId="+userId %>"><img src="/rss_button.gif" border="0" title="RSS" alt="RSS"></img></a>
						</p>
					</div> 
				</div> 
				
				<div class="main"> 


<%
	response.flushBuffer();
	String m = request.getParameter("m");
	if ("config".equals(m) || "saveConfig".equals(m)) {
%>
	<jsp:include page="_rt_config.jsp"></jsp:include>
<%
	}else {
%>
	<jsp:include page="_list.jsp"></jsp:include>
<%
	}
%>						
				</div> 
			</div> 
			
			<!-- footer --> 
			<div id="footer"> 
				<div class="ft-in"> 
					<div class="footer-defined"> 
						<em class="site-name">微博趋势</em> 
						意见反馈
						| 帮助中心
					</div> 
					<img src="https://developers.google.com/appengine/images/appengine-noborder-120x30.gif" 
					alt="Powered by Google App Engine" />
				</div> 
			</div> 
			<!-- end footer --> 
		</div> 
	</div> 

</body> 
</html> 
