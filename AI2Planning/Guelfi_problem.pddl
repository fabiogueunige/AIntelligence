(define (problem Guelfi_problem) (:domain Guelfi_domain)
    (:objects 
        water sugar milk - ingredient
        ground - ground
        beans - beans
        drawer closet fridge sink table crafttable - location ; drawer = cassetto
        left right - hand
        wt - water_tap
        gr - grinder
        btt_pot - bottom_pot
        top_pot - top_pot
        spoon cutter - tool
    )

    (:init
        (be table)
        ;todo: put the initial state's facts and numeric values here
        (ground_ready ground)
        (at_machine gr crafttable)
        (at btt_pot closet)
        (at top_pot closet)
        (at_machine wt sink)
        (tapTOwater wt water)
        (filled wt)
        (toghether btt_pot top_pot)
        (open sink) (open table)
        (open crafttable)
        (free left) (free right)
        (at sugar closet) (at milk fridge)
        (at beans closet) (at ground closet)
        (at spoon drawer) (at cutter drawer)

    )

    (:goal (and
        ;todo: put the goal condition here
        (ground_ready beans)
        (machine_off gr)
        (ing_ready water)
    ))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
