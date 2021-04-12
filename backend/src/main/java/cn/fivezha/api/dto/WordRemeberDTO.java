package cn.fivezha.api.dto;

import lombok.Data;

@Data
public class WordRemeberDTO {
    private String userName;
    private Long wordId;
    private Integer times;
}
