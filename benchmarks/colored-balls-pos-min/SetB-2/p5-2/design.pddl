(define (domain colored-balls)
    
   (:requirements :strips :typing)

    (:types pos ball color)
    (:predicates
        (suc ?x ?y - pos)
        (ball-pos ?b - ball ?x ?y - pos)
        (holding ?b - ball)
        (empty-arm)
        (ball-color ?b - ball ?c - color)
        (spot ?x ?y - pos ?c - color)
        (ball-at-spot ?b - ball)
        (at ?x ?y - pos)
	(design)	
	(dummy-goal)
    )
  
   (:action design-infoshaping-not-ball-pos
    :parameters (?b - ball ?x ?y - pos)
    :precondition (and(design))
    :effect (and (not(ball-pos ?b ?x ?y)))
   )

)

