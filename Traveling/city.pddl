;Header and description

(define (domain city)

;remove requirements that are not needed
    (:requirements :strips)


    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (CITY ?c)
        (AGENT ?a)

        (move ?from ?to)
        (been ?c)
        (not_visited ?c)
        (at_agent ?a ?c)
        
    )


    (:action travel
        :parameters (?from ?to ?a)
        :precondition (and (CITY ?from) (CITY ?to) (AGENT ?a)
            (not_visited ?to) (been ?from) (move ?from ?to)
        )
        :effect (and 
            (at_agent ?a ?to) (been ?to) (not (been ?from)) (not (not_visited ?to))
        )
    )

;define actions here

)