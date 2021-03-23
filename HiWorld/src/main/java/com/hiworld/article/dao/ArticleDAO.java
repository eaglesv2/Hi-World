package com.hiworld.article.dao;

import java.util.ArrayList;

import com.hiworld.article.vo.ArticleVO;

public interface ArticleDAO {

	
	ArrayList<ArticleVO> getAllArticle();
	
	int insert(ArticleVO vo);
	
	ArticleVO getOneArticle(String ArticleName);
	
	int check(ArticleVO vo);
	
	int basket(ArticleVO vo);
}
