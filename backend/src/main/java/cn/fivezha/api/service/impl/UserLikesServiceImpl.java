package cn.fivezha.api.service.impl;

import cn.fivezha.api.core.response.ResultCode;
import cn.fivezha.api.core.service.AbstractService;
import cn.fivezha.api.dto.UserLikesDTO;
import cn.fivezha.api.service.UserLikesService;
import cn.fivezha.api.entity.AccountDO;
import cn.fivezha.api.mapper.UserLikesMapper;
import cn.fivezha.api.entity.UserLikesDO;
import cn.fivezha.api.service.AccountService;
import cn.fivezha.api.util.AssertUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xmmmmmovo
 * @date 2020/07/02
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserLikesServiceImpl extends AbstractService<UserLikesDO> implements UserLikesService {
    @Resource
    private UserLikesMapper userLikesMapper;

    @Resource
    private AccountService accountService;

    @Override
    public Long save(UserLikesDTO userLikesDTO) {
        AccountDO accountDO = accountService.getBy("name", userLikesDTO.getUsername());
        AssertUtils.asserts(accountDO != null, ResultCode.FIND_FAILED);

        UserLikesDO userLikesDO = new UserLikesDO();
        userLikesDO.setFromSentence(userLikesDTO.getFrom());
        userLikesDO.setToSentence(userLikesDTO.getTo());
        userLikesDO.setUserId(accountDO.getId());
        this.save(userLikesDO);
        return userLikesDO.getId();
    }

    @Override
    public List<UserLikesDO> starDetailList(String name) {
        AccountDO accountDO = accountService.getBy("name", name);
        AssertUtils.asserts(accountDO != null, ResultCode.FIND_FAILED);

        Condition condition = new Condition(UserLikesDO.class);
        condition.createCriteria().andEqualTo("userId", accountDO.getId());
        List<UserLikesDO> udo = this.listByCondition(condition);
        return udo;
    }

}
