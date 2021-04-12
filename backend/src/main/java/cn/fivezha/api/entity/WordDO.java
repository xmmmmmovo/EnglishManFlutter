package cn.fivezha.api.entity;

import lombok.Data;

import javax.persistence.*;

@Data
public class WordDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String word;

    private String sw;

    private String phonetic;

    private String pos;

    private Integer collins;

    private Integer oxford;

    private String tag;

    private Integer bnc;

    private Integer frq;

    private String audio;

    private String definition;

    private String translation;

    private String exchange;

    private String detail;
}