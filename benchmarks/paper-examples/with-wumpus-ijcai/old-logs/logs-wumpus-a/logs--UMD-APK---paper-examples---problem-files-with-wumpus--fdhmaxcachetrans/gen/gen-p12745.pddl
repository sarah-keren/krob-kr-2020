(define (problem wumpus_paper)
    (:domain full-wumpus)
    (:init (= (total-cost) 0) (K_wumpus_p_3_2) (K_stench_p_3_1) (K_stench_p_3_3) (K_stench_p_4_2) (K_stench_p_2_2) (K_safe_p_1_1) (K_safe_p_1_2) (K_safe_p_1_3) (K_safe_p_1_4) (K_safe_p_2_1) (K_safe_p_2_2) (K_safe_p_2_3) (K_safe_p_2_4) (K_safe_p_3_1) (K_safe_p_3_3) (K_safe_p_3_4) (K_safe_p_4_1) (K_safe_p_4_2) (K_safe_p_4_3) (K_safe_p_4_4) (K_gold_p_3_3) (K_at_p_1_1) (K_alive) (K_not_stench_p_1_1) (K_not_breeze_p_1_1) (K_not_at_p_1_2) (K_not_at_p_1_3) (K_not_at_p_1_4) (K_not_at_p_2_1) (K_not_at_p_2_2) (K_not_at_p_2_3) (K_not_at_p_2_4) (K_not_at_p_3_1) (K_not_at_p_3_2) (K_not_at_p_3_3) (K_not_at_p_3_4) (K_not_at_p_4_1) (K_not_at_p_4_2) (K_not_at_p_4_3) (K_not_at_p_4_4) (K_not_have-gold))
    (:goal (new-goal))

(:metric minimize (total-cost))
)
