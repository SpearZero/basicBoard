<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="./includes/header.jsp" %>
    <div class="container signup">
        <form>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-user"></i></div>
                </div>
                <input type="text" class="form-control" name="username" id="username" placeholder="아이디">
                <button type="button" class="btn btn-light ml-2" id="dupIdChk">아이디 중복 확인</button>
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                </div>
                <input type="password" class="form-control" name="password" placeholder="비밀번호">
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                </div>
                <input type="password" class="form-control" name="passwordCheck" placeholder="비밀번호 확인">
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-envelope"></i></div>
                </div>
                <input type="email" class="form-control" name="email" placeholder="이메일">
            </div>
            <div class="col-md-6 mx-auto">
                <div class="float-right">
                    <button type="submit" class="btn btn-primary">회원가입</button>
                </div>
            </div>
        </form>
    </div>
<script src="/resources/js/sign.js"></script>
<script>
	$(document).ready(function(){
		var dupIdChk = $('#dupIdChk');
		
		dupIdChk.click(function(){
			var id = $('#username').val();
			
			signService.dupidChk(id, function(result) {
				if(result === 1) {
					console.log("존재하는 아이디!")
				} else {
					console.log("사용가능한 아이디")
				}
			})
		});
	});
</script>
<%@ include file="./includes/footer.jsp" %>