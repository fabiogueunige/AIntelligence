(define (domain airport)

    (:requirements :strips )

    (:predicates
        ; Pradicates to distinguish among agent, location and type of transport
        (AGENT ?a)
        (LOCATION ?l)
        (TRANSPORT ?t)

        ; Fluents
        ; Agent a being at location l
        (at_agent ?a ?l)
        ; Transport t being at location l
        (at_transport ?t ?l)
        ; Agent a being in transport t
        (in ?a ?t)
        ; Transport t going from location from to location to
        (can_go ?t ?from ?to)
    )

    (:action board 
        ; Agent can go inside his car or plane
        :parameters (?a ?t ?l)
        :precondition (and (AGENT ?a) (TRANSPORT ?t) (LOCATION ?l) 
                            (at_agent ?a ?l) (at_transport ?t ?l))
        
        :effect (and (in ?a ?t) (not (at_agent ?a ?l)))
    )

    (:action unboard
        ; Agent can go out of his car or plane
        :parameters (?a ?t ?l)
        :precondition (and 
                        (AGENT ?a) (TRANSPORT ?t) (LOCATION ?l) 
                        (in ?a ?t) (at_transport ?t ?l)
        )
        :effect (and (at_agent ?a ?l) (not (in ?a ?t)))
    )

    (:action move
        ; Agent can move from one location to another
        :parameters (?a ?t ?from ?to)
        :precondition (and (AGENT ?a) (TRANSPORT ?t) (LOCATION ?from) (LOCATION ?to)
                        (at_transport ?t ?from) (can_go ?t ?from ?to) (in ?a ?t))
        :effect (and (at_transport ?t ?to) (not (at_transport ?t ?from)))            
        )
)