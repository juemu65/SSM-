package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.FuWu;

public interface FuWuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FuWu record);

    int insertSelective(FuWu record);

    FuWu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FuWu record);

    int updateByPrimaryKeyWithBLOBs(FuWu record);

    int updateByPrimaryKey(FuWu record);
    
    public FuWu checkUname(Map<String, Object> uname);
//  查询所有信息
  public List<FuWu> getAll(Map<String, Object> map);
//  获取条数
  public int getCount(Map<String, Object> po); 
//  分页
  public List<FuWu> getByPage(Map<String, Object> map);
//  模糊查询并分页
  public List<FuWu> select(Map<String, Object> map);
}