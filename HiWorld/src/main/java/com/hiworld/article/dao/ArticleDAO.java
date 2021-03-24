package com.hiworld.article.dao;

import java.util.ArrayList;

import com.hiworld.article.vo.ArticleVO;

public interface ArticleDAO {

	
	ArrayList<ArticleVO> getAllArticle();
	
	int insert(ArticleVO vo);
	
	ArticleVO getOneArticle(String ArticleName);
	
	ArticleVO check(ArticleVO vo);
	
	int basket(ArticleVO vo);
	
	int basketCheck(ArticleVO vo);
	
	ArrayList<ArticleVO> getUserArticle(int UserSerial);
	
	int cash(ArticleVO vo);
	
	int delBasket(ArticleVO vo);
}
