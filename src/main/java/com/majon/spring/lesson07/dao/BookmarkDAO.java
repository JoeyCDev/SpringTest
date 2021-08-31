package com.majon.spring.lesson07.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.spring.lesson07.model.Bookmark;

@Repository
public interface BookmarkDAO {

	public int insertBookmark(@Param("name")String name, @Param("url")String url);
	
	
	public List<Bookmark> selectBookmarkList();
	
	public int countDuplicate(@Param("url")String url);
}
