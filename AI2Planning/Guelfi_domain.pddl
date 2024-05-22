;Header and description

(define (domain Guelfi_domain)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :typing :equality)

    (:types 
        ; Ingredient to cook coffee
        coffee - ingredient
        ; Type of coffee
        beans ground - coffee
        ; location in the kitchen
        hand - location
        ; machine to cook coffee
        burner grinder - machine
        ; tool for rhe preparation
        cup spoon cutter - tool
        ; Proporty of big groups of objects
        ingredient tool moka - movable
        water_tap ingredient location - openable
        ; moka components
        bottom_pot top_pot filter - moka   
    )

    (:predicates ;todo: define predicates here
        ; Location predicates
        (be ?l - location)
        (free ?h - hand)
        (at ?m - movable ?l - location)
        (at_machine ?m - machine ?l - location)
        (host_location ?l - location)

        ; Openable predicates
        (open ?o - openable)
        (close ?o - openable)

        ; Ingredient predicates
        (ing_ready ?i - ingredient)

        ; Machine predicates
        (filled ?m - machine)
        (machine_on ?m - machine)
        (machine_off ?m - machine)

        ; Moka and coffee predicates
        (ground_ready ?c - coffee)
        (separate_pot ?p1 - bottom_pot ?p2 - top_pot)
        (toghether ?p1 - bottom_pot ?p2 - top_pot)
        (free_coffee ?m - moka)
        (filter_on ?f - filter)
        (filter_off ?f - filter)
        (coffe_in_filter ?f - filter ?c - coffee)
        (finished ?c - coffee)
        
        ; Water tap predicates
        (tapTOwater ?w - water_tap ?i - ingredient)
        (wt_on ?w - water_tap)
        (at_wt ?w - water_tap ?l - location)
        (end_wash ?w - water_tap)
        
        ; Stovetop predicates
        (fire_on ?b - burner)
        (fire_ok ?b - burner)
        (fire_off ?b - burner)

        ; Tool predicates
        (cup_ready ?c - cup)
        (delivery_ok ?c - cup)
        (washed ?m - movable)
    )

    ;define actions to grab object here (ingredients, tools)

    (:action pick_up ; pick up an object
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

    (:action put_down ; put down an object
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

    (:action move ; move the robot to a location
        :parameters (?l1 - location ?l2 - location)
        :precondition (and (be ?l1))
        :effect (and (not (be ?l1)) 
        (be ?l2))
    )
    
    (:action open ; open a location
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

    (:action open_ingredients ; open an ingredient
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

    (:action close ; close a location
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

    (:action close_ingredients ; close an ingredient
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

    (:action pour_in ; pour an ingredient in a machine
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

    (:action grind_on ; turn on the grinder
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

    (:action grind ; grind the beans
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

    (:action grind_off ; turn off the grinder
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

    (:action unscrew_moka ; unscrew the moka
        :parameters (?p1 - bottom_pot ?p2 - top_pot ?h1 - hand ?h2 - hand)
        :precondition (and 
            (toghether ?p1 ?p2)
            (at ?p1 ?h1)
            (free ?h2)
            (free_coffee ?p1)
        )
        :effect (and 
            (not (free ?h2)) (not(toghether ?p1 ?p2))
            (at ?p2 ?h2)
            (separate_pot ?p1 ?p2)
        )
    )

    (:action screw_moka ; screw the moka
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

    (:action open_tap ; open the water tap
        :parameters (?p1 - bottom_pot ?p2 - top_pot ?h1 - hand ?h2 - hand ?w - water_tap ?l - location)
        :precondition (and 
            (free ?h2)
            (at ?p1 ?h1)
            (at_wt ?w ?l)
            (be ?l)
        )
        :effect (and 
            (open ?w)
            (not (open ?w))
        )
    )
    
    (:action refill_water ; refill the water in the moka
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

    (:action close_tap ; close the water tap
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

    (:action insert_filter ; insert the filter in the moka
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

    (:action remove_filter ; remove the filter from the moka
        :parameters (?p - bottom_pot ?p1 - top_pot ?f - filter ?h1 - hand ?h2 - hand ?cof - coffee)
        :precondition (and 
            (at ?p ?h1)
            (filter_on ?f)
            (separate_pot ?p ?p1)
            (finished ?cof)
        )
        :effect (and 
            (filter_off ?f)
            (not (filter_on ?f))
            (at ?f ?h2)
        )
    )

    (:action coffe_in_filter ; put the coffee in the filter with a spoon
        :parameters (?f - filter ?p - bottom_pot ?p1 - top_pot ?l - location ?h1 - hand ?h2 - hand ?c - coffee ?s - spoon)
        :precondition (and 
            (filter_on ?f)
            (at ?s ?h1)
            (be ?l)
            (at ?p ?l)
            (ing_ready ?c)
            (open ?c)
            (at ?c ?l)
            (separate_pot ?p ?p1)
        )
        :effect (and 
            (coffe_in_filter ?f ?c)
            (not (free_coffee ?p))
        )
    )

    (:action burner_on ; turn on the burner
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

    (:action set_fire ; set the fire on the burner as medium
        :parameters (?h - hand ?b - burner)
        :precondition (and 
            (fire_on ?b)
            (free ?h)
        )
        :effect (and 
            (fire_ok ?b)
        )
    )

    (:action burner_off_ready ; turn off the burner
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

    (:action pour_in_cup ; pour the coffee in the cup
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
            (free_coffee ?p)
        )
    )

    (:action bring_to_host ; bring the cup to the host
        :parameters (?c - cup ?h - hand ?l - location )
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

    (:action wait_to_finish ; wait for the host to finish the coffee
        :parameters (?c - cup ?cof - coffee ?l - location ?f - filter)
        :precondition (and 
            (delivery_ok ?c)
            (be ?l)
            (at ?c ?l)
            (host_location ?l)
            (coffe_in_filter ?f ?cof)
        )
        :effect (and 
            (finished ?cof)
        )
    )
    
    (:action wash ; wash the tools and the moka
        :parameters (?m - movable ?w - water_tap ?l - location ?h - hand ?cof - coffee ?p1 - bottom_pot ?p2 - top_pot)
        :precondition (and 
            (finished ?cof)
            (at_wt ?w ?l)
            (at ?m ?h)
            (be ?l)
            (separate_pot ?p1 ?p2)
        )
        :effect (and 
            (washed ?m)
        )
    )

    (:action wash_complete ; Check if everything has been washed
        :parameters (?c - cup ?s - spoon ?f - filter ?w - water_tap ?p1 - bottom_pot ?p2 - top_pot)
        :precondition (and 
            (close ?w)
            (separate_pot ?p1 ?p2)
            (washed ?c)
            (washed ?s)
            (washed ?f)
            (washed ?p1)
            (washed ?p2)

        )
        :effect (and 
            (end_wash ?w)
        )
    )
    ; End of the actions of the domain
)