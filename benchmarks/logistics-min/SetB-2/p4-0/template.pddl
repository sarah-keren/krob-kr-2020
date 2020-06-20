;;; a three step plan works
(define (problem att_log0) 
  (:domain logistics_cont)
;;  (:requirements :strips :equality :typing :conditional-effects :disjunctive-preconditions)			
  (:objects
	obj31 - OBJ
		obj32 - OBJ
		obj33 - OBJ 	
    obj23 - OBJ
		obj22 - OBJ
		obj21 - OBJ
    obj13 - OBJ
		obj12 - OBJ
		obj11 - OBJ
		tru2 - TRUCK
		tru1 - TRUCK
		apn1 - AIRPLANE
		apn2 - AIRPLANE
		pos31 - LOCATION
		pos32 - LOCATION
		pos33 - LOCATION
		pos21 - LOCATION
		pos22 - LOCATION
		pos23 - LOCATION
		pos11 - LOCATION
		pos12 - LOCATION
		pos13 - LOCATION
		apt1 - AIRPORT 
		apt2 - AIRPORT 
		cit1 - CITY
		cit2 - CITY
	)
 (:init 

	 (at_tl tru1 pos11)
	 (at_tl tru2 pos22)
	 (at_aa apn1 apt2)
	 (at_aa apn2 apt1)

	 (in_city_a apt1 cit1) 
	 (in_city_l pos11 cit1) 
	 (in_city_l pos12 cit1) 
	 (in_city_l pos13 cit1)
	 
	 (in_city_a apt2 cit2) 
	 (in_city_l pos21 cit2) 
	 (in_city_l pos22 cit2) 
	 (in_city_l pos23 cit2)

	 (in_city_l pos31 cit2) 
	 (in_city_l pos32 cit2) 
	 (in_city_l pos33 cit2)


	 (in_city_t tru1 cit1)
	 (in_city_t tru2 cit2)


	(invariant
	 (at_ol obj11 pos11)
	 (at_ol obj11 pos12)
	 (at_ol obj11 pos13)
	 (at_ol obj11 pos21)
	 (at_ol obj11 pos22)
	 (at_ol obj11 pos23)
	 )
	(invariant
	 (at_ol obj12 pos11)
	 (at_ol obj12 pos12)
	 (at_ol obj12 pos13)
	 (at_ol obj12 pos21)
	 (at_ol obj12 pos22)
	 (at_ol obj12 pos23)
	 )
	(invariant
	 (at_ol obj13 pos12)
	 (at_ol obj13 pos13)
	 (at_ol obj13 pos11)
	 (at_ol obj13 pos21)
	 (at_ol obj13 pos22)
	 (at_ol obj13 pos23)
	)
	(invariant
	 (at_ol obj21 pos11)
	 (at_ol obj21 pos12)
	 (at_ol obj21 pos13)
	 (at_ol obj21 pos21)
	 (at_ol obj21 pos22)
	 (at_ol obj21 pos23)
	)
	(invariant
	 (at_ol obj22 pos13)
	 (at_ol obj22 pos21)
	 (at_ol obj22 pos22)
	 (at_ol obj22 pos11)
	 (at_ol obj22 pos12)
	 (at_ol obj22 pos23)
	)
	(invariant
	 (at_ol obj23 pos21)
	 (at_ol obj23 pos22)
	 (at_ol obj23 pos23)
	 (at_ol obj23 pos11)
	 (at_ol obj23 pos12)
	 (at_ol obj23 pos13)
	)

	(invariant
	 (at_ol obj31 pos11)
	 (at_ol obj31 pos12)
	 (at_ol obj31 pos13)
	 (at_ol obj31 pos31)
	 (at_ol obj31 pos32)
	 (at_ol obj31 pos33)
	)
	(invariant
	 (at_ol obj32 pos11)
	 (at_ol obj32 pos12)
	 (at_ol obj32 pos13)
	 (at_ol obj32 pos31)
	 (at_ol obj32 pos32)
	 (at_ol obj32 pos33)
	)
	(invariant
	 (at_ol obj33 pos11)
	 (at_ol obj33 pos12)
	 (at_ol obj33 pos13)
	 (at_ol obj33 pos31)
	 (at_ol obj33 pos32)
	 (at_ol obj33 pos33)
	)

 ;;; CHANGES 
  )

(:hidden
	(at_ol obj11 pos11) 
	(at_ol obj12 pos11) 
	(at_ol obj13 pos11)
	(at_ol obj21 pos11) 
	(at_ol obj22 pos11) 
	(at_ol obj23 pos11)
	(at_ol obj31 pos11) 
	(at_ol obj32 pos11) 
	(at_ol obj33 pos11)

);; end_hidden


(:goal
;;; HYPS <hyp>
 )
)
