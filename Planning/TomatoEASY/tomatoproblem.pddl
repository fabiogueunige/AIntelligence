(define (problem tomatoproblem) (:domain tomato)
(:objects 
    tomato1 tomato2 tomato3 tomato4
    loc1 loc2 loc3 loc4 table
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (TOMATO tomato1) (TOMATO tomato2) (TOMATO tomato3) (TOMATO tomato4)
    (LOCATION loc1) (LOCATION loc2) (LOCATION loc3) (LOCATION loc4)

    (empty loc1) (empty loc2) (empty loc3) (empty loc4)
    (on_table tomato1) (on_table tomato2) (on_table tomato3) (on_table tomato4)
    ; (at_location tomato1 table) (at_location tomato2 table) 
    ; (at_location tomato3 table) (at_location tomato4 table)
)

(:goal (and
    ;todo: put the goal condition here
    (at_location tomato1 loc1) (at_location tomato2 loc2) 
    (at_location tomato3 loc3) (at_location tomato4 loc4)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
