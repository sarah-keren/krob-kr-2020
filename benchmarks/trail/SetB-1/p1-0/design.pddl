(define (domain trail)
    (:requirements :typing :equality)
    (:types pos)
    (:predicates
		(design)
		(dummy-goal)
        (adj ?p1 ?p2 - pos)
        (stone ?p - pos)
        (final-stone ?p - pos)
        (visited ?p - pos)
        (at ?p - pos)
        (done)
    ) ;;; end_predicates

   (:action design-infoshaping-no-stone
    :parameters (?p - pos)
    :precondition (and(design))
    :effect (and (not(stone ?p)))
   )
 	

)
