package com.example.S20230501.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.S20230501.Model.CalenderModel;
import com.example.S20230501.Service.CalenderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Controller
@RequiredArgsConstructor
@Slf4j
public class CalenderController {
	private final CalenderService calenderService;
	
	@GetMapping("/")
	public String main() {
		
		return "main";
	}

	
	@RequestMapping(value = "/calender", method = RequestMethod.GET)
	public String goTestPage() {
		return "cal_sample";
	}
}
