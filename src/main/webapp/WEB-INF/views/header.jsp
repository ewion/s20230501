<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/board.css" rel="stylesheet" type="text/css">
<link href="css/sidebars.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<div class="collapse navbar-collapse show" id="navbarNavDarkDropdown"
			data-bs-auto-close="false">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDarkDropdownMenuLink" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"
					style="font-size: 20px; color: rgb(22, 160, 133)"> 메인메뉴 </a>
					<ul class="dropdown-menu dropdown-menu-dark"
						aria-labelledby="navbarDarkDropdownMenuLink">
						<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark"
							style="width: 280px;">
							<div class="d-flex justify-content-center">
								<a href="#"
									class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none"
									onclick="event.stopPropagation();"> <span class="fs-4"
									style="color: rgb(22, 160, 133);">
										<div class="form-floating">
											<input type="email" class="form-control" id="floatingInput"
												placeholder="name@example.com"
												style="width: 250px; margin-bottom: 5px;"> <label
												for="floatingInput" style="font-size: 18px;">Email
												address</label>
										</div>
										<div class="form-floating">
											<input type="password" class="form-control"
												id="floatingPassword" placeholder="Password"> <label
												for="floatingPassword" style="font-size: 18px;">Password</label>
										</div>
								</span>
								</a>
							</div>

							<div class="d-flex justify-content-center mt-3">
								<button class="btn btn-primary me-2"
									style="background: rgb(52, 73, 94); color: rgb(22, 160, 133); border: 0;"
									onclick="event.stopPropagation();">로그인</button>
								<button class="btn btn-secondary"
									style="background: rgb(52, 73, 94); color: rgb(22, 160, 133); border: 0;"
									onclick="event.stopPropagation();">회원 가입</button>
							</div>
							<hr>
							<ul class="nav nav-pills flex-column mb-auto">
								<li><a href="#" class="nav-link text-white"
									onclick="event.stopPropagation(); window.location.href='/Users';">
										<svg class="bi pe-none me-1" width="16" height="16">
      <use xlink:href="#"></use>
    </svg> <span style="color: rgb(22, 160, 133);">유저정보</span>
								</a></li>
								<li><a href="#" class="nav-link text-white"
									onclick="event.stopPropagation();"> <svg
											class="bi pe-none me-2" width="16" height="16">
											<use xlink:href="#speedometer2" /></svg> <span
										style="color: rgb(22, 160, 133);"> 프로필정보</span>
								</a></li>
								<li><a href="#" class="nav-link text-white"
									onclick="event.stopPropagation();"> <svg
											class="bi pe-none me-2" width="16" height="16">
											<use xlink:href="#table" /></svg> <span
										style="color: rgb(22, 160, 133);"> 프로필정보</span>
								</a></li>
								<li><a href="#" class="nav-link text-white"
									onclick="event.stopPropagation();"> <svg
											class="bi pe-none me-2" width="16" height="16">
											<use xlink:href="#grid" /></svg> <span
										style="color: rgb(22, 160, 133);"> 프로필정보</span>
								</a></li>
								<li><a href="#" class="nav-link text-white"
									onclick="event.stopPropagation();"> <svg
											class="bi pe-none me-2" width="16" height="16">
											<use xlink:href="#people-circle" /></svg> <span
										style="color: rgb(22, 160, 133);"> 프로필정보</span>
								</a></li>
							</ul>
							<style>
.navbar, .navbar-expand-lg, .navbar-dark, .bg-dark {
	color: rgb(22, 160, 133);
	background: rgb(52, 73, 94);
}

.nav-link.active, .nav-link {
	color: rgb(22, 160, 133);
}

.nav-link.active, .nav-link:hover {
	background-color: #343a40;
}

.btn-primary {
	
}
</style>

							<hr>
							<div class="dropdown">
								<a href="#"
									class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
									data-bs-toggle="dropdown" aria-expanded="false"
									onclick="event.stopPropagation();"> <img
									src="https://github.com/mdo.png" alt="" width="32" height="32"
									class="rounded-circle me-2"> <strong
									style="color: rgb(22, 160, 133);">회원아이디</strong>
								</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
									<li><a class="dropdown-item"
										onclick="event.stopPropagation();" href="#"><span
											style="color: rgb(22, 160, 133);"> 뭐로</span></a></li>
									<li><a class="dropdown-item"
										onclick="event.stopPropagation();" href="#"><span
											style="color: rgb(22, 160, 133);"> 할까</span></a></li>
									<li><a class="dropdown-item"
										onclick="event.stopPropagation();" href="#"><span
											style="color: rgb(22, 160, 133);"> 회원탈퇴</span></a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#"><span
											style="color: rgb(22, 160, 133);"> 로그아웃</span></a></li>
								</ul>
							</div>
						</div>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>


