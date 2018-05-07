package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.AddrMapper;
import com.entity.Addr;
import com.server.AddrServer;
@Service
public class AddrSeverImpi implements AddrServer {
     @Resource
     private AddrMapper kdao;
     
	@Override
	public int add(Addr po) {
		return kdao.insertSelective(po);
	}

	@Override
	public int update(Addr po) {
		return kdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return kdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Addr> getAll(Map<String, Object> map) {
		return kdao.getAll(map);
	}

	@Override
	public Addr checkUname(Map<String, Object> account) {
		return kdao.checkUname(account);
	}

	@Override
	public List<Addr> getByPage(Map<String, Object> map) {
		return kdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return kdao.getCount(map);
	}

	@Override
	public List<Addr> select(Map<String, Object> map) {
		return null;
	}

	@Override
	public Addr getById(int id) {
		return kdao.selectByPrimaryKey(id);
	}



}
