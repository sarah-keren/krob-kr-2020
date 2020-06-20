(define (domain full-wumpus)
    (:predicates
        (K_wumpus_p_3_2)
        (K_not_wumpus_p_3_2)
        (K_stench_p_3_1)
        (K_not_stench_p_3_1)
        (K_stench_p_3_3)
        (K_not_stench_p_3_3)
        (K_stench_p_4_2)
        (K_not_stench_p_4_2)
        (K_stench_p_2_2)
        (K_not_stench_p_2_2)
        (K_safe_p_1_1)
        (K_not_safe_p_1_1)
        (K_safe_p_1_2)
        (K_not_safe_p_1_2)
        (K_safe_p_1_3)
        (K_not_safe_p_1_3)
        (K_safe_p_1_4)
        (K_not_safe_p_1_4)
        (K_safe_p_2_1)
        (K_not_safe_p_2_1)
        (K_safe_p_2_2)
        (K_not_safe_p_2_2)
        (K_safe_p_2_3)
        (K_not_safe_p_2_3)
        (K_safe_p_2_4)
        (K_not_safe_p_2_4)
        (K_safe_p_3_1)
        (K_not_safe_p_3_1)
        (K_safe_p_3_3)
        (K_not_safe_p_3_3)
        (K_safe_p_3_4)
        (K_not_safe_p_3_4)
        (K_safe_p_4_1)
        (K_not_safe_p_4_1)
        (K_safe_p_4_2)
        (K_not_safe_p_4_2)
        (K_safe_p_4_3)
        (K_not_safe_p_4_3)
        (K_safe_p_4_4)
        (K_not_safe_p_4_4)
        (K_gold_p_3_3)
        (K_not_gold_p_3_3)
        (K_at_p_1_1)
        (K_not_at_p_1_1)
        (K_alive)
        (K_not_alive)
        (K_wumpus_p_1_1)
        (K_not_wumpus_p_1_1)
        (K_stench_p_1_1)
        (K_not_stench_p_1_1)
        (K_pit_p_1_1)
        (K_not_pit_p_1_1)
        (K_breeze_p_1_1)
        (K_not_breeze_p_1_1)
        (K_wumpus_p_1_2)
        (K_not_wumpus_p_1_2)
        (K_stench_p_1_2)
        (K_not_stench_p_1_2)
        (K_pit_p_1_2)
        (K_not_pit_p_1_2)
        (K_breeze_p_1_2)
        (K_not_breeze_p_1_2)
        (K_wumpus_p_1_3)
        (K_not_wumpus_p_1_3)
        (K_stench_p_1_3)
        (K_not_stench_p_1_3)
        (K_pit_p_1_3)
        (K_not_pit_p_1_3)
        (K_breeze_p_1_3)
        (K_not_breeze_p_1_3)
        (K_wumpus_p_1_4)
        (K_not_wumpus_p_1_4)
        (K_stench_p_1_4)
        (K_not_stench_p_1_4)
        (K_pit_p_1_4)
        (K_not_pit_p_1_4)
        (K_breeze_p_1_4)
        (K_not_breeze_p_1_4)
        (K_wumpus_p_2_1)
        (K_not_wumpus_p_2_1)
        (K_stench_p_2_1)
        (K_not_stench_p_2_1)
        (K_pit_p_2_1)
        (K_not_pit_p_2_1)
        (K_breeze_p_2_1)
        (K_not_breeze_p_2_1)
        (K_wumpus_p_2_2)
        (K_not_wumpus_p_2_2)
        (K_pit_p_2_2)
        (K_not_pit_p_2_2)
        (K_breeze_p_2_2)
        (K_not_breeze_p_2_2)
        (K_wumpus_p_2_3)
        (K_not_wumpus_p_2_3)
        (K_stench_p_2_3)
        (K_not_stench_p_2_3)
        (K_pit_p_2_3)
        (K_not_pit_p_2_3)
        (K_breeze_p_2_3)
        (K_not_breeze_p_2_3)
        (K_wumpus_p_2_4)
        (K_not_wumpus_p_2_4)
        (K_stench_p_2_4)
        (K_not_stench_p_2_4)
        (K_pit_p_2_4)
        (K_not_pit_p_2_4)
        (K_breeze_p_2_4)
        (K_not_breeze_p_2_4)
        (K_wumpus_p_3_1)
        (K_not_wumpus_p_3_1)
        (K_pit_p_3_1)
        (K_not_pit_p_3_1)
        (K_breeze_p_3_1)
        (K_not_breeze_p_3_1)
        (K_stench_p_3_2)
        (K_not_stench_p_3_2)
        (K_pit_p_3_2)
        (K_not_pit_p_3_2)
        (K_breeze_p_3_2)
        (K_not_breeze_p_3_2)
        (K_safe_p_3_2)
        (K_not_safe_p_3_2)
        (K_wumpus_p_3_3)
        (K_not_wumpus_p_3_3)
        (K_pit_p_3_3)
        (K_not_pit_p_3_3)
        (K_breeze_p_3_3)
        (K_not_breeze_p_3_3)
        (K_wumpus_p_3_4)
        (K_not_wumpus_p_3_4)
        (K_stench_p_3_4)
        (K_not_stench_p_3_4)
        (K_pit_p_3_4)
        (K_not_pit_p_3_4)
        (K_breeze_p_3_4)
        (K_not_breeze_p_3_4)
        (K_wumpus_p_4_1)
        (K_not_wumpus_p_4_1)
        (K_stench_p_4_1)
        (K_not_stench_p_4_1)
        (K_pit_p_4_1)
        (K_not_pit_p_4_1)
        (K_breeze_p_4_1)
        (K_not_breeze_p_4_1)
        (K_wumpus_p_4_2)
        (K_not_wumpus_p_4_2)
        (K_pit_p_4_2)
        (K_not_pit_p_4_2)
        (K_breeze_p_4_2)
        (K_not_breeze_p_4_2)
        (K_wumpus_p_4_3)
        (K_not_wumpus_p_4_3)
        (K_stench_p_4_3)
        (K_not_stench_p_4_3)
        (K_pit_p_4_3)
        (K_not_pit_p_4_3)
        (K_breeze_p_4_3)
        (K_not_breeze_p_4_3)
        (K_wumpus_p_4_4)
        (K_not_wumpus_p_4_4)
        (K_stench_p_4_4)
        (K_not_stench_p_4_4)
        (K_pit_p_4_4)
        (K_not_pit_p_4_4)
        (K_breeze_p_4_4)
        (K_not_breeze_p_4_4)
        (K_at_p_1_2)
        (K_not_at_p_1_2)
        (K_at_p_1_3)
        (K_not_at_p_1_3)
        (K_at_p_1_4)
        (K_not_at_p_1_4)
        (K_at_p_2_1)
        (K_not_at_p_2_1)
        (K_at_p_2_2)
        (K_not_at_p_2_2)
        (K_at_p_2_3)
        (K_not_at_p_2_3)
        (K_at_p_2_4)
        (K_not_at_p_2_4)
        (K_at_p_3_1)
        (K_not_at_p_3_1)
        (K_at_p_3_2)
        (K_not_at_p_3_2)
        (K_at_p_3_3)
        (K_not_at_p_3_3)
        (K_at_p_3_4)
        (K_not_at_p_3_4)
        (K_at_p_4_1)
        (K_not_at_p_4_1)
        (K_at_p_4_2)
        (K_not_at_p_4_2)
        (K_at_p_4_3)
        (K_not_at_p_4_3)
        (K_at_p_4_4)
        (K_not_at_p_4_4)
        (K_have-gold)
        (K_not_have-gold)
        (new-goal)
    )
    (:functions (total-cost))
    (:action move_p_4_4_p_4_3
        :precondition (K_at_p_4_4)
        :effect (and (not (K_at_p_4_4)) (not (K_not_at_p_4_3)) (K_at_p_4_3) (K_not_at_p_4_4)(increase (total-cost) 1000)
))
    (:action move_p_4_4_p_3_4
        :precondition (K_at_p_4_4)
        :effect (and (not (K_at_p_4_4)) (not (K_not_at_p_3_4)) (K_at_p_3_4) (K_not_at_p_4_4)(increase (total-cost) 1000)
))
    (:action move_p_4_3_p_4_4
        :precondition (K_at_p_4_3)
        :effect (and (not (K_not_at_p_4_4)) (not (K_at_p_4_3)) (K_not_at_p_4_3) (K_at_p_4_4)(increase (total-cost) 1000)
))
    (:action move_p_4_3_p_4_2
        :precondition (K_at_p_4_3)
        :effect (and (not (K_at_p_4_3)) (not (K_not_at_p_4_2)) (K_at_p_4_2) (K_not_at_p_4_3)(increase (total-cost) 1000)
))
    (:action move_p_4_3_p_3_3
        :precondition (K_at_p_4_3)
        :effect (and (not (K_at_p_4_3)) (not (K_not_at_p_3_3)) (K_at_p_3_3) (K_not_at_p_4_3)(increase (total-cost) 1000)
))
    (:action move_p_4_2_p_4_3
        :precondition (K_at_p_4_2)
        :effect (and (not (K_not_at_p_4_3)) (not (K_at_p_4_2)) (K_not_at_p_4_2) (K_at_p_4_3)(increase (total-cost) 1000)
))
    (:action move_p_4_2_p_4_1
        :precondition (K_at_p_4_2)
        :effect (and (not (K_at_p_4_2)) (not (K_not_at_p_4_1)) (K_at_p_4_1) (K_not_at_p_4_2)(increase (total-cost) 1000)
))
    (:action move_p_4_1_p_4_2
        :precondition (K_at_p_4_1)
        :effect (and (not (K_not_at_p_4_2)) (not (K_at_p_4_1)) (K_not_at_p_4_1) (K_at_p_4_2)(increase (total-cost) 1000)
))
    (:action move_p_4_1_p_3_1
        :precondition (K_at_p_4_1)
        :effect (and (not (K_at_p_4_1)) (not (K_not_at_p_3_1)) (K_at_p_3_1) (K_not_at_p_4_1)(increase (total-cost) 1000)
))
    (:action move_p_3_4_p_4_4
        :precondition (K_at_p_3_4)
        :effect (and (not (K_not_at_p_4_4)) (not (K_at_p_3_4)) (K_not_at_p_3_4) (K_at_p_4_4)(increase (total-cost) 1000)
))
    (:action move_p_3_4_p_3_3
        :precondition (K_at_p_3_4)
        :effect (and (not (K_at_p_3_4)) (not (K_not_at_p_3_3)) (K_at_p_3_3) (K_not_at_p_3_4)(increase (total-cost) 1000)
))
    (:action move_p_3_4_p_2_4
        :precondition (K_at_p_3_4)
        :effect (and (not (K_at_p_3_4)) (not (K_not_at_p_2_4)) (K_at_p_2_4) (K_not_at_p_3_4)(increase (total-cost) 1000)
))
    (:action move_p_3_3_p_4_3
        :precondition (K_at_p_3_3)
        :effect (and (not (K_not_at_p_4_3)) (not (K_at_p_3_3)) (K_not_at_p_3_3) (K_at_p_4_3)(increase (total-cost) 1000)
))
    (:action move_p_3_3_p_3_4
        :precondition (K_at_p_3_3)
        :effect (and (not (K_not_at_p_3_4)) (not (K_at_p_3_3)) (K_not_at_p_3_3) (K_at_p_3_4)(increase (total-cost) 1000)
))
    (:action move_p_3_3_p_2_3
        :precondition (K_at_p_3_3)
        :effect (and (not (K_at_p_3_3)) (not (K_not_at_p_2_3)) (K_at_p_2_3) (K_not_at_p_3_3)(increase (total-cost) 1000)
))
    (:action move_p_3_1_p_4_1
        :precondition (K_at_p_3_1)
        :effect (and (not (K_not_at_p_4_1)) (not (K_at_p_3_1)) (K_not_at_p_3_1) (K_at_p_4_1)(increase (total-cost) 1000)
))
    (:action move_p_3_1_p_2_1
        :precondition (K_at_p_3_1)
        :effect (and (not (K_at_p_3_1)) (not (K_not_at_p_2_1)) (K_at_p_2_1) (K_not_at_p_3_1)(increase (total-cost) 1000)
))
    (:action move_p_2_4_p_3_4
        :precondition (K_at_p_2_4)
        :effect (and (not (K_not_at_p_3_4)) (not (K_at_p_2_4)) (K_not_at_p_2_4) (K_at_p_3_4)(increase (total-cost) 1000)
))
    (:action move_p_2_4_p_2_3
        :precondition (K_at_p_2_4)
        :effect (and (not (K_at_p_2_4)) (not (K_not_at_p_2_3)) (K_at_p_2_3) (K_not_at_p_2_4)(increase (total-cost) 1000)
))
    (:action move_p_2_4_p_1_4
        :precondition (K_at_p_2_4)
        :effect (and (not (K_at_p_2_4)) (not (K_not_at_p_1_4)) (K_at_p_1_4) (K_not_at_p_2_4)(increase (total-cost) 1000)
))
    (:action move_p_2_3_p_3_3
        :precondition (K_at_p_2_3)
        :effect (and (not (K_not_at_p_3_3)) (not (K_at_p_2_3)) (K_not_at_p_2_3) (K_at_p_3_3)(increase (total-cost) 1000)
))
    (:action move_p_2_3_p_2_4
        :precondition (K_at_p_2_3)
        :effect (and (not (K_not_at_p_2_4)) (not (K_at_p_2_3)) (K_not_at_p_2_3) (K_at_p_2_4)(increase (total-cost) 1000)
))
    (:action move_p_2_3_p_2_2
        :precondition (K_at_p_2_3)
        :effect (and (not (K_at_p_2_3)) (not (K_not_at_p_2_2)) (K_at_p_2_2) (K_not_at_p_2_3)(increase (total-cost) 1000)
))
    (:action move_p_2_3_p_1_3
        :precondition (K_at_p_2_3)
        :effect (and (not (K_at_p_2_3)) (not (K_not_at_p_1_3)) (K_at_p_1_3) (K_not_at_p_2_3)(increase (total-cost) 1000)
))
    (:action move_p_2_2_p_2_3
        :precondition (K_at_p_2_2)
        :effect (and (not (K_not_at_p_2_3)) (not (K_at_p_2_2)) (K_not_at_p_2_2) (K_at_p_2_3)(increase (total-cost) 1000)
))
    (:action move_p_2_2_p_2_1
        :precondition (K_at_p_2_2)
        :effect (and (not (K_at_p_2_2)) (not (K_not_at_p_2_1)) (K_at_p_2_1) (K_not_at_p_2_2)(increase (total-cost) 1000)
))
    (:action move_p_2_2_p_1_2
        :precondition (K_at_p_2_2)
        :effect (and (not (K_at_p_2_2)) (not (K_not_at_p_1_2)) (K_at_p_1_2) (K_not_at_p_2_2)(increase (total-cost) 1000)
))
    (:action move_p_2_1_p_3_1
        :precondition (K_at_p_2_1)
        :effect (and (not (K_not_at_p_3_1)) (not (K_at_p_2_1)) (K_not_at_p_2_1) (K_at_p_3_1)(increase (total-cost) 1000)
))
    (:action move_p_2_1_p_2_2
        :precondition (K_at_p_2_1)
        :effect (and (not (K_not_at_p_2_2)) (not (K_at_p_2_1)) (K_not_at_p_2_1) (K_at_p_2_2)(increase (total-cost) 1000)
))
    (:action move_p_2_1_p_1_1
        :precondition (K_at_p_2_1)
        :effect (and (not (K_at_p_2_1)) (not (K_not_at_p_1_1)) (K_at_p_1_1) (K_not_at_p_2_1)(increase (total-cost) 1000)
))
    (:action move_p_1_4_p_2_4
        :precondition (K_at_p_1_4)
        :effect (and (not (K_not_at_p_2_4)) (not (K_at_p_1_4)) (K_not_at_p_1_4) (K_at_p_2_4)(increase (total-cost) 1000)
))
    (:action move_p_1_4_p_1_3
        :precondition (K_at_p_1_4)
        :effect (and (not (K_at_p_1_4)) (not (K_not_at_p_1_3)) (K_at_p_1_3) (K_not_at_p_1_4)(increase (total-cost) 1000)
))
    (:action move_p_1_3_p_2_3
        :precondition (K_at_p_1_3)
        :effect (and (not (K_not_at_p_2_3)) (not (K_at_p_1_3)) (K_not_at_p_1_3) (K_at_p_2_3)(increase (total-cost) 1000)
))
    (:action move_p_1_3_p_1_4
        :precondition (K_at_p_1_3)
        :effect (and (not (K_not_at_p_1_4)) (not (K_at_p_1_3)) (K_not_at_p_1_3) (K_at_p_1_4)(increase (total-cost) 1000)
))
    (:action move_p_1_3_p_1_2
        :precondition (K_at_p_1_3)
        :effect (and (not (K_at_p_1_3)) (not (K_not_at_p_1_2)) (K_at_p_1_2) (K_not_at_p_1_3)(increase (total-cost) 1000)
))
    (:action move_p_1_2_p_2_2
        :precondition (K_at_p_1_2)
        :effect (and (not (K_not_at_p_2_2)) (not (K_at_p_1_2)) (K_not_at_p_1_2) (K_at_p_2_2)(increase (total-cost) 1000)
))
    (:action move_p_1_2_p_1_3
        :precondition (K_at_p_1_2)
        :effect (and (not (K_not_at_p_1_3)) (not (K_at_p_1_2)) (K_not_at_p_1_2) (K_at_p_1_3)(increase (total-cost) 1000)
))
    (:action move_p_1_2_p_1_1
        :precondition (K_at_p_1_2)
        :effect (and (not (K_at_p_1_2)) (not (K_not_at_p_1_1)) (K_at_p_1_1) (K_not_at_p_1_2)(increase (total-cost) 1000)
))
    (:action move_p_1_1_p_2_1
        :precondition (K_at_p_1_1)
        :effect (and (not (K_not_at_p_2_1)) (not (K_at_p_1_1)) (K_not_at_p_1_1) (K_at_p_2_1)(increase (total-cost) 1000)
))
    (:action move_p_1_1_p_1_2
        :precondition (K_at_p_1_1)
        :effect (and (not (K_not_at_p_1_2)) (not (K_at_p_1_1)) (K_not_at_p_1_1) (K_at_p_1_2)(increase (total-cost) 1000)
))
    (:action grab-gold_p_3_3
        :precondition (and (K_gold_p_3_3) (K_at_p_3_3))
        :effect (and (not (K_not_have-gold)) (not (K_gold_p_3_3)) (K_not_gold_p_3_3) (K_have-gold)(increase (total-cost) 1000)
))
    (:action sensor-sensor-for-stench_p_4_4-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_4_4)) (not (K_stench_p_4_4)) (K_at_p_4_4)) (K_stench_p_4_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_4_4-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_4_4)) (not (K_stench_p_4_4)) (K_at_p_4_4)) (K_not_stench_p_4_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_4_3-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_4_3)) (not (K_stench_p_4_3)) (K_at_p_4_3)) (K_stench_p_4_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_4_3-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_4_3)) (not (K_stench_p_4_3)) (K_at_p_4_3)) (K_not_stench_p_4_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_4_1-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_4_1)) (not (K_stench_p_4_1)) (K_at_p_4_1)) (K_stench_p_4_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_4_1-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_4_1)) (not (K_stench_p_4_1)) (K_at_p_4_1)) (K_not_stench_p_4_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_3_4-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_3_4)) (not (K_stench_p_3_4)) (K_at_p_3_4)) (K_stench_p_3_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_3_4-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_3_4)) (not (K_stench_p_3_4)) (K_at_p_3_4)) (K_not_stench_p_3_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_2_4-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_2_4)) (not (K_stench_p_2_4)) (K_at_p_2_4)) (K_stench_p_2_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_2_4-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_2_4)) (not (K_stench_p_2_4)) (K_at_p_2_4)) (K_not_stench_p_2_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_2_3-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_2_3)) (not (K_stench_p_2_3)) (K_at_p_2_3)) (K_stench_p_2_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_2_3-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_2_3)) (not (K_stench_p_2_3)) (K_at_p_2_3)) (K_not_stench_p_2_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_2_1-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_2_1)) (not (K_stench_p_2_1)) (K_at_p_2_1)) (K_stench_p_2_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_2_1-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_2_1)) (not (K_stench_p_2_1)) (K_at_p_2_1)) (K_not_stench_p_2_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_4-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_1_4)) (not (K_stench_p_1_4)) (K_at_p_1_4)) (K_stench_p_1_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_4-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_1_4)) (not (K_stench_p_1_4)) (K_at_p_1_4)) (K_not_stench_p_1_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_3-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_1_3)) (not (K_stench_p_1_3)) (K_at_p_1_3)) (K_stench_p_1_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_3-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_1_3)) (not (K_stench_p_1_3)) (K_at_p_1_3)) (K_not_stench_p_1_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_2-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_1_2)) (not (K_stench_p_1_2)) (K_at_p_1_2)) (K_stench_p_1_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_2-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_1_2)) (not (K_stench_p_1_2)) (K_at_p_1_2)) (K_not_stench_p_1_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_1-obs0-ver0
        :effect (and (when (and (not (K_not_stench_p_1_1)) (not (K_stench_p_1_1)) (K_at_p_1_1)) (K_stench_p_1_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-stench_p_1_1-obs0-ver1
        :effect (and (when (and (not (K_not_stench_p_1_1)) (not (K_stench_p_1_1)) (K_at_p_1_1)) (K_not_stench_p_1_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_4-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_4_4)) (not (K_breeze_p_4_4)) (K_at_p_4_4)) (K_breeze_p_4_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_4-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_4_4)) (not (K_breeze_p_4_4)) (K_at_p_4_4)) (K_not_breeze_p_4_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_3-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_4_3)) (not (K_breeze_p_4_3)) (K_at_p_4_3)) (K_breeze_p_4_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_3-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_4_3)) (not (K_breeze_p_4_3)) (K_at_p_4_3)) (K_not_breeze_p_4_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_2-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_4_2)) (not (K_breeze_p_4_2)) (K_at_p_4_2)) (K_breeze_p_4_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_2-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_4_2)) (not (K_breeze_p_4_2)) (K_at_p_4_2)) (K_not_breeze_p_4_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_1-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_4_1)) (not (K_breeze_p_4_1)) (K_at_p_4_1)) (K_breeze_p_4_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_4_1-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_4_1)) (not (K_breeze_p_4_1)) (K_at_p_4_1)) (K_not_breeze_p_4_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_3_4-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_3_4)) (not (K_breeze_p_3_4)) (K_at_p_3_4)) (K_breeze_p_3_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_3_4-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_3_4)) (not (K_breeze_p_3_4)) (K_at_p_3_4)) (K_not_breeze_p_3_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_3_3-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_3_3)) (not (K_breeze_p_3_3)) (K_at_p_3_3)) (K_breeze_p_3_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_3_3-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_3_3)) (not (K_breeze_p_3_3)) (K_at_p_3_3)) (K_not_breeze_p_3_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_3_1-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_3_1)) (not (K_breeze_p_3_1)) (K_at_p_3_1)) (K_breeze_p_3_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_3_1-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_3_1)) (not (K_breeze_p_3_1)) (K_at_p_3_1)) (K_not_breeze_p_3_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_4-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_2_4)) (not (K_breeze_p_2_4)) (K_at_p_2_4)) (K_breeze_p_2_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_4-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_2_4)) (not (K_breeze_p_2_4)) (K_at_p_2_4)) (K_not_breeze_p_2_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_3-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_2_3)) (not (K_breeze_p_2_3)) (K_at_p_2_3)) (K_breeze_p_2_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_3-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_2_3)) (not (K_breeze_p_2_3)) (K_at_p_2_3)) (K_not_breeze_p_2_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_2-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_2_2)) (not (K_breeze_p_2_2)) (K_at_p_2_2)) (K_breeze_p_2_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_2-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_2_2)) (not (K_breeze_p_2_2)) (K_at_p_2_2)) (K_not_breeze_p_2_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_1-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_2_1)) (not (K_breeze_p_2_1)) (K_at_p_2_1)) (K_breeze_p_2_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_2_1-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_2_1)) (not (K_breeze_p_2_1)) (K_at_p_2_1)) (K_not_breeze_p_2_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_4-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_1_4)) (not (K_breeze_p_1_4)) (K_at_p_1_4)) (K_breeze_p_1_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_4-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_1_4)) (not (K_breeze_p_1_4)) (K_at_p_1_4)) (K_not_breeze_p_1_4))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_3-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_1_3)) (not (K_breeze_p_1_3)) (K_at_p_1_3)) (K_breeze_p_1_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_3-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_1_3)) (not (K_breeze_p_1_3)) (K_at_p_1_3)) (K_not_breeze_p_1_3))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_2-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_1_2)) (not (K_breeze_p_1_2)) (K_at_p_1_2)) (K_breeze_p_1_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_2-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_1_2)) (not (K_breeze_p_1_2)) (K_at_p_1_2)) (K_not_breeze_p_1_2))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_1-obs0-ver0
        :effect (and (when (and (not (K_not_breeze_p_1_1)) (not (K_breeze_p_1_1)) (K_at_p_1_1)) (K_breeze_p_1_1))(increase (total-cost) 1)
))
    (:action sensor-sensor-for-breeze_p_1_1-obs0-ver1
        :effect (and (when (and (not (K_not_breeze_p_1_1)) (not (K_breeze_p_1_1)) (K_at_p_1_1)) (K_not_breeze_p_1_1))(increase (total-cost) 1)
))
    (:action invariant-at-least-one-328    ; (K_wumpus_p_4_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_4_4)) (K_wumpus_p_4_4))
        :effect (and (K_not_at_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-331    ; (K_pit_p_4_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_4_4)) (K_pit_p_4_4))
        :effect (and (K_not_at_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-311    ; (K_wumpus_p_4_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_4_3)) (K_wumpus_p_4_3))
        :effect (and (K_not_at_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-314    ; (K_pit_p_4_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_4_3)) (K_pit_p_4_3))
        :effect (and (K_not_at_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-290    ; (K_wumpus_p_4_2) (K_alive)  ==> 
        :precondition (and (not (K_at_p_4_2)) (K_wumpus_p_4_2))
        :effect (and (K_not_at_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-293    ; (K_pit_p_4_2) (K_alive)  ==> 
        :precondition (and (not (K_at_p_4_2)) (K_pit_p_4_2))
        :effect (and (K_not_at_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-272    ; (K_pit_p_4_1) (K_alive)  ==> 
        :precondition (and (not (K_at_p_4_1)) (K_pit_p_4_1))
        :effect (and (K_not_at_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-252    ; (K_wumpus_p_3_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_3_4)) (K_wumpus_p_3_4))
        :effect (and (K_not_at_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-255    ; (K_pit_p_3_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_3_4)) (K_pit_p_3_4))
        :effect (and (K_not_at_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-231    ; (K_wumpus_p_3_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_3_3)) (K_wumpus_p_3_3))
        :effect (and (K_not_at_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-234    ; (K_pit_p_3_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_3_3)) (K_pit_p_3_3))
        :effect (and (K_not_at_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-206    ; (K_wumpus_p_3_2) (K_alive)  ==> 
        :effect (and (K_not_at_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-209    ; (K_pit_p_3_2) (K_alive)  ==> 
        :precondition (K_pit_p_3_2)
        :effect (and (K_not_at_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-181    ; (K_wumpus_p_3_1) (K_alive)  ==> 
        :precondition (and (not (K_at_p_3_1)) (K_wumpus_p_3_1))
        :effect (and (K_not_at_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-184    ; (K_pit_p_3_1) (K_alive)  ==> 
        :precondition (and (not (K_at_p_3_1)) (K_pit_p_3_1))
        :effect (and (K_not_at_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-160    ; (K_wumpus_p_2_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_4)) (K_wumpus_p_2_4))
        :effect (and (K_not_at_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-163    ; (K_pit_p_2_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_4)) (K_pit_p_2_4))
        :effect (and (K_not_at_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-139    ; (K_wumpus_p_2_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_3)) (K_wumpus_p_2_3))
        :effect (and (K_not_at_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-142    ; (K_pit_p_2_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_3)) (K_pit_p_2_3))
        :effect (and (K_not_at_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-114    ; (K_wumpus_p_2_2) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_2)) (K_wumpus_p_2_2))
        :effect (and (K_not_at_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-117    ; (K_pit_p_2_2) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_2)) (K_pit_p_2_2))
        :effect (and (K_not_at_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-89    ; (K_wumpus_p_2_1) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_1)) (K_wumpus_p_2_1))
        :effect (and (K_not_at_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-92    ; (K_pit_p_2_1) (K_alive)  ==> 
        :precondition (and (not (K_at_p_2_1)) (K_pit_p_2_1))
        :effect (and (K_not_at_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-68    ; (K_wumpus_p_1_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_4)) (K_wumpus_p_1_4))
        :effect (and (K_not_at_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-71    ; (K_pit_p_1_4) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_4)) (K_pit_p_1_4))
        :effect (and (K_not_at_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-51    ; (K_wumpus_p_1_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_3)) (K_wumpus_p_1_3))
        :effect (and (K_not_at_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-54    ; (K_pit_p_1_3) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_3)) (K_pit_p_1_3))
        :effect (and (K_not_at_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-30    ; (K_wumpus_p_1_2) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_2)) (K_wumpus_p_1_2))
        :effect (and (K_not_at_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-33    ; (K_pit_p_1_2) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_2)) (K_pit_p_1_2))
        :effect (and (K_not_at_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-250    ; (K_pit_p_3_4)  ==> 
        :precondition (and (not (K_not_breeze_p_4_4)) (K_pit_p_3_4))
        :effect (and (K_breeze_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-309    ; (K_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_breeze_p_4_4)) (K_pit_p_4_3))
        :effect (and (K_breeze_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-461    ; (K_not_pit_p_3_4) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_breeze_p_4_4)) (K_not_pit_p_3_4) (K_not_pit_p_4_3))
        :effect (and (K_not_breeze_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-435    ; (K_breeze_p_3_4) (K_not_pit_p_2_4) (K_not_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_pit_p_4_4)) (K_not_pit_p_2_4) (K_not_pit_p_3_3) (K_breeze_p_3_4))
        :effect (and (K_pit_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-457    ; (K_breeze_p_4_3) (K_not_pit_p_3_3) (K_not_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_pit_p_4_4)) (K_not_pit_p_3_3) (K_not_pit_p_4_2) (K_breeze_p_4_3))
        :effect (and (K_pit_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-330    ; (K_at_p_4_4) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_4_4)) (K_at_p_4_4))
        :effect (and (K_not_pit_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-321    ; (K_not_breeze_p_3_4)  ==> 
        :precondition (and (not (K_pit_p_4_4)) (K_not_breeze_p_3_4))
        :effect (and (K_not_pit_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-325    ; (K_not_breeze_p_4_3)  ==> 
        :precondition (and (not (K_pit_p_4_4)) (K_not_breeze_p_4_3))
        :effect (and (K_not_pit_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-248    ; (K_wumpus_p_3_4)  ==> 
        :precondition (and (not (K_not_stench_p_4_4)) (K_wumpus_p_3_4))
        :effect (and (K_stench_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-307    ; (K_wumpus_p_4_3)  ==> 
        :precondition (and (not (K_not_stench_p_4_4)) (K_wumpus_p_4_3))
        :effect (and (K_stench_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-458    ; (K_not_wumpus_p_3_4) (K_not_wumpus_p_4_3)  ==> 
        :precondition (and (not (K_stench_p_4_4)) (K_not_wumpus_p_3_4) (K_not_wumpus_p_4_3))
        :effect (and (K_not_stench_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-431    ; (K_stench_p_3_4) (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_4_4)) (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3) (K_stench_p_3_4))
        :effect (and (K_wumpus_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-453    ; (K_stench_p_4_3) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_4_4)) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2) (K_stench_p_4_3))
        :effect (and (K_wumpus_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-327    ; (K_at_p_4_4) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_4_4)) (K_at_p_4_4))
        :effect (and (K_not_wumpus_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-319    ; (K_not_stench_p_3_4)  ==> 
        :precondition (and (not (K_wumpus_p_4_4)) (K_not_stench_p_3_4))
        :effect (and (K_not_wumpus_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-323    ; (K_not_stench_p_4_3)  ==> 
        :precondition (and (not (K_wumpus_p_4_4)) (K_not_stench_p_4_3))
        :effect (and (K_not_wumpus_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-229    ; (K_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_breeze_p_4_3)) (K_pit_p_3_3))
        :effect (and (K_breeze_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-288    ; (K_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_breeze_p_4_3)) (K_pit_p_4_2))
        :effect (and (K_breeze_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-326    ; (K_pit_p_4_4)  ==> 
        :precondition (and (not (K_not_breeze_p_4_3)) (K_pit_p_4_4))
        :effect (and (K_breeze_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-454    ; (K_not_pit_p_3_3) (K_not_pit_p_4_2) (K_not_pit_p_4_4)  ==> 
        :precondition (and (not (K_breeze_p_4_3)) (K_not_pit_p_3_3) (K_not_pit_p_4_2) (K_not_pit_p_4_4))
        :effect (and (K_not_breeze_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-427    ; (K_breeze_p_3_3) (K_not_pit_p_2_3) (K_not_pit_p_3_2) (K_not_pit_p_3_4)  ==> 
        :precondition (and (not (K_not_pit_p_4_3)) (K_not_pit_p_3_2) (K_breeze_p_3_3) (K_not_pit_p_3_4))
        :effect (and (K_pit_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-449    ; (K_breeze_p_4_2) (K_not_pit_p_3_2) (K_not_pit_p_4_1)  ==> 
        :precondition (and (not (K_not_pit_p_4_3)) (K_not_pit_p_3_2) (K_not_pit_p_4_1) (K_breeze_p_4_2))
        :effect (and (K_pit_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-463    ; (K_breeze_p_4_4) (K_not_pit_p_3_4)  ==> 
        :precondition (and (not (K_not_pit_p_4_3)) (K_not_pit_p_3_4) (K_breeze_p_4_4))
        :effect (and (K_pit_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-313    ; (K_at_p_4_3) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_4_3)) (K_at_p_4_3))
        :effect (and (K_not_pit_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-300    ; (K_not_breeze_p_3_3)  ==> 
        :precondition (and (not (K_pit_p_4_3)) (K_not_breeze_p_3_3))
        :effect (and (K_not_pit_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-304    ; (K_not_breeze_p_4_2)  ==> 
        :precondition (and (not (K_pit_p_4_3)) (K_not_breeze_p_4_2))
        :effect (and (K_not_pit_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-308    ; (K_not_breeze_p_4_4)  ==> 
        :precondition (and (not (K_pit_p_4_3)) (K_not_breeze_p_4_4))
        :effect (and (K_not_pit_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-227    ; (K_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_stench_p_4_3)) (K_wumpus_p_3_3))
        :effect (and (K_stench_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-286    ; (K_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_stench_p_4_3)) (K_wumpus_p_4_2))
        :effect (and (K_stench_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-324    ; (K_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_not_stench_p_4_3)) (K_wumpus_p_4_4))
        :effect (and (K_stench_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-450    ; (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2) (K_not_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_stench_p_4_3)) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2) (K_not_wumpus_p_4_4))
        :effect (and (K_not_stench_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-460    ; (K_stench_p_4_4) (K_not_wumpus_p_3_4)  ==> 
        :precondition (and (not (K_not_wumpus_p_4_3)) (K_not_wumpus_p_3_4) (K_stench_p_4_4))
        :effect (and (K_wumpus_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-310    ; (K_at_p_4_3) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_4_3)) (K_at_p_4_3))
        :effect (and (K_not_wumpus_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-306    ; (K_not_stench_p_4_4)  ==> 
        :precondition (and (not (K_wumpus_p_4_3)) (K_not_stench_p_4_4))
        :effect (and (K_not_wumpus_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-204    ; (K_pit_p_3_2)  ==> 
        :precondition (and (not (K_not_breeze_p_4_2)) (K_pit_p_3_2))
        :effect (and (K_breeze_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-267    ; (K_pit_p_4_1)  ==> 
        :precondition (and (not (K_not_breeze_p_4_2)) (K_pit_p_4_1))
        :effect (and (K_breeze_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-305    ; (K_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_breeze_p_4_2)) (K_pit_p_4_3))
        :effect (and (K_breeze_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-446    ; (K_not_pit_p_3_2) (K_not_pit_p_4_1) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_breeze_p_4_2)) (K_not_pit_p_3_2) (K_not_pit_p_4_1) (K_not_pit_p_4_3))
        :effect (and (K_not_breeze_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-417    ; (K_breeze_p_3_2) (K_not_pit_p_2_2) (K_not_pit_p_3_1) (K_not_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_pit_p_4_2)) (K_not_pit_p_2_2) (K_not_pit_p_3_1) (K_breeze_p_3_2) (K_not_pit_p_3_3))
        :effect (and (K_pit_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-441    ; (K_breeze_p_4_1) (K_not_pit_p_3_1)  ==> 
        :precondition (and (not (K_not_pit_p_4_2)) (K_not_pit_p_3_1) (K_breeze_p_4_1))
        :effect (and (K_pit_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-456    ; (K_breeze_p_4_3) (K_not_pit_p_3_3) (K_not_pit_p_4_4)  ==> 
        :precondition (and (not (K_not_pit_p_4_2)) (K_not_pit_p_3_3) (K_breeze_p_4_3) (K_not_pit_p_4_4))
        :effect (and (K_pit_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-292    ; (K_at_p_4_2) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_4_2)) (K_at_p_4_2))
        :effect (and (K_not_pit_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-279    ; (K_not_breeze_p_3_2)  ==> 
        :precondition (and (not (K_pit_p_4_2)) (K_not_breeze_p_3_2))
        :effect (and (K_not_pit_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-283    ; (K_not_breeze_p_4_1)  ==> 
        :precondition (and (not (K_pit_p_4_2)) (K_not_breeze_p_4_1))
        :effect (and (K_not_pit_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-287    ; (K_not_breeze_p_4_3)  ==> 
        :precondition (and (not (K_pit_p_4_2)) (K_not_breeze_p_4_3))
        :effect (and (K_not_pit_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-412    ; (K_stench_p_3_2) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1) (K_not_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_4_2)) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1) (K_stench_p_3_2) (K_not_wumpus_p_3_3))
        :effect (and (K_wumpus_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-438    ; (K_stench_p_4_1) (K_not_wumpus_p_3_1)  ==> 
        :precondition (and (not (K_not_wumpus_p_4_2)) (K_not_wumpus_p_3_1) (K_stench_p_4_1))
        :effect (and (K_wumpus_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-452    ; (K_stench_p_4_3) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_not_wumpus_p_4_2)) (K_not_wumpus_p_3_3) (K_stench_p_4_3) (K_not_wumpus_p_4_4))
        :effect (and (K_wumpus_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-289    ; (K_at_p_4_2) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_4_2)) (K_at_p_4_2))
        :effect (and (K_not_wumpus_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-277    ; (K_not_stench_p_3_2)  ==> 
        :precondition (and (not (K_wumpus_p_4_2)) (K_not_stench_p_3_2))
        :effect (and (K_not_wumpus_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-281    ; (K_not_stench_p_4_1)  ==> 
        :precondition (and (not (K_wumpus_p_4_2)) (K_not_stench_p_4_1))
        :effect (and (K_not_wumpus_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-285    ; (K_not_stench_p_4_3)  ==> 
        :precondition (and (not (K_wumpus_p_4_2)) (K_not_stench_p_4_3))
        :effect (and (K_not_wumpus_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-179    ; (K_pit_p_3_1)  ==> 
        :precondition (and (not (K_not_breeze_p_4_1)) (K_pit_p_3_1))
        :effect (and (K_breeze_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-284    ; (K_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_breeze_p_4_1)) (K_pit_p_4_2))
        :effect (and (K_breeze_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-439    ; (K_not_pit_p_3_1) (K_not_pit_p_4_2)  ==> 
        :precondition (and (not (K_breeze_p_4_1)) (K_not_pit_p_3_1) (K_not_pit_p_4_2))
        :effect (and (K_not_breeze_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-407    ; (K_breeze_p_3_1) (K_not_pit_p_2_1) (K_not_pit_p_3_2)  ==> 
        :precondition (and (not (K_not_pit_p_4_1)) (K_not_pit_p_2_1) (K_breeze_p_3_1) (K_not_pit_p_3_2))
        :effect (and (K_pit_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-448    ; (K_breeze_p_4_2) (K_not_pit_p_3_2) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_pit_p_4_1)) (K_not_pit_p_3_2) (K_breeze_p_4_2) (K_not_pit_p_4_3))
        :effect (and (K_pit_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-271    ; (K_at_p_4_1) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_4_1)) (K_at_p_4_1))
        :effect (and (K_not_pit_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-262    ; (K_not_breeze_p_3_1)  ==> 
        :precondition (and (not (K_pit_p_4_1)) (K_not_breeze_p_3_1))
        :effect (and (K_not_pit_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-266    ; (K_not_breeze_p_4_2)  ==> 
        :precondition (and (not (K_pit_p_4_1)) (K_not_breeze_p_4_2))
        :effect (and (K_not_pit_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-177    ; (K_wumpus_p_3_1)  ==> 
        :precondition (and (not (K_not_stench_p_4_1)) (K_wumpus_p_3_1))
        :effect (and (K_stench_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-282    ; (K_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_stench_p_4_1)) (K_wumpus_p_4_2))
        :effect (and (K_stench_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-436    ; (K_not_wumpus_p_3_1) (K_not_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_stench_p_4_1)) (K_not_wumpus_p_3_1) (K_not_wumpus_p_4_2))
        :effect (and (K_not_stench_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-268    ; (K_at_p_4_1) (K_alive)  ==> 
        :precondition (K_at_p_4_1)
        :effect (and (K_not_wumpus_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-158    ; (K_pit_p_2_4)  ==> 
        :precondition (and (not (K_not_breeze_p_3_4)) (K_pit_p_2_4))
        :effect (and (K_breeze_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-225    ; (K_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_breeze_p_3_4)) (K_pit_p_3_3))
        :effect (and (K_breeze_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-322    ; (K_pit_p_4_4)  ==> 
        :precondition (and (not (K_not_breeze_p_3_4)) (K_pit_p_4_4))
        :effect (and (K_breeze_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-432    ; (K_not_pit_p_2_4) (K_not_pit_p_3_3) (K_not_pit_p_4_4)  ==> 
        :precondition (and (not (K_breeze_p_3_4)) (K_not_pit_p_2_4) (K_not_pit_p_3_3) (K_not_pit_p_4_4))
        :effect (and (K_not_breeze_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-399    ; (K_breeze_p_2_4) (K_not_pit_p_1_4) (K_not_pit_p_2_3)  ==> 
        :precondition (and (not (K_not_pit_p_3_4)) (K_not_pit_p_1_4) (K_breeze_p_2_4))
        :effect (and (K_pit_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-426    ; (K_breeze_p_3_3) (K_not_pit_p_2_3) (K_not_pit_p_3_2) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_pit_p_3_4)) (K_not_pit_p_3_2) (K_breeze_p_3_3) (K_not_pit_p_4_3))
        :effect (and (K_pit_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-462    ; (K_breeze_p_4_4) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_pit_p_3_4)) (K_not_pit_p_4_3) (K_breeze_p_4_4))
        :effect (and (K_pit_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-254    ; (K_at_p_3_4) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_3_4)) (K_at_p_3_4))
        :effect (and (K_not_pit_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-241    ; (K_not_breeze_p_2_4)  ==> 
        :precondition (and (not (K_pit_p_3_4)) (K_not_breeze_p_2_4))
        :effect (and (K_not_pit_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-245    ; (K_not_breeze_p_3_3)  ==> 
        :precondition (and (not (K_pit_p_3_4)) (K_not_breeze_p_3_3))
        :effect (and (K_not_pit_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-249    ; (K_not_breeze_p_4_4)  ==> 
        :precondition (and (not (K_pit_p_3_4)) (K_not_breeze_p_4_4))
        :effect (and (K_not_pit_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-156    ; (K_wumpus_p_2_4)  ==> 
        :precondition (and (not (K_not_stench_p_3_4)) (K_wumpus_p_2_4))
        :effect (and (K_stench_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-223    ; (K_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_stench_p_3_4)) (K_wumpus_p_3_3))
        :effect (and (K_stench_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-320    ; (K_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_not_stench_p_3_4)) (K_wumpus_p_4_4))
        :effect (and (K_stench_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-428    ; (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_stench_p_3_4)) (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_4))
        :effect (and (K_not_stench_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-395    ; (K_stench_p_2_4) (K_not_wumpus_p_1_4) (K_not_wumpus_p_2_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_4)) (K_not_wumpus_p_1_4) (K_stench_p_2_4))
        :effect (and (K_wumpus_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-459    ; (K_stench_p_4_4) (K_not_wumpus_p_4_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_4)) (K_not_wumpus_p_4_3) (K_stench_p_4_4))
        :effect (and (K_wumpus_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-251    ; (K_at_p_3_4) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_3_4)) (K_at_p_3_4))
        :effect (and (K_not_wumpus_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-239    ; (K_not_stench_p_2_4)  ==> 
        :precondition (and (not (K_wumpus_p_3_4)) (K_not_stench_p_2_4))
        :effect (and (K_not_wumpus_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-247    ; (K_not_stench_p_4_4)  ==> 
        :precondition (and (not (K_wumpus_p_3_4)) (K_not_stench_p_4_4))
        :effect (and (K_not_wumpus_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-137    ; (K_pit_p_2_3)  ==> 
        :precondition (and (not (K_not_breeze_p_3_3)) (K_pit_p_2_3))
        :effect (and (K_breeze_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-200    ; (K_pit_p_3_2)  ==> 
        :precondition (and (not (K_not_breeze_p_3_3)) (K_pit_p_3_2))
        :effect (and (K_breeze_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-246    ; (K_pit_p_3_4)  ==> 
        :precondition (and (not (K_not_breeze_p_3_3)) (K_pit_p_3_4))
        :effect (and (K_breeze_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-301    ; (K_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_breeze_p_3_3)) (K_pit_p_4_3))
        :effect (and (K_breeze_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-423    ; (K_not_pit_p_2_3) (K_not_pit_p_3_2) (K_not_pit_p_3_4) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_breeze_p_3_3)) (K_not_pit_p_3_2) (K_not_pit_p_3_4) (K_not_pit_p_4_3))
        :effect (and (K_not_breeze_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-391    ; (K_breeze_p_2_3) (K_not_pit_p_1_3) (K_not_pit_p_2_2) (K_not_pit_p_2_4)  ==> 
        :precondition (and (not (K_not_pit_p_3_3)) (K_not_pit_p_2_2) (K_breeze_p_2_3) (K_not_pit_p_2_4))
        :effect (and (K_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-416    ; (K_breeze_p_3_2) (K_not_pit_p_2_2) (K_not_pit_p_3_1) (K_not_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_pit_p_3_3)) (K_not_pit_p_2_2) (K_not_pit_p_3_1) (K_breeze_p_3_2) (K_not_pit_p_4_2))
        :effect (and (K_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-434    ; (K_breeze_p_3_4) (K_not_pit_p_2_4) (K_not_pit_p_4_4)  ==> 
        :precondition (and (not (K_not_pit_p_3_3)) (K_not_pit_p_2_4) (K_breeze_p_3_4) (K_not_pit_p_4_4))
        :effect (and (K_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-455    ; (K_breeze_p_4_3) (K_not_pit_p_4_2) (K_not_pit_p_4_4)  ==> 
        :precondition (and (not (K_not_pit_p_3_3)) (K_not_pit_p_4_2) (K_breeze_p_4_3) (K_not_pit_p_4_4))
        :effect (and (K_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-233    ; (K_at_p_3_3) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_3_3)) (K_at_p_3_3))
        :effect (and (K_not_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-216    ; (K_not_breeze_p_2_3)  ==> 
        :precondition (and (not (K_pit_p_3_3)) (K_not_breeze_p_2_3))
        :effect (and (K_not_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-220    ; (K_not_breeze_p_3_2)  ==> 
        :precondition (and (not (K_pit_p_3_3)) (K_not_breeze_p_3_2))
        :effect (and (K_not_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-224    ; (K_not_breeze_p_3_4)  ==> 
        :precondition (and (not (K_pit_p_3_3)) (K_not_breeze_p_3_4))
        :effect (and (K_not_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-228    ; (K_not_breeze_p_4_3)  ==> 
        :precondition (and (not (K_pit_p_3_3)) (K_not_breeze_p_4_3))
        :effect (and (K_not_pit_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-386    ; (K_stench_p_2_3) (K_not_wumpus_p_1_3) (K_not_wumpus_p_2_2) (K_not_wumpus_p_2_4)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_3)) (K_not_wumpus_p_2_2) (K_stench_p_2_3) (K_not_wumpus_p_2_4))
        :effect (and (K_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-411    ; (K_stench_p_3_2) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1) (K_not_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_3)) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1) (K_stench_p_3_2) (K_not_wumpus_p_4_2))
        :effect (and (K_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-430    ; (K_stench_p_3_4) (K_not_wumpus_p_2_4) (K_not_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_3)) (K_not_wumpus_p_2_4) (K_stench_p_3_4) (K_not_wumpus_p_4_4))
        :effect (and (K_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-451    ; (K_stench_p_4_3) (K_not_wumpus_p_4_2) (K_not_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_3)) (K_not_wumpus_p_4_2) (K_stench_p_4_3) (K_not_wumpus_p_4_4))
        :effect (and (K_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-230    ; (K_at_p_3_3) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_3_3)) (K_at_p_3_3))
        :effect (and (K_not_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-214    ; (K_not_stench_p_2_3)  ==> 
        :precondition (and (not (K_wumpus_p_3_3)) (K_not_stench_p_2_3))
        :effect (and (K_not_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-218    ; (K_not_stench_p_3_2)  ==> 
        :precondition (and (not (K_wumpus_p_3_3)) (K_not_stench_p_3_2))
        :effect (and (K_not_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-222    ; (K_not_stench_p_3_4)  ==> 
        :precondition (and (not (K_wumpus_p_3_3)) (K_not_stench_p_3_4))
        :effect (and (K_not_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-226    ; (K_not_stench_p_4_3)  ==> 
        :precondition (and (not (K_wumpus_p_3_3)) (K_not_stench_p_4_3))
        :effect (and (K_not_wumpus_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-112    ; (K_pit_p_2_2)  ==> 
        :precondition (and (not (K_not_breeze_p_3_2)) (K_pit_p_2_2))
        :effect (and (K_breeze_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-175    ; (K_pit_p_3_1)  ==> 
        :precondition (and (not (K_not_breeze_p_3_2)) (K_pit_p_3_1))
        :effect (and (K_breeze_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-221    ; (K_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_breeze_p_3_2)) (K_pit_p_3_3))
        :effect (and (K_breeze_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-280    ; (K_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_breeze_p_3_2)) (K_pit_p_4_2))
        :effect (and (K_breeze_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-413    ; (K_not_pit_p_2_2) (K_not_pit_p_3_1) (K_not_pit_p_3_3) (K_not_pit_p_4_2)  ==> 
        :precondition (and (not (K_breeze_p_3_2)) (K_not_pit_p_2_2) (K_not_pit_p_3_1) (K_not_pit_p_3_3) (K_not_pit_p_4_2))
        :effect (and (K_not_breeze_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-381    ; (K_breeze_p_2_2) (K_not_pit_p_1_2) (K_not_pit_p_2_1) (K_not_pit_p_2_3)  ==> 
        :precondition (and (not (K_not_pit_p_3_2)) (K_not_pit_p_2_1) (K_breeze_p_2_2))
        :effect (and (K_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-406    ; (K_breeze_p_3_1) (K_not_pit_p_2_1) (K_not_pit_p_4_1)  ==> 
        :precondition (and (not (K_not_pit_p_3_2)) (K_not_pit_p_2_1) (K_breeze_p_3_1) (K_not_pit_p_4_1))
        :effect (and (K_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-425    ; (K_breeze_p_3_3) (K_not_pit_p_2_3) (K_not_pit_p_3_4) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_pit_p_3_2)) (K_breeze_p_3_3) (K_not_pit_p_3_4) (K_not_pit_p_4_3))
        :effect (and (K_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-447    ; (K_breeze_p_4_2) (K_not_pit_p_4_1) (K_not_pit_p_4_3)  ==> 
        :precondition (and (not (K_not_pit_p_3_2)) (K_not_pit_p_4_1) (K_breeze_p_4_2) (K_not_pit_p_4_3))
        :effect (and (K_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-191    ; (K_not_breeze_p_2_2)  ==> 
        :precondition (and (not (K_pit_p_3_2)) (K_not_breeze_p_2_2))
        :effect (and (K_not_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-195    ; (K_not_breeze_p_3_1)  ==> 
        :precondition (and (not (K_pit_p_3_2)) (K_not_breeze_p_3_1))
        :effect (and (K_not_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-199    ; (K_not_breeze_p_3_3)  ==> 
        :precondition (and (not (K_pit_p_3_2)) (K_not_breeze_p_3_3))
        :effect (and (K_not_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-203    ; (K_not_breeze_p_4_2)  ==> 
        :precondition (and (not (K_pit_p_3_2)) (K_not_breeze_p_4_2))
        :effect (and (K_not_pit_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-110    ; (K_wumpus_p_2_2)  ==> 
        :precondition (and (not (K_not_stench_p_3_2)) (K_wumpus_p_2_2))
        :effect (and (K_stench_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-173    ; (K_wumpus_p_3_1)  ==> 
        :precondition (and (not (K_not_stench_p_3_2)) (K_wumpus_p_3_1))
        :effect (and (K_stench_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-219    ; (K_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_stench_p_3_2)) (K_wumpus_p_3_3))
        :effect (and (K_stench_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-278    ; (K_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_stench_p_3_2)) (K_wumpus_p_4_2))
        :effect (and (K_stench_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-408    ; (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_stench_p_3_2)) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2))
        :effect (and (K_not_stench_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-87    ; (K_pit_p_2_1)  ==> 
        :precondition (and (not (K_not_breeze_p_3_1)) (K_pit_p_2_1))
        :effect (and (K_breeze_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-196    ; (K_pit_p_3_2)  ==> 
        :precondition (and (not (K_not_breeze_p_3_1)) (K_pit_p_3_2))
        :effect (and (K_breeze_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-263    ; (K_pit_p_4_1)  ==> 
        :precondition (and (not (K_not_breeze_p_3_1)) (K_pit_p_4_1))
        :effect (and (K_breeze_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-404    ; (K_not_pit_p_2_1) (K_not_pit_p_3_2) (K_not_pit_p_4_1)  ==> 
        :precondition (and (not (K_breeze_p_3_1)) (K_not_pit_p_2_1) (K_not_pit_p_3_2) (K_not_pit_p_4_1))
        :effect (and (K_not_breeze_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-371    ; (K_breeze_p_2_1) (K_not_pit_p_1_1) (K_not_pit_p_2_2)  ==> 
        :precondition (and (not (K_not_pit_p_3_1)) (K_not_pit_p_1_1) (K_breeze_p_2_1) (K_not_pit_p_2_2))
        :effect (and (K_pit_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-415    ; (K_breeze_p_3_2) (K_not_pit_p_2_2) (K_not_pit_p_3_3) (K_not_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_pit_p_3_1)) (K_not_pit_p_2_2) (K_breeze_p_3_2) (K_not_pit_p_3_3) (K_not_pit_p_4_2))
        :effect (and (K_pit_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-440    ; (K_breeze_p_4_1) (K_not_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_pit_p_3_1)) (K_breeze_p_4_1) (K_not_pit_p_4_2))
        :effect (and (K_pit_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-183    ; (K_at_p_3_1) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_3_1)) (K_at_p_3_1))
        :effect (and (K_not_pit_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-170    ; (K_not_breeze_p_2_1)  ==> 
        :precondition (and (not (K_pit_p_3_1)) (K_not_breeze_p_2_1))
        :effect (and (K_not_pit_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-174    ; (K_not_breeze_p_3_2)  ==> 
        :precondition (and (not (K_pit_p_3_1)) (K_not_breeze_p_3_2))
        :effect (and (K_not_pit_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-178    ; (K_not_breeze_p_4_1)  ==> 
        :precondition (and (not (K_pit_p_3_1)) (K_not_breeze_p_4_1))
        :effect (and (K_not_pit_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-367    ; (K_stench_p_2_1) (K_not_wumpus_p_1_1) (K_not_wumpus_p_2_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_1)) (K_not_wumpus_p_1_1) (K_stench_p_2_1) (K_not_wumpus_p_2_2))
        :effect (and (K_wumpus_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-410    ; (K_stench_p_3_2) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_1)) (K_not_wumpus_p_2_2) (K_stench_p_3_2) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2))
        :effect (and (K_wumpus_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-437    ; (K_stench_p_4_1) (K_not_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_3_1)) (K_stench_p_4_1) (K_not_wumpus_p_4_2))
        :effect (and (K_wumpus_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-180    ; (K_at_p_3_1) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_3_1)) (K_at_p_3_1))
        :effect (and (K_not_wumpus_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-168    ; (K_not_stench_p_2_1)  ==> 
        :precondition (and (not (K_wumpus_p_3_1)) (K_not_stench_p_2_1))
        :effect (and (K_not_wumpus_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-172    ; (K_not_stench_p_3_2)  ==> 
        :precondition (and (not (K_wumpus_p_3_1)) (K_not_stench_p_3_2))
        :effect (and (K_not_wumpus_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-176    ; (K_not_stench_p_4_1)  ==> 
        :precondition (and (not (K_wumpus_p_3_1)) (K_not_stench_p_4_1))
        :effect (and (K_not_wumpus_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-66    ; (K_pit_p_1_4)  ==> 
        :precondition (and (not (K_not_breeze_p_2_4)) (K_pit_p_1_4))
        :effect (and (K_breeze_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-133    ; (K_pit_p_2_3)  ==> 
        :precondition (and (not (K_not_breeze_p_2_4)) (K_pit_p_2_3))
        :effect (and (K_breeze_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-242    ; (K_pit_p_3_4)  ==> 
        :precondition (and (not (K_not_breeze_p_2_4)) (K_pit_p_3_4))
        :effect (and (K_breeze_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-396    ; (K_not_pit_p_1_4) (K_not_pit_p_2_3) (K_not_pit_p_3_4)  ==> 
        :precondition (and (not (K_breeze_p_2_4)) (K_not_pit_p_1_4) (K_not_pit_p_3_4))
        :effect (and (K_not_breeze_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-363    ; (K_breeze_p_1_4) (K_not_pit_p_1_3)  ==> 
        :precondition (and (not (K_not_pit_p_2_4)) (K_breeze_p_1_4))
        :effect (and (K_pit_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-390    ; (K_breeze_p_2_3) (K_not_pit_p_1_3) (K_not_pit_p_2_2) (K_not_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_pit_p_2_4)) (K_not_pit_p_2_2) (K_breeze_p_2_3) (K_not_pit_p_3_3))
        :effect (and (K_pit_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-433    ; (K_breeze_p_3_4) (K_not_pit_p_3_3) (K_not_pit_p_4_4)  ==> 
        :precondition (and (not (K_not_pit_p_2_4)) (K_not_pit_p_3_3) (K_breeze_p_3_4) (K_not_pit_p_4_4))
        :effect (and (K_pit_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-162    ; (K_at_p_2_4) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_2_4)) (K_at_p_2_4))
        :effect (and (K_not_pit_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-149    ; (K_not_breeze_p_1_4)  ==> 
        :precondition (and (not (K_pit_p_2_4)) (K_not_breeze_p_1_4))
        :effect (and (K_not_pit_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-153    ; (K_not_breeze_p_2_3)  ==> 
        :precondition (and (not (K_pit_p_2_4)) (K_not_breeze_p_2_3))
        :effect (and (K_not_pit_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-157    ; (K_not_breeze_p_3_4)  ==> 
        :precondition (and (not (K_pit_p_2_4)) (K_not_breeze_p_3_4))
        :effect (and (K_not_pit_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-64    ; (K_wumpus_p_1_4)  ==> 
        :precondition (and (not (K_not_stench_p_2_4)) (K_wumpus_p_1_4))
        :effect (and (K_stench_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-131    ; (K_wumpus_p_2_3)  ==> 
        :precondition (and (not (K_not_stench_p_2_4)) (K_wumpus_p_2_3))
        :effect (and (K_stench_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-240    ; (K_wumpus_p_3_4)  ==> 
        :precondition (and (not (K_not_stench_p_2_4)) (K_wumpus_p_3_4))
        :effect (and (K_stench_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-392    ; (K_not_wumpus_p_1_4) (K_not_wumpus_p_2_3) (K_not_wumpus_p_3_4)  ==> 
        :precondition (and (not (K_stench_p_2_4)) (K_not_wumpus_p_1_4) (K_not_wumpus_p_3_4))
        :effect (and (K_not_stench_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-360    ; (K_stench_p_1_4) (K_not_wumpus_p_1_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_4)) (K_stench_p_1_4))
        :effect (and (K_wumpus_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-385    ; (K_stench_p_2_3) (K_not_wumpus_p_1_3) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_4)) (K_not_wumpus_p_2_2) (K_stench_p_2_3) (K_not_wumpus_p_3_3))
        :effect (and (K_wumpus_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-429    ; (K_stench_p_3_4) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_4)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_4)) (K_not_wumpus_p_3_3) (K_stench_p_3_4) (K_not_wumpus_p_4_4))
        :effect (and (K_wumpus_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-159    ; (K_at_p_2_4) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_2_4)) (K_at_p_2_4))
        :effect (and (K_not_wumpus_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-147    ; (K_not_stench_p_1_4)  ==> 
        :precondition (and (not (K_wumpus_p_2_4)) (K_not_stench_p_1_4))
        :effect (and (K_not_wumpus_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-151    ; (K_not_stench_p_2_3)  ==> 
        :precondition (and (not (K_wumpus_p_2_4)) (K_not_stench_p_2_3))
        :effect (and (K_not_wumpus_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-155    ; (K_not_stench_p_3_4)  ==> 
        :precondition (and (not (K_wumpus_p_2_4)) (K_not_stench_p_3_4))
        :effect (and (K_not_wumpus_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-49    ; (K_pit_p_1_3)  ==> 
        :precondition (and (not (K_not_breeze_p_2_3)) (K_pit_p_1_3))
        :effect (and (K_breeze_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-108    ; (K_pit_p_2_2)  ==> 
        :precondition (and (not (K_not_breeze_p_2_3)) (K_pit_p_2_2))
        :effect (and (K_breeze_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-154    ; (K_pit_p_2_4)  ==> 
        :precondition (and (not (K_not_breeze_p_2_3)) (K_pit_p_2_4))
        :effect (and (K_breeze_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-217    ; (K_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_breeze_p_2_3)) (K_pit_p_3_3))
        :effect (and (K_breeze_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-387    ; (K_not_pit_p_1_3) (K_not_pit_p_2_2) (K_not_pit_p_2_4) (K_not_pit_p_3_3)  ==> 
        :precondition (and (not (K_breeze_p_2_3)) (K_not_pit_p_2_2) (K_not_pit_p_2_4) (K_not_pit_p_3_3))
        :effect (and (K_not_breeze_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-141    ; (K_at_p_2_3) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_2_3)) (K_at_p_2_3))
        :effect (and (K_not_pit_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-124    ; (K_not_breeze_p_1_3)  ==> 
        :precondition (and (not (K_pit_p_2_3)) (K_not_breeze_p_1_3))
        :effect (and (K_not_pit_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-128    ; (K_not_breeze_p_2_2)  ==> 
        :precondition (and (not (K_pit_p_2_3)) (K_not_breeze_p_2_2))
        :effect (and (K_not_pit_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-132    ; (K_not_breeze_p_2_4)  ==> 
        :precondition (and (not (K_pit_p_2_3)) (K_not_breeze_p_2_4))
        :effect (and (K_not_pit_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-136    ; (K_not_breeze_p_3_3)  ==> 
        :precondition (and (not (K_pit_p_2_3)) (K_not_breeze_p_3_3))
        :effect (and (K_not_pit_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-47    ; (K_wumpus_p_1_3)  ==> 
        :precondition (and (not (K_not_stench_p_2_3)) (K_wumpus_p_1_3))
        :effect (and (K_stench_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-106    ; (K_wumpus_p_2_2)  ==> 
        :precondition (and (not (K_not_stench_p_2_3)) (K_wumpus_p_2_2))
        :effect (and (K_stench_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-152    ; (K_wumpus_p_2_4)  ==> 
        :precondition (and (not (K_not_stench_p_2_3)) (K_wumpus_p_2_4))
        :effect (and (K_stench_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-215    ; (K_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_stench_p_2_3)) (K_wumpus_p_3_3))
        :effect (and (K_stench_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-382    ; (K_not_wumpus_p_1_3) (K_not_wumpus_p_2_2) (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_stench_p_2_3)) (K_not_wumpus_p_2_2) (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3))
        :effect (and (K_not_stench_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-138    ; (K_at_p_2_3) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_2_3)) (K_at_p_2_3))
        :effect (and (K_not_wumpus_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-122    ; (K_not_stench_p_1_3)  ==> 
        :precondition (and (not (K_wumpus_p_2_3)) (K_not_stench_p_1_3))
        :effect (and (K_not_wumpus_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-130    ; (K_not_stench_p_2_4)  ==> 
        :precondition (and (not (K_wumpus_p_2_3)) (K_not_stench_p_2_4))
        :effect (and (K_not_wumpus_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-28    ; (K_pit_p_1_2)  ==> 
        :precondition (and (not (K_not_breeze_p_2_2)) (K_pit_p_1_2))
        :effect (and (K_breeze_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-83    ; (K_pit_p_2_1)  ==> 
        :precondition (and (not (K_not_breeze_p_2_2)) (K_pit_p_2_1))
        :effect (and (K_breeze_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-129    ; (K_pit_p_2_3)  ==> 
        :precondition (and (not (K_not_breeze_p_2_2)) (K_pit_p_2_3))
        :effect (and (K_breeze_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-192    ; (K_pit_p_3_2)  ==> 
        :precondition (and (not (K_not_breeze_p_2_2)) (K_pit_p_3_2))
        :effect (and (K_breeze_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-377    ; (K_not_pit_p_1_2) (K_not_pit_p_2_1) (K_not_pit_p_2_3) (K_not_pit_p_3_2)  ==> 
        :precondition (and (not (K_breeze_p_2_2)) (K_not_pit_p_2_1) (K_not_pit_p_3_2))
        :effect (and (K_not_breeze_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-349    ; (K_breeze_p_1_2) (K_not_pit_p_1_1) (K_not_pit_p_1_3)  ==> 
        :precondition (and (not (K_not_pit_p_2_2)) (K_not_pit_p_1_1) (K_breeze_p_1_2))
        :effect (and (K_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-370    ; (K_breeze_p_2_1) (K_not_pit_p_1_1) (K_not_pit_p_3_1)  ==> 
        :precondition (and (not (K_not_pit_p_2_2)) (K_not_pit_p_1_1) (K_breeze_p_2_1) (K_not_pit_p_3_1))
        :effect (and (K_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-389    ; (K_breeze_p_2_3) (K_not_pit_p_1_3) (K_not_pit_p_2_4) (K_not_pit_p_3_3)  ==> 
        :precondition (and (not (K_not_pit_p_2_2)) (K_breeze_p_2_3) (K_not_pit_p_2_4) (K_not_pit_p_3_3))
        :effect (and (K_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-414    ; (K_breeze_p_3_2) (K_not_pit_p_3_1) (K_not_pit_p_3_3) (K_not_pit_p_4_2)  ==> 
        :precondition (and (not (K_not_pit_p_2_2)) (K_not_pit_p_3_1) (K_breeze_p_3_2) (K_not_pit_p_3_3) (K_not_pit_p_4_2))
        :effect (and (K_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-116    ; (K_at_p_2_2) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_2_2)) (K_at_p_2_2))
        :effect (and (K_not_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-99    ; (K_not_breeze_p_1_2)  ==> 
        :precondition (and (not (K_pit_p_2_2)) (K_not_breeze_p_1_2))
        :effect (and (K_not_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-103    ; (K_not_breeze_p_2_1)  ==> 
        :precondition (and (not (K_pit_p_2_2)) (K_not_breeze_p_2_1))
        :effect (and (K_not_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-107    ; (K_not_breeze_p_2_3)  ==> 
        :precondition (and (not (K_pit_p_2_2)) (K_not_breeze_p_2_3))
        :effect (and (K_not_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-111    ; (K_not_breeze_p_3_2)  ==> 
        :precondition (and (not (K_pit_p_2_2)) (K_not_breeze_p_3_2))
        :effect (and (K_not_pit_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-345    ; (K_stench_p_1_2) (K_not_wumpus_p_1_1) (K_not_wumpus_p_1_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_2)) (K_not_wumpus_p_1_1) (K_stench_p_1_2))
        :effect (and (K_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-366    ; (K_stench_p_2_1) (K_not_wumpus_p_1_1) (K_not_wumpus_p_3_1)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_2)) (K_not_wumpus_p_1_1) (K_stench_p_2_1) (K_not_wumpus_p_3_1))
        :effect (and (K_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-384    ; (K_stench_p_2_3) (K_not_wumpus_p_1_3) (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_2)) (K_stench_p_2_3) (K_not_wumpus_p_2_4) (K_not_wumpus_p_3_3))
        :effect (and (K_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-409    ; (K_stench_p_3_2) (K_not_wumpus_p_3_1) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_2)) (K_not_wumpus_p_3_1) (K_stench_p_3_2) (K_not_wumpus_p_3_3) (K_not_wumpus_p_4_2))
        :effect (and (K_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-113    ; (K_at_p_2_2) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_2_2)) (K_at_p_2_2))
        :effect (and (K_not_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-97    ; (K_not_stench_p_1_2)  ==> 
        :precondition (and (not (K_wumpus_p_2_2)) (K_not_stench_p_1_2))
        :effect (and (K_not_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-101    ; (K_not_stench_p_2_1)  ==> 
        :precondition (and (not (K_wumpus_p_2_2)) (K_not_stench_p_2_1))
        :effect (and (K_not_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-105    ; (K_not_stench_p_2_3)  ==> 
        :precondition (and (not (K_wumpus_p_2_2)) (K_not_stench_p_2_3))
        :effect (and (K_not_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-109    ; (K_not_stench_p_3_2)  ==> 
        :precondition (and (not (K_wumpus_p_2_2)) (K_not_stench_p_3_2))
        :effect (and (K_not_wumpus_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-7    ; (K_pit_p_1_1)  ==> 
        :precondition (and (not (K_not_breeze_p_2_1)) (K_pit_p_1_1))
        :effect (and (K_breeze_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-104    ; (K_pit_p_2_2)  ==> 
        :precondition (and (not (K_not_breeze_p_2_1)) (K_pit_p_2_2))
        :effect (and (K_breeze_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-171    ; (K_pit_p_3_1)  ==> 
        :precondition (and (not (K_not_breeze_p_2_1)) (K_pit_p_3_1))
        :effect (and (K_breeze_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-368    ; (K_not_pit_p_1_1) (K_not_pit_p_2_2) (K_not_pit_p_3_1)  ==> 
        :precondition (and (not (K_breeze_p_2_1)) (K_not_pit_p_1_1) (K_not_pit_p_2_2) (K_not_pit_p_3_1))
        :effect (and (K_not_breeze_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-341    ; (K_breeze_p_1_1) (K_not_pit_p_1_2)  ==> 
        :precondition (and (not (K_not_pit_p_2_1)) (K_breeze_p_1_1))
        :effect (and (K_pit_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-379    ; (K_breeze_p_2_2) (K_not_pit_p_1_2) (K_not_pit_p_2_3) (K_not_pit_p_3_2)  ==> 
        :precondition (and (not (K_not_pit_p_2_1)) (K_breeze_p_2_2) (K_not_pit_p_3_2))
        :effect (and (K_pit_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-405    ; (K_breeze_p_3_1) (K_not_pit_p_3_2) (K_not_pit_p_4_1)  ==> 
        :precondition (and (not (K_not_pit_p_2_1)) (K_breeze_p_3_1) (K_not_pit_p_3_2) (K_not_pit_p_4_1))
        :effect (and (K_pit_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-91    ; (K_at_p_2_1) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_2_1)) (K_at_p_2_1))
        :effect (and (K_not_pit_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-78    ; (K_not_breeze_p_1_1)  ==> 
        :precondition (and (not (K_pit_p_2_1)) (K_not_breeze_p_1_1))
        :effect (and (K_not_pit_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-82    ; (K_not_breeze_p_2_2)  ==> 
        :precondition (and (not (K_pit_p_2_1)) (K_not_breeze_p_2_2))
        :effect (and (K_not_pit_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-86    ; (K_not_breeze_p_3_1)  ==> 
        :precondition (and (not (K_pit_p_2_1)) (K_not_breeze_p_3_1))
        :effect (and (K_not_pit_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-5    ; (K_wumpus_p_1_1)  ==> 
        :precondition (and (not (K_not_stench_p_2_1)) (K_wumpus_p_1_1))
        :effect (and (K_stench_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-102    ; (K_wumpus_p_2_2)  ==> 
        :precondition (and (not (K_not_stench_p_2_1)) (K_wumpus_p_2_2))
        :effect (and (K_stench_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-169    ; (K_wumpus_p_3_1)  ==> 
        :precondition (and (not (K_not_stench_p_2_1)) (K_wumpus_p_3_1))
        :effect (and (K_stench_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-364    ; (K_not_wumpus_p_1_1) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1)  ==> 
        :precondition (and (not (K_stench_p_2_1)) (K_not_wumpus_p_1_1) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1))
        :effect (and (K_not_stench_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-338    ; (K_stench_p_1_1) (K_not_wumpus_p_1_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_2_1)) (K_stench_p_1_1))
        :effect (and (K_wumpus_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-88    ; (K_at_p_2_1) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_2_1)) (K_at_p_2_1))
        :effect (and (K_not_wumpus_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-76    ; (K_not_stench_p_1_1)  ==> 
        :precondition (and (not (K_wumpus_p_2_1)) (K_not_stench_p_1_1))
        :effect (and (K_not_wumpus_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-45    ; (K_pit_p_1_3)  ==> 
        :precondition (and (not (K_not_breeze_p_1_4)) (K_pit_p_1_3))
        :effect (and (K_breeze_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-150    ; (K_pit_p_2_4)  ==> 
        :precondition (and (not (K_not_breeze_p_1_4)) (K_pit_p_2_4))
        :effect (and (K_breeze_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-361    ; (K_not_pit_p_1_3) (K_not_pit_p_2_4)  ==> 
        :precondition (and (not (K_breeze_p_1_4)) (K_not_pit_p_2_4))
        :effect (and (K_not_breeze_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-356    ; (K_breeze_p_1_3) (K_not_pit_p_1_2) (K_not_pit_p_2_3)  ==> 
        :precondition (and (not (K_not_pit_p_1_4)) (K_breeze_p_1_3))
        :effect (and (K_pit_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-397    ; (K_breeze_p_2_4) (K_not_pit_p_2_3) (K_not_pit_p_3_4)  ==> 
        :precondition (and (not (K_not_pit_p_1_4)) (K_breeze_p_2_4) (K_not_pit_p_3_4))
        :effect (and (K_pit_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-70    ; (K_at_p_1_4) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_1_4)) (K_at_p_1_4))
        :effect (and (K_not_pit_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-61    ; (K_not_breeze_p_1_3)  ==> 
        :precondition (and (not (K_pit_p_1_4)) (K_not_breeze_p_1_3))
        :effect (and (K_not_pit_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-65    ; (K_not_breeze_p_2_4)  ==> 
        :precondition (and (not (K_pit_p_1_4)) (K_not_breeze_p_2_4))
        :effect (and (K_not_pit_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-43    ; (K_wumpus_p_1_3)  ==> 
        :precondition (and (not (K_not_stench_p_1_4)) (K_wumpus_p_1_3))
        :effect (and (K_stench_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-148    ; (K_wumpus_p_2_4)  ==> 
        :precondition (and (not (K_not_stench_p_1_4)) (K_wumpus_p_2_4))
        :effect (and (K_stench_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-358    ; (K_not_wumpus_p_1_3) (K_not_wumpus_p_2_4)  ==> 
        :precondition (and (not (K_stench_p_1_4)) (K_not_wumpus_p_2_4))
        :effect (and (K_not_stench_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-352    ; (K_stench_p_1_3) (K_not_wumpus_p_1_2) (K_not_wumpus_p_2_3)  ==> 
        :precondition (and (not (K_not_wumpus_p_1_4)) (K_stench_p_1_3))
        :effect (and (K_wumpus_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-393    ; (K_stench_p_2_4) (K_not_wumpus_p_2_3) (K_not_wumpus_p_3_4)  ==> 
        :precondition (and (not (K_not_wumpus_p_1_4)) (K_stench_p_2_4) (K_not_wumpus_p_3_4))
        :effect (and (K_wumpus_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-67    ; (K_at_p_1_4) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_1_4)) (K_at_p_1_4))
        :effect (and (K_not_wumpus_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-59    ; (K_not_stench_p_1_3)  ==> 
        :precondition (and (not (K_wumpus_p_1_4)) (K_not_stench_p_1_3))
        :effect (and (K_not_wumpus_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-63    ; (K_not_stench_p_2_4)  ==> 
        :precondition (and (not (K_wumpus_p_1_4)) (K_not_stench_p_2_4))
        :effect (and (K_not_wumpus_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-24    ; (K_pit_p_1_2)  ==> 
        :precondition (and (not (K_not_breeze_p_1_3)) (K_pit_p_1_2))
        :effect (and (K_breeze_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-62    ; (K_pit_p_1_4)  ==> 
        :precondition (and (not (K_not_breeze_p_1_3)) (K_pit_p_1_4))
        :effect (and (K_breeze_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-125    ; (K_pit_p_2_3)  ==> 
        :precondition (and (not (K_not_breeze_p_1_3)) (K_pit_p_2_3))
        :effect (and (K_breeze_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-354    ; (K_not_pit_p_1_2) (K_not_pit_p_1_4) (K_not_pit_p_2_3)  ==> 
        :precondition (and (not (K_breeze_p_1_3)) (K_not_pit_p_1_4))
        :effect (and (K_not_breeze_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-53    ; (K_at_p_1_3) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_1_3)) (K_at_p_1_3))
        :effect (and (K_not_pit_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-40    ; (K_not_breeze_p_1_2)  ==> 
        :precondition (and (not (K_pit_p_1_3)) (K_not_breeze_p_1_2))
        :effect (and (K_not_pit_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-44    ; (K_not_breeze_p_1_4)  ==> 
        :precondition (and (not (K_pit_p_1_3)) (K_not_breeze_p_1_4))
        :effect (and (K_not_pit_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-48    ; (K_not_breeze_p_2_3)  ==> 
        :precondition (and (not (K_pit_p_1_3)) (K_not_breeze_p_2_3))
        :effect (and (K_not_pit_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-22    ; (K_wumpus_p_1_2)  ==> 
        :precondition (and (not (K_not_stench_p_1_3)) (K_wumpus_p_1_2))
        :effect (and (K_stench_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-60    ; (K_wumpus_p_1_4)  ==> 
        :precondition (and (not (K_not_stench_p_1_3)) (K_wumpus_p_1_4))
        :effect (and (K_stench_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-123    ; (K_wumpus_p_2_3)  ==> 
        :precondition (and (not (K_not_stench_p_1_3)) (K_wumpus_p_2_3))
        :effect (and (K_stench_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-350    ; (K_not_wumpus_p_1_2) (K_not_wumpus_p_1_4) (K_not_wumpus_p_2_3)  ==> 
        :precondition (and (not (K_stench_p_1_3)) (K_not_wumpus_p_1_4))
        :effect (and (K_not_stench_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-50    ; (K_at_p_1_3) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_1_3)) (K_at_p_1_3))
        :effect (and (K_not_wumpus_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-38    ; (K_not_stench_p_1_2)  ==> 
        :precondition (and (not (K_wumpus_p_1_3)) (K_not_stench_p_1_2))
        :effect (and (K_not_wumpus_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-42    ; (K_not_stench_p_1_4)  ==> 
        :precondition (and (not (K_wumpus_p_1_3)) (K_not_stench_p_1_4))
        :effect (and (K_not_wumpus_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-46    ; (K_not_stench_p_2_3)  ==> 
        :precondition (and (not (K_wumpus_p_1_3)) (K_not_stench_p_2_3))
        :effect (and (K_not_wumpus_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-3    ; (K_pit_p_1_1)  ==> 
        :precondition (and (not (K_not_breeze_p_1_2)) (K_pit_p_1_1))
        :effect (and (K_breeze_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-41    ; (K_pit_p_1_3)  ==> 
        :precondition (and (not (K_not_breeze_p_1_2)) (K_pit_p_1_3))
        :effect (and (K_breeze_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-100    ; (K_pit_p_2_2)  ==> 
        :precondition (and (not (K_not_breeze_p_1_2)) (K_pit_p_2_2))
        :effect (and (K_breeze_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-346    ; (K_not_pit_p_1_1) (K_not_pit_p_1_3) (K_not_pit_p_2_2)  ==> 
        :precondition (and (not (K_breeze_p_1_2)) (K_not_pit_p_1_1) (K_not_pit_p_2_2))
        :effect (and (K_not_breeze_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-32    ; (K_at_p_1_2) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_1_2)) (K_at_p_1_2))
        :effect (and (K_not_pit_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-19    ; (K_not_breeze_p_1_1)  ==> 
        :precondition (and (not (K_pit_p_1_2)) (K_not_breeze_p_1_1))
        :effect (and (K_not_pit_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-23    ; (K_not_breeze_p_1_3)  ==> 
        :precondition (and (not (K_pit_p_1_2)) (K_not_breeze_p_1_3))
        :effect (and (K_not_pit_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-27    ; (K_not_breeze_p_2_2)  ==> 
        :precondition (and (not (K_pit_p_1_2)) (K_not_breeze_p_2_2))
        :effect (and (K_not_pit_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-1    ; (K_wumpus_p_1_1)  ==> 
        :precondition (and (not (K_not_stench_p_1_2)) (K_wumpus_p_1_1))
        :effect (and (K_stench_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-39    ; (K_wumpus_p_1_3)  ==> 
        :precondition (and (not (K_not_stench_p_1_2)) (K_wumpus_p_1_3))
        :effect (and (K_stench_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-98    ; (K_wumpus_p_2_2)  ==> 
        :precondition (and (not (K_not_stench_p_1_2)) (K_wumpus_p_2_2))
        :effect (and (K_stench_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-342    ; (K_not_wumpus_p_1_1) (K_not_wumpus_p_1_3) (K_not_wumpus_p_2_2)  ==> 
        :precondition (and (not (K_stench_p_1_2)) (K_not_wumpus_p_1_1) (K_not_wumpus_p_2_2))
        :effect (and (K_not_stench_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-29    ; (K_at_p_1_2) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_1_2)) (K_at_p_1_2))
        :effect (and (K_not_wumpus_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-17    ; (K_not_stench_p_1_1)  ==> 
        :precondition (and (not (K_wumpus_p_1_2)) (K_not_stench_p_1_1))
        :effect (and (K_not_wumpus_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-21    ; (K_not_stench_p_1_3)  ==> 
        :precondition (and (not (K_wumpus_p_1_2)) (K_not_stench_p_1_3))
        :effect (and (K_not_wumpus_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-20    ; (K_pit_p_1_2)  ==> 
        :precondition (and (not (K_not_breeze_p_1_1)) (K_pit_p_1_2))
        :effect (and (K_breeze_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-79    ; (K_pit_p_2_1)  ==> 
        :precondition (and (not (K_not_breeze_p_1_1)) (K_pit_p_2_1))
        :effect (and (K_breeze_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-339    ; (K_not_pit_p_1_2) (K_not_pit_p_2_1)  ==> 
        :precondition (and (not (K_breeze_p_1_1)) (K_not_pit_p_2_1))
        :effect (and (K_not_breeze_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-347    ; (K_breeze_p_1_2) (K_not_pit_p_1_3) (K_not_pit_p_2_2)  ==> 
        :precondition (and (not (K_not_pit_p_1_1)) (K_breeze_p_1_2) (K_not_pit_p_2_2))
        :effect (and (K_pit_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-369    ; (K_breeze_p_2_1) (K_not_pit_p_2_2) (K_not_pit_p_3_1)  ==> 
        :precondition (and (not (K_not_pit_p_1_1)) (K_breeze_p_2_1) (K_not_pit_p_2_2) (K_not_pit_p_3_1))
        :effect (and (K_pit_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-11    ; (K_at_p_1_1) (K_alive)  ==> 
        :precondition (and (not (K_pit_p_1_1)) (K_at_p_1_1))
        :effect (and (K_not_pit_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-2    ; (K_not_breeze_p_1_2)  ==> 
        :precondition (and (not (K_pit_p_1_1)) (K_not_breeze_p_1_2))
        :effect (and (K_not_pit_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-6    ; (K_not_breeze_p_2_1)  ==> 
        :precondition (and (not (K_pit_p_1_1)) (K_not_breeze_p_2_1))
        :effect (and (K_not_pit_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-18    ; (K_wumpus_p_1_2)  ==> 
        :precondition (and (not (K_not_stench_p_1_1)) (K_wumpus_p_1_2))
        :effect (and (K_stench_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-77    ; (K_wumpus_p_2_1)  ==> 
        :precondition (and (not (K_not_stench_p_1_1)) (K_wumpus_p_2_1))
        :effect (and (K_stench_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-336    ; (K_not_wumpus_p_1_2) (K_not_wumpus_p_2_1)  ==> 
        :precondition (and (not (K_stench_p_1_1)) (K_not_wumpus_p_2_1))
        :effect (and (K_not_stench_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-343    ; (K_stench_p_1_2) (K_not_wumpus_p_1_3) (K_not_wumpus_p_2_2)  ==> 
        :precondition (and (not (K_not_wumpus_p_1_1)) (K_stench_p_1_2) (K_not_wumpus_p_2_2))
        :effect (and (K_wumpus_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-365    ; (K_stench_p_2_1) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1)  ==> 
        :precondition (and (not (K_not_wumpus_p_1_1)) (K_stench_p_2_1) (K_not_wumpus_p_2_2) (K_not_wumpus_p_3_1))
        :effect (and (K_wumpus_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-8    ; (K_at_p_1_1) (K_alive)  ==> 
        :precondition (and (not (K_wumpus_p_1_1)) (K_at_p_1_1))
        :effect (and (K_not_wumpus_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-0    ; (K_not_stench_p_1_2)  ==> 
        :precondition (and (not (K_wumpus_p_1_1)) (K_not_stench_p_1_2))
        :effect (and (K_not_wumpus_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-4    ; (K_not_stench_p_2_1)  ==> 
        :precondition (and (not (K_wumpus_p_1_1)) (K_not_stench_p_2_1))
        :effect (and (K_not_wumpus_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-9    ; (K_wumpus_p_1_1) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_1)) (K_wumpus_p_1_1))
        :effect (and (K_not_at_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-12    ; (K_pit_p_1_1) (K_alive)  ==> 
        :precondition (and (not (K_at_p_1_1)) (K_pit_p_1_1))
        :effect (and (K_not_at_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-335    ; (K_not_wumpus_p_4_4) (K_not_pit_p_4_4)  ==> 
        :precondition (and (K_not_wumpus_p_4_4) (K_not_pit_p_4_4))
        :effect (and (K_safe_p_4_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-318    ; (K_not_wumpus_p_4_3) (K_not_pit_p_4_3)  ==> 
        :precondition (and (K_not_wumpus_p_4_3) (K_not_pit_p_4_3))
        :effect (and (K_safe_p_4_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-297    ; (K_not_wumpus_p_4_2) (K_not_pit_p_4_2)  ==> 
        :precondition (and (K_not_wumpus_p_4_2) (K_not_pit_p_4_2))
        :effect (and (K_safe_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-276    ; (K_not_wumpus_p_4_1) (K_not_pit_p_4_1)  ==> 
        :precondition (and (K_not_wumpus_p_4_1) (K_not_pit_p_4_1))
        :effect (and (K_safe_p_4_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-259    ; (K_not_wumpus_p_3_4) (K_not_pit_p_3_4)  ==> 
        :precondition (and (K_not_wumpus_p_3_4) (K_not_pit_p_3_4))
        :effect (and (K_safe_p_3_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-238    ; (K_not_wumpus_p_3_3) (K_not_pit_p_3_3)  ==> 
        :precondition (and (K_not_wumpus_p_3_3) (K_not_pit_p_3_3))
        :effect (and (K_safe_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-188    ; (K_not_wumpus_p_3_1) (K_not_pit_p_3_1)  ==> 
        :precondition (and (K_not_wumpus_p_3_1) (K_not_pit_p_3_1))
        :effect (and (K_safe_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-167    ; (K_not_wumpus_p_2_4) (K_not_pit_p_2_4)  ==> 
        :precondition (and (K_not_wumpus_p_2_4) (K_not_pit_p_2_4))
        :effect (and (K_safe_p_2_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-146    ; (K_not_wumpus_p_2_3) (K_not_pit_p_2_3)  ==> 
        :effect (and (K_safe_p_2_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-121    ; (K_not_wumpus_p_2_2) (K_not_pit_p_2_2)  ==> 
        :precondition (and (K_not_wumpus_p_2_2) (K_not_pit_p_2_2))
        :effect (and (K_safe_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-96    ; (K_not_wumpus_p_2_1) (K_not_pit_p_2_1)  ==> 
        :precondition (and (K_not_wumpus_p_2_1) (K_not_pit_p_2_1))
        :effect (and (K_safe_p_2_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-75    ; (K_not_wumpus_p_1_4) (K_not_pit_p_1_4)  ==> 
        :precondition (and (K_not_wumpus_p_1_4) (K_not_pit_p_1_4))
        :effect (and (K_safe_p_1_4)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-58    ; (K_not_wumpus_p_1_3) (K_not_pit_p_1_3)  ==> 
        :effect (and (K_safe_p_1_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-37    ; (K_not_wumpus_p_1_2) (K_not_pit_p_1_2)  ==> 
        :effect (and (K_safe_p_1_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-16    ; (K_not_wumpus_p_1_1) (K_not_pit_p_1_1)  ==> 
        :precondition (and (K_not_wumpus_p_1_1) (K_not_pit_p_1_1))
        :effect (and (K_safe_p_1_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-190    ; (K_wumpus_p_3_2)  ==> 
        :effect (and (K_stench_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-26    ; (K_wumpus_p_1_2)  ==> 
        :precondition (K_wumpus_p_1_2)
        :effect (and (K_stench_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-81    ; (K_wumpus_p_2_1)  ==> 
        :precondition (K_wumpus_p_2_1)
        :effect (and (K_stench_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-127    ; (K_wumpus_p_2_3)  ==> 
        :precondition (K_wumpus_p_2_3)
        :effect (and (K_stench_p_2_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-202    ; (K_wumpus_p_3_2)  ==> 
        :effect (and (K_stench_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-303    ; (K_wumpus_p_4_3)  ==> 
        :precondition (K_wumpus_p_4_3)
        :effect (and (K_stench_p_4_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-198    ; (K_wumpus_p_3_2)  ==> 
        :effect (and (K_stench_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-135    ; (K_wumpus_p_2_3)  ==> 
        :precondition (K_wumpus_p_2_3)
        :effect (and (K_stench_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-244    ; (K_wumpus_p_3_4)  ==> 
        :precondition (K_wumpus_p_3_4)
        :effect (and (K_stench_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-299    ; (K_wumpus_p_4_3)  ==> 
        :precondition (K_wumpus_p_4_3)
        :effect (and (K_stench_p_3_3)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-194    ; (K_wumpus_p_3_2)  ==> 
        :effect (and (K_stench_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-85    ; (K_wumpus_p_2_1)  ==> 
        :precondition (K_wumpus_p_2_1)
        :effect (and (K_stench_p_3_1)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-402    ; (K_stench_p_3_1) (K_not_wumpus_p_2_1) (K_not_wumpus_p_4_1)  ==> 
        :precondition (and (K_not_wumpus_p_2_1) (K_not_wumpus_p_4_1))
        :effect (and (K_wumpus_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-420    ; (K_stench_p_3_3) (K_not_wumpus_p_2_3) (K_not_wumpus_p_3_4) (K_not_wumpus_p_4_3)  ==> 
        :precondition (and (K_not_wumpus_p_3_4) (K_not_wumpus_p_4_3))
        :effect (and (K_wumpus_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-443    ; (K_stench_p_4_2) (K_not_wumpus_p_4_1) (K_not_wumpus_p_4_3)  ==> 
        :precondition (and (K_not_wumpus_p_4_1) (K_not_wumpus_p_4_3))
        :effect (and (K_wumpus_p_3_2)(increase (total-cost) 0)
))
    (:action invariant-at-least-one-376    ; (K_stench_p_2_2) (K_not_wumpus_p_1_2) (K_not_wumpus_p_2_1) (K_not_wumpus_p_2_3)  ==> 
        :precondition (K_not_wumpus_p_2_1)
        :effect (and (K_wumpus_p_3_2)(increase (total-cost) 0)
))
    (:action reach_new_goal_through_original_goal__
        :precondition (K_have-gold)
        :effect (and (new-goal)(increase (total-cost) 1000)
))
)
