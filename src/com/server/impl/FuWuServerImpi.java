package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.FuWuMapper;
import com.entity.FuWu;
import com.server.FuWuServer;
@Service
public class FuWuServerImpi implements FuWuServer {
   @Resource
   private FuWuMapper gdao;
	@Override
	public int add(FuWu po) {
		return gdao.insert(po);
	}

	@Override
	public int update(FuWu po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<FuWu> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}

	@Override
	public FuWu checkUname(String account) {
		return null;
	}

	@Override
	public List<FuWu> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<FuWu> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public FuWu getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}
