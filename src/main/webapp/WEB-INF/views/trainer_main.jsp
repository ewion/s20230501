<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>

<style>
@import
	url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

body {
	background-color:  rgb(52, 73, 94);
}

#calender {
	background-color: rgb(52, 73, 94);
	height: auto;
	width: 400px;
	margin: 0px;
	margin: 0 auto;
	box-shadow: 10px 10px 10px 10px rgba(0, 0, 0, 0.3);
}
table {
    border: 0;
    width: 100%;
}

td {
background-color:rgb(52, 73, 94);
    border:0;
	width: 50px;
	height: 50px;
	color: rgb(22, 160, 133);
}

.Calendar {
	text-align: center;
}

.Calendar>thead>tr:first-child>td {
	font-family: 'Questrial', sans-serif;
	font-size: 1.1em;
	font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
	font-family: 'Questrial', sans-serif;
	font-weight: 600;
}

.Calendar>tbody>tr>td>p {
	font-family: 'Montserrat', sans-serif;
	height: 45px;
	width: 45px;
	border-radius: 2px;
	transition-duration: .2s;
	line-height: 45px;
	margin: 2.5px;
	display: block;
	text-align: center;
}

.pastDay {
	color: lightgray;
}

.today {
	background-color: #212529;
	color: rgb(22, 160, 133);
	font-weight: 600;
	cursor: pointer;
}

.futureDay {
	background-color: rgb(52, 73, 94);
	color: rgb(22, 160, 133);
	cursor: pointer;
}

.futureDay:hover {
	background: #eee;
}

.futureDay.choiceDay,
.today.choiceDay {
	background: #0A174E;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}
#formDiv {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#todayInfo {
	margin-top: 20px;
}

#trainerOrder {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	height: auto;
	margin-top: 10px;
}

.trainerOrderOne {
	margin-top: 3px;
}

#trainerComent {
	display: inline-block;
	flex-direction: column;
	align-items: flex-start;
	margin-top: 10px;
}

#formButtons {
	display: flex;
	justify-content: flex-end;
}

#memberTable {
	margin-top: 20px;
}

button {
	margin-top: 10px;
}

addActivity {
	display: flex;
	justify-content: flex-end;
}
</style>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

window.onload = function () {
  buildCalendar();
};

let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date(); // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화
// 달력 생성: 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {
  let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
  let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0); // 이번달 마지막날

  let tbody_Calendar = document.querySelector(".Calendar > tbody");
  document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
  document.getElementById("calMonth").innerText = leftPad(
    nowMonth.getMonth() + 1
  ); // 월 숫자 갱신

  while (tbody_Calendar.rows.length > 0) {
    // 이전 출력결과가 남아있는 경우 초기화
    tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
  }

  let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가

  for (let j = 0; j < firstDate.getDay(); j++) {
    // 이번달 1일의 요일만큼
    let nowColumn = nowRow.insertCell(); // 열 추가
  }

  for (
    let nowDay = new Date(firstDate);
    nowDay <= lastDate;
    nowDay.setDate(nowDay.getDate() + 1)
  ) {
    // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

    let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

    let newDIV = document.createElement("p");
    newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
    nowColumn.appendChild(newDIV);

    if (
      nowDay.getDay() == 6 // 토요일인 경우
    ) {
      nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
    }

    if (
      nowDay.getFullYear() == today.getFullYear() &&
      nowDay.getMonth() == today.getMonth() &&
      nowDay.getDate() == today.getDate()
    ) {
      // 오늘인 경우
      newDIV.className = "today";
      newDIV.onclick = function () {
        choiceDate(this);
      };
    } else {
      // 미래인 경우
      newDIV.className = "futureDay";
      newDIV.onclick = function () {
        choiceDate(this);
      };
    }
  }
}

