(define (problem Guelfi_problem) (:domain Guelfi_domain)
    (:objects 
        water sugar milk - ingredient
        ground - ground
        beans - beans
        host_pos stovetop drawer closet fridge sink table crafttable - location ; drawer = cassetto
        left right - hand
        wt - water_tap
        gr - grinder
        burner - burner
        btt_pot - bottom_pot
        top_pot - top_pot
        filter - filter
        spoon - spoon 
        cutter - cutter 
        cup - cup
    )

    (:init
        (be table)
        ;todo: put the initial state's facts and numeric values here
        (ground_ready ground)
        (at_machine gr crafttable)
        (at btt_pot closet)
        (at top_pot closet)
        (at filter closet)
        (tapTOwater wt water)
        (toghether btt_pot top_pot)
        (open sink) (open table)
        
        (open crafttable)
        (free left) (free right)
        (at sugar closet) (at milk fridge)
        (at beans closet) (at ground closet)
        (at spoon drawer) (at cutter drawer)

        (at_wt wt sink)
        (open stovetop) 
        (at_machine burner stovetop)
        (at cup closet)
        (open host_pos)
        (host_location host_pos)
    )

    (:goal (and
        ;todo: put the goal condition here
        (ing_ready beans)
        (machine_off gr)
        (ing_ready water)
        (delivery_ok cup)
    ))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)