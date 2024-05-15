;Header and description

(define (domain Guelfi_domain)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        water sugar milk cofee - ingredient
        beans ground - coffee
        ; attento che prendi i contenitori
        drawer closet fridge hand - locations
        water_tap grinder - machine
        spoon cutter - tools
        left right - hand
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (empty ?h - hand)
        (at ?i - ingredient ?l - location)
    )


    (:functions ;todo: define numeric functions here
    )

    ;define actions here
    (:action pick_ingredient
        :parameters (?i - ingredient ?l - location ?h - hand)
        :precondition (and 
            (at ?i ?l)
            (empty ?h)
        )
        :effect (and 
            (not (at ?i ?l)) (not(empty ?h))
            (at ?i ?h)
        )
    )

    (:action pick_tool
        :parameters ()
    )
    

)