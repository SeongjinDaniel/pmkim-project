<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.Base64"%>

<html>
<head>
   	<title>Rserve</title>
    <script src="/redu/resources/wordcloud2/htmlwidgets-0.8/htmlwidgets.js?ver=2"></script>
	<link href="/redu/resources/wordcloud2/wordcloud2-0.0.1/wordcloud.css" rel="stylesheet" />
	<script src="/redu/resources/wordcloud2/wordcloud2-0.0.1/wordcloud2-all.js"></script>
	<script src="/redu/resources/wordcloud2/wordcloud2-0.0.1/hover.js"></script>
	<script src="/redu/resources/wordcloud2/wordcloud2-binding-0.2.0/wordcloud2.js?ver=2"></script>	
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<h1>WordCloud2 시각화 결과 표현하기</h1> 
<hr>
${ cu_html }
<hr>
<%
if(request.getAttribute("img_content") != null) {		
	byte src[] = (byte[])request.getAttribute("img_content");
%>
	<img src="
	   data:image/png;base64, <%= Base64.getEncoder().encodeToString(src) %>"
	   width="500" height="400">
<%
} 
%>	


</body>
</html> 
