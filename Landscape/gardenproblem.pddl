(define (problem gardenproblem) 
    (:domain garden)
(:objects 
    vase1 vase2 vase3 vase4
    spotA spotB spotC spotD 
    store
    flower1 flower2 flower3 flower4
)

(:init
    (VASE vase1)(VASE vase2)(VASE vase3)(VASE vase4)
    (FLOWER flower1)(FLOWER flower2)(FLOWER flower3)(FLOWER flower4)
    (SPOT spotA)(SPOT spotB)(SPOT spotC)(SPOT spotD)
    (SPOt store)
)

(:goal (and
    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
