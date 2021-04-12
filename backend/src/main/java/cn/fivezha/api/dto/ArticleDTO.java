package cn.fivezha.api.dto;

import lombok.Data;

import javax.persistence.Column;

@Data
public class ArticleDTO {
    private Long id;
    private String title;
    private String content;
    private String avatar;
    private String name;
    @Column(name = "like_count")
    private int likeCount;
}
