(define (problem unix-3)
   (:domain unix)
   (:objects root sub1 sub2 sub11 sub12 sub21 sub22 - DIR myfile1 myfile2 - FILE)
   
   (:init
     (subdir root sub1)
     (subdir root sub2)
     (subdir sub1 sub11)
     (subdir sub1 sub12)
     (subdir sub2 sub21)
     (subdir sub2 sub22)
     (iscurdir root)
    (design)
   )
  (:goal (dummy-goal))
)

