(define (domain unix)
(:requirements :typing :equality)

(:types FILE DIR)
    

    (:predicates
 (fileindir ?file - FILE ?dir - DIR)
    (subdir ?pardir - DIR ?childdir - DIR)
    (iscurdir ?d - DIR)
    (design)	
    (dummy-goal)
    )

   (:action design-infoshaping-not-fileindir
    :parameters (?dir - DIR ?file - FILE)
    :precondition (and (design))
    :effect (and(not (fileindir ?file ?dir )))
   )

)


    


