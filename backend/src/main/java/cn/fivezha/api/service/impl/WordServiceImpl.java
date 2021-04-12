package cn.fivezha.api.service.impl;

import cn.fivezha.api.core.service.AbstractService;
import cn.fivezha.api.service.WordService;
import cn.fivezha.api.mapper.WordMapper;
import cn.fivezha.api.entity.WordDO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xmmmmmovo
 * @date 2020/07/02
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class WordServiceImpl extends AbstractService<WordDO> implements WordService {
    @Resource
    private WordMapper wordMapper;

    @Override
    public List<WordDO> randomList(Integer limit) {
        List<WordDO> wordDOList = wordMapper.randomSelect(limit);
        return wordDOList;
    }

    @Override
    public List<WordDO> listByWord(String word) {
        word = "%" + word + "%";
        List<WordDO> wordDOList = wordMapper.listByWord(word);
        return wordDOList;
    }
}
