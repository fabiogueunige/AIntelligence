;Header and description

(define (domain travelling)

;remove requirements that are not needed
    (:requirements 
        :strips )

    (:predicates 
        (CITY ?loc)
        (connected ?from ?to)
        (visited ?loc)
        (at_city ?loc)
    )

    (:action move
        :parameters (?from ?to)
        :precondition (and (CITY ?from) (CITY ?to) (connected ?from ?to) (at_city ?from))
        :effect (and (at_city ?to) (not (at_city ?from)) (visited ?to))
    )
    
)