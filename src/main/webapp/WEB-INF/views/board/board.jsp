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
							<td><a href='/board/get?bno=<c:out value = "${board.bno}"/>'><c:out value="${board.title }"/></a></td>
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
                        <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
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
		})
	</script>   
<%@ include file="../includes/footer.jsp" %>