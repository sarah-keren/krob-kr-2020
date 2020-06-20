(define (domain full-wumpus)
    (:requirements :typing :equality)
    (:types pos)
    (:predicates
        (adj ?p1 ?p2 - pos)
        (wumpus ?p - pos)
        (stench ?p - pos)
        (pit ?p - pos)
        (breeze ?p - pos)
        (gold ?p)
        (have-gold)
        (safe ?p2)
        (at ?p - pos)
        (alive)
	    (design)	
       (dummy-goal)
    )

   (:action design-infoshaping-safe
    :parameters (?i - pos)
    :precondition (and (design))
    :effect (and(safe ?i))
   )
   

)

