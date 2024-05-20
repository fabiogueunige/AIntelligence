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
        water_tap
        spoon cutter - tool
        ingredient tool moka - movable
        ingredient location - openable
        bottom_pot top_pot filter - moka
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (be ?l - location)
        (free ?h - hand)
        (at ?m - movable ?l - location)
        (at_machine ?m - machine ?l - location)
        (different ?h1 - hand ?h2 - hand)
        (open ?o - openable)
        (ground_ready ?c - coffee)
        (filled ?m - machine)
        (machine_on ?m)
        (machine_off ?m)
        (ing_ready ?i - ingredient)
        (separate_pot ?p1 - bottom_pot ?p2 - top_pot)
        (toghether ?p1 - bottom_pot ?p2 - top_pot)
        (filter_on ?f - filter)
        (coffe_in_filter ?f - filter ?c - coffee)
        
        ; close ingredients ecc come condizione vera per tutto per
        ; terminare la ricetta
        ; water tap preconditions
        (tapTOwater ?w - water_tap ?i - ingredient)
        (wt_on ?w - water_tap)	
        (at_water ?w - water_tap ?l - location)
        (open_tp ?w - water_tap)
        (readyTOwt ?w - water_tap)
    )


    ;(:functions ;todo: define numeric functions here
    ;)

    ;define actions to grab object here (ingredients, tools)
    (:action pick_up
        :parameters (?m - movable ?l - location ?h - hand)
        :precondition (and 
            (at ?m ?l)
            (be ?l)
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
            (be ?l)
        )
        :effect (and 
            (not (at ?m ?h)) 
            (free ?h)
            (at ?m ?l)
        )
    )

    (:action move
        :parameters (?l1 - location ?l2 - location)
        :precondition (and (be ?l1))
        :effect (and (not (be ?l1)) 
        (be ?l2))
    )
    

    (:action open
        :parameters (?l - location ?h - hand)
        :precondition (and 
            (free ?h)
            (be ?l)
        )
        :effect (and 
            (open ?l)
        )
    )

    (:action open_ingredients
        :parameters (?i - ingredient ?h1 - hand ?h2 - hand ?c - cutter)
        :precondition (and 
            (at ?c ?h1)
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
            (be ?l)
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
        :parameters (?i - ingredient ?m - machine ?h - hand ?l - location)
        :precondition (and 
            (at ?i ?h)
            (open ?i)
            (at_machine ?m ?l)
            (be ?l)
        )
        :effect (and 
            (filled ?m)
            (at ?i ?l)
            (free ?h)
        )
    )

    (:action machine_on
        :parameters (?l - location ?m - machine ?h - hand)
        :precondition (and 
            (at_machine ?m ?l)
            (filled ?m)
            (be ?l)
            (free ?h)
        )
        :effect (and 
            (machine_on ?m)
        )
    )

    (:action grind 
        :parameters (?b - beans ?g - grinder ?w - water_tap)
        :precondition (and 
            (open ?b)
            (filled ?g)
            (machine_on ?g)
        )
        :effect (and 
            (ground_ready ?b)
            (ing_ready ?b)
        )
    )

    (:action machine_off 
        :parameters (?i - ingredient ?m - machine ?h - hand)
        :precondition (and 
            (ing_ready ?i)
            (free ?h)
        )
        :effect (and 
            (not (machine_on ?m))
            (machine_off ?m)
            ; completa precondition
        )
    )
    ; if problems with water tap keep being there thn change machine on and off
    ; with grind on and grind off

    ; Start of step 3 actions (screw and unscrew) and fill the water
    (:action unscrew_moka
        :parameters (?p1 - bottom_pot ?p2 - top_pot ?h1 - hand ?h2 - hand ?w - water_tap)
        :precondition (and 
            (toghether ?p1 ?p2)
            (at ?p1 ?h1)
            (different ?h1 ?h2)
            (free ?h2)
        )
        :effect (and 
            (not (free ?h2)) (not(toghether ?p1 ?p2))
            (at ?p2 ?h2)
            (at ?p1 ?h1)
            (separate_pot ?p1 ?p2)
            (readyTOwt ?w)
        )
    )

    (:action screw_moka
        :parameters (?p1 - bottom_pot ?p2 - top_pot ?h1 - hand ?h2 - hand)
        :precondition (and 
            (separate_pot ?p1 ?p2)
            (at ?p1 ?h1)
            (at ?p2 ?h2)
        )
        :effect (and 
            (not (separate_pot ?p1 ?p2))
            (not (at ?p2 ?h2))
            (toghether ?p1 ?p2)
            (free ?h2)
        )
    )

    (:action open_tap
        :parameters (?w - water_tap ?h - hand ?l - location)
        :precondition (and 
            (free ?h)
            (at_water ?w ?l)
            (be ?l)
            (readyTOwt ?w)
        )
        :effect (and 
            (open_tp ?w)
            (not (readyTOwt ?w))
        )
    )
    
    (:action refill_water
        :parameters (?p1 - bottom_pot ?p2 - top_pot ?h - hand ?w - water_tap)
        :precondition (and 
            (at ?p1 ?h)
            (separate_pot ?p1 ?p2)
            (open_tp ?w)
        )
        :effect (and 
            (wt_on ?w)
        )
    )

    (:action close_tap
        :parameters (?w - water_tap ?h - hand ?i - ingredient)
        :precondition (and 
            (free ?h)
            (wt_on ?w)
            (open_tp ?w)
            (tapTOwater ?w ?i)
        )
        :effect (and 
            (ing_ready ?i)
            (not (wt_on ?w))
            (not (open_tp ?w))
        )
    )
    
    ; Start of step 4 add coffee to basket and level it, add filter to bottom pwrt
    (:action insert_filter
        :parameters (?p - bottom_pot ?p1 - top_pot ?f - filter ?h1 - hand ?h2 - hand ?i - ingredient ?w - water_tap)
        :precondition (and 
            (at ?p ?h1)
            (at ?f ?h2)
            (tapTOwater ?w ?i)
            (ing_ready ?i)
            (separate_pot ?p ?p1)
        )
        :effect (and 
            (filter_on ?f)
            (not (at ?f ?h2))
            (free ?h2)
        )
    )

    (:action coffe_in_filter
        :parameters (?f - filter ?p - bottom_pot ?p1 - top_pot ?l - location ?h1 - hand ?h2 - hand ?c - coffee ?s - spoon)
        :precondition (and 
            (filter_on ?f)
            (at ?s ?h1)
            (at ?p ?l)
            (ing_ready ?c)
            (at ?c ?h2)
            (be ?l)
            (separate_pot ?p ?p1)
        )
        :effect (and 
            (coffe_in_filter ?f ?c)
            (not (at ?c ?h2))
            (free ?h2)
        )
    )
    ; 3 e 4 non funzionanp piu. Water tap ha fatto saltare tutto
    ; Ogni volta apre il frigo e quella minchia di latte
)