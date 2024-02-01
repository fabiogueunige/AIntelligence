(define (problem traveling_party) (:domain travelling )
    (:objects 
        genova savona torino milano verona bologna
    )

    (:init
        (CITY savona)(CITY torino)(CITY milano)(CITY verona)(CITY bologna)(CITY genova)
        (connected genova savona)
        (connected savona torino)
        (connected torino milano)
        (connected milano verona)
        (connected verona bologna)
        (connected bologna genova)
        (connected genova torino)
        (connected genova milano)
        (at_city genova)

    )

    (:goal 
        (and
            (visited savona)
            (visited torino)
            (visited milano)
            (visited verona)
            (visited bologna)
            (visited genova)
        )
    
    )
)
