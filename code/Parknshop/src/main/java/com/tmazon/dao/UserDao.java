package com.tmazon.dao;

import java.util.List;

import com.tmazon.domain.User;

public interface UserDao {

	public List<User> select(User user);
	
	public boolean insert(User user);
	
	public boolean update(User user);
	
	public boolean delete(User user);
	
	public User findByName(String name);
}