package com.example.S20230501.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.S20230501.Model.Biz;
import com.example.S20230501.Service.SearchService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequiredArgsConstructor
public class SearchController {
	private final SearchService searchService;
	
	@GetMapping("search")
	public String search(Model model, Biz biz ){
		List<Biz> searchList = searchService.serchList(biz);
		System.out.println("컨트롤러에 키워드 값이 잘 들어오나"+biz.getKeyword());
		
		model.addAttribute("searchList",searchList);
		return "search";
	}

}
