(define (problem plant-party) (:domain plant)
(:objects 
    vase1 vase2 vase3 vase4
    flower1 flower2 flower3 flower4
    store
    spotA spotB spotC spotD
)

(:init
    (VASE vase1)(VASE vase2)(VASE vase3)(VASE vase4)
    (FLOWER flower1)(FLOWER flower2)(FLOWER flower3)(FLOWER flower4)
    (LOCATION store)
    (LOCATION spotA)(LOCATION spotB)(LOCATION spotC)(LOCATION spotD)

    (in vase1 store)(in vase2 store)(in vase3 store)(in vase4 store)
    (in flower1 store)(in flower2 store)(in flower3 store)(in flower4 store)
    
    (at_robby store)

    (empty vase1)(empty vase2)(empty vase3)(empty vase4)
    (empty spotA)(empty spotB)(empty spotC)(empty spotD)
    
    (near store spotA)(near store spotB)
    (near spotA store)(near spotB store)

    (far spotA spotC)(far spotB spotD)
    (far spotC spotA)(far spotD spotB)
)

(:goal 
    (and
        (full spotA)
        (full spotB)
        (full spotC)
        (full spotD)   
    )
)

)