// 날짜 선택
// 날짜 선택
function choiceDate(newDIV) {
  if (document.getElementsByClassName("choiceDay")[0]) {
    // 기존에 선택한 날짜가 있으면
    document
      .getElementsByClassName("choiceDay")[0]
      .classList.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
  }
  newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가

  // 클릭한 날짜의 연도, 월, 일을 추출하여 콘솔에 출력
	const year = String(today.getFullYear()).slice(-2);
  const month = document.getElementById("calMonth").innerText;
  const day = newDIV.innerHTML;
  console.log("선택한 날짜:", year, month, day);

  // 클릭한 날짜를 form태그 내의 input태그에 추가
  document.getElementById("selectDate").value = year+"/"+month+"/"+day

	$.ajax({
		url: '/todayMembersList',
		method : 'GET',
		data : {
			selectDate: $('#selectDate').val(),
			trainer_id: $('#trainer_id').val()
		},
		dataType: 'json',
		success: function(response) {

			var tableBody = $('#memberTableBody');
			tableBody.empty();

			// 성공적인 응답 처리
			// response를 이용하여 테이블에 데이터를 추가하는 로직 작성
			response.forEach(function(users) {
				var row = '<tr>' +
						'<td>' + users.users_name + '<input type="hidden" readonly id="users_id" name="users_id" value="' + users.users_id + '"></td>' +

						'<td>';

				if (users.users_gender == '701') {
					row += '남';
				} else if (users.users_gender == '702') {
					row += '여';
				}

				row += '</td>' +
						'<td>' + users.users_phone + '</td>' +
						'<td>' + users.ticket_end.substring(0, 10) + '</td>' +
						'<td></td>'+
						'<td><button type="submit">확인</button></td>';

				tableBody.append(row);
			});
		},
		error: function (xhr, status,error) {
			var tableBody = $('#memberTableBody');
			tableBody.empty();
		}
	});
}


// 이전달 버튼 클릭
function prevCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() - 1,
    nowMonth.getDate()
  ); // 현재 달을 1 감소
  buildCalendar(); // 달력 다시 생성
}

// 다음달 버튼 클릭
function nextCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() + 1,
    nowMonth.getDate()
  ); // 현재 달을 1 증가
  buildCalendar(); // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
  if (value < 10) {
    value = "0" + value;
    return value;
  }
  return value;
}

// 페이지 로드 시 오늘 일자 추출
document.addEventListener('DOMContentLoaded', function () {
	const year = String(today.getFullYear()).slice(-2);
	const month = String(today.getMonth() + 1).padStart(2, '0');
	const day = String(today.getDate()).padStart(2, '0');
	console.log("오늘 날짜 :", year, month, day);
	document.getElementById("selectDate").value = year+"/"+month+"/"+day
});

// ajax
</script>
</head>

<body>
	<div id="content">
		<div id="calender">
			<table class="Calendar">
				<thead>
					<tr>
						<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
						<td colspan="5"><span id="calYear"></span>년 <span
							id="calMonth"></span>월</td>
						<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
					</tr>
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
					</tr>
				</thead>

				<tbody>
				</tbody>
			</table>
		</div>
		<div id="formDiv">
			<form action="trainer_management" method="get">
				<div id="memberTable">
					<table class="table table-dark table-hover" style="max-width: 1200px;">
						<a style="color: rgb(22, 160, 133);">트레이너 ${trainerInfo.USERS_NAME} 님 안녕하세요
						<input id="selectDate" name="selectDate" value="" readonly style="background-color:  rgb(52, 73, 94); align-items: center"> 일정 관리입니다.</a>
						<tr>
							<th scope="col">이름</th>
							<th scope="col">성별</th>
							<th scope="col">연락처</th>
							<th scope="col">종료일</th>
							<th scope="col">활동</th>
							<th scope="col">관리</th>
						</tr>
						</thead>
						<tbody id="memberTableBody">
							<c:forEach var="users" items="${trainersMemberList}">
								<tr>
									<td>${users.users_name}<input type="hidden" readonly id="users_id" name="users_id" value="${users.users_id}"></td>
									<td><c:choose>
										<c:when test="${users.users_gender eq '701'}">남</c:when>
										<c:when test="${users.users_gender eq '702'}">여</c:when>
										</c:choose>
									</td>
									<td>${users.users_phone}</td>
									<td>${fn:substring(users.ticket_end, 0, 10)}</td>
									<td></td>
									<td><button type="submit">확인</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<input type="hidden" id="trainer_id" name="trainer_id" value="${trainerInfo.USERS_ID}" readonly>
			</form>
		</div>
	</div>
</body>
</html>

