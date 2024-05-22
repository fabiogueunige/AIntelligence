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
        
        (ok_pos sugar) (ok_pos milk) (ok_pos beans) (ok_pos ground) 
        (ok_pos spoon) (ok_pos cutter) (ok_pos cup) 
        (ok_pos top_pot) (ok_pos btt_pot) (ok_pos filter)
        (init_pos sugar closet) (init_pos milk fridge) 
        (init_pos beans closet) (init_pos ground closet)
        (init_pos spoon drawer) (init_pos cutter drawer)
        (init_pos cup closet)
        (init_pos top_pot closet) (init_pos btt_pot closet) (init_pos filter closet)

        (at_wt wt sink)
        (open stovetop) 
        (at_machine burner stovetop)
        (at cup closet)
        (open host_pos)
        (close fridge) (close sugar) (close milk)
        (host_location host_pos)
        (wash_pos cup sink) (wash_pos spoon sink) 
        (wash_pos filter sink) (wash_pos top_pot sink) (wash_pos btt_pot sink)
    )

    (:goal (and
        ;todo: put the goal condition here
        (ing_ready beans) (machine_off gr)
        (ing_ready water)
        (delivery_ok cup)
        ;(washed cup) (washed spoon) (washed filter) (washed top_pot) (washed btt_pot)
        ;(end_coffee beans)
        (ok_pos sugar) (ok_pos milk)
        (ok_pos beans) (ok_pos ground )
        (ok_pos spoon ) (ok_pos cutter )
        (ok_pos cup)
        (ok_pos top_pot ) (ok_pos btt_pot) (ok_pos filter )
        (close closet) (close drawer) (close fridge) (close sugar) (close milk)
    ))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)