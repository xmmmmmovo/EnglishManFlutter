package cn.fivezha.api.service.impl;

import cn.fivezha.api.core.response.ResultCode;
import cn.fivezha.api.core.service.AbstractService;
import cn.fivezha.api.dto.MyRemeberedWordDTO;
import cn.fivezha.api.dto.WordRemeberDTO;
import cn.fivezha.api.service.RemeberedWordService;
import com.github.pagehelper.PageHelper;
import cn.fivezha.api.entity.AccountDO;
import cn.fivezha.api.mapper.AccountMapper;
import cn.fivezha.api.mapper.RemeberedWordMapper;
import cn.fivezha.api.entity.RemeberedWordDO;
import cn.fivezha.api.util.AssertUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author xmmmmmovo
 * @date 2020/07/03
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class RemeberedWordServiceImpl extends AbstractService<RemeberedWordDO> implements RemeberedWordService {
    @Resource
    private RemeberedWordMapper remeberedWordMapper;

    @Resource
    private AccountMapper accountMapper;

    @Override
    public int add(WordRemeberDTO wordRemeberDTO) {
        AccountDO accountDO = new AccountDO();
        accountDO.setName(wordRemeberDTO.getUserName());
        accountDO = accountMapper.selectOne(accountDO);
        AssertUtils.asserts(accountDO != null, ResultCode.FIND_FAILED);


        RemeberedWordDO remeberedWordDO = new RemeberedWordDO();
        remeberedWordDO.setUserId(accountDO.getId());
        remeberedWordDO.setWordId(wordRemeberDTO.getWordId());

        RemeberedWordDO tmp = remeberedWordMapper.selectOne(remeberedWordDO);
        int index = 0;
        if (tmp == null) {
            remeberedWordDO.setTimes(1);
            remeberedWordDO.setRemeberTime(new Date());
            index = remeberedWordMapper.insert(remeberedWordDO);
        } else {
            tmp.setTimes(tmp.getTimes() + 1);
            tmp.setRemeberTime(new Date());
            index = remeberedWordMapper.updateByPrimaryKey(tmp);
        }
        return index;
    }

    @Override
    public List<MyRemeberedWordDTO> listByName(String userName, int size, int page) {
        AccountDO accountDO = new AccountDO();
        accountDO.setName(userName);
        accountDO = accountMapper.selectOne(accountDO);
        AssertUtils.asserts(accountDO != null, ResultCode.FIND_FAILED);

        PageHelper.startPage(page, size);
        List<MyRemeberedWordDTO> list = remeberedWordMapper.getDTOList(accountDO.getId());

        return list;
    }
}
