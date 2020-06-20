
(define (domain RockSample)
    (:requirements :typing :equality)

    (:types LOCATION ROCK HEIGHT)
    (:constants h0 h1 h2 - HEIGHT)
    (:predicates
		(design)
		(dummy-goal)
        (rock-at ?r - ROCK ?loc - LOCATION)
        (agent-at ?loc - LOCATION)
        (adj ?loc1 ?loc2 - LOCATION)
        (good ?r - ROCK)
        (done ?r - ROCK)
        (antenna-height ?h - HEIGHT)
        (good-rocks-in-range ?loc - LOCATION ?h - HEIGHT)
        (in-range ?r - ROCK ?loc - LOCATION ?h - HEIGHT)
        (sensing)
    ) ;;; end_predicates

	(:action design-infoshaping-good-r-nearby
	 :parameters (?loc - LOCATION ?h - HEIGHT) 
         :precondition (and (design)) 
	 :effect (good-rocks-in-range ?loc ?h)
	)

)
