package com.example.S20230501.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.S20230501.Model.HT_USERS_DATA;
import com.example.S20230501.Service.Paging;
import com.example.S20230501.Service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequiredArgsConstructor
public class UsersController {
	private final UsersService usersServic;

	@GetMapping("/Users")
	public String users(HT_USERS_DATA users_DATA, Model model) {
		return "Users";
	}
	@ResponseBody
	@GetMapping("/loadUsers")
	public Map<String, Object> loadUsers(HT_USERS_DATA users_DATA,String currentPage, Model model) {
		int userTotal = usersServic.userTotal();
		Paging page = new Paging(userTotal, currentPage);
		users_DATA.setStart(page.getStart()); // 시작시 1
		users_DATA.setEnd(page.getEnd());     // 시작시 10
		List<HT_USERS_DATA> users = usersServic.users_DATA(users_DATA);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> formattedUserBirthList = new ArrayList<>();
		List<String> formattedUserStartList = new ArrayList<>();
		List<String> formattedUserEndList = new ArrayList<>();
		for (HT_USERS_DATA user : users) {
			Date usersBirth = user.getUSERS_BIRTH();
			Date usersStart = user.getUSERS_START();
			Date usersEnd = user.getUSERS_END();
			if (usersEnd == null) {
				formattedUserEndList.add("");
			}else {
				String formattedEnd = dateFormat.format(usersEnd);
				formattedUserEndList.add(formattedEnd);
			}

			if (usersBirth != null) {
				String formattedBirth = dateFormat.format(usersBirth);
				String formattedStart = dateFormat.format(usersStart);

				formattedUserBirthList.add(formattedBirth);
				formattedUserStartList.add(formattedStart);
			}
		}

		Map<String, Object> response = new HashMap<>();
		response.put("users", users);
		response.put("formattedUserBirthList", formattedUserBirthList);
		response.put("formattedUserStartList", formattedUserStartList);
		response.put("formattedUserEndList", formattedUserEndList);
		response.put("userTotal", userTotal);

		return response;
	}

