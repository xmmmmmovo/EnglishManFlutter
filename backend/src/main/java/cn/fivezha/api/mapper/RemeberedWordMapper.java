package cn.fivezha.api.mapper;

import cn.fivezha.api.core.mapper.MyMapper;
import cn.fivezha.api.dto.MyRemeberedWordDTO;
import cn.fivezha.api.entity.RemeberedWordDO;

import java.util.List;

public interface RemeberedWordMapper extends MyMapper<RemeberedWordDO> {
    List<MyRemeberedWordDTO> getDTOList(Long userId);
}