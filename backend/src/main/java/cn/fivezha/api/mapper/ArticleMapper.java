package cn.fivezha.api.mapper;

import cn.fivezha.api.core.mapper.MyMapper;
import cn.fivezha.api.dto.ArticleDTO;
import cn.fivezha.api.entity.ArticleDO;

import java.util.List;

public interface ArticleMapper extends MyMapper<ArticleDO> {
    List<ArticleDTO> findAllDTO();
    List<ArticleDTO> findAllDTOByName(String userName);
}