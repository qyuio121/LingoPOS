﻿package com.kosmo.lingopos;

public class PagingUtil {

	public static String pagingBootStrapStyle(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page){
		
		String pagingStr="<nav class=\"text-center\"><ul class=\"pagination\" >";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage=1'>\r\n" + 
					"<span class=\"glyphicon glyphicon-fast-backward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li >\r\n" + 
					"<a href='"+page+"nowPage="+(intTemp -blockPage)+"' >\r\n" + 
					"<span class=\"glyphicon glyphicon-backward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>";   
			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<li><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
			}
		     else
		    	 pagingStr+="<li><a href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a></li>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage="+intTemp+"'>\r\n" + 
					"<span class=\"glyphicon glyphicon-forward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li>\r\n" + 
					"<a href='"+page+"nowPage="+totalPage+"' >\r\n" + 
					"<span class=\"glyphicon glyphicon-fast-forward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>";
							   
		}
		pagingStr+="</ul></nav>";
		return pagingStr;
	}
	public static String pagingBootStrapStyleSearch(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page,String searchColumn,String searchWord){
		
		String pagingStr="<nav class=\"text-center\"><ul class=\"pagination\" >";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage=1"+"&searchColumn="+searchColumn+"&searchWord="+searchWord+"'>\r\n" + 
					"<span class=\"glyphicon glyphicon-fast-backward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li >\r\n" + 
					"<a href='"+page+"nowPage="+(intTemp -blockPage)+"&searchColumn="+searchColumn+"&searchWord="+searchWord+"' >\r\n" + 
					"<span class=\"glyphicon glyphicon-backward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>";   
			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<li><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
			}
		     else
		    	 pagingStr+="<li><a href='"+page+"nowPage="+intTemp+"&searchColumn="+searchColumn+"&searchWord="+searchWord+"'>"+intTemp+"</a></li>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage="+intTemp+"&searchColumn="+searchColumn+"&searchWord="+searchWord+"'>\r\n" + 
					"<span class=\"glyphicon glyphicon-forward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li>\r\n" + 
					"<a href='"+page+"nowPage="+totalPage+"&searchColumn="+searchColumn+"&searchWord="+searchWord+"' >\r\n" + 
					"<span class=\"glyphicon glyphicon-fast-forward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>";
							   
		}
		pagingStr+="</ul></nav>";
		return pagingStr;
	}
public static String pagingBootStrapStyleReview(int totalRecordCount,int pageSize,int blockPage,int nowPage){
		
		String pagingStr="<nav class=\"text-center\"><ul class=\"pagination\" >";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
			pagingStr+="<li>\r\n" + 
					"<a href='#' onclick='getReview(1)' title='1'>\r\n" + 
					"<span class=\"glyphicon glyphicon-fast-backward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li >\r\n" + 
					"<a href='#' onclick='getReview("+(intTemp -blockPage)+")' title='"+(intTemp -blockPage)+"'>\r\n" + 
					"<span class=\"glyphicon glyphicon-backward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>";   
			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<li><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
			}
		     else
		    	 pagingStr+="<li><a href='#' onclick='getReview("+intTemp+")' title='"+intTemp+"'>"+intTemp+"</a></li>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="<li>\r\n" + 
					"<a href='#' onclick='getReview("+intTemp+")' title='"+intTemp+"'>\r\n" + 
					"<span class=\"glyphicon glyphicon-forward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li>\r\n" + 
					"<a href='#' onclick='getReview("+totalPage+")' title='"+totalPage+"' >\r\n" + 
					"<span class=\"glyphicon glyphicon-fast-forward\"></span>\r\n" + 
					"</a>\r\n" + 
					"</li>";
							   
		}
		pagingStr+="</ul></nav>";
		return pagingStr;
	}
public static String pagingBootStrapStyleReviewSearch(int totalRecordCount,int pageSize,int blockPage,int nowPage,String searchColumn,String searchWord){
	
	String pagingStr="<nav class=\"text-center\"><ul class=\"pagination\" >";
	
	//1.전체 페이지 구하기
	int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
	
	int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

	//처음 및 이전을 위한 로직
	if(intTemp != 1){
		pagingStr+="<li>\r\n" + 
				"<a href='#' onclick='getReviewSearch(1,\""+searchColumn+"\",\""+searchWord+"\") title='1'>\r\n" + 
				"<span class=\"glyphicon glyphicon-fast-backward\"></span>\r\n" + 
				"</a>\r\n" + 
				"</li>\r\n" + 
				"<li >\r\n" + 
				"<a href='#' onclick='getReviewSearch("+(intTemp -blockPage)+",\""+searchColumn+"\",\""+searchWord+"\"))' title='"+(intTemp -blockPage)+"'>\r\n" + 
				"<span class=\"glyphicon glyphicon-backward\"></span>\r\n" + 
				"</a>\r\n" + 
				"</li>";   
		
	}
	
	//페이지 표시 제어를 위한 변수
	int blockCount = 1;
	
	//페이지를 뿌려주는 로직
	//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
	while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
			//현재 페이지를 의미함
		if(intTemp == nowPage){  
			pagingStr+="<li><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
		}
	     else
	    	 pagingStr+="<li><a href='#' onclick='getReviewSearch("+intTemp+",\""+searchColumn+"\",\""+searchWord+"\")' title='"+intTemp+"'>"+intTemp+"</a></li>";
	       
		intTemp = intTemp + 1;
		blockCount = blockCount + 1;
	
	}

	//다음 및 마지막을 위한 로직
		
	if(intTemp <= totalPage){
		pagingStr+="<li>\r\n" + 
				"<a href='#' onclick='getReviewSearch("+intTemp+",\""+searchColumn+"\",\""+searchWord+"\")' title='"+intTemp+"'>\r\n" + 
				"<span class=\"glyphicon glyphicon-forward\"></span>\r\n" + 
				"</a>\r\n" + 
				"</li>\r\n" + 
				"<li>\r\n" + 
				"<a href='#' onclick='getReviewSearch("+totalPage+",\""+searchColumn+"\",\""+searchWord+"\")' title='"+totalPage+"' >\r\n" + 
				"<span class=\"glyphicon glyphicon-fast-forward\"></span>\r\n" + 
				"</a>\r\n" + 
				"</li>";
						   
	}
	pagingStr+="</ul></nav>";
	return pagingStr;
}
}
