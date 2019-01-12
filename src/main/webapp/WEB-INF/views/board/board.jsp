<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
	
    <div class="container board">
        <div class="row">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">글 제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">날짜</th>
                        <th scope="col">수정날짜</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}"/></td>
							<td><a href='<c:out value = "${board.bno}"/>' class="getArticle">
								<c:out value="${board.title }"/></a>
							</td>
							<td><c:out value="${board.writer}"/></td>
							<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
            <div class="col-lg-12 d-flex justify-content-end mb-3">
                <button class="btn btn-primary" id="write">글쓰기</button>
            </div>
            <div id="pagenNavi" class="col-lg-12 d-flex justify-content-center mb-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                    	<c:if test="${pageMaker.prev}">
                    		<li class="page-item">
                    			<a href="${(pageaker.startPage-1) * 10}" class="page-link">Previous</a>
                    		</li>
                    	</c:if>
                    	
                    	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                        <li class="page-item">
	                        	<a href="${(num-1)*10}" class="page-link">${num}</a>
	                        </li>
                    	</c:forEach>
                    	
                        <c:if test="${pageMaker.next}">
                        	<li class="page-item">
                        		<a href="${(pageMaker.endPage) * 10}" class="page-link">Next</a>
                        	</li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <div class="input-group col-lg-6 mx-auto">
                <select name="searchType" id="searchType" class="custom-select col-lg-3">
                    <option selected>...</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
                <input type="text" class="form-control" name="searchword">
                <button type="button" class="btn btn-outline-primary">검색</button>
            </div>
        </div>
    </div>
    
    <!-- 모달  -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">글 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                	처리가 완료되었습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <form action="/board/list" id="moveForm" method="get">
    	<input type="hidden" name="offset" value = "${pageMaker.cri.offset}">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
    </form>
    
	<script>
		$(document).ready(function(){
			$("#write").click(function(){
				window.location.href = "/board/register";
			})
			
			var result = '<c:out value="${result}"/>';
			console.log(result);
			
			registerCheck(result);
			
			// 방문 상태 체크
			history.replaceState({},null,null);
			
			function registerCheck(result) {
				if(result === '' || history.state) {
					return;
				}
				
				if(parseInt(result) > 0) {
					$(".modal-body").html(parseInt(result) + "번 게시글이 등록되었습니다.");
				}
				
				$("#registerModal").modal("show");
			}
			
			var moveForm = $("#moveForm");
			
			$(".pagination a").on("click", function(e) {
				e.preventDefault();
				
				moveForm.find("input[name='offset']").val($(this).attr("href"));
				moveForm.submit();
			});
			
			$(".getArticle").on("click", function(e) {
				e.preventDefault();
				moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href") +"'>");
				moveForm.attr("action", "/board/get");
				moveForm.submit();
			});
		})
	</script>   
<%@ include file="../includes/footer.jsp" %>