package com.mat.zip.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mat.zip.board.PostComVO;

@Controller
public class PostComController {

	@Autowired
	PostComDAO dao;
	
	@Autowired
	PostDAO dao2;
	
	// 자유게시판 댓글 등록 insert
	@RequestMapping("/board/createPostCom")
	@ResponseBody
	public void insert(PostComVO vo) {
		System.out.println("creatPostCom 요청됨.");
		System.out.println(vo);
		dao.insert(vo);
	}

	// 자유게시판 댓글 삭제 delete
	@RequestMapping("/board/deletePostCom")
	public void delete(PostComVO vo) {
		System.out.println("updatePostCom요청됨.");
		System.out.println(vo);
		dao.delete(vo);
	}

	// 자유게시판 댓글 list (post_id 별)
	@RequestMapping(value = "/board/postComList", method = RequestMethod.GET) // ajax
	@ResponseBody
	public ResponseEntity<List<PostComVO>> postComList(@RequestParam int post_id) {
	  List<PostComVO> list = dao.postComList(post_id);
	  return new ResponseEntity<List<PostComVO>>(list, HttpStatus.OK);
	}
}
