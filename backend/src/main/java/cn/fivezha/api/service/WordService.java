package cn.fivezha.api.service;

import cn.fivezha.api.core.service.Service;
import cn.fivezha.api.entity.WordDO;

import java.util.List;

/**
* @author xmmmmmovo
* @date 2020/07/02
*/
public interface WordService extends Service<WordDO> {
    List<WordDO> randomList(Integer limit);
    List<WordDO> listByWord(String word);
}
