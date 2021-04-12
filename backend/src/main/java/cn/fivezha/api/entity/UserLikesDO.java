package cn.fivezha.api.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Table(name = "user_likes")
public class UserLikesDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "from_sentence")
    private String fromSentence;

    @Column(name = "to_sentence")
    private String toSentence;
}