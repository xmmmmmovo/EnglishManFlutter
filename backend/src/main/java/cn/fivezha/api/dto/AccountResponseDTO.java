package cn.fivezha.api.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
@ApiModel(value = "账户返回实体")
public class AccountResponseDTO {
    @ApiModelProperty(value = "账户名", example = "admin", accessMode = ApiModelProperty.AccessMode.READ_ONLY)
    private String name;

    @ApiModelProperty(value = "验证token", example = "Bearer ....")
    private String token;

    @ApiModelProperty(value = "邮箱", example = "1@q.com")
    private String email;

    @ApiModelProperty(value = "头像", example = "null")
    private String avatar;

    @ApiModelProperty(value = "每日单词数量", example = "20")
    private int todayWords;

    public AccountResponseDTO(String name, String token, String email, String avatar, int todayWords) {
        this.name = name;
        this.token = token;
        this.email = email;
        this.todayWords = todayWords;
        this.avatar = avatar;
    }
}
