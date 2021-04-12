package cn.fivezha.api.service;

import cn.fivezha.api.core.service.Service;
import cn.fivezha.api.dto.MyRemeberedWordDTO;
import cn.fivezha.api.dto.WordRemeberDTO;
import cn.fivezha.api.entity.RemeberedWordDO;

import java.util.List;

/**
* @author xmmmmmovo
* @date 2020/07/03
*/
public interface RemeberedWordService extends Service<RemeberedWordDO> {
    int add(WordRemeberDTO wordRemeberDTO);

    List<MyRemeberedWordDTO> listByName(String userName, int size, int page);
}
