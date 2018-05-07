package com.server;

import java.util.List;

import java.util.Map;

import com.entity.FuWu;

public interface FuWuServer {
//  添加
  public int add(FuWu po);
//  修改
  public int update(FuWu po);
//  删除
  public int delete(int id);
//  查询
  public List<FuWu> getAll(Map<String, Object> map);
//  验证
  public FuWu checkUname(String account);
//  获取对象
  public FuWu getById( int id);
//  分页显示
  public List<FuWu> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> map);
//  模糊查询
  public List<FuWu> select(Map<String, Object> map);
}
