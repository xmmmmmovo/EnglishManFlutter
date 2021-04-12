package cn.fivezha.api.service.impl;

import cn.fivezha.api.core.response.ResultCode;
import cn.fivezha.api.core.service.AbstractService;
import cn.fivezha.api.dto.ArticleDTO;
import cn.fivezha.api.dto.ArticleUploadDTO;
import cn.fivezha.api.service.ArticleService;
import cn.fivezha.api.entity.AccountDO;
import cn.fivezha.api.mapper.AccountMapper;
import cn.fivezha.api.mapper.ArticleMapper;
import cn.fivezha.api.entity.ArticleDO;
import cn.fivezha.api.util.AssertUtils;
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
public class ArticleServiceImpl extends AbstractService<ArticleDO> implements ArticleService {
    @Resource
    private ArticleMapper articleMapper;

    @Resource
    private AccountMapper accountMapper;

    @Override
    public List<ArticleDTO> listAllDTO() {
        return articleMapper.findAllDTO();
    }

    @Override
    public List<ArticleDTO> listAllDTOByName(String userName) {
        return articleMapper.findAllDTOByName(userName);
    }

    @Override
    public void uploadArticle(ArticleUploadDTO articleUploadDTO) {
        AccountDO accountDO = new AccountDO();
        accountDO.setName(articleUploadDTO.getUserName());
        accountDO = accountMapper.selectOne(accountDO);
        AssertUtils.asserts(accountDO != null, ResultCode.FIND_FAILED);

        ArticleDO articleDO = new ArticleDO();
        articleDO.setTitle(articleUploadDTO.getTitle());
        articleDO.setContent(articleUploadDTO.getContent());
        articleDO.setAuthor(accountDO.getId());
        articleDO.setLikeCount(0);
        save(articleDO);
    }
}
