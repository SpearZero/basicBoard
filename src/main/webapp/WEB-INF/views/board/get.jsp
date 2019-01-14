<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
	
    <div class="container article">
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
		<div class="text-right articleBtn">
			<button class="btn btn-primary" data-action="remove">삭제</button>
			<button class="btn btn-primary" data-action="modify">수정</button>
			<button class="btn btn-primary" data-action="list">목록</button>
		</div>
			
		<form action="/board/modify" method="get" id="actionForm">
			<input type="hidden" name="bno" value='<c:out value="${board.bno}"/>'>
			<input type="hidden" name="offset" value='<c:out value="${cri.offset}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'> 
			<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
		</form>
	</div>
	
    <div class="container reply mt-3">
        <div class="row mt-2">
            <div class="col-md-12">
                <div class="panel panel-heading"></div>
                <div class="panel-body">
                    <ul class="chat list-group">
                        <li class="list-group-item" data-rno='12'>
                            <div>
                                <div class="header">
                                    <strong class="primary-font">user00</strong>
                                    <small class="float-right text-muted">2018-01-01 13:13</small>
                                </div>
                                <div class="body">
                                    <p class="d-inline-block">ㅋㅋㅋㅋㅋㅋ</p>
                                    <button class="float-right d-inline-block btn btn-primary" data-action="deleteComment">삭제</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row text-right mt-3 mb-3">
            <div class="col-md-2">
                <input type="text" class="form-control" placeholder="Replyer" name="replyer" id="replyer">
            </div>
            <div class="col-md-9">
                <input type="text" class="form-control" placeholder="Reply" name="reply" id="reply">
            </div>
            <div class="col-md-1">
                <button class="btn btn-primary" data-action="addComment">등록</button>
            </div>
        </div>
    </div>
    
    <script src="/resources/js/reply.js"></script>
    <script>
    	$(document).ready(function(){
	    	
	    	var bnoValue = '<c:out value="${board.bno}"/>';
			var replyUL = $(".chat");
			
			showList(0);
			
			function showList(offset) {
				replyService.getList({bno : bnoValue, offset : offset || 0}, function(list){
					var str = "";
					if(list == null || list.length == 0) {
						replyUL.html("");
						return;
					}
					
					for(var i = 0, len = list.length || 0; i < len; i++) {
						str += "<li class='list-group-item' data-rno='"+ list[i].rno +"'>";
						str += "	<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
						str += "	<samll class='float-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
						str += "	<div class='body'><p class='d-inline-block'>" + list[i].reply + "</p>";
						str += "	<button class='float-right d-inline-block btn btn-primary' data-action='deleteComment'>삭제</button>";
						str += "</div></div></li>";
					}
					
					replyUL.html(str);
				});
			}
			
			// 동적으로 이벤트를 주기 위해
			$(".reply").on("click","button", function(e) {
				e.preventDefault();
				
				var action = $(this).data("action");
				
				if(action === 'addComment') {
					var inputReply = $("#reply").val().trim();
					var inputReplyer = $("#replyer").val().trim();
					
					if(!inputReply.length) {
						alert("내용을 입력 하세요.");
						return;
					}
					
					if(!inputReplyer.length) {
						alert("글쓴이를 입력하세요.");
						return;
					}
					
					var reply = { reply : inputReply, replyer : inputReplyer, bno : bnoValue};
					replyService.add(reply, function(result) {
						
						alert(result);
						
						showList(0);
					});
					
					$("#reply").val("");
					$("#replyer").val("");
				} else if(action === 'deleteComment') {
					console.log("확인만할게용");
				}
			});
    	});
    	
    </script>
	<script>
		$(document).ready(function(){
			
			var form = $("#actionForm");
			
			$(".articleBtn button").click(function(e) {
				e.preventDefault();
				
				var action = $(this).data("action");
				
				if(action === 'modify') {
					form.attr("action", "/board/modify");
					form.submit();
				} else if(action === 'list') {
					form.find("#bno").remove();
					form.attr("action", "/board/list");
					form.submit();
				} else if(action === 'remove'){
	 				var check = confirm("삭제하시겠습니까?");
					
					if(check) {
						form.attr("action","/board/remove");
						form.attr("method","post");
						form.submit();
					} 	
				}
			});
		});
	</script>   
<%@ include file="../includes/footer.jsp" %>