package net.skhu.mapper;

import net.skhu.domain.Teams;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface TeamsMapper {

    //TODO camel로 바꾸기
    @Select("select * from Teams where type_chk = 0")
    List<Teams> findByTeams();

    @Delete("delete from Teams where idx = #{idx}")
    void deleteTeams(int idx);

    @Update("update Teams set type_chk = 1 where idx = #{idx}")
    void updateTeams(int idx);
}
