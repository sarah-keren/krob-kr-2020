(define (domain logistics_cont)
  (:types OBJ TRUCK LOCATION AIRPLANE CITY AIRPORT )
  (:requirements :strips :typing)

  (:predicates
  
        (at_tl ?obj - TRUCK  ?loc - LOCATION)
        (at_ta ?obj - TRUCK  ?loc - AIRPORT)
        (at_aa ?obj - AIRPLANE ?loc - AIRPORT)
        (at_ol ?obj - OBJ ?loc - LOCATION)
        (at_oa ?obj - OBJ ?loc - AIRPORT)
        (in_ot ?obj1 - OBJ ?obj2 - TRUCK)
        (in_oa ?obj1 - OBJ ?obj2 - AIRPLANE)
        (in_city_l ?loc - LOCATION ?city - CITY)
        (in_city_a ?loc - AIRPORT ?city - CITY)
        (in_city_t ?loc - TRUCK ?city - CITY)
	(design)	
        (dummy-goal)
   )

   (:action design-infoshaping-safe
    :parameters (?obj - OBJ ?loc - LOCATION)
    :precondition (and (design))
    :effect (and(at_ol ?obj ?loc))
   )
)


    


