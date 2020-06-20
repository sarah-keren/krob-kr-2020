(define (problem n3-b1-c1)
    (:domain colored-balls)
    (:objects
        p1 p2 p3 p4 p5 - pos
        b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - ball
        c1 c2 c3 c4 - color)
 
    (:init
      (suc p1 p2) (suc p2 p3) (suc p3 p4) (suc p4 p5)
      (at p1 p1)
      (empty-arm)
      (design)
	
    )   
    
    (:goal
    (dummy-goal)
    )
)
