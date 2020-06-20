(define (problem unix-3)
   (:domain unix)
   (:objects root sub1 sub2 sub3 sub11 sub12 sub21 sub22 sub31 sub32 - DIR myfile1 myfile2 - FILE)
   
   (:init
     (subdir root sub1)
     (subdir root sub2)
     (subdir root sub3)
     (subdir sub1 sub11)
     (subdir sub1 sub12)
     (subdir sub2 sub21)
     (subdir sub2 sub22)
     (subdir sub3 sub31)
     (subdir sub3 sub32)
  
     (iscurdir root)
     (invariant
        (fileindir myfile1 sub11)
        (fileindir myfile1 sub21)
        (fileindir myfile1 sub12)
        (fileindir myfile1 sub22)
        (fileindir myfile1 sub31)
        (fileindir myfile1 sub32)
	)
     (invariant
        (fileindir myfile2 sub11)
        (fileindir myfile2 sub21)
        (fileindir myfile2 sub12)
        (fileindir myfile2 sub22)
        (fileindir myfile2 sub31)
        (fileindir myfile2 sub32)
)
     ;;; CHANGES 

     )

    (:hidden
	   (fileindir myfile1 sub22)
	   (fileindir myfile2 sub12)
	  
    );;; end_hidden



   (:goal 
   (and	
   ;;; HYPS <hyp>
   )  
   )



)




   
