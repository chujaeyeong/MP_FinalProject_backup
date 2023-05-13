<%@page import="com.mat.zip.board.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	// 게시글 로드 완료 후 조회수 증가 요청
	$.ajax({
		url: "increasePostViewCount",
		data: {
			post_id: ${vo.post_id}
		},
		success: function() {
			console.log("조회수 증가");
		},
		error: function(request, status, error) {
			console.log("오류 발생");
		}
	});
});

/* $(function() {
	$('#b1').click(function() {
		// 1. 화면을 이동하지 않고, 서버에 insert해달라고 요청 
		// 2. 성공하면, result 아래에 append!
		content = $('#reply').val()
		writer = "apple"
		$. ajax({
			url: "insert4",
			data: {
				bbsno: ${bag.no},
				content: content,
				writer: writer
			},
			success: function() {
				alert('댓글 달기 성공!')
				$('#result').append("- " + content + ", " + writer + "<br>")
				$('#reply').val('')
				
			} // success
		}) // ajax
	}) // b1
}) // $ */
</script>

<a href="boardPost.jsp">
		<button style="background: pink;">자유게시판으로 돌아가기</button>
	</a>
<hr color="red">
<br>
post id : ${vo.post_id} <br> 
user id : ${vo.user_id} <br>
게시물의 음식 카테고리 : ${vo.food_cg} <br>
${user_id} 님의 선호 음식 카테고리 : ${vo.category} <br>
<br>
제목 : ${vo.post_title} <br>
내용 : ${vo.post_content} <br>
<img src="../../resources/img/${vo.post_file}" width=300 height=300> <br>
<br>
작성 시간 : ${vo.created_date}  /  게시물 최종 수정 시간 : ${vo.updated_date}
<br>
<hr color="red">
댓글달기 <input id="reply"> <button id="b1">댓글달기</button> <br>
<%-- <hr color="green">
<div id="result">
	<c:forEach items="${list}" var="bag"> 
	- ${bag.content}, ${bag.writer} <br>
	</c:forEach>
</div> --%>

</body>
</html>