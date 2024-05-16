(define (problem Guelfi_problem) (:domain Guelfi_domain)
    (:objects 
        water sugar milk - ingredient
        ground - ground
        beans - beans
        drawer closet fridge sink table - location ; drawer = cassetto
        left right - hand
        water_tap - machine
        gr - grinder
        spoon cutter - tool
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (ground_ready ground)
        (open sink) (open table)
        (free left) (free right)
        (at sugar closet) (at milk fridge)
        (at beans closet) (at ground closet)
        (at spoon drawer) (at cutter drawer)

    )

    (:goal (and
        ;todo: put the goal condition here
        (ground_ready beans)
    ))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
