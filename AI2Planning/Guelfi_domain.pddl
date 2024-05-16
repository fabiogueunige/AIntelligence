;Header and description

(define (domain Guelfi_domain)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :typing :equality)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        coffee - ingredient
        beans ground - coffee
        ; for ground put true precondition ground
        hand - location
        ; put sink and table as open as true
        grinder - machine
        tool
        ingredient tool - movable
        ingredient location - openable
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (free ?h - hand)
        (at ?m - movable ?l - location)
        (different ?h1 - hand ?h2 - hand)
        ; (open ; to open all closets, ingredients ecc
        (open ?o - openable)
        (ground_ready ?c - coffee)
        (filled ?m - machine)
    )


    ;(:functions ;todo: define numeric functions here
    ;)

    ;define actions to grab object here (ingredients, tools)
    (:action pick_up
        :parameters (?m - movable ?l - location ?h - hand)
        :precondition (and 
            (at ?m ?l)
            (free ?h)
            (open ?l)
        )
        :effect (and 
            (not (at ?m ?l)) (not(free ?h))
            (at ?m ?h)
        )
    )

    (:action put_down
        :parameters (?m - movable ?l - location ?h - hand)
        :precondition (and 
            (at ?m ?h)
            (open ?l)
        )
        :effect (and 
            (not (at ?m ?h)) 
            (free ?h)
            (at ?m ?l)
        )
    )

    (:action open
        :parameters (?l - location ?h - hand)
        :precondition (and 
            (free ?h)
        )
        :effect (and 
            (open ?l)
        )
    )

    (:action open_ingredients
        :parameters (?i - ingredient ?h1 - hand ?h2 - hand)
        :precondition (and 
            (free ?h1)
            (at ?i ?h2)
        )
        :effect (and 
            (open ?i)
        )
    )

    (:action close
        :parameters (?l - location ?h - hand)
        :precondition (and 
            (open ?l)
            (free ?h)
        )
        :effect (and 
            (not (open ?l))
        )
    )

    (:action close_ingredients
        :parameters (?i - ingredient ?h1 - hand ?h2 - hand)
        :precondition (and 
            (open ?i)
            (free ?h1)
            (at ?i ?h2)
        )
        :effect (and 
            (not (open ?i))
        )
    )

    ; Start of step 2 actions

    (:action pour_in 
        :parameters (?i - ingredient ?m - machine ?h - hand)
        :precondition (and 
            (at ?i ?h)
            (open ?i)
        )
        :effect (and 
            (filled ?m)
        )
    )

    (:action grind 
        :parameters (?b - beans ?g - grinder)
        :precondition (and 
            (open ?b)
            (filled ?g)
        )
        :effect (and 
            (ground_ready ?b)
        )
    )

    ; Start of step 3 actions

    

    
    

    

)