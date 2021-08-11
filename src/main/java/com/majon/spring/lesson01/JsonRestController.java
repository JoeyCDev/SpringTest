package com.majon.spring.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/lesson01/test02")
public class JsonRestController {

	// 1.json 출력(List, Map)
	@RequestMapping("/1")
	public List<Map<String,Object>> printListMap(){
		List<Map<String,Object>> list = new ArrayList<>();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		list.add(map);
		map = new HashMap<String,Object>();
		map.put("rate", 0);
		map.put("director", "로베르토 베니니");
		map.put("time", 131);
		map.put("title", "인생은 아름다워");
		list.add(map);
		map = new HashMap<String,Object>();
		map.put("rate", 12);
		map.put("director", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		list.add(map);
		map = new HashMap<String,Object>();
		map.put("rate", 19);
		map.put("director", "윤종빈");
		map.put("time", 133);
		map.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		list.add(map);
		map = new HashMap<String,Object>();
		map.put("rate", 15);
		map.put("director", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		list.add(map);
		
		return list;
	}
	
	// 2.json 출력(List, Class)
	
	@RequestMapping("/2")
	public List<User> printListClass(){
		
		List<User> list = new ArrayList<>();
		User user1 = new User();
		user1.setTitle("안녕하세요 가입인사 드립니다.");
		user1.setUser("hagulu");
		user1.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		list.add(user1);
		User user2 = new User();
		user2.setTitle("헐 대박");
		user2.setUser("bada");
		user2.setContent("오늘 목요일이 었어... 금요일인줄");
		list.add(user2);
		User user3 = new User();
		user3.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		user3.setUser("dulumary");
		user3.setContent("....");
		list.add(user3);
		
		return list;
		
	}
	
	// 3. ResponseEntity
	
	@RequestMapping("/3")
	public ResponseEntity<User> printResponseEntity(){
		User user = new User();
		user.setTitle("안녕하세요 가입인사 드립니다.");
		user.setUser("hagulu");
		user.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		ResponseEntity<User> entity = new ResponseEntity<>(user,HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
	

	
}
