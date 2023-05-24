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
	<div id="userModalContainer">
		<div class="modal fade" id="myModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">회원 정보 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
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
  <label for="password" class="form-label">비밀번호 변경</label>
  <input type="password" class="form-control" id="password" placeholder="비밀번호 입력" required>
  <div class="invalid-feedback" id="passwordError">비밀번호를 입력해주세요.</div>
</div>
<div class="col-12">
  <label for="passwordConfirm" class="form-label">비밀번호 확인</label>
  <input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호 확인" required>
  <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
</div>

								<div class="col-12">
									<label for="address" class="form-label">주소</label> <input
										type="text" class="form-control" id="address" placeholder=""
										required>
									<div class="invalid-feedback"></div>
								</div>
								<div class="col-6">
									<label for="birthDate" class="form-label">생년월일</label> <input
										type="text" class="form-control" id="birthDate"
										placeholder="19**-01-01" minlength="10" maxlength="10"
										required>
									<div class="invalid-feedback"></div>
								</div>
								<div class="col-6">
									<label for="gender" class="form-label">성별</label> <select
										class="form-select" id="gender" required>
										<option value="" disabled selected>선택</option>
										<option value="701">남자</option>
										<option value="702">여자</option>
									</select>
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
										<option value="602">탈퇴</option>
										<option value="603">휴면</option>
										<option value="604">정지</option>
									</select>
									<div class="invalid-feedback"></div>
								</div>
								<div class="col-md-3">
									<label for="height" class="form-label">키</label> <input
										type="text" class="form-control" id="height" placeholder=""
										required>
									<div class="invalid-feedback">키를 입력해주세요.</div>
								</div>
								<div class="col-md-3">
									<label for="weight" class="form-label">몸무게</label> <input
										type="text" class="form-control" id="weight" placeholder=""
										required>
									<div class="invalid-feedback">몸무게를 입력해주세요.</div>
								</div>

								<div class="col-12 mt-3">
									<button type="button" class="btn btn-primary"
										onclick="editForm()">수정</button>
									<button type="button" class="btn btn-danger"
										onclick="deleteForm()">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	function editForm() {
		  var password = $('#password').val();
		  var passwordConfirm = $('#passwordConfirm').val();

		  if (password !== passwordConfirm) {
		    $('#passwordConfirm').addClass('is-invalid');
		    $('.invalid-feedback').text('비밀번호가 일치하지 않습니다.');
		    showAlert('비밀번호가 일치하지 않습니다.');
		    return;
		  } else {
		    $('#passwordConfirm').removeClass('is-invalid');
		    $('.invalid-feedback').text('');
		    showAlert('성공했습니다');
		  }

		  var firstName = document.getElementById("firstName").value;
		  var lastName = document.getElementById("lastName").value;
		  var address = document.getElementById("address").value;
		  var birthDate = document.getElementById("birthDate").value;
		  var formattedBirthDate = birthDate.split('-').join('/');
		  var gender = document.getElementById("gender").value;
		  var height = document.getElementById("height").value;
		  var weight = document.getElementById("weight").value;
		  var phone = document.getElementById("phone").value;
		  var status = document.getElementById("status").value;
		  var password = document.getElementById("password").value;
		  
		  $.ajax({
		    url: '/editForm',
		    method: 'GET',
		    data: {
		      USERS_PASS: password,
		      USERS_PHONE: phone,
		      USERS_ADDR: address,
		      USERS_STATE: status,
		      USERS_BIRTH: formattedBirthDate,
		      USERS_HEIGHT: height,
		      USERS_WEIGHT: weight,
		      USERS_NAME: firstName,
		      USERS_ID: lastName,
		      USERS_GENDER: gender
		    },
		    success: function(response) {
		      console.log('응답 데이터 성공했습니다', response);
		      // Close the modal
		      $('#myModal').modal('hide');
		      location.reload();
		    },
		    error: function(xhr, status, error) {
		      console.log('에러:', error);
		    }
		  });
		}

		function showAlert(message) {
		  alert(message);
		}
	</script>
	<table class="table table-dark table-hover" style="max-width: 1200px;">
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
			<th scope="col">성별</th>
			<th scope="col">키</th>
			<th scope="col">몸무게</th>
			<th scope="col">연락처</th>
			<th scope="col">거주지</th>
			<th scope="col">가입일</th>
			<th scope="col">상태 변경일</th>
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
			<th scope="col">성별</th>
			<th scope="col">키</th>
			<th scope="col">몸무게</th>
			<th scope="col">연락처</th>
			<th scope="col">거주지</th>
			<th scope="col">가입일</th>
			<th scope="col">상태 변경일</th>
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
	        var row = $('<tr style="font-size: 15px;"></tr>');

	        var indexCell = $('<th scope="row">' + (index + 1) + '</th>');
	        var userIdCell = $('<td>' + user.users_ID + '</td>');
	        var userNameCell = $('<td>' + user.users_NAME + '</td>');
	        var userBirthCell = $('<td>' + formattedUserBirthList[index] + '</td>');
	        var userGenderCell = $('<td>' + (user.users_GENDER == 701 ? '남자' : '여자') + '</td>');
	        var userHeightCell = $('<td>' + user.users_HEIGHT + '</td>');
	        var userWeightCell = $('<td>' + user.users_WEIGHT + '</td>');
	        var userPhoneCell = $('<td>' + user.users_PHONE + '</td>');
	        var userAddressCell = $('<td>' + user.users_ADDR + '</td>');
	        var userStartCell = $('<td>' + formattedUserStartList[index] + '</td>');
	        var userEndCell = $('<td>' + formattedUserEndList[index] + '</td>');
	        var userStateCell = $('<td></td>').text(getUserState(user.users_STATE));

	        row.append(indexCell, userIdCell, userNameCell, userBirthCell, userGenderCell, userHeightCell, userWeightCell, userPhoneCell, userAddressCell, userStartCell, userEndCell, userStateCell);
	        tableBody.append(row);

	        // Add click event handler to the row
	        row.click(function() {
	        	
	          // Show the modal
	          $('#myModal').modal('show');
              console.log("됩니까??");
	          // Populate the form fields with user data
	          $('#firstName').val(user.users_NAME);
	          $('#lastName').val(user.users_ID);
	          $('#address').val(user.users_ADDR);
	          $('#birthDate').val(formattedUserBirthList[index]);
	          $('#gender').val(user.users_GENDER == 701 ? '701' : '702');
	          $('#height').val(user.users_HEIGHT);
	          $('#weight').val(user.users_WEIGHT);
	          $('#phone').val(user.users_PHONE);
	          $('#status').val(user.users_STATE);
	          $('#password').val(user.users_PASS);
	          $('#passwordConfirm').val(user.users_PASS);
	        });
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}

	function getUserState(stateCode) {
	  switch (stateCode) {
	    case 602:
	      return '탈퇴';
	    case 603:
	      return '휴면';
	    case 604:
	      return '정지';
	    default:
	      return '활동중';
	  }
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

		      $.each(trainer, function(index, trainer) {
		        var row = $('<tr style="font-size: 15px;"></tr>');

		        var indexCell = $('<th scope="row">' + (index + 1) + '</th>');
		        var userIdCell = $('<td>' + trainer.users_ID + '</td>');
		        var userNameCell = $('<td>' + trainer.users_NAME + '</td>');
		        var userBirthCell = $('<td>' + formattedTrainerBirthList[index] + '</td>');
		        var userGenderCell = $('<td>' + (trainer.users_GENDER == 701 ? '남자' : '여자') + '</td>');
		        var userHeightCell = $('<td>' + trainer.users_HEIGHT + '</td>');
		        var userWeightCell = $('<td>' + trainer.users_WEIGHT + '</td>');
		        var userPhoneCell = $('<td>' + trainer.users_PHONE + '</td>');
		        var userAddressCell = $('<td>' + trainer.users_ADDR + '</td>');
		        var userStartCell = $('<td>' + formattedTrainerStartList[index] + '</td>');
		        var userEndCell = $('<td>' + formattedTrainerEndList[index] + '</td>');
		        var userStateCell = $('<td></td>').text(getUserState(trainer.users_STATE));

		        row.append(indexCell, userIdCell, userNameCell, userBirthCell, userGenderCell, userHeightCell, userWeightCell, userPhoneCell, userAddressCell, userStartCell, userEndCell, userStateCell);
		        tableBody.append(row);

		        // Add click event handler to the row
		        row.click(function() {
		          // Show the modal
		          $('#myModal').modal('show');
		          console.log("됩니까??");

		          // Populate the form fields with user data
		          $('#firstName').val(trainer.users_NAME);
		          $('#lastName').val(trainer.users_ID);
		          $('#address').val(trainer.users_ADDR);
		          $('#birthDate').val(formattedTrainerBirthList[index]);
		          $('#gender').val(trainer.users_GENDER == 701 ? '701' : '702');
		          $('#height').val(trainer.users_HEIGHT);
		          $('#weight').val(trainer.users_WEIGHT);
		          $('#phone').val(trainer.users_PHONE);
		          $('#status').val(trainer.users_STATE);
		          $('#password').val(trainer.users_PASS);
		          $('#passwordConfirm').val(trainer.users_PASS);
		        });
		      });
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		  });
		}
		function getUserState(stateCode) {
		  switch (stateCode) {
		    case 602:
		      return '탈퇴';
		    case 603:
		      return '휴면';
		    case 604:
		      return '정지';
		    default:
		      return '활동중';
		  }
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
	    	
		        pageLoad3();
	      var tableBody = $('#userTableBody');
	      tableBody.empty();
	      var users = response.users;
	      var formattedUserBirthList = response.formattedUserBirthList;
	      var formattedUserStartList = response.formattedUserStartList;
	      var formattedUserEndList = response.formattedUserEndList;
	      $.each(users, function(index, user) {
	    	  var row = $('<tr style="font-size: 15px;"></tr>');

		        var indexCell = $('<th scope="row">' + (index + 1) + '</th>');
		        var userIdCell = $('<td>' + user.users_ID + '</td>');
		        var userNameCell = $('<td>' + user.users_NAME + '</td>');
		        var userBirthCell = $('<td>' + formattedUserBirthList[index] + '</td>');
		        var userGenderCell = $('<td>' + (user.users_GENDER == 701 ? '남자' : '여자') + '</td>');
		        var userHeightCell = $('<td>' + user.users_HEIGHT + '</td>');
		        var userWeightCell = $('<td>' + user.users_WEIGHT + '</td>');
		        var userPhoneCell = $('<td>' + user.users_PHONE + '</td>');
		        var userAddressCell = $('<td>' + user.users_ADDR + '</td>');
		        var userStartCell = $('<td>' + formattedUserStartList[index] + '</td>');
		        var userEndCell = $('<td>' + formattedUserEndList[index] + '</td>');
		        var userStateCell = $('<td></td>').text(getUserState(user.users_STATE));

		        row.append(indexCell, userIdCell, userNameCell, userBirthCell, userGenderCell, userHeightCell, userWeightCell, userPhoneCell, userAddressCell, userStartCell, userEndCell, userStateCell);
		        tableBody.append(row);

		        // Add click event handler to the row
		        row.click(function() {
		        	
		          // Show the modal
		          $('#myModal').modal('show');
	              console.log("됩니까??");
		          // Populate the form fields with user data
		          $('#firstName').val(user.users_NAME);
		          $('#lastName').val(user.users_ID);
		          $('#address').val(user.users_ADDR);
		          $('#birthDate').val(formattedUserBirthList[index]);
		          $('#gender').val(user.users_GENDER == 701 ? '701' : '702');
		          $('#height').val(user.users_HEIGHT);
		          $('#weight').val(user.users_WEIGHT);
		          $('#phone').val(user.users_PHONE);
		          $('#status').val(user.users_STATE);
		          $('#password').val(user.users_PASS);
		          $('#passwordConfirm').val(user.users_PASS);
		        });
		      });
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		  });
		}

		function getUserState(stateCode) {
		  switch (stateCode) {
		    case 602:
		      return '탈퇴';
		    case 603:
		      return '휴면';
		    case 604:
		      return '정지';
		    default:
		      return '활동중';
		  }
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
     
	  $.ajax({
	    url: '/userssearch',
	    method: 'GET',
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
	    	  var row = $('<tr style="font-size: 15px;"></tr>');

		        var indexCell = $('<th scope="row">' + (index + 1) + '</th>');
		        var userIdCell = $('<td>' + user.users_ID + '</td>');
		        var userNameCell = $('<td>' + user.users_NAME + '</td>');
		        var userBirthCell = $('<td>' + formattedUserBirthList[index] + '</td>');
		        var userGenderCell = $('<td>' + (user.users_GENDER == 701 ? '남자' : '여자') + '</td>');
		        var userHeightCell = $('<td>' + user.users_HEIGHT + '</td>');
		        var userWeightCell = $('<td>' + user.users_WEIGHT + '</td>');
		        var userPhoneCell = $('<td>' + user.users_PHONE + '</td>');
		        var userAddressCell = $('<td>' + user.users_ADDR + '</td>');
		        var userStartCell = $('<td>' + formattedUserStartList[index] + '</td>');
		        var userEndCell = $('<td>' + formattedUserEndList[index] + '</td>');
		        var userStateCell = $('<td></td>').text(getUserState(user.users_STATE));

		        row.append(indexCell, userIdCell, userNameCell, userBirthCell, userGenderCell, userHeightCell, userWeightCell, userPhoneCell, userAddressCell, userStartCell, userEndCell, userStateCell);
		        tableBody.append(row);

		        // Add click event handler to the row
		        row.click(function() {
		        	
		          // Show the modal
		          $('#myModal').modal('show');
	              console.log("됩니까??");
		          // Populate the form fields with user data
		          $('#firstName').val(user.users_NAME);
		          $('#lastName').val(user.users_ID);
		          $('#address').val(user.users_ADDR);
		          $('#birthDate').val(formattedUserBirthList[index]);
		          $('#gender').val(user.users_GENDER == 701 ? '701' : '702');
		          $('#height').val(user.users_HEIGHT);
		          $('#weight').val(user.users_WEIGHT);
		          $('#phone').val(user.users_PHONE);
		          $('#status').val(user.users_STATE);
		          $('#password').val(user.users_PASS);
		          $('#passwordConfirm').val(user.users_PASS);
		        });
		      });
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		  });
		}

		function getUserState(stateCode) {
		  switch (stateCode) {
		    case 602:
		      return '탈퇴';
		    case 603:
		      return '휴면';
		    case 604:
		      return '정지';
		    default:
		      return '활동중';
		  }
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

	      $.each(trainer, function(index, trainer) {
	        var row = $('<tr style="font-size: 15px;"></tr>');

	        var indexCell = $('<th scope="row">' + (index + 1) + '</th>');
	        var userIdCell = $('<td>' + trainer.users_ID + '</td>');
	        var userNameCell = $('<td>' + trainer.users_NAME + '</td>');
	        var userBirthCell = $('<td>' + formattedTrainerBirthList[index] + '</td>');
	        var userGenderCell = $('<td>' + (trainer.users_GENDER == 701 ? '남자' : '여자') + '</td>');
	        var userHeightCell = $('<td>' + trainer.users_HEIGHT + '</td>');
	        var userWeightCell = $('<td>' + trainer.users_WEIGHT + '</td>');
	        var userPhoneCell = $('<td>' + trainer.users_PHONE + '</td>');
	        var userAddressCell = $('<td>' + trainer.users_ADDR + '</td>');
	        var userStartCell = $('<td>' + formattedTrainerStartList[index] + '</td>');
	        var userEndCell = $('<td>' + formattedTrainerEndList[index] + '</td>');
	        var userStateCell = $('<td></td>').text(getUserState(trainer.users_STATE));

	        row.append(indexCell, userIdCell, userNameCell, userBirthCell, userGenderCell, userHeightCell, userWeightCell, userPhoneCell, userAddressCell, userStartCell, userEndCell, userStateCell);
	        tableBody.append(row);

	        // Add click event handler to the row
	        row.click(function() {
	          // Show the modal
	          $('#myModal').modal('show');
	          console.log("됩니까??");

	          // Populate the form fields with user data
	          $('#firstName').val(trainer.users_NAME);
	          $('#lastName').val(trainer.users_ID);
	          $('#address').val(trainer.users_ADDR);
	          $('#birthDate').val(formattedTrainerBirthList[index]);
	          $('#gender').val(trainer.users_GENDER == 701 ? '701' : '702');
	          $('#height').val(trainer.users_HEIGHT);
	          $('#weight').val(trainer.users_WEIGHT);
	          $('#phone').val(trainer.users_PHONE);
	          $('#status').val(trainer.users_STATE);
	          $('#password').val(trainer.users_PASS);
	          $('#passwordConfirm').val(trainer.users_PASS);
	        });
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}

	function getUserState(stateCode) {
	  switch (stateCode) {
	    case 602:
	      return '탈퇴';
	    case 603:
	      return '휴면';
	    case 604:
	      return '정지';
	    default:
	      return '활동중';
	  }
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

	      $.each(trainer, function(index, trainer) {
	        var row = $('<tr style="font-size: 15px;"></tr>');

	        var indexCell = $('<th scope="row">' + (index + 1) + '</th>');
	        var userIdCell = $('<td>' + trainer.users_ID + '</td>');
	        var userNameCell = $('<td>' + trainer.users_NAME + '</td>');
	        var userBirthCell = $('<td>' + formattedTrainerBirthList[index] + '</td>');
	        var userGenderCell = $('<td>' + (trainer.users_GENDER == 701 ? '남자' : '여자') + '</td>');
	        var userHeightCell = $('<td>' + trainer.users_HEIGHT + '</td>');
	        var userWeightCell = $('<td>' + trainer.users_WEIGHT + '</td>');
	        var userPhoneCell = $('<td>' + trainer.users_PHONE + '</td>');
	        var userAddressCell = $('<td>' + trainer.users_ADDR + '</td>');
	        var userStartCell = $('<td>' + formattedTrainerStartList[index] + '</td>');
	        var userEndCell = $('<td>' + formattedTrainerEndList[index] + '</td>');
	        var userStateCell = $('<td></td>').text(getUserState(trainer.users_STATE));

	        row.append(indexCell, userIdCell, userNameCell, userBirthCell, userGenderCell, userHeightCell, userWeightCell, userPhoneCell, userAddressCell, userStartCell, userEndCell, userStateCell);
	        tableBody.append(row);

	        // Add click event handler to the row
	        row.click(function() {
	          // Show the modal
	          $('#myModal').modal('show');
	          console.log("됩니까??");

	          // Populate the form fields with user data
	          $('#firstName').val(trainer.users_NAME);
	          $('#lastName').val(trainer.users_ID);
	          $('#address').val(trainer.users_ADDR);
	          $('#birthDate').val(formattedTrainerBirthList[index]);
	          $('#gender').val(trainer.users_GENDER == 701 ? '701' : '702');
	          $('#height').val(trainer.users_HEIGHT);
	          $('#weight').val(trainer.users_WEIGHT);
	          $('#phone').val(trainer.users_PHONE);
	          $('#status').val(trainer.users_STATE);
	          $('#password').val(trainer.users_PASS);
	          $('#passwordConfirm').val(trainer.users_PASS);
	        });
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log('Error:', error);
	    }
	  });
	}

	function getUserState(stateCode) {
	  switch (stateCode) {
	    case 602:
	      return '탈퇴';
	    case 603:
	      return '휴면';
	    case 604:
	      return '정지';
	    default:
	      return '활동중';
	  }
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