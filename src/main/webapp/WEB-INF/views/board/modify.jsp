<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<style>
	.uploadResult {
		width : 100%;
		background-color: gray;
	}
	
	.uploadResult ul {
		display : flex;
		flex-flow : row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style : none;
		padding : 10px;
		align-content: center;
		text-align: center;
	}
	
	.uploadResult ul li img {
		width : 100px;
	}
	
	.uploadResult ul li span {
		color : white;
	}
</style>
	
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
			<div class="row mb-3">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							File Upload
						</div>
						<div class="card-body">
							<div class="form-group uploadDiv">
								<input type="file" name="uploadFile" multiple />
							</div>
							<div class="uploadResult">
								<ul>
									
								</ul>
							</div>
						</div>
					</div>
				</div>	
			</div>
			<div class="text-right">
				<button class="btn btn-primary" data-action="modify">수정</button>
				<button class="btn btn-primary" data-action="list">목록</button>
			</div>
			
			<input type="hidden" name="offset" value='<c:out value="${cri.offset}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
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
				} else if(action === 'modify') {
					var str = "";
					
					$(".uploadResult ul li").each(function(i,obj){
						var jobj = $(obj);
						
						str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") +"'>";
						str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") +"'>";
						str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") +"'>";
						str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") +"'>";
					});
					
					form.append(str).submit();
				}
				
			});
			
			$(".uploadResult").on("click", "button", function(e) {
				console.log("delete file");
				
				if(confirm("Remove this file? ")) {
					var targetLi = $(this).closest("li");
					targetLi.remove();
				}
			});
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;
			
			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				
				return true;
			}
			
			$("input[type='file']").change(function(e) {
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				for(var i = 0; i < files.length; i++) {
					
					if(!checkExtension(files[i].name, files[i].size)) {
						return false;						
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadResult(result);
					}
				})
			});
		});
		
		function showUploadResult(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length == 0) { return; }
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				// image type
				if(obj.image) {
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid + "_"+ obj.fileName);
					
					str += "<li data-path='" + obj.uploadPath +"' data-uuid='" + obj.uuid +"' data-filename='" + obj.fileName +"' data-type='" + obj.image + "'><div>";
					str += "<span> " + obj.fileName + "</span>";
					str += "<button type='button' class='btn btn-warning btn-sm' data-file=\'"+ fileCallPath + "\' data-type='image'><i class='fas fa-times'></i></button><br>";
					str += "<img src = '/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
				} else {
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					
					str += "<li data-path='" + obj.uploadPath +"' data-uuid='" + obj.uuid +"' data-filename='" + obj.fileName +"' data-type='" + obj.image +"'><div>";
					str += "<span> " + obj.fileName + "</span>";
					str += "<button type='button' class='btn btn-warning btn-sm' data-file=\'" + fileCallPath + "\' data-type='file'><i class='fas fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			uploadUL.append(str);
		}
		
		$(document).ready(function(){
			(function(){
				var bno = '<c:out value="${board.bno}"/>';
				
				$.getJSON("/board/getAttachList", {bno : bno}, function(arr){
					console.log(arr);
					
					var str = "";
					
					$(arr).each(function(i,attach){
						if(attach.fileType) {
							var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
							
							str += "<li data-path='" + attach.uploadPath +"' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='"
							+ attach.fileType + "'><div>";
							str += "<span>" + attach.fileName + "</span>";
							str += "<button type='button' data-file-\'" + fileCallPath + "\' data-type='image'";
							str += " class='btn btn-warning btn-sm'><i class='fas fa-times'></i></button><br>";
							str += "<img src='/display?fileName=" + fileCallPath + "'>";
							str += "</div>";
							str += "</li>";
						} else {
							str += "<li data-path='" + attach.uploadPath +"' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='"
							+ attach.fileType + "'><div>";
							str += "<span>" + attach.fileName + "</span>";
							str += "<button type='button' data-file-\'" + fileCallPath + "\' data-type='image'";
							str += " class='btn btn-warning btn-sm'><i class='fas fa-times'></i></button><br>";
							str += "<img src='/resources/img/attach.png'>";
							str += "</div>";
							str += "</li>";
						}
					});
					
					$(".uploadResult ul").html(str);
				});
			})();
		})
	</script>   
<%@ include file="../includes/footer.jsp" %>





















