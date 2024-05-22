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
        burner grinder - machine
        cup spoon cutter - tool
        ingredient tool moka - movable
        water_tap ingredient location - openable
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
        (close ?o - openable)
        (ground_ready ?c - coffee)
        (filled ?m - machine)
        (machine_on ?m - machine)
        (machine_off ?m - machine)
        (ing_ready ?i - ingredient)
        (separate_pot ?p1 - bottom_pot ?p2 - top_pot)
        (toghether ?p1 - bottom_pot ?p2 - top_pot)
        
        ; Step 3 & 4 predicates
        (tapTOwater ?w - water_tap ?i - ingredient)
        (wt_on ?w - water_tap)
        (at_wt ?w - water_tap ?l - location)
        (filter_on ?f - filter)
        (coffe_in_filter ?f - filter ?c - coffee)

        ; Step 5 predicates
        (fire_on ?b - burner)
        (fire_ok ?b - burner)
        (fire_off ?b - burner)
        ; close ingredients ecc come condizione vera per tutto per
        ; terminare la ricetta
        ; Step 6
        (cup_ready ?c - cup)
        (delivery_ok ?c - cup)
        (host_location ?l - location)

        ; My added actions
        (init_pos ?m - movable ?l - location)
        (washed ?m - movable)
        (wash_pos ?m - movable ?l - location)
        (ok_pos ?m - movable)
        (end_coffee ?c - coffee)
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
            (not (ok_pos ?m))
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
            (not (close ?l))
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
            (not (close ?i))
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
            (close ?l)
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
            (close ?i)
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
            (not (at ?i ?h))
            (at ?i ?l)
            (free ?h)
        )
    )

    (:action grind_on
        :parameters (?l - location ?g - grinder ?h - hand)
        :precondition (and 
            (at_machine ?g ?l)
            (filled ?g)
            (be ?l)
            (free ?h)
        )
        :effect (and 
            (machine_on ?g)
        )
    )

    (:action grind 
        :parameters (?b - beans ?g - grinder ?l - location)
        :precondition (and 
            (open ?b)
            (filled ?g)
            (machine_on ?g)
            (at_machine ?g ?l)
            (at ?b ?l)
        )
        :effect (and 
            (ground_ready ?b)
            (ing_ready ?b)
        )
    )

    (:action grind_off 
        :parameters (?b - beans ?g - grinder ?h - hand)
        :precondition (and 
            (ing_ready ?b)
            (free ?h)
            (machine_on ?g)
        )
        :effect (and 
            (not (machine_on ?g))
            (machine_off ?g)
        )
    )
    ; if problems with water tap keep being there thn change machine on and off
    ; with grind on and grind off

    ; Start of step 3 actions (screw and unscrew) and fill the water
    (:action unscrew_moka
        :parameters (?p1 - bottom_pot ?p2 - top_pot ?h1 - hand ?h2 - hand)
        :precondition (and 
            (toghether ?p1 ?p2)
            (at ?p1 ?h1)
            (free ?h2)
        )
        :effect (and 
            (not (free ?h2)) (not(toghether ?p1 ?p2))
            (at ?p2 ?h2)
            (separate_pot ?p1 ?p2)
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
        :parameters (?p1 - bottom_pot ?p2 - top_pot ?h1 - hand ?h2 - hand ?w - water_tap ?l - location)
        :precondition (and 
            (free ?h2)
            (at ?p1 ?h1)
            (at_wt ?w ?l)
            (be ?l)
        )
        :effect (and 
            (open ?w)
        )
    )
    
    (:action refill_water
        :parameters (?p - bottom_pot ?p2 - top_pot ?h - hand ?w - water_tap)
        :precondition (and 
            (at ?p ?h)
            (open ?w)
            (separate_pot ?p ?p2)
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
            (tapTOwater ?w ?i)
        )
        :effect (and 
            (ing_ready ?i)
            (not (open ?w))
            (close ?w)
        )
    )
    
    ; Start of step 4 add coffee to basket and level it, add filter to bottom pwrt
    (:action insert_filter
        :parameters (?p - bottom_pot ?p1 - top_pot ?f - filter ?h1 - hand ?h2 - hand ?w - water_tap)
        :precondition (and 
            (at ?p ?h1)
            (at ?f ?h2)
            (close ?w)
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
            (be ?l)
            (at ?p ?l)
            (ing_ready ?c)
            (at ?c ?l)
            (separate_pot ?p ?p1)
        )
        :effect (and 
            (coffe_in_filter ?f ?c)
        )
    )

    ; Step number 5. Everything has to be optimized
    (:action burner_on
        :parameters (?b - burner ?l - location ?h - hand ?p - bottom_pot ?p1 - top_pot ?f - filter ?c - coffee)
        :precondition (and 
            (coffe_in_filter ?f ?c)
            (toghether ?p ?p1)
            (at ?p ?l)
            (at_machine ?b ?l)
            (be ?l)
            (free ?h)
        )
        :effect (and 
            (fire_on ?b)
        )
    )

    (:action set_fire
        :parameters (?h - hand ?b - burner)
        :precondition (and 
            (fire_on ?b)
            (free ?h)
        )
        :effect (and 
            (fire_ok ?b)
        )
    )

    (:action burner_off_ready
        :parameters (?h - hand ?b - burner)
        :precondition (and 
            (fire_ok ?b)
            (free ?h)
        )
        :effect (and 
            (fire_off ?b)
            (not (fire_on ?b))
            (not (fire_ok ?b))
        )
    )

    (:action pour_in_cup
        :parameters (?p - bottom_pot ?p1 - top_pot ?l - location ?h1 - hand ?h2 - hand ?c - cup ?b - burner)
        :precondition (and 
            (fire_off ?b)
            (toghether ?p ?p1)
            (at ?p ?h1)
            (at ?c ?h2)
            (be ?l)
        )
        :effect (and 
            (cup_ready ?c)
        )
    )

    (:action bring_to_host
        :parameters (?c - cup ?h - hand ?l - location)
        :precondition (and 
            (be ?l)
            (at ?c ?h)
            (host_location ?l)
            (cup_ready ?c)
        )
        :effect (and 
            (delivery_ok ?c)
        )
    ) 
    ; Now:
    ; - improve the plan and the actions performing the steps
    ; - add possibility to add igredients to the coffee 
    ; - wash the moka and put everything back in place
    ; - close all the locations opened
    (:action put_back
        :parameters (?m - movable ?l - location ?h - hand ?c - cup)
        :precondition (and 
            (init_pos ?m ?l)
            (be ?l)
            (at ?m ?h)
            (delivery_ok ?c)
        )
        :effect (and 
            (not (at ?m ?h))
            (free ?h)
            (at ?m ?l)
            (ok_pos ?m)
        )
    )

    (:action wash
        :parameters (?m - movable ?l - location ?h - hand ?w - water_tap ?c - cup)
        :precondition (and 
            (at ?m ?h)
            (be ?l)
            (wash_pos ?m ?l)
            (open ?w)
            (free ?h)
            (delivery_ok ?c)
        )
        :effect (and 
            (washed ?m)
        )
    )

    (:action end_wash
        :parameters (?w - water_tap ?m - movable ?c - coffee)
        :precondition (and 
            (washed ?m)
            (close ?w)
        )
        :effect (and 
            (end_coffee ?c)
        )
    )
    
)