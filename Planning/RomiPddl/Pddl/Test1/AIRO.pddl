(define (domain viaggio)
    (:requirements 
        :strips 
        :equality 
        :typing
    )    

    (:predicates 
        ; Type of objects
        (AGENT ?a)  (LOCATION ?loc)  (CAR ?c) (PLANE ?p) (CITY ?city)
        ; State of objects
        (at_agent ?a ?loc) (veh_loc ?v ?loc) (at_loc ?loc ?city) 
        (conection ?from ?to)
        ; Fluent predicates
        (in_car ?a ?v)(in_plane ?a ?v) (change_city ?a ?city)
    )

    (:action get_on
        :parameters (?v ?a ?loc ?city)
        :precondition (and (LOCATION ?loc)(CAR ?v)(AGENT ?a)(CITY ?city)
                        (veh_loc ?v ?loc) (at_agent ?a ?loc)(at_loc ?loc ?city)) 
        :effect (and (in_car ?a ?v) (not (at_agent ?a ?loc)))    
    )
    
    (:action drive
        :parameters (?from ?to ?v ?a ?city)
        :precondition (and (LOCATION ?from) (LOCATION ?to) (CAR ?v) (AGENT ?a) (CITY ?city)
                        (veh_loc ?v ?from) (conection ?from ?to)(in_car ?a ?v))
        :effect (and (veh_loc ?v ?to) 
                    (not (veh_loc ?v ?from)) (not (at_agent ?a ?from)))
    )

    (:action get_off
        :parameters (?v ?a ?loc ?city)
        :precondition (and (LOCATION ?loc)(CAR ?v)(AGENT ?a)(CITY ?city)
                        (veh_loc ?v ?loc) (in_car ?a ?v))
        :effect (and (at_agent ?a ?loc) (not (in_car ?a ?v)))
    )

    (:action board
        :parameters (?v ?a ?loc ?city)
        :precondition (and (LOCATION ?loc)(PLANE ?v)(AGENT ?a)(CITY ?city)
                        (veh_loc ?v ?loc) (at_loc ?loc ?city)(at_agent ?a ?loc)(change_city ?a ?city))
        :effect (and (in_plane ?a ?v) (not (at_agent ?a ?loc))(not(change_city ?a ?city)))
    )   

    (:action fly
        :parameters (?from ?to ?v ?a ?cityfrom ?cityto)
        :precondition (and(PLANE ?v) (AGENT ?a) (CITY ?cityfrom) (CITY ?cityto)
                        (in_plane ?a ?v)(conection ?from ?to)(veh_loc ?v ?from))
        :effect (and (veh_loc ?v ?to) (not (veh_loc ?v ?from)))
    )

    (:action unboard
        :parameters (?v ?a ?from ?to ?cityfrom ?cityto)
        :precondition (and (PLANE ?v)(AGENT ?a)(LOCATION ?from)(LOCATION ?to)
                        (CITY ?cityfrom)(CITY ?cityto)
                        (conection ?from ?to)(in_plane ?a ?v)(veh_loc ?v ?from))
        :effect (and (at_agent ?a ?to) (not (at_agent ?a ?from)) 
                    (change_city ?a ?cityto) (not (change_city ?a ?cityfrom))
                    (veh_loc ?v ?to) (not(veh_loc ?v ?from)) 
                    (at_loc ?to ?cityto)(not (in_plane ?a ?v)))
    )
    
    

)