;; init=(7,4)
;; goal=(2,1)
;; @@@@@.@@@@@
;; @.sssssI..@
;; @@s@@@@@@.@
;; @.s.@.....@
;; @.G.@.....@
;; @@@@@@@@@@@

(define (problem ijcai-2)
    (:domain trail)
    (:objects p7 p8 p10 p13 p14 p15 p16 p19 p20 p22 p28 p31 p32 p34 p35 p37 p38 p40 p43 p44 p46 p49 p50 p52 p55 p56 p57 p58 - pos)
    (:init
       (adj p7 p8)
       (adj p7 p13)
       (adj p8 p14)
       (adj p8 p7)
       (adj p10 p16)
       (adj p13 p14)
       (adj p13 p19)
       (adj p13 p7)
       (adj p14 p15)
       (adj p14 p20)
       (adj p14 p13)
       (adj p14 p8)
       (adj p15 p16)
       (adj p15 p14)
       (adj p16 p22)
       (adj p16 p15)
       (adj p16 p10)
       (adj p19 p20)
       (adj p19 p13)
       (adj p20 p19)
       (adj p20 p14)
       (adj p22 p28)
       (adj p22 p16)
       (adj p28 p34)
       (adj p28 p22)
       (adj p31 p32)
       (adj p31 p37)
       (adj p32 p38)
       (adj p32 p31)
       (adj p34 p35)
       (adj p34 p40)
       (adj p34 p28)
       (adj p35 p34)
       (adj p37 p38)
       (adj p37 p43)
       (adj p37 p31)
       (adj p38 p44)
       (adj p38 p37)
       (adj p38 p32)
       (adj p40 p46)
       (adj p40 p34)
       (adj p43 p44)
       (adj p43 p49)
       (adj p43 p37)
       (adj p44 p50)
       (adj p44 p43)
       (adj p44 p38)
       (adj p46 p52)
       (adj p46 p40)
       (adj p49 p50)
       (adj p49 p55)
       (adj p49 p43)
       (adj p50 p56)
       (adj p50 p49)
       (adj p50 p44)
       (adj p52 p58)
       (adj p52 p46)
       (adj p55 p56)
       (adj p55 p49)
       (adj p56 p57)
       (adj p56 p55)
       (adj p56 p50)
       (adj p57 p58)
       (adj p57 p56)
       (adj p58 p57)
       (adj p58 p52)

       (at p46)
        ;;; HYPS <hyp>


       (invariant (stone p7) (not (stone p7)))
       (invariant (final-stone p7) (not (final-stone p7)))
       (invariant (stone p8) (not (stone p8)))
       (invariant (final-stone p8) (not (final-stone p8)))
       (invariant (stone p10) (not (stone p10)))
       (invariant (final-stone p10) (not (final-stone p10)))
       (invariant (stone p13) (not (stone p13)))
       (invariant (final-stone p13) (not (final-stone p13)))
       (invariant (stone p14) (not (stone p14)))
       (invariant (final-stone p14) (not (final-stone p14)))
       (invariant (stone p15) (not (stone p15)))
       (invariant (final-stone p15) (not (final-stone p15)))
       (invariant (stone p16) (not (stone p16)))
       (invariant (final-stone p16) (not (final-stone p16)))
       (invariant (stone p19) (not (stone p19)))
       (invariant (final-stone p19) (not (final-stone p19)))
       (invariant (stone p20) (not (stone p20)))
       (invariant (final-stone p20) (not (final-stone p20)))
       (invariant (stone p22) (not (stone p22)))
       (invariant (final-stone p22) (not (final-stone p22)))
       (invariant (stone p28) (not (stone p28)))
       (invariant (final-stone p28) (not (final-stone p28)))
       (invariant (stone p31) (not (stone p31)))
       (invariant (final-stone p31) (not (final-stone p31)))
       (invariant (stone p32) (not (stone p32)))
       (invariant (final-stone p32) (not (final-stone p32)))
       (invariant (stone p34) (not (stone p34)))
       (invariant (final-stone p34) (not (final-stone p34)))
       (invariant (stone p35) (not (stone p35)))
       (invariant (final-stone p35) (not (final-stone p35)))
       (invariant (stone p37) (not (stone p37)))
       (invariant (final-stone p37) (not (final-stone p37)))
       (invariant (stone p38) (not (stone p38)))
       (invariant (final-stone p38) (not (final-stone p38)))
       (invariant (stone p40) (not (stone p40)))
       (invariant (final-stone p40) (not (final-stone p40)))
       (invariant (stone p43) (not (stone p43)))
       (invariant (final-stone p43) (not (final-stone p43)))
       (invariant (stone p44) (not (stone p44)))
       (invariant (final-stone p44) (not (final-stone p44)))
       (invariant (stone p46) (not (stone p46)))
       (invariant (final-stone p46) (not (final-stone p46)))
       (invariant (stone p49) (not (stone p49)))
       (invariant (final-stone p49) (not (final-stone p49)))
       (invariant (stone p50) (not (stone p50)))
       (invariant (final-stone p50) (not (final-stone p50)))
       (invariant (stone p52) (not (stone p52)))
       (invariant (final-stone p52) (not (final-stone p52)))
       (invariant (stone p55) (not (stone p55)))
       (invariant (final-stone p55) (not (final-stone p55)))
       (invariant (stone p56) (not (stone p56)))
       (invariant (final-stone p56) (not (final-stone p56)))
       (invariant (stone p57) (not (stone p57)))
       (invariant (final-stone p57) (not (final-stone p57)))
       (invariant (stone p58) (not (stone p58)))
       (invariant (final-stone p58) (not (final-stone p58)))
            
	 ;;; CHANGES
    )
    (:hidden
       (stone p7)
       (stone p8)
       (stone p10)
       (stone p13)
       (stone p14)
       (stone p15)
       (stone p16)
       (stone p19)
       (stone p20)
       (stone p22) 
       (stone p28) 
       (stone p31) 
       (stone p32) 
       (stone p34) 
       (stone p35) 
       (stone p37) 
       (stone p38) 
       (stone p40) 
       (stone p43) 
       (stone p44) 
       (stone p46) 
       (stone p49) 
       (stone p50) 
       (stone p52) 
       (stone p55) 
       (stone p56) 
       (stone p57)
       (stone p58)
 	 );;; end_hidden
	(:goal (done)) 
)
