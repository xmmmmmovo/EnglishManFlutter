package cn.fivezha.api.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
@Table(name = "remebered_word")
public class RemeberedWordDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "word_id")
    private Long wordId;

    private Integer times;

    @Column(name = "remeber_time")
    private Date remeberTime;
}