package cn.fivezha.api.service;

import cn.fivezha.api.core.service.Service;
import cn.fivezha.api.dto.LikeStatusDTO;
import cn.fivezha.api.entity.LikeTableDO;

/**
* @author xmmmmmovo
* @date 2020/07/03
*/
public interface LikeTableService extends Service<LikeTableDO> {

    Long fetchLikeStatus(String userName, Long articleId);

    void saveByName(LikeStatusDTO likeStatusDTO);

}
