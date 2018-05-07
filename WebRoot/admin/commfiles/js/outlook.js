//outlook function init
var preClassName = ""; 
function list_sub_detail(Id, jiazheng) { 
	if(preClassName != "") { 
		getObject(preClassName).className = "left_back" 
	} 
	if(getObject(Id).className == "left_back") { 
		getObject(Id).className = "left_back_onclick"; 
		outlookbar.getbyjiazheng(jiazheng); 
		preClassName = Id 
	} 
} 

function getObject(objectId) { 
	if(document.getElementById && document.getElementById(objectId)) { 
		return document.getElementById(objectId) 
	} 
	else if(document.all && document.all(objectId)) { 
		return document.all(objectId) 
	} 
	else if(document.layers && document.layers[objectId]) { 
		return document.layers[objectId] 
	} 
	else { 
		return false 
	} 
}
 
function outlook() 
{ 
	this.titlelist = new Array(); 
	this.jiazhenglist = new Array(); 
	this.addtitle = addtitle; 
	this.addjiazheng = addjiazheng; 
	this.getbytitle = getbytitle; 
	this.getbyjiazheng = getbyjiazheng; 
	this.getdefaultnav = getdefaultnav;
} 

function thejiazheng(intitle, insort, inkey, inisdefault) 
{ 
	this.sortname = insort; 
	this.key = inkey; 
	this.title = intitle; 
	this.isdefault = inisdefault; 
} 

function addtitle(intitle, sortname, inisdefault) 
{ 
	outlookbar.jiazhenglist[outlookbar.titlelist.length] = new Array(); 
	outlookbar.titlelist[outlookbar.titlelist.length] = new thejiazheng(intitle, sortname, 0, inisdefault); 
	return(outlookbar.titlelist.length - 1) 
}

function addjiazheng(intitle, parentid, inkey) 
{ 
	if(parentid >= 0 && parentid <= outlookbar.titlelist.length) 
	{
		insort = "jiazheng_" + parentid; 
		outlookbar.jiazhenglist[parentid][outlookbar.jiazhenglist[parentid].length] = new thejiazheng(intitle, insort, inkey, 0); 
		return(outlookbar.jiazhenglist[parentid].length - 1) 
	} 
	else addjiazheng = - 1 
}
 
function getdefaultnav(sortname) 
{ 
	var output = ""; 
	for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
	{ 
		if(outlookbar.titlelist[i].isdefault == 1 && outlookbar.titlelist[i].sortname == sortname) 
		{ 
			output += "<div class=list_tilte id=sub_sort_" + i + " onclick=\"hideorshow('sub_detail_"+i+"')\">"; 
			output += "<span>" + outlookbar.titlelist[i].title + "</span>"; 
			output += "</div>"; 
			output += "<div class=list_detail id=sub_detail_" + i + "><ul>"; 
			for(j = 0; j < outlookbar.jiazhenglist[i].length; j ++ ) 
			{ 
				output += "<li id=" + outlookbar.jiazhenglist[i][j].sortname + j + " onclick=\"changeframe('"+outlookbar.jiazhenglist[i][j].title+"', '"+outlookbar.titlelist[i].title+"', '"+outlookbar.jiazhenglist[i][j].key+"')\"><a href=#>" + outlookbar.jiazhenglist[i][j].title + "</a></li>" 
			} 
			output += "</ul></div>" 
		} 
	} 
	getObject('right_main_nav').innerHTML = output 
}
 
function getbytitle(sortname) 
{ 
	var output = "<ul>"; 
	for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
	{ 
		if(outlookbar.titlelist[i].sortname == sortname) 
		{ 
			output += "<li id=left_nav_" + i + " onclick=\"list_sub_detail(id, '"+outlookbar.titlelist[i].title+"')\" class=left_back>" + outlookbar.titlelist[i].title + "</li>" 
		} 
	} 

	output += "</ul>"; 
	getObject('left_main_nav').innerHTML = output 
} 

function getbyjiazheng(jiazheng) 
{ 
	var output = ""; 
	for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
	{ 
		if(outlookbar.titlelist[i].title == jiazheng) 
		{ 
			output = "<div class=list_tilte id=sub_sort_" + i + " onclick=\"hideorshow('sub_detail_"+i+"')\">"; 
			output += "<span>" + outlookbar.titlelist[i].title + "</span>"; 
			output += "</div>"; 
			output += "<div class=list_detail id=sub_detail_" + i + " style='display:block;'><ul>"; 
			for(j = 0; j < outlookbar.jiazhenglist[i].length; j ++ ) 
			{ 
				output += "<li id=" + outlookbar.jiazhenglist[i][j].sortname + "_" + j + " onclick=\"changeframe('"+outlookbar.jiazhenglist[i][j].title+"', '"+outlookbar.titlelist[i].title+"', '"+outlookbar.jiazhenglist[i][j].key+"')\"><a href=#>" + outlookbar.jiazhenglist[i][j].title + "</a></li>" 
			} 
			output += "</ul></div>" 
		} 
	} 
	getObject('right_main_nav').innerHTML = output 
} 


function changeframe(jiazheng, sortname, src) 
{ 
	if(jiazheng != "" && sortname != "") 
	{ 
		window.top.frames['mainFrame'].getObject('show_text').innerHTML = sortname + "&nbsp;&nbsp;<img src=/marnav/commfiles/images/slide.gif broder=0 />&nbsp;&nbsp;" + jiazheng 
	} 
	if(src != "") 
	{ 
		window.top.frames['manFrame'].location = src 
	} 
}
 
function hideorshow(divid) 
{ 
	subsortid = "sub_sort_" + divid.substring(11); 
	if(getObject(divid).style.display == "none") 
	{ 
		getObject(divid).style.display = "block"; 
		getObject(subsortid).className = "list_tilte" 
	} 
	else 
	{ 
		getObject(divid).style.display = "none"; 
		getObject(subsortid).className = "list_tilte_onclick" 
	} 
} 


function initinav(sortname) { 
	outlookbar.getdefaultnav(sortname); 
	outlookbar.getbytitle(sortname); 
}