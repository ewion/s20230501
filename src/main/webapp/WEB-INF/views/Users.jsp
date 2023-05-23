<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body style="background: rgb(52, 73, 94);">
	<table class="table table-dark table-hover" style="max-width: 1200px;">
		<div style="max-width: 500px;">
			<div class="row g-3">
				<div class="col-sm-6">
					<label for="firstName" class="form-label">회원 이름</label> <input
						type="text" class="form-control" id="firstName" placeholder=""
						value="" required>
					<div class="invalid-feedback"></div>
				</div>
				<div class="col-sm-6">
					<label for="lastName" class="form-label">회원 아이디</label> <input
						type="text" class="form-control" id="lastName" placeholder=""
						value="" required>
					<div class="invalid-feedback"></div>
				</div>

				<div class="col-12">
					<label for="password" class="form-label">비밀번호 변경 <span
						class="text-body-secondary"></span></label> <input type="password"
						class="form-control" id="password" placeholder="비밀번호입력">
					<div class="invalid-feedback">Please enter a valid email
						address for shipping updates.</div>
				</div>
				<div class="col-12">
					<label for="passwordConfirm" class="form-label">비밀번호 확인 <span
						class="text-body-secondary"></span></label> <input type="password"
						class="form-control" id="passwordConfirm" placeholder="비밀번호 확인">
					<div class="invalid-feedback">Please enter a valid email
						address for shipping updates.</div>
				</div>

				<div class="col-12">
					<label for="address" class="form-label">주소</label> <input
						type="text" class="form-control" id="address" placeholder=""
						required>
					<div class="invalid-feedback"></div>
				</div>
				<div class="col-6">
					<label for="birthDate" class="form-label">주민번호 앞자리</label> <input
						type="text" class="form-control" id="birthDate"
						placeholder="6자리입력" minlength="6" maxlength="6" required>
					<div class="invalid-feedback"></div>
				</div>
				<div class="col-6">
					<label for="idNumber" class="form-label">주민번호 뒷자리</label> <input
						type="text" class="form-control" id="idNumber"
						placeholder="앞번호 만 입력" minlength="1" maxlength="1" required>
					<div class="invalid-feedback"></div>
				</div>
				<div class="col-12">
					<label for="phone" class="form-label">휴대전화 <span
						class="text-body-secondary"></span></label> <input type="text"
						class="form-control" id="phone" placeholder="">
				</div>
				<div class="col-md-5">
					<label for="status" class="form-label">상태코드</label> <select
						class="form-select" id="status" required>
						<option value="601">활동중</option>
						<option value="602">휴면</option>
						<option value="603">정지</option>
						<option value="604">탈퇴</option>
					</select>
					<div class="invalid-feedback"></div>
				</div>
				<div class="col-md-3">
					<label for="height" class="form-label">키</label> <input type="text"
						class="form-control" id="height" placeholder="" required>
					<div class="invalid-feedback">Zip code required.</div>
				</div>
				<div class="col-md-3">
					<label for="weight" class="form-label">몸무게</label> <input
						type="text" class="form-control" id="weight" placeholder=""
						required>
					<div class="invalid-feedback">Zip code required.</div>
				</div>

				<div class="col-12 mt-3">
					<button type="button" class="btn btn-primary" onclick="editForm()">수정</button>
					<button type="button" class="btn btn-danger" onclick="deleteForm()">삭제</button>
				</div>
			</div>
		</div>

		<script>
  function editForm() {
    // TODO: Implement your edit logic here
    console.log("Edit button clicked");
  }

  function deleteForm() {
    // TODO: Implement your delete logic here
    console.log("Delete button clicked");
  }
</script>
		<br>
		<a style="color: rgb(22, 160, 133);">일반회원</a>
		<div class="d-flex align-items-center">
			<select name="search" id="search"
				style="width: auto; border-radius: 10px; text-align: center;"
				class="form-control me-2">
				<option data-bs-toggle="dropdown">검색조건</option>
				<option value="users_ID">아이디</option>
				<option value="users_NAME">이름</option>
			</select> <input style="width: auto; border-radius: 10px; text-align: left;"
				class="form-control me-2" type="text" placeholder="검색어 입력란"
				name="keyword" aria-label="Search" id="keyword">
			<button
				style="margin-left: 25px; margin-right: 35px; font-weight: bolder; font-size: 20px; border-radius: 10px; width: 100px; border-color: rgb(22, 160, 133); border: 1; color: rgb(22, 160, 133); text-align: center;"
				class="btn" type="button" onclick="search1()">검색</button>
		</div>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">생년월일</th>
			<th scope="col">키</th>
			<th scope="col">성별</th>
			<th scope="col">몸무게</th>
			<th scope="col">연락처</th>
			<th scope="col">거주지</th>
			<th scope="col">가입일</th>
			<th scope="col">탈퇴일</th>
			<th scope="col">가입상태</th>
		</tr>
		</thead>
		<tbody id="userTableBody">
		</tbody>
	</table>
	<div id="userPage"></div>

	<table class="table table-dark table-hover" style="max-width: 1200px;">
		<a style="color: rgb(22, 160, 133);">트레이너</a>
		<div class="d-flex align-items-center">
			<select name="search" id="search2"
				style="width: auto; border-radius: 10px; text-align: center;"
				class="form-control me-2">
				<option data-bs-toggle="dropdown">검색조건</option>
				<option value="users_ID">아이디</option>
				<option value="users_NAME">이름</option>
			</select> <input style="width: auto; border-radius: 10px; text-align: left;"
				class="form-control me-2" type="text" placeholder="검색어 입력란"
				name="keyword" aria-label="Search" id="keyword2">
			<button
				style="margin-left: 25px; margin-right: 35px; font-weight: bolder; font-size: 20px; border-radius: 10px; width: 100px; border-color: rgb(22, 160, 133); border: 1; color: rgb(22, 160, 133); text-align: center;"
				class="btn" type="button" onclick="search2()">검색</button>
		</div>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">생년월일</th>
			<th scope="col">키</th>
			<th scope="col">성별</th>
			<th scope="col">몸무게</th>
			<th scope="col">연락처</th>
			<th scope="col">거주지</th>
			<th scope="col">가입일</th>
			<th scope="col">탈퇴일</th>
			<th scope="col">가입상태</th>
		</tr>
		</thead>
		<tbody id="trainerTableBody">
		</tbody>
	</table>
	<div id="trainerPage"></div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
loadUsers();
loadtrainer();
pageLoad();
pageLoad2();
function loadUsers() {
	  $.ajax({
	    url: '/loadUsers',
	    method: 'GET',
	    dataType: 'json',
	    success: function(response) {
	      var tableBody = $('#userTableBody');
	      tableBody.empty();

	      var users = response.users;
	      var formattedUserBirthList = response.formattedUserBirthList;
	      var formattedUserStartList = response.formattedUserStartList;
	      var formattedUserEndList = response.formattedUserEndList;

	      $.each(users, function(index, user) {
	        var row = '<tr style="font-size: 15px;">' +
	          '<th scope="row">' + (index + 1) + '</th>' +
	          '<td>' + user.users_ID + '</td>' +
	          '<td>' + user.users_NAME + '</td>' +
	          '<td>' + formattedUserBirthList[index] + '</td>' +
	          '<td>' + user.users_HEIGHT + '</td>' +
	          '<td>' + user.users_WEIGHT + '</td>' +
	          '<td>' + user.users_PHONE + '</td>' +
	          '<td>' + user.users_ADDR + '</td>' +
	          '<td>' + formattedUserStartList[index] + '</td>' +
	          '<td>' + formattedUserEndList[index] + '</td>';

	        if (user.users_STATE === 602) {
	          row += '<td>탈퇴</td>';
	        } else if (user.users_STATE === 603) {
	          row += '<td>휴면</td>';
	        } else if (user.users_STATE === 604) {
	          row += '<td>정지</td>';
	        } else {
	          row += '<td>활동중</td>';
	        }

	        row += '</tr>';
	        tableBody.append(row);

	        // 모달 창 표시 이벤트 핸들러
	        $(row).click(function() {
	          // 모달 창을 표시하는 코드 작성
	          // 예를 들어, 모달 창의 내용을 사용자 정보로 채우는 등의 작업을 수행할 수 있습니다.
	          console.log("Modal opened for user:", user.users_NAME);
	        });
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}

function loadtrainer() {
	  $.ajax({
	    url: '/trainer',
	    method: 'GET',
	    dataType: 'json',
	    success: function(response) {
	      var tableBody = $('#trainerTableBody');
	      tableBody.empty();

	      var trainer = response.trainer;
	      var formattedTrainerBirthList = response.formattedTrainerBirthList;
	      var formattedTrainerStartList = response.formattedTrainerStartList;
	      var formattedTrainerEndList = response.formattedTrainerEndList;

	      $.each(trainer, function(index, trainers) {
	        var row = '<tr style="font-size: 15px;">' +
	          '<th scope="row">' + (index + 1) + '</th>' +
	          '<td>' + trainers.users_ID + '</td>' +
	          '<td>' + trainers.users_NAME + '</td>' +
	          '<td>' + formattedTrainerBirthList[index] + '</td>' +
	          '<td>' + trainers.users_HEIGHT + '</td>' +
	          '<td>' + trainers.users_WEIGHT + '</td>' +
	          '<td>' + trainers.users_PHONE + '</td>' +
	          '<td>' + trainers.users_ADDR + '</td>' +
	          '<td>' + formattedTrainerStartList[index] + '</td>' +
	          '<td>' + formattedTrainerEndList[index] + '</td>';

	        if (trainers.users_STATE === 602) {
	          row += '<td>탈퇴</td>';
	        } else if (trainers.users_STATE === 603) {
	          row += '<td>휴면</td>';
	        } else if (trainers.users_STATE === 604) {
	          row += '<td>정지</td>';
	        } else {
	          row += '<td>활동중</td>';
	        }

	        row += '</tr>';

	        tableBody.append(row);
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}
function search1() {
	var keyword = document.getElementById("keyword").value;
	var search = document.getElementById("search").value;
	  $.ajax({
	    url: '/userssearch',
	    method: 'GET',
	    dataType: 'json',
	    data: {
	        keyword: keyword,
	        search: search
	      },
	    success: function(response) {
	    	
	      var tableBody = $('#userTableBody');
	      tableBody.empty();
	      var users = response.users;
	      var formattedUserBirthList = response.formattedUserBirthList;
	      var formattedUserStartList = response.formattedUserStartList;
	      var formattedUserEndList = response.formattedUserEndList;
	      $.each(users, function(index, user) {
	    	  console.log(user)
	        var row = '<tr style="font-size: 15px;">' +
	          '<th scope="row">' + (index + 1) + '</th>' +
	          '<td>' + user.users_ID + '</td>' +
	          '<td>' + user.users_NAME + '</td>' +
	          '<td>' + formattedUserBirthList[index] + '</td>' +
	          '<td>' + user.users_HEIGHT + '</td>' +
	          '<td>' + user.users_WEIGHT + '</td>' +
	          '<td>' + user.users_PHONE + '</td>' +
	          '<td>' + user.users_ADDR + '</td>' +
	          '<td>' + formattedUserStartList[index] + '</td>' +
	          '<td>' + formattedUserEndList[index] + '</td>';

	        if (user.users_STATE === 602) {
	          row += '<td>탈퇴</td>';
	        } else if (user.users_STATE === 603) {
	          row += '<td>휴면</td>';
	        } else if (user.users_STATE === 604) {
	          row += '<td>정지</td>';
	        } else {
	          row += '<td>활동중</td>';
	        }

	        row += '</tr>';
	        tableBody.append(row);
	        pageLoad3();
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}
function pageLoad() {
	  $.ajax({
	    url: '/loadUsers',
	    method: 'GET',
	    success: function(response) {
	      console.log('응답 데이터 response.page :', response.userTotal);
	      var itemsPerPage = 5; // Number of items to display per page
	      var totalItems = response.userTotal;
	      var currentPage = 1; // Assuming the current page is 1

	      var totalPages = Math.ceil(totalItems / itemsPerPage); // Calculate total number of pages

	      var paginationHtml = '<nav aria-label="Page navigation example"><ul class="pagination">';

	      if (currentPage > 1) {
	        paginationHtml += '<li class="page-item "><a class="page-link" href="#" onclick="clickPage(' + (currentPage - 1) + ')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&laquo;</span></li>';
	      }

	      for (var i = 1; i <= totalPages; i++) {
	        if (i == currentPage) {
	          paginationHtml += '<li class="page-item active"><a class="page-link" href="#" onclick="clickPage('+i+')">' + i + '</a></li>';
	        } else {
	          paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage(' + i + ')">' + i + '</a></li>';
	        }
	      }

	      if (currentPage < totalPages) {
	        paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage(' + (currentPage + 1) + ')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&raquo;</span></li>';
	      }

	      paginationHtml += '</ul></nav>';

	      $('#userPage').html(paginationHtml);

	      // 현재 페이지 강조 표시
	      $('.pagination li').click(function() {
	        $('.pagination li').removeClass('active');
	        $(this).addClass('active');
	      });

	    },
	    error: function(xhr, status, error) {
	      console.log('에러:', error);
	    }
	  });
	}
function clickPage(pageNumber) {
	  var keyword = document.getElementById("keyword").value;
	  var search = document.getElementById("search").value;
	  // 페이지 번호에 해당하는 데이터를 가져와서 표시하거나 처리하는 로직을 작성해주세요.
	  // 예: Ajax를 사용하여 서버로부터 해당 페이지의 데이터를 가져와서 표시
	  $.ajax({
	    url: '/userssearch', // 예시 URL, 실제 서버 URL로 수정 필요
	    method: 'GET', // 예시 메소드, 실제 요청 메소드로 수정 필요
	    data: {
	      currentPage: pageNumber,
	      keyword: keyword,
	      search: search
	    },
	    success: function(response) {
	      var tableBody = $('#userTableBody');
	      tableBody.empty();
	      var users = response.users;
	      var formattedUserBirthList = response.formattedUserBirthList;
	      var formattedUserStartList = response.formattedUserStartList;
	      var formattedUserEndList = response.formattedUserEndList;
	      $.each(users, function(index, user) {
	        console.log(user);
	        var row =
	          '<tr style="font-size: 15px;">' +
	          '<th scope="row">' +
	          (index + 1) +
	          '</th>' +
	          '<td>' +
	          user.users_ID +
	          '</td>' +
	          '<td>' +
	          user.users_NAME +
	          '</td>' +
	          '<td>' +
	          formattedUserBirthList[index] +
	          '</td>' +
	          '<td>' +
	          user.users_HEIGHT +
	          '</td>' +
	          '<td>' +
	          user.users_WEIGHT +
	          '</td>' +
	          '<td>' +
	          user.users_PHONE +
	          '</td>' +
	          '<td>' +
	          user.users_ADDR +
	          '</td>' +
	          '<td>' +
	          formattedUserStartList[index] +
	          '</td>' +
	          '<td>' +
	          formattedUserEndList[index] +
	          '</td>';

	        if (user.users_STATE === 602) {
	          row += '<td>탈퇴</td>';
	        } else if (user.users_STATE === 603) {
	          row += '<td>휴면</td>';
	        } else if (user.users_STATE === 604) {
	          row += '<td>정지</td>';
	        } else {
	          row += '<td>활동중</td>';
	        }

	        row += '</tr>';

	        tableBody.append(row);
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}
	
function pageLoad2() {
	  $.ajax({
	    url: '/trainer',
	    method: 'GET',
	    success: function(response) {
	      console.log('응답 데이터 response.page :', response.trainerTotal);
	      var itemsPerPage = 5; // Number of items to display per page
	      var totalItems = response.trainerTotal;
	      var currentPage = 1; // Assuming the current page is 1

	      var totalPages = Math.ceil(totalItems / itemsPerPage); // Calculate total number of pages

	      var paginationHtml = '<nav aria-label="Page navigation example"><ul class="pagination">';

	      if (currentPage > 1) {
	        paginationHtml += '<li class="page-item "><a class="page-link" href="#" onclick="clickPage1(' + (currentPage - 1) + ')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&laquo;</span></li>';
	      }

	      for (var i = 1; i <= totalPages; i++) {
	        if (i == currentPage) {
	          paginationHtml += '<li class="page-item active"><a class="page-link" href="#" onclick="clickPage1('+i+')">' + i + '</a></li>';
	        } else {
	          paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage1(' + i + ')">' + i + '</a></li>';
	        }
	      }

	      if (currentPage < totalPages) {
	        paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage1(' + (currentPage + 1) + ')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&raquo;</span></li>';
	      }

	      paginationHtml += '</ul></nav>';

	      $('#trainerPage').html(paginationHtml);

	      // 현재 페이지 강조 표시
	      $('.pagination li').click(function() {
	        $('.pagination li').removeClass('active');
	        $(this).addClass('active');
	      });

	    },
	    error: function(xhr, status, error) {
	      console.log('에러:', error);
	    }
	  });
	}
function search2() {
	var keyword = document.getElementById("keyword2").value;
	var search = document.getElementById("search2").value;
	  $.ajax({
	    url: '/trainerssearch',
	    method: 'GET',
	    dataType: 'json',
	    data: {
	        keyword: keyword,
	        search: search
	        },
	  	    success: function(response) {
	  	      var tableBody = $('#trainerTableBody');
	  	      tableBody.empty();

	  	      var trainer = response.trainer;
	  	      var formattedTrainerBirthList = response.formattedTrainerBirthList;
	  	      var formattedTrainerStartList = response.formattedTrainerStartList;
	  	      var formattedTrainerEndList = response.formattedTrainerEndList;

	  	      $.each(trainer, function(index, trainers) {
	  	        var row = '<tr style="font-size: 15px;">' +
	  	          '<th scope="row">' + (index + 1) + '</th>' +
	  	          '<td>' + trainers.users_ID + '</td>' +
	  	          '<td>' + trainers.users_NAME + '</td>' +
	  	          '<td>' + formattedTrainerBirthList[index] + '</td>' +
	  	          '<td>' + trainers.users_HEIGHT + '</td>' +
	  	          '<td>' + trainers.users_WEIGHT + '</td>' +
	  	          '<td>' + trainers.users_PHONE + '</td>' +
	  	          '<td>' + trainers.users_ADDR + '</td>' +
	  	          '<td>' + formattedTrainerStartList[index] + '</td>' +
	  	          '<td>' + formattedTrainerEndList[index] + '</td>';

	  	        if (trainers.users_STATE === 602) {
	  	          row += '<td>탈퇴</td>';
	  	        } else if (trainers.users_STATE === 603) {
	  	          row += '<td>휴면</td>';
	  	        } else if (trainers.users_STATE === 604) {
	  	          row += '<td>정지</td>';
	  	        } else {
	  	          row += '<td>활동중</td>';
	  	        }

	  	        row += '</tr>';

	  	        tableBody.append(row);
	  	      trainerpageLoad2();
	  	      });
	  	    },
	  	    error: function(xhr, status, error) {
	  	      console.log('Error:', error);
	  	    }
	  	  });
	  	}
function pageLoad3() {
	var keyword = document.getElementById("keyword").value;
	var search = document.getElementById("search").value;
	  $.ajax({
	    url: '/userssearch',
	    method: 'GET',
	    dataType: 'json',
	    data: {
	        keyword: keyword,
	        search: search
	        },
	    success: function(response) {
	      console.log('응답 데이터 response.page :', response.userTotal);
	      var itemsPerPage = 5; // Number of items to display per page
	      var totalItems = response.userTotal;
	      var currentPage = 1; // Assuming the current page is 1

	      var totalPages = Math.ceil(totalItems / itemsPerPage); // Calculate total number of pages

	      var paginationHtml = '<nav aria-label="Page navigation example"><ul class="pagination">';

	      if (currentPage > 1) {
	        paginationHtml += '<li class="page-item "><a class="page-link" href="#" onclick="clickPage(' + (currentPage - 1) + ')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&laquo;</span></li>';
	      }

	      for (var i = 1; i <= totalPages; i++) {
	        if (i == currentPage) {
	          paginationHtml += '<li class="page-item active"><a class="page-link" href="#" onclick="clickPage('+i+')">' + i + '</a></li>';
	        } else {
	          paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage(' + i + ')">' + i + '</a></li>';
	        }
	      }

	      if (currentPage < totalPages) {
	        paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage(' + (currentPage + 1) + ')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&raquo;</span></li>';
	      }

	      paginationHtml += '</ul></nav>';

	      $('#userPage').html(paginationHtml);

	      // 현재 페이지 강조 표시
	      $('.pagination li').click(function() {
	        $('.pagination li').removeClass('active');
	        $(this).addClass('active');
	      });

	    },
	    error: function(xhr, status, error) {
	      console.log('에러:', error);
	    }
	  });
	}
function clickPage1(pageNumber) {
	  $.ajax({
	    url: '/trainer',
	    method: 'GET',
	    dataType: 'json',	    
	    data: {
		      currentPage: pageNumber
		    },
	    success: function(response) {
	      var tableBody = $('#trainerTableBody');
	      tableBody.empty();

	      var trainer = response.trainer;
	      var formattedTrainerBirthList = response.formattedTrainerBirthList;
	      var formattedTrainerStartList = response.formattedTrainerStartList;
	      var formattedTrainerEndList = response.formattedTrainerEndList;

	      $.each(trainer, function(index, trainers) {
	        var row = '<tr style="font-size: 15px;">' +
	          '<th scope="row">' + (index + 1) + '</th>' +
	          '<td>' + trainers.users_ID + '</td>' +
	          '<td>' + trainers.users_NAME + '</td>' +
	          '<td>' + formattedTrainerBirthList[index] + '</td>' +
	          '<td>' + trainers.users_HEIGHT + '</td>' +
	          '<td>' + trainers.users_WEIGHT + '</td>' +
	          '<td>' + trainers.users_PHONE + '</td>' +
	          '<td>' + trainers.users_ADDR + '</td>' +
	          '<td>' + formattedTrainerStartList[index] + '</td>' +
	          '<td>' + formattedTrainerEndList[index] + '</td>';

	        if (trainers.users_STATE === 602) {
	          row += '<td>탈퇴</td>';
	        } else if (trainers.users_STATE === 603) {
	          row += '<td>휴면</td>';
	        } else if (trainers.users_STATE === 604) {
	          row += '<td>정지</td>';
	        } else {
	          row += '<td>활동중</td>';
	        }

	        row += '</tr>';

	        tableBody.append(row);
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}
function trainerpageLoad2() {
	var keyword = document.getElementById("keyword2").value;
	var search = document.getElementById("search2").value;
	  $.ajax({
	    url: '/trainerssearch',
	    method: 'GET',
	    data: {
	        keyword: keyword,
	        search: search
	        },
	    success: function(response) {
	      console.log('응답 데이터 response.page :', response.trainerTotal);
	      var itemsPerPage = 5; // Number of items to display per page
	      var totalItems = response.trainerTotal;
	      var currentPage = 1; // Assuming the current page is 1

	      var totalPages = Math.ceil(totalItems / itemsPerPage); // Calculate total number of pages

	      var paginationHtml = '<nav aria-label="Page navigation example"><ul class="pagination">';

	      if (currentPage > 1) {
	        paginationHtml += '<li class="page-item "><a class="page-link" href="#" onclick="clickPage1(' + (currentPage - 1) + ')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&laquo;</span></li>';
	      }

	      for (var i = 1; i <= totalPages; i++) {
	        if (i == currentPage) {
	          paginationHtml += '<li class="page-item active"><a class="page-link" href="#" onclick="clickPage1('+i+')">' + i + '</a></li>';
	        } else {
	          paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage1(' + i + ')">' + i + '</a></li>';
	        }
	      }

	      if (currentPage < totalPages) {
	        paginationHtml += '<li class="page-item"><a class="page-link" href="#" onclick="clickPage1(' + (currentPage + 1) + ')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
	      } else {
	        paginationHtml += '<li class="page-item disabled"><span class="page-link" aria-hidden="true">&raquo;</span></li>';
	      }

	      paginationHtml += '</ul></nav>';

	      $('#trainerPage').html(paginationHtml);

	      // 현재 페이지 강조 표시
	      $('.pagination li').click(function() {
	        $('.pagination li').removeClass('active');
	        $(this).addClass('active');
	      });

	    },
	    error: function(xhr, status, error) {
	      console.log('에러:', error);
	    }
	  });
	}

</script>