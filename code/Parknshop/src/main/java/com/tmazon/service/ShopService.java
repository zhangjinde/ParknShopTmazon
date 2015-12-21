package com.tmazon.service;

import com.tmazon.domain.Shop;

public interface ShopService {

	public Shop findById(Integer id);
	
	public boolean register(Shop shop);
	
	public boolean isShopExist(Shop shop);
	
}
