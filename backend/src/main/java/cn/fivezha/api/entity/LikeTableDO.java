package cn.fivezha.api.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Table(name = "like_table")
public class LikeTableDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "article_id")
    private Long articleId;
}