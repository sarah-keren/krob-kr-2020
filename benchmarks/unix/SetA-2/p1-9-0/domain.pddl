(define (domain unix)
(:requirements :typing :equality)

(:types FILE DIR)

(:predicates
 (fileindir ?file - FILE ?dir - DIR)
    (subdir ?pardir - DIR ?childdir - DIR)
    (iscurdir ?d - DIR)
    )
 
(:action cd-down
 :parameters (?curdir - DIR ?childdir - DIR)
 :precondition (and (iscurdir ?curdir)(subdir ?curdir ?childdir))
 :effect (and (iscurdir ?childdir)(not (iscurdir ?curdir)))
)
 

(:action cd-up
 :parameters (?curdir - DIR ?pardir - DIR)
 :precondition (and (iscurdir ?curdir)(subdir ?pardir ?curdir))
 :effect (and (iscurdir ?pardir)(not (iscurdir ?curdir)))
)
 
(:action ls
 :parameters (?curdir - DIR ?file - FILE)
 :precondition (iscurdir ?curdir)
 :observe (fileindir ?file ?curdir)
)
 
(:action mv
 :parameters (?file - FILE ?curdir - DIR ?targetdir - DIR)
 :precondition (and (iscurdir ?curdir)(fileindir ?file ?curdir))
 :effect (and (not (fileindir ?file ?curdir))(fileindir ?file ?targetdir))
)

)
