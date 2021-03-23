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
		ArticleVO vo2 = articleDAO.check(vo);
		if (vo2.getArticleSerial() > 0) {
			return 0;
		} else {
			return 1;
		}
	}

	/* 장바구니에 담기 */
	@Override
	public int basket(ArticleVO vo) {
		System.out.println("장바구니 담기");
		return articleDAO.basket(vo);
	}

	/* 장바구니 있는지 확인 */
	@Override
	public int basketCheck(ArticleVO vo) {
		System.out.println("장바구니 확인");
		int check = articleDAO.basketCheck(vo);
		if (check != 0) {
			return 1;
		} else {
			return 0;
		}
	}

	/* 장바구니 목록 가져오기 */
	@Override
	public ArrayList<ArticleVO> getUserArticle(int UserSerial) {
		System.out.println("장바구니 목록 가져오기");
		return articleDAO.getUserArticle(UserSerial);
	}
}
