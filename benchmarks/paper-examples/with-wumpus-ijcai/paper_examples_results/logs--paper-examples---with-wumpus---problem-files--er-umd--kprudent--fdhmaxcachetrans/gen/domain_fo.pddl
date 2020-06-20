(define (domain full-wumpus)
    (:requirements :typing :equality)
    (:types pos)
    (:predicates
        (adj ?p1 ?p2 - pos)
        (kac_adj ?p1 ?p2 - pos)
        (wumpus ?p - pos)
        (kac_wumpus ?p - pos)
        (stench ?p - pos)
        (kac_stench ?p - pos)
        (pit ?p - pos)
        (kac_pit ?p - pos)
        (breeze ?p - pos)
        (kac_breeze ?p - pos)
        (gold ?p)
        (kac_gold ?p)
        (have-gold)
        (kac_have-gold)
        (safe ?p2)
        (kac_safe ?p2)
        (at ?p - pos)
        (kac_at ?p - pos)
        (alive)
        (kac_alive)
    )


   (:action act_kac_adj
    :parameters ( ?p1 ?p2 - pos)
    :precondition (kac_adj ?p1 ?p2  )
   :effect(and(adj ?p1 ?p2  ) ))

   (:action act_kac_wumpus
    :parameters ( ?p - pos)
    :precondition (kac_wumpus ?p  )
   :effect(and(wumpus ?p  ) ))

   (:action act_kac_stench
    :parameters ( ?p - pos)
    :precondition (kac_stench ?p  )
   :effect(and(stench ?p  ) ))

   (:action act_kac_pit
    :parameters ( ?p - pos)
    :precondition (kac_pit ?p  )
   :effect(and(pit ?p  ) ))

   (:action act_kac_breeze
    :parameters ( ?p - pos)
    :precondition (kac_breeze ?p  )
   :effect(and(breeze ?p  ) ))

   (:action act_kac_gold
    :parameters ( ?p)
    :precondition (kac_gold ? )
   :effect(and(gold ? ) ))

   (:action act_kac_have-gold
    :parameters ( ?p)
    :precondition (kac_have-gold )
   :effect(and(have-gold ) ))

   (:action act_kac_safe
    :parameters ( ?p2)
    :precondition (kac_safe ?p )
   :effect(and(safe ?p ) ))

   (:action act_kac_at
    :parameters ( ?p - pos)
    :precondition (kac_at ?p  )
   :effect(and(at ?p  ) ))

   (:action act_kac_alive
    :parameters ( ?p - pos)
    :precondition (kac_alive )
   :effect(and(alive ) ))

    (:action move
        :parameters (?p1 ?p2 - pos)
        :precondition (and (adj ?p1 ?p2) (at ?p1) (alive) (safe ?p2))
        :effect (and (not (at ?p1)) (at ?p2))
    )

    (:action grab-gold
        :parameters (?p - pos)
        :precondition (and (at ?p) (gold ?p) (alive))
        :effect (and (not (gold ?p)) (have-gold))
    )

    (:sensor sensor-for-stench
        :parameters (?p - pos)
        :condition (at ?p)
        :sense (stench ?p)
    )

    (:sensor sensor-for-breeze
        :parameters (?p - pos)
        :condition (at ?p)
        :sense (breeze ?p)
    )
)

