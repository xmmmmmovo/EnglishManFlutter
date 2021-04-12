package cn.fivezha.api.mapper;

import cn.fivezha.api.core.mapper.MyMapper;
import cn.fivezha.api.entity.WordDO;

import java.util.List;

public interface WordMapper extends MyMapper<WordDO> {
    List<WordDO> randomSelect(Integer limit);

    List<WordDO> listByWord(String word);
}