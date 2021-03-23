package com.hiworld.article.service;

import java.util.ArrayList;

import com.hiworld.article.vo.ArticleVO;

public interface ArticleService {
	
	/* 기본 정보 가져오기 */
	ArrayList<ArticleVO> getAllArticle();
	
	ArticleVO getOneArticle(String ArticleName);
	
	int check(ArticleVO vo);
	
	int insert(ArticleVO vo);
	
	int basket(ArticleVO vo);
}
