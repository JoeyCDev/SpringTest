package com.majon.spring.lesson07.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson07.dao.BookmarkDAO;
import com.majon.spring.lesson07.model.Bookmark;

@Service
public class BookmarkBO {

	@Autowired
	private BookmarkDAO bookmarkDAO;
	public int insertBookMark(String name, String url) {
		
		return bookmarkDAO.insertBookmark(name, url);
	}
	
	public List<Bookmark> selectBookmarkList(){
		return bookmarkDAO.selectBookmarkList();
	}

}
