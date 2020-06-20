(define (problem n5-b6-c4)
    (:domain colored-balls)
    (:objects
        p1 p2 p3 p4 p5 - pos
        b1 - ball
        c1 c2 c3 c4 - color)
    (:init
        (suc p1 p2) (suc p2 p3) (suc p3 p4) (suc p4 p5)
        (at p1 p1)
        (empty-arm)
        (spot p5 p1 c1)
        (spot p1 p3 c2)
        (spot p2 p3 c3)
        (spot p1 p2 c4)
        (not (ball-at-spot b1))
        (invariant (ball-color b1 c1) (ball-color b1 c2) (ball-color b1 c3) (ball-color b1 c4))
        (invariant (ball-at-spot b1)
                   (ball-pos b1 p1 p1) (ball-pos b1 p1 p2) (ball-pos b1 p1 p3) (ball-pos b1 p1 p4) (ball-pos b1 p1 p5)
                   (ball-pos b1 p2 p1) (ball-pos b1 p2 p2) (ball-pos b1 p2 p3) (ball-pos b1 p2 p4) (ball-pos b1 p2 p5)
                   (ball-pos b1 p3 p1) (ball-pos b1 p3 p2) (ball-pos b1 p3 p3) (ball-pos b1 p3 p4) (ball-pos b1 p3 p5)
                   (ball-pos b1 p4 p1) (ball-pos b1 p4 p2) (ball-pos b1 p4 p3) (ball-pos b1 p4 p4) (ball-pos b1 p4 p5)
                   (ball-pos b1 p5 p1) (ball-pos b1 p5 p2) (ball-pos b1 p5 p3) (ball-pos b1 p5 p4) (ball-pos b1 p5 p5))       
	;;; CHANGES 
    

	)
    (:hidden
        (ball-pos b1 p3 p4) 
        (ball-color b1 c1)
    );; end_hidden

   (:goal
    (and	
	;;; HYPS <hyp>
     )
    )
)
