<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
	
    <div class="container article">
    	<form action="/board/modify" method="post">
			<div class="form-row mb-3">
				<div class="col-md-12 mb-3">
					<input type="text" class="form-control" id="bno" name="bno" readonly value='<c:out value="${board.bno}"/>'>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" id="writer" readonly name="writer" value='<c:out value="${board.writer}"/>'>
				</div>
				<div class="col-md-10">
					<input type="text" class="form-control" id="title" name="title" maxlength="66" value='<c:out value="${board.title}"/>'>
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control" id="content" name="content" rows="20"><c:out value="${board.content}"/></textarea>
			</div>
			<div class="text-right">
				<button class="btn btn-primary" data-action="modfiy">수정</button>
				<button class="btn btn-primary" data-action="list">목록</button>
			</div>
			
			<input type="hidden" name="offset" value='<c:out value="${cri.offset}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>		
    	</form>
	</div>
    
	<script>
		$(document).ready(function(){
			
			var form = $("form");
			
			$("button").on("click", function(e){
				e.preventDefault();
				
				var action = $(this).data("action");
				
				if(action === 'list') {
					form.find("#bno").remove();
					form.find("#writer").remove();
					form.find("#title").remove();
					form.find("#content").remove();
					
					form.attr("action", "/board/list");
					form.attr("method", "get");
					form.submit();
				}
				
				form.submit();
			});
		});
	</script>   
<%@ include file="../includes/footer.jsp" %>