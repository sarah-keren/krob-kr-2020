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
		tru1 - TRUCK
		tru2 - TRUCK
		apn1 - AIRPLANE
		apn2 - AIRPLANE
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
	 (in-city_a apt1 cit1) 
	 (in-city_l pos11 cit1) 
	 (in-city_l pos12 cit1) 
	 (in-city_l pos13 cit1)
	 (in-city_a apt2 cit2) 
	 (in-city_l pos21 cit2) 
	 (in-city_l pos22 cit2) 
	 (in-city_l pos23 cit2)
	 (design)

  )
  (:goal (dummy-goal))
)
