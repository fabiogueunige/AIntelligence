(define (problem Guelfi_problem) (:domain Guelfi_domain)
    (:objects 
        ; Type definition 
        water sugar milk - ingredient
        ; coffe tyoe definition
        ground - ground
        beans - beans
        ; location definition
        host_pos stovetop drawer closet fridge sink table crafttable - location 
        ; two gripper
        left right - hand
        ; machine definition
        wt - water_tap
        gr - grinder
        burner - burner
        ; moka component
        btt_pot - bottom_pot
        top_pot - top_pot
        filter - filter
        ; utensil definition
        spoon - spoon 
        cutter - cutter 
        cup - cup
    )

    (:init
        ;todo: put the initial state's facts and numeric values here

        ; starting location definition
        ; Agent and host initial location
        (be host_pos)
        (host_location host_pos)
        ; moka components initial location
        (at btt_pot closet) (at top_pot closet) (at filter closet)
        ; machine initial location
        (at_machine gr crafttable) (at_wt wt sink)
        (at_machine burner stovetop)
        ; ingredient initial location
        (at sugar closet) (at milk fridge)
        (at beans closet) (at ground closet)
        ; utensil initial location
        (at spoon drawer) (at cutter drawer) (at cup closet)

        ; Setup of the locations
        (open crafttable) (close fridge)
        (close closet) (close drawer)
        (open sink) (open table)
        (open stovetop) (open host_pos)
        
        ; hand status
        (free left) (free right)

        ; coffee  and moka status
        (free_coffee btt_pot)
        (ground_ready ground)
        (toghether btt_pot top_pot)

        ; water tap status
        (tapTOwater wt water)
    )

    (:goal (and
        ;todo: put the goal condition here
        ; coffee prepeared with beans
        (ing_ready beans)
        (machine_off gr)
        ; Always close all the location to avoid risk
        (close closet) (close drawer)
        ; close water tap to avoid waste
        (close wt)
        ; End of cleaning stuff
        (end_wash wt)
        ; Put tools back (if not washed)
        (at cutter drawer)
    ))
;un-comment the following line if metric is needed
;(:metric minimize (???))
)