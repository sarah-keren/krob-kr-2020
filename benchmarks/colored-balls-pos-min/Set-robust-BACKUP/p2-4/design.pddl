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
  
   (:action design-infoshaping-ball-pos
    :parameters (?b - ball ?x ?y - pos)
    :precondition (and(design))
    :effect (and (ball-pos ?b ?x ?y))
   )

   (:action design-infoshaping-ball-color
    :parameters (?b - ball ?c - color)
    :precondition (and(design))
    :effect (and (ball-color ?b ?c))
   )

   (:action design-infoshaping-not-ball-pos
    :parameters (?b - ball ?x ?y - pos)
    :precondition (and(design))
    :effect (and (not(ball-pos ?b ?x ?y)))
   )

   (:action design-infoshaping-not-ball-color
    :parameters (?b - ball ?c - color)
    :precondition (and(design))
    :effect (and (not(ball-color ?b ?c)))
   )


)

