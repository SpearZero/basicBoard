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
                <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디">
                <button type="button" class="btn btn-light ml-2" id="useIdChk">사용 가능 아이디 확인</button>
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                </div>
                <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
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
		
		// 사용 가능한 아이디 조건
		function validIdCheck(id) {
			var validIdReg = /^[a-z]+[a-z0-9]{5,15}/g;
			if(!validIdReg.test(id)){
				alert("ID는 영문자로 시작하는 6~16자 영문자, 숫자 입니다.")
				return false;
			}
			
			return true;
		}
		
		var useIdChk = $('#useIdChk');
		useIdChk.click(function(){
			var inputId = $('#userid').val();
			
			signService.useIdChk(inputId, function(result) {
				if(result === 1) {
					alert("이미 존재하는 아이디입니다.");
				} else {
					
					var validId = validIdCheck(inputId);
					if(!validId) {
						$('#userid').val('');
						return false;
					}
					
					var choiceUseId = confirm("사용가능한 아이디입니다 이 아이디를 사용하시겠습니까?");
					if(!choiceUseId) {
						$('#userid').val('');
						return;
					}
					
					$('#password').focus();
				}
			})
		});
	});
</script>
<%@ include file="./includes/footer.jsp" %>