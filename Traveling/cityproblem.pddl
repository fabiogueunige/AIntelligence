(define (problem cityproblem) (:domain city)
    (:objects 
        genova savona torino milano verona bologna
        fabietto
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (CITY genova) (CITY savona) (CITY torino) (CITY milano) (CITY verona) (CITY bologna)
        (AGENT fabietto)

        (move genova savona) (move savona torino) 
        (move torino milano) (move milano verona) 
        (move verona bologna) 
        (move bologna genova)  
        (move torino genova)
        (move milano torino)
        (move verona milano)
        (move bologna verona)

        (not_visited genova)

        (not_visited savona) (not_visited torino) (not_visited milano) (not_visited verona) (not_visited bologna)
        
        (been genova)
    )

    (:goal (and
        ;todo: put the goal condition here
            (at_agent fabietto savona)
            (at_agent fabietto torino)
            (at_agent fabietto milano)
            (at_agent fabietto verona)
            (at_agent fabietto bologna)
            (at_agent fabietto genova)
        )
    
    )

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
