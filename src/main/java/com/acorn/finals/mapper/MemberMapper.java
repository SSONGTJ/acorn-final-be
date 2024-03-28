package com.acorn.finals.mapper;

import com.acorn.finals.model.entity.MemberEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    List<MemberEntity> findAll();

    MemberEntity findOneById(int id);
    
    MemberEntity findOneByEmail(String email);

    List<MemberEntity> findAllByChannelId(int channelId);

    int insert(MemberEntity entity);

    int update(MemberEntity entity);

    int updateActiveConnectionCount(MemberEntity entity);

    int deleteById(int id);
}
