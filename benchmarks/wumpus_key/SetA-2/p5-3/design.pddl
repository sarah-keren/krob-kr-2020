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
        (holding ?k)
	(key-at ?k - key ?p - pos)
    (dummy-goal)
    (design)
    )

   (:action design-infoshaping-keypos
    :parameters (?k - key ?p - pos)
    :precondition (and (design))
    :effect (and(key-at ?k ?p))
   )

   (:action design-infoshaping-safe
    :parameters (?i - pos)
    :precondition (and (design))
    :effect (and(safe ?i))
   )

   
   

)

