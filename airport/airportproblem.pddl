(define (problem airportproblem)
    (:domain airport)

    (:objects
        a
        car plane
        home citya cityb
    )
    (:init
        ; Predicates to distinguish among objects 
        (AGENT a)
        (TRANSPORT car) (TRANSPORT plane)
        (LOCATION home) (LOCATION citya) (LOCATION cityb)
        ; Pradicates to state transport capabilities
        (can_go car home citya)
        (can_go plane citya cityb)
        ; Fluents
        (at_agent a home)
        (at_transport car home)
        (at_transport plane citya)
    )

    (:goal (and
        (at_agent a cityb))
    
    )


)