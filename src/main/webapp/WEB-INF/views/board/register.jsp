<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<div class="container board">
	<div class="container writer">
		<form action="/board/register" method="post">
			<div class="form-row mb-3">
				<div class="col-md-2">
					<input type="text" class="form-control" id="writer" name="writer" placeholder="작성자" maxlength="16">
				</div>
				<div class="col-md-10">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" maxlength="66">
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control" id="content" name="content" rows="20"
					maxlength="666"></textarea>
			</div>
			<div class="text-right">
				<button class="btn btn-primary" id="write">글쓰기</button>
				<button class="btn btn-primary" id="cancel">취소</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>