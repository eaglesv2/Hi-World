package com.hiworld.article.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.article.dao.ArticleDAO;
import com.hiworld.article.vo.ArticleVO;

@Service("ArticleSerivce")
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDAO articleDAO;
	
	@Override
	public ArrayList<ArticleVO> getAllArticle() {
		/* 상품목록 가져오기 */
		System.out.println("상품가져오기");
		return articleDAO.getAllArticle();
	}
	
	/* 상품 확인 */
	public ArticleVO getOneArticle(String ArticleName) {
		System.out.println("물품정보가져오기");
		return articleDAO.getOneArticle(ArticleName);
	}
	
	/* 회원한테 담기 */
	@Override
	public int insert(ArticleVO vo) {
		System.out.println("회원한테 담기");
		return articleDAO.insert(vo);
	}
	
	/* 회원한테 상품 있는지 체크 */
	@Override
	public int check(ArticleVO vo) {
		System.out.println("상품 있는지 확인");
		return articleDAO.check(vo);
	}
	
	/* 장바구니에 담기 */
	@Override
	public int basket(ArticleVO vo) {
		System.out.println("장바구니 담기");
		return articleDAO.basket(vo);
	}
}
