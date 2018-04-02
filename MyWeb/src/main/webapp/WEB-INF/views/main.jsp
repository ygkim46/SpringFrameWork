<!DOCTYPE html>
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
	      <a class="navbar-brand" href="#">@ygkim</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" ng-controller="loginCtrl">
	      <form class="navbar-form navbar-right" role="search" name="loginForm">
	        <div ng-show="'<%=!isLogin %>'" class="form-group">
	        	<input type="text" class="form-control" placeholder="id" ng-model="login.id" name="id" required />
	        	<input type="password" class="form-control" placeholder="password" ng-model="login.password" name="password" required>
	        	<button type="button" class="btn btn-default js-popover" data-container="body" data-trigger="manual" data-placement="bottom" data-content="아이디 또는 비밀번호를 확인해주세요." ng-click="fn_login()" ng-disabled="loginForm.id.$invalid || loginForm.password.$invalid">로그인</button>
	        </div>
	        <div ng-show="'<%=isLogin %>'" class="form-group">
	        	<span><%=name%> 님 환영합니다.</span>
	        	<button type="button" class="btn btn-default" data-container="body" data-placement="bottom" data-content="" ng-click="fn_logout()">로그아웃</button>
	        </div>
	      </form>
	    </div><!-- /.navbar-collapse -->
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
	    </script>
	  </div><!-- /.container-fluid -->
	</nav>
	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1</th>
					<td>b</td>
					<td>c</td>
					<td>c</td>
				</tr>
				<tr>
					<th>2</th>
					<td>b</td>
					<td>c</td>
					<td>c</td>
				</tr>
				<tr>
					<th>3</th>
					<td>b</td>
					<td>c</td>
					<td>c</td>
				</tr>
				<tr>
					<th>4</th>
					<td>b</td>
					<td>c</td>
					<td>c</td>
				</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-default">글작성</button>
		<button type="button" class="btn btn-default">수정</button>
		<button type="button" class="btn btn-default">삭제</button>
	</div>
  </body>
</html>