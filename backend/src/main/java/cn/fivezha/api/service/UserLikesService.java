package cn.fivezha.api.service;

import cn.fivezha.api.core.service.Service;
import cn.fivezha.api.dto.UserLikesDTO;
import cn.fivezha.api.entity.UserLikesDO;

import java.util.List;

/**
 * @author xmmmmmovo
 * @date 2020/07/02
 */
public interface UserLikesService extends Service<UserLikesDO> {
    /**
     * 保存账户
     *
     * @param userLikesDTO 账户传输实体
     * @return
     */
    Long save(UserLikesDTO userLikesDTO);

    List<UserLikesDO> starDetailList(String name);
}
