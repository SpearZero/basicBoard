<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
	
    <div class="container article">
    	<form action="/board/remove" method="post">
			<div class="form-row mb-3">
				<div class="col-md-12 mb-3">
					<input type="text" class="form-control" id="bno" name="bno" readonly value='<c:out value="${board.bno}"/>'>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" id="writer" name="writer" readonly value='<c:out value="${board.writer}"/>'>
				</div>
				<div class="col-md-10">
					<input type="text" class="form-control" id="title" name="title" maxlength="66" readonly value='<c:out value="${board.title}"/>'>
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control" id="content" name="content" rows="20" readonly><c:out value="${board.content}"/></textarea>
			</div>
			<div class="text-right">
				<button class="btn btn-primary" data-action="remove">삭제</button>
				<button class="btn btn-primary" data-action="modify">수정</button>
				<button class="btn btn-primary" data-action="list">목록</button>
			</div>
    	</form>
	</div>
    
	<script>
		$(document).ready(function(){
			
			var form = $("form");
			
			$("button").click(function(e) {
				e.preventDefault();
				
				var action = $(this).data("action");
				
				if(action === 'modify') {
					self.location = "/board/modify?bno="+'<c:out value="${board.bno}"/>';
					return;
				} else if(action === 'list') {
					self.location = "/board/list";
					return;
				}
				
				var check = confirm("삭제하시겠습니까?");
				
				if(check) {
					form.submit();
				}
			});
		});
	</script>   
<%@ include file="../includes/footer.jsp" %>