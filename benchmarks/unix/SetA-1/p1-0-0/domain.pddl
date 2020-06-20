(define (domain unix)
(:requirements :typing :equality)

(:types FILE DIR)
(:predicates
 (fileindir ?file - FILE ?dir - DIR)
    (subdir ?pardir - DIR ?childdir - DIR)
    (iscurdir ?d - DIR)
    )
 
(:action cd-down
 :parameters (?cur-dir - DIR ?childdir - DIR)
 :precondition (and (iscurdir ?cur-dir)(subdir ?cur-dir ?childdir))
 :effect (and (iscurdir ?childdir)(not (iscurdir ?cur-dir)))
)
 

(:action cd-up
 :parameters (?cur-dir - DIR ?pardir - DIR)
 :precondition (and (iscurdir ?cur-dir)(subdir ?pardir ?cur-dir))
 :effect (and (iscurdir ?pardir)(not (iscurdir ?cur-dir)))
)
 
(:action ls
 :parameters (?cur-dir - DIR ?file - FILE)
 :precondition (iscurdir ?cur-dir)
 :observe (fileindir ?file ?cur-dir)
)
 
(:action mv
 :parameters (?file - FILE ?cur-dir - DIR ?target-dir - DIR)
 :precondition (and (iscurdir ?cur-dir)(fileindir ?file ?cur-dir))
 :effect (and (not (fileindir ?file ?cur-dir))(fileindir ?file ?target-dir))
)

)
