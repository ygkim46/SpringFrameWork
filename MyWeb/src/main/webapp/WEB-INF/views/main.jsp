<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.dto.board.BoardInfo"%>
<html lang="ko" ng-app="main">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿</title>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- angularJS CDN -->
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    <script src="/resources/js/transition.js"></script>
    <script src="/resources/js/tooltip.js"></script>
    <script src="/resources/js/popover.js"></script>
    <%
    	Boolean isLogin = (String)session.getAttribute("id") == null ? false : true;
   		String id = (String)session.getAttribute("id") == null ? "" : (String)session.getAttribute("id");
   		String name = (String)session.getAttribute("name") == null ? "" : (String)session.getAttribute("name");
    %>
  </head>

  <body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="/getBoardListMain">게시판</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" ng-controller="loginCtrl">
	      <form class="navbar-form navbar-right" role="search" name="loginForm">
	        <div ng-show="'<%=!isLogin %>'" class="form-group">
	        	<input type="text" class="form-control" placeholder="id" ng-model="login.id" name="id" required />
	        	<input type="password" class="form-control" placeholder="password" ng-model="login.password" name="password" required>
	        	<button type="button" class="btn btn-default js-popover" data-container="body" data-trigger="manual" data-placement="bottom" data-content="아이디 또는 비밀번호를 확인해주세요." ng-click="fn_login()" ng-disabled="loginForm.id.$invalid || loginForm.password.$invalid">로그인</button>
	        	<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">회원가입</button>
	        </div>
	        <div ng-show="'<%=isLogin %>'" class="form-group">
	        	<span><%=name%> 님 환영합니다.</span>
	        	<button type="button" class="btn btn-default" data-container="body" data-placement="bottom" data-content="" ng-click="fn_logout()">로그아웃</button>
	        </div>
	      </form>
	    </div><!-- /.navbar-collapse -->
	    <!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" ng-controller="joinCtrl">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">회원가입</h4>
		      </div>
		      <div class="modal-body">
		        <form name="form_join">
				  <div ng-class="divType" class="form-group has-feedback">
				    <label for="inpt_id">아이디</label>
				    <input type="text" ng-change="fn_inptIdChkAjax()" aria-describedby="inputError2Status" class="form-control" ng-model="join.id" name="inpt_id" placeholder="아이디을 입력하세요" required />
				     <span ng-hide="" ng-class="spnType" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				  </div>
				  <div ng-class="divNmType" class="form-group has-feedback">
				    <label for="inpt_name">이름</label>
				    <input type="text" class="form-control" ng-model="join.name" name="inpt_name" placeholder="이름을 입력하세요" required />
				    <span ng-hide="" ng-class="spnNmType" class="glyphicon form-control-feedback" aria-hidden="true"></span>
				  </div>
				  <div class="form-group">
				    <label for="inpt_passwd">암호</label>
				    <input type="password" class="form-control" ng-model="join.passwd" name="inpt_passwd" placeholder="암호" required />
				  </div>
				  <div class="form-group">
				    <label for="inpt_conf_passwd">암호확인</label>
				    <input type="password" class="form-control" ng-model="join.conf_passwd" name="inpt_conf_passwd" placeholder="암호확인" required/>
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" id="btn_close" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" ng-click="fn_joinPrc()" ng-disabled="form_join.inpt_id.$invalid || form_join.inpt_name.$invalid || form_join.inpt_passwd.$invalid || form_join.inpt_conf_passwd.$invalid">완료</button>
		      </div>
		    </div>
		  </div>
		</div>
	    <script>
	    	var main = angular.module('main',[]);
	    	
	    	main.controller('loginCtrl', ['$scope', '$http', function ($scope, $http) {
	    	
	    		$scope.fn_login = function() {
	    			var p_id = $scope.login.id;
	    			var p_password = $scope.login.password;

	    			$http({
	    				method: 'POST',
	    				url: '/loginChk',
	    				data: $.param({
	    					id: p_id,
	    					password: p_password
	    				}),
	    				headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    				}).success(function (data) {
	    				var isLogin = angular.toJson(data['isLogin']);
	    				if(isLogin === 'true') {
	    					$('.js-popover').popover('hide');
	    					window.location.reload();
	    				} else {
	    					$('.js-popover').popover('show');
	    				}
	    			}).error(function () {
	    				alert('Error 잠시후 다시 시도해주세요.');
	    				return false;
    				});
	    		};
	    		
	    		$scope.fn_logout = function() {
	    			$http({
	    				method: 'POST',
	    				url: '/logout',
    				}).success(function (data) {
    					window.location.reload();
	    			}).error(function () {
	    				alert('Error 잠시후 다시 시도해주세요.');
	    				return false;
    				});
	    		};
	    	}]);
	    	
	    	main.controller("joinCtrl", ['$scope', '$http', function($scope, $http) {
	    		$scope.fn_inptIdChkAjax = function() {
	    			var p_id = ''+$scope.join.id;
	    			var isOK = '';
	    			if(p_id !='undefined' && p_id.length >= 4) {
		    			$http({
		    				method: 'GET',
		    				url: '/inptIdChkAjax?id='+p_id
	    				}).success(function (data) {
	    					// result : true 중복x
	    					var result = angular.toJson(data['result']);
	    					if(result == 'true') {
			    				$scope.divType = 'has-success';
								$scope.spnType = 'glyphicon-ok';
			    			} else {
			    				$scope.divType = 'has-error';
			    				$scope.spnType = 'glyphicon-remove';
			    			}
		    			}).error(function () {
		    				alert('Error 잠시후 다시 시도해주세요.');
		    				return false;
	    				});
	    			} else {
	    				$scope.divType = 'has-error';
	    				$scope.spnType = 'glyphicon-remove';
	    			}
	    		};
	    		
	    		$scope.fn_joinPrc = function() {
	    			var p_id = $scope.join.id;
	    			var p_name = $scope.join.name;
	    			var p_password = $scope.join.passwd;
	    			
	    			$http({
	    				method: 'POST',
	    				url: '/joinPrc',
	    				data: $.param({
	    					id: p_id,
	    					name: p_name,
	    					password: p_password
	    				}),
	    				headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
    				}).success(function (data) {
    					
	    			}).error(function () {
	    				alert('Error 잠시후 다시 시도해주세요.');
	    				return false;
    				});
	    			
	    			$('#btn_close').trigger('click');
	    		};
	    	}]);
	    	
	    	
	    	main.controller("boardCtrl",['$scope', '$http', function($scope, $http) {
	    		
    			$http({
    				method: 'GET',
    				url: '/getBoardList',
    				data: $.param({
    				}),
    				headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
				}).success(function (data) {
    				$scope.list = data.brdList;
    				var total = data.totCnt;
    				var page = data.page;
    				var rowCnt = data.rowCnt;
    				var totalPage = Math.ceil(total / rowCnt);
					var startPage = 0;
					var endPage = 0;
    				var curBlock = 0;
    				var totalBlock = 0;
    				var pageViewCnt = 5;
					var pageLenth = 0;
					var pageArr = [];
					
					curBlock = Math.floor((page - 1) / pageViewCnt) + 1;
					totBlock = Math.ceil(totalPage / pageViewCnt);
    				curBlock = curBlock > totBlock ? totBlock : curBlock;
    				startPage = 1 + ((curBlock - 1) * pageViewCnt); 
    				endPage = curBlock == totBlock ? startPage + parseInt(totalPage%pageViewCnt) - 1 : startPage + pageViewCnt - 1;
    				pageLen = endPage - startPage + 1;
    				
    				for(var i=0; i<pageLen; i++) {
    					pageArr[i] = startPage++;
    				}
    				
    				$scope.pageList = pageArr;
    				
    			}).error(function () {
    				alert('Error 잠시후 다시 시도해주세요.');
    				return false;
				});
	    	}]);
	    </script>
	  </div><!-- /.container-fluid -->
	</nav>
  </body>
</html>