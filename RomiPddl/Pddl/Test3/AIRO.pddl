(define (domain tomatoesme)
    (:requirements 
        :strips
        :equality
        :typing
     )
    
    (:predicates
        ;Objects
        (TOMATOES ?t)(LOCATION ?loc)(PERSON ?p)
        ;Actions  
        (on_table ?t ?loc) (at_loc ?loc) (carry ?t ?r) (free ?p)
        ; Connection to the location
        (con ?loc1 ?loc2)
        ; State of the location
        (empty ?loc)(full ?loc)
    )

    (:action move
        :parameters (?from ?to)
        :precondition (and (LOCATION ?from) (LOCATION ?to) (at_loc ?from)
                        (con ?from ?to))
        :effect (and (at_loc ?to)(not (at_loc ?from)))
    )

    (:action pickup 
        :parameters (?t ?loc ?p)
        :precondition (and (TOMATOES ?t)(LOCATION ?loc)(PERSON ?p)
                        (at_loc ?loc) (on_table ?t ?loc) (free ?p))
        :effect (and (carry ?t ?p) (not(free ?p))(not(on_table ?t ?loc)))
    )
    
    (:action drop 
        :parameters (?t ?loc ?p)
        :precondition (and (TOMATOES ?t) (LOCATION ?loc) (PERSON ?p)
                            (carry ?t ?p) (at_loc ?loc) (empty ?loc))
        :effect (and (free ?p) (full ?loc)
                    (not(carry ?t ?loc))(not(empty ?loc)))
    )
    
)