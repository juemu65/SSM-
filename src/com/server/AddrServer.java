package com.server;

import java.util.List;


import java.util.Map;
import com.entity.Addr;

public interface AddrServer {
//  添加
  public int add(Addr po);
//  修改
  public int update(Addr po);
//  删除
  public int delete(int id);
//  查询
  public List<Addr> getAll(Map<String, Object> map);
//  验证
  public Addr checkUname(Map<String, Object> account);
//获取对象
   public Addr getById( int id);
//  分页显示
  public List<Addr> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> map);
//  模糊查询
  public List<Addr> select(Map<String, Object> map);
}
