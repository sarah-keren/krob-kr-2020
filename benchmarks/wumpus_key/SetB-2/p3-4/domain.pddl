(define (domain full-wumpus)
    (:requirements :typing :equality)
    (:types pos key)
    (:predicates
        (adj ?p1 ?p2 - pos)
        (wumpus ?p - pos)
        (stench ?p - pos)
        (pit ?p - pos)
        (breeze ?p - pos)
        (gold ?p - pos)
        (have-gold)
        (safe ?p - pos)
        (at ?p - pos)
        (alive)
	(opens ?k - key ?p - pos)
        (holding ?k - key )
	(key-at ?k - key  ?p - pos)
    )

    (:action move
        :parameters (?p1 ?p2 - pos)
        :precondition (and (adj ?p1 ?p2) (at ?p1) (alive) (safe ?p2))
        :effect (and (not (at ?p1)) (at ?p2))
    )


    (:action grab-gold
        :parameters (?p - pos ?k - key)
        :precondition (and (at ?p) (gold ?p) (alive)(opens ?k ?p)(holding ?k))
        :effect (and (not (gold ?p)) (have-gold))
    )

    (:action pickup-key
        :parameters (?p - pos ?k - key )
        :precondition (and (at ?p) (alive) (key-at ?k ?p))
        :effect (and (not (key-at ?k ?p)) (holding ?k))
    )

    (:sensor sensor-for-key
        :parameters (?p - pos ?k - key)
        :condition (at ?p)
        :sense (key-at ?k ?p)
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

