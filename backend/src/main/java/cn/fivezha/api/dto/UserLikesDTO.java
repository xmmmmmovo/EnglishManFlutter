package cn.fivezha.api.dto;

import cn.fivezha.api.core.dto.AbstractConverter;
import cn.fivezha.api.entity.UserLikesDO;
import lombok.Data;

@Data
public class UserLikesDTO extends AbstractConverter<UserLikesDTO, UserLikesDO> {
    private String username;

    private String from;

    private String to;

    @Override
    protected UserLikesDTO setDTO() {
        return this;
    }
}