	@ResponseBody
	@GetMapping("/trainer")
	public   Map<String, Object> trainerList(HT_USERS_DATA users_DATA,String currentPage, Model model){
		int trainerTotal = usersServic.trainerTotal();
		Paging page = new Paging(trainerTotal, currentPage);
		users_DATA.setStart(page.getStart()); // 시작시 1
		users_DATA.setEnd(page.getEnd());     // 시작시 10
		List<HT_USERS_DATA> trainer = usersServic.trainer(users_DATA);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		List<String> formattedTrainerBirthList = new ArrayList<>();
		List<String> formattedTrainerStartList = new ArrayList<>();
		List<String> formattedTrainerEndList = new ArrayList<>();

		for (HT_USERS_DATA trainerData : trainer) {
			Date trainerBirth = trainerData.getUSERS_BIRTH();
			Date trainerStart = trainerData.getUSERS_START();
			Date trainerEnd = trainerData.getUSERS_END();



			if (trainerEnd == null) {
				formattedTrainerEndList.add("");
			}else {
				String formattedEnd = dateFormat.format(trainerEnd);
				formattedTrainerEndList.add(formattedEnd);
			}


			if (trainerBirth != null) {
				String formattedTrainerBirth = dateFormat.format(trainerBirth);
				String formattedTrainerStart = dateFormat.format(trainerStart);

				formattedTrainerBirthList.add(formattedTrainerBirth);
				formattedTrainerStartList.add(formattedTrainerStart);
				System.out.println("trainer의 USERS_BIRTH: " + formattedTrainerBirth);
			}
		}
		System.out.println("trainer"+trainer);
		Map<String, Object> response = new HashMap<>();
		response.put("trainer", trainer);
		response.put("formattedTrainerBirthList", formattedTrainerBirthList);
		response.put("formattedTrainerStartList", formattedTrainerStartList);
		response.put("formattedTrainerEndList", formattedTrainerEndList);
		response.put("trainerTotal", trainerTotal);

		return response;
	}
	@ResponseBody
	@GetMapping("/userssearch")
	public Map<String, Object> userssearch(HT_USERS_DATA users_DATA,String currentPage, Model model) {
		int userTotal = usersServic.userssearch1(users_DATA);
		System.out.println("userTotal"+userTotal);
		Paging page = new Paging(userTotal, currentPage);
		users_DATA.setStart(page.getStart()); // 시작시 1
		users_DATA.setEnd(page.getEnd());     // 시작시 10
		System.out.println(users_DATA.getKeyword());
		System.out.println(users_DATA.getSearch());
		List<HT_USERS_DATA> userssearch=usersServic.userssearch(users_DATA);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> formattedUserBirthList = new ArrayList<>();
		List<String> formattedUserStartList = new ArrayList<>();
		List<String> formattedUserEndList = new ArrayList<>();

		for (HT_USERS_DATA user : userssearch) {
			Date usersBirth = user.getUSERS_BIRTH();
			Date usersStart = user.getUSERS_START();
			Date usersEnd = user.getUSERS_END();

			if (usersEnd == null) {
				formattedUserEndList.add("");
			}else {
				String formattedEnd = dateFormat.format(usersEnd);
				formattedUserEndList.add(formattedEnd);
			}

			if (usersBirth != null) {
				String formattedBirth = dateFormat.format(usersBirth);
				String formattedStart = dateFormat.format(usersStart);

				formattedUserBirthList.add(formattedBirth);
				formattedUserStartList.add(formattedStart);
			}
		}
		Map<String, Object> response = new HashMap<>();
		response.put("users", userssearch);
		response.put("formattedUserBirthList", formattedUserBirthList);
		response.put("formattedUserStartList", formattedUserStartList);
		response.put("formattedUserEndList", formattedUserEndList);
		response.put("userTotal", userTotal);
		return response;
	}
	@ResponseBody
	@GetMapping("/trainerssearch")
	public Map<String, Object> trainerssearch(HT_USERS_DATA users_DATA,String currentPage, Model model) {
		int trainerTotal = usersServic.trainerscTotal(users_DATA);
		System.out.println("trainerTotal"+trainerTotal);
		Paging page = new Paging(trainerTotal, currentPage);
		users_DATA.setStart(page.getStart()); // 시작시 1
		users_DATA.setEnd(page.getEnd());     // 시작시 10
		List<HT_USERS_DATA> trainer = usersServic.trainerSearch(users_DATA);
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> formattedTrainerBirthList = new ArrayList<>();
		List<String> formattedTrainerStartList = new ArrayList<>();
		List<String> formattedTrainerEndList = new ArrayList<>();

		for (HT_USERS_DATA trainerData : trainer) {
			Date trainerBirth = trainerData.getUSERS_BIRTH();
			Date trainerStart = trainerData.getUSERS_START();
			Date trainerEnd = trainerData.getUSERS_END();
			if (trainerEnd == null) {
				formattedTrainerEndList.add("");
			}else {
				String formattedEnd = dateFormat.format(trainerEnd);
				formattedTrainerEndList.add(formattedEnd);
			}
			if (trainerBirth != null) {
				String formattedTrainerBirth = dateFormat.format(trainerBirth);
				String formattedTrainerStart = dateFormat.format(trainerStart);

				formattedTrainerBirthList.add(formattedTrainerBirth);
				formattedTrainerStartList.add(formattedTrainerStart);
				System.out.println("trainer의 formattedTrainerEndList: " + formattedTrainerEndList);
			}
		}
		Map<String, Object> response = new HashMap<>();
		response.put("trainer", trainer);
		response.put("formattedTrainerBirthList", formattedTrainerBirthList);
		response.put("formattedTrainerStartList", formattedTrainerStartList);
		response.put("formattedTrainerEndList", formattedTrainerEndList);
		response.put("trainerTotal", trainerTotal);

		return response;
	}
	@ResponseBody
	@GetMapping("editForm")
	public int editForm(HT_USERS_DATA data) {
	    if (data.getUSERS_STATE() == 601) {
	        data.setUSERS_END(null);
	    } else {
	        data.setUSERS_END(new Date());
	    }
	    System.out.println("data==>" + data.getUSERS_END());
	    int editForm = usersServic.editForm(data);

	    return editForm;
	}
}