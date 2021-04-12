package cn.fivezha.api.service;

import cn.fivezha.api.core.service.Service;
import cn.fivezha.api.dto.ArticleDTO;
import cn.fivezha.api.dto.ArticleUploadDTO;
import cn.fivezha.api.entity.ArticleDO;

import java.util.List;

/**
* @author xmmmmmovo
* @date 2020/07/02
*/
public interface ArticleService extends Service<ArticleDO> {
    List<ArticleDTO> listAllDTO();
    List<ArticleDTO> listAllDTOByName(String userName);

    void uploadArticle(ArticleUploadDTO articleUploadDTO);
}
