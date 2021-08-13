package com.majon.spring.lesson02.bo;

import java.util.List;

import org.apache.catalina.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson02.dao.StoreDAO;

@Service
public class StoreBO {
	
	@Autowired
	private StoreDAO storeDAO;

	public List<Store> getStoreList(){
		
		return storeDAO.selectStoreList();
		
	}
	
}
