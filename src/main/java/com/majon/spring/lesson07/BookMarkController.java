package com.majon.spring.lesson07;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.majon.spring.lesson07.bo.BookmarkBO;
import com.majon.spring.lesson07.model.Bookmark;

@Controller
@RequestMapping("/lesson07")
public class BookMarkController {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	@GetMapping("/add_bookmark_view")
	public String addBookmarkView() {
		
		return "/lesson07/addBookmark";
	}
	
	@PostMapping("/addBookmark")
	@ResponseBody
	public Map<String,String> addBookmark(
			@RequestParam("name")String name
			,@RequestParam("url")String url
			){
	
		int count = bookmarkBO.insertBookMark(name, url);
	
		Map<String,String> result  = new HashMap<>();
	
		if(count ==1) {
			result.put("result","success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/print_bookmark_view")
	public String printBookMarkList(Model model) {
		List<Bookmark> bookmarkList = bookmarkBO.selectBookmarkList();
		
		model.addAttribute("bookmarkList", bookmarkList);
		
		return"/lesson07/BookmarkList";
	}
	
	@PostMapping("/isDuplicate")
	@ResponseBody
	public Map<String,Boolean> isDuplicate(@RequestParam("url") String url){
		
		Boolean bool = bookmarkBO.isDuplicate(url);
		
		Map<String,Boolean> result = new HashMap<>();
		
		if(bool) {
			result.put("isDuplicate", true);
		}else {
			result.put("isDuplicate", false);
		}
		
		return result;
	
	}
	
	@GetMapping("/deleteUrl")
	@ResponseBody
	public Map<String,String> deleteUrl(@RequestParam("url") String url){
		
		Map<String,String> result = new HashMap<>();

		int count = bookmarkBO.deleteUrl(url);
		
		if(count>=1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
}
