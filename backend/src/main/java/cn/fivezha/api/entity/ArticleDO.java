package cn.fivezha.api.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Table(name = "article")
public class ArticleDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private Long author;

    @Column(name = "like_count")
    private Integer likeCount;

    private String content;
}