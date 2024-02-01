;Header and description

(define (domain plant)

;remove requirements that are not needed
(:requirements 
    :strips) 

(:predicates 
    (VASE ?x) (FLOWER ?f)(LOCATION ?loc)
    (in ?x ?loc) (near ?loc1 ?loc2) (far ?loc1 ?loc2)(at_robby ?loc)
    (vaso_full ?v)(empty ?v)(full ?loc)
)


(:action fill_vase
    :parameters (?v ?f ?loc)
    :precondition (and (VASE ?v)(FLOWER ?f)(LOCATION ?loc)
                    (at_robby ?loc) (in ?f ?loc)(in ?v ?loc)(empty ?v))
    :effect (and (vaso_full ?v)(not(empty ?v))(not(in ?f ?loc)))
)

(:action move_near
    :parameters (?from ?to)
    :precondition (and (LOCATION ?from)(LOCATION ?to)(near ?from ?to)(at_robby ?from))
    :effect (and (at_robby ?to)(not(at_robby ?from)))
)
(:action move_far
    :parameters (?from ?to)
    :precondition (and (LOCATION ?from)(LOCATION ?to)(far ?from ?to)(at_robby ?from))
    :effect (and (at_robby ?to)(not(at_robby ?from)))
)

(:action plant_plant
    :parameters (?v ?loc)
    :precondition (and (VASE ?v)(LOCATION ?loc)(at_robby ?loc)(vaso_full ?v)(empty ?loc))
    :effect (and (full ?loc)(not (vaso_full ?v)))
)



)