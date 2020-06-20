
(define (problem problem-5-5-522)
    (:domain RockSample)
    (:objects
        p0-0 p0-1 p0-2 p0-3 p0-4 p1-0 p1-1 p1-2 p1-3 p1-4 p2-0 p2-1 p2-2 p2-3 p2-4 p3-0 p3-1 p3-2 p3-3 p3-4 p4-0 p4-1 p4-2 p4-3 p4-4 - LOCATION
        r0 r1 r2 r3 r4 - ROCK
    )

    (:init
		(design)        ;; adjacencies
        (adj p0-0 p0-1) (adj p0-0 p1-0) (adj p0-1 p0-0) (adj p0-1 p0-2) (adj p0-1 p1-1) (adj p0-2 p0-1) (adj p0-2 p0-3) (adj p0-2 p1-2) (adj p0-3 p0-2) (adj p0-3 p0-4) (adj p0-3 p1-3) (adj p0-4 p0-3) (adj p0-4 p1-4) (adj p1-0 p0-0) (adj p1-0 p1-1) (adj p1-0 p2-0) (adj p1-1 p0-1) (adj p1-1 p1-0) (adj p1-1 p1-2) (adj p1-1 p2-1) (adj p1-2 p0-2) (adj p1-2 p1-1) (adj p1-2 p1-3) (adj p1-2 p2-2) (adj p1-3 p0-3) (adj p1-3 p1-2) (adj p1-3 p1-4) (adj p1-3 p2-3) (adj p1-4 p0-4) (adj p1-4 p1-3) (adj p1-4 p2-4) (adj p2-0 p1-0) (adj p2-0 p2-1) (adj p2-0 p3-0) (adj p2-1 p1-1) (adj p2-1 p2-0) (adj p2-1 p2-2) (adj p2-1 p3-1) (adj p2-2 p1-2) (adj p2-2 p2-1) (adj p2-2 p2-3) (adj p2-2 p3-2) (adj p2-3 p1-3) (adj p2-3 p2-2) (adj p2-3 p2-4) (adj p2-3 p3-3) (adj p2-4 p1-4) (adj p2-4 p2-3) (adj p2-4 p3-4) (adj p3-0 p2-0) (adj p3-0 p3-1) (adj p3-0 p4-0) (adj p3-1 p2-1) (adj p3-1 p3-0) (adj p3-1 p3-2) (adj p3-1 p4-1) (adj p3-2 p2-2) (adj p3-2 p3-1) (adj p3-2 p3-3) (adj p3-2 p4-2) (adj p3-3 p2-3) (adj p3-3 p3-2) (adj p3-3 p3-4) (adj p3-3 p4-3) (adj p3-4 p2-4) (adj p3-4 p3-3) (adj p3-4 p4-4) (adj p4-0 p3-0) (adj p4-0 p4-1) (adj p4-1 p3-1) (adj p4-1 p4-0) (adj p4-1 p4-2) (adj p4-2 p3-2) (adj p4-2 p4-1) (adj p4-2 p4-3) (adj p4-3 p3-3) (adj p4-3 p4-2) (adj p4-3 p4-4) (adj p4-4 p3-4) (adj p4-4 p4-3)
        (agent-at p1-1)
        (antenna-height h0)
        (not-sensing)
	)
	(:goal 
	 (dummy-goal) 
	) 
)
