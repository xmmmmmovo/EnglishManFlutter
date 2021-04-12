package cn.fivezha.api.service.impl;

import cn.fivezha.api.core.response.ResultCode;
import cn.fivezha.api.core.service.AbstractService;
import cn.fivezha.api.dto.LikeStatusDTO;
import cn.fivezha.api.service.LikeTableService;
import cn.fivezha.api.entity.AccountDO;
import cn.fivezha.api.mapper.AccountMapper;
import cn.fivezha.api.mapper.LikeTableMapper;
import cn.fivezha.api.entity.LikeTableDO;
import cn.fivezha.api.util.AssertUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author xmmmmmovo
 * @date 2020/07/03
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class LikeTableServiceImpl extends AbstractService<LikeTableDO> implements LikeTableService {
    @Resource
    private LikeTableMapper likeTableMapper;

    @Resource
    private AccountMapper accountMapper;

    @Override
    public Long fetchLikeStatus(String userName, Long articleId) {
        AccountDO accountDO = new AccountDO();
        accountDO.setName(userName);
        accountDO = accountMapper.selectOne(accountDO);
        AssertUtils.asserts(accountDO != null, ResultCode.FIND_FAILED);

        LikeTableDO likeTableDO = new LikeTableDO();
        likeTableDO.setUserId(accountDO.getId());
        likeTableDO.setArticleId(articleId);
        LikeTableDO res = likeTableMapper.selectOne(likeTableDO);
        if (res == null) {
            return 0L;
        } else {
            return res.getId();
        }
    }

    @Override
    public void saveByName(LikeStatusDTO likeStatusDTO) {
        AccountDO accountDO = new AccountDO();
        accountDO.setName(likeStatusDTO.getUserName());
        accountDO = accountMapper.selectOne(accountDO);
        AssertUtils.asserts(accountDO != null, ResultCode.FIND_FAILED);

        LikeTableDO likeTableDO = new LikeTableDO();
        likeTableDO.setArticleId(likeStatusDTO.getId());
        likeTableDO.setUserId(accountDO.getId());
        save(likeTableDO);
    }
}
