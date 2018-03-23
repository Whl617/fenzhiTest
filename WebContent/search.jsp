<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#mydiv {
position:absolute;
top:50%;
left:35%;
margin-lift:-200px;
margin-top:-50px;
}
.mouseOver {
 background:#708090;
 color:#FFFAFA;
}
.mouseOut {
background:#FFFAFA;
color:#000000;
}
</style>
<script type="text/javascript">
var xmlHttp;
//获得用户输入内容关联信息的函数
function getMoreContents()
{
	
	
	var content=document.getElementById("keyword");
	if(content.value =="")
	{
		clearcontent();
		retrun ;
	}
	xmlHttp=createXMLHttp();
	var url="search?keyword="+escape(content.value);
	xmlHttp.open("GET",url,true);
	//回调方法
	
	xmlHttp.onreadystatechange=callback;
	xmlHttp.send(null);
	
}
//获得XMLHTTP
function createXMLHttp()
{
	var xmlHttp;
	if(window.XMLHttpRequest)
		{
		xmlHttp=new XMLHttpRequest();
		}
	if(window.ActiveXObject)
		{
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		if(!xmlHttp)
			{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			}
		
		}
	return xmlHttp;
	
}

function callback()
{
	
	if(xmlHttp.readyState==4)
		{
		
		if(xmlHttp.status==200)
		{
			var result = xmlHttp.responseText;
		    var json = eval("("+result+")");
		    setcontents(json);
		}
		
		}
	
}
//设置关联数据
function setcontents(contents)
{
	clearcontent();
	setLocation();
	var truev=document.getElementById("keyword").value;
	var size=contents.length;
	//内容
	for(var i=0;i<size;i++)
		{
		var nextNode=contents[i];
		var tr=document.createElement("tr");
		var td=document.createElement("td");
		td.setAttribute("border","0");
		td.setAttribute("bgcolor","#FFFAFA");
		td.onmouseover=function()
		{
			
			this.className='mouseOver';
			document.getElementById("keyword").value=this.innerHTML;
		};
		
	    td.onmouseout=function()
	    {
	    	this.className='mouseOut';
	    	document.getElementById("keyword").value=truev;
	    };
	    
	   td.onclick=function()
	   {
	    	
		   document.getElementById("keyword").value=this.innerHTML;
	   };
	   
	    var text=document.createTextNode(nextNode);
	    td.appendChild(text);
	    tr.appendChild(td);
	    document.getElementById("content_table_body").appendChild(tr);
		}
}

function clearcontent()
{
	var tablebody=document.getElementById("content_table_body");
	var size=tablebody.childNodes.length;
	for(var i=size-1;i>=0;i--)
	{
		tablebody.removeChild(tablebody.childNodes[i]);
	}
	document.getElementById("popDiv").style.border="none";
}

function keywordblur()
{
	clearcontent();
}
function setLocation(){
	var content=document.getElementById("keyword");
	var width=content.offsetWidth;
	var left=content["offsetLeft"];
	var top=content["offsetTop"]+content.offsetHeight;
	var popdiv=document.getElementById("popDiv");
	popdiv.style.border="black 1px solid";
	popdiv.style.left=left+"px";
	popdiv.style.top=top+"px";
	popdiv.style.width=width+"px";
	document.getElementById("content_table").style.width=width+"px";
}
</script>

</head>
<body>

  <div id="mydiv">
<!-- 输入框 -->
    
    <input style="left:50px" type="text"  size="50" id="keyword" onkeyup="getMoreContents()" onblur="keywordblur()" onfocus="getMoreContents()" />
    <input type="button" value="百度一下" width="50px" />
<!-- 关联数据输出 -->
    <div id="popDiv">
    <table id="content_table" bgcolor="#FFFAFA" border="0" cellspacing="0" 
     cellpadding="0">
     <tbody id="content_table_body">
     <!-- 动态显示区域 -->
  
     </tbody>
     </table>
    </div>
  </div>
</body>
</html>