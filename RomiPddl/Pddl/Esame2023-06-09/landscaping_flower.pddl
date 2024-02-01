(define (problem four_flower) 
    (:domain flower)
    (:objects 
        flower1 flower2 flower3 flower4
        spotA spotB spotC spotD
        store
        vase1 vase2 vase3 vase4
    )

    (:init
        (FLOWER flower1)(FLOWER flower2)(FLOWER flower3)(FLOWER flower4)
        (LOCATION spotA)(LOCATION spotB)(LOCATION spotC)(LOCATION spotD)
        (LOCATION store)
        (VASE vase1)(VASE vase2)(VASE vase3)(VASE vase4)
        
        (at_object flower1 store)(at_object flower2 store)
        (at_object flower3 store)(at_object flower4 store)

        (at_object vase1 store)(at_object vase2 store)

        (empty spotA)(empty spotB)(empty spotC)(empty spotD)
       
        (can_go spotA spotC)(can_go spotC spotA)
        (can_go spotB spotD)(can_go spotB spotD)
        (can_go store spotA)(can_go spotA store)
        (can_go store spotB)(can_go spotB store)
    )

    (:goal 
        (and
            (in_vase spotA)
        )

    )

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
