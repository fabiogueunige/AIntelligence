(define (problem cocktail-four) 
    (:domain domain_name)
    (:objects 
        cocktail1 cocktail2 cocktail3 cocktail4 
        glass1 glass2 glass3 glass4
        dispenser
    )

    (:init
        (GLASS glass1)(GLASS glass2)(GLASS glass3)(GLASS glass4)
        (CLIENT cocktail1)(CLIENT cocktail2)(CLIENT cocktail3)(CLIENT cocktail4)
        (DISPENSER dispenser)

        (empty glass1)(empty glass2)(empty glass3)(empty glass4)
        (in glass1 cocktail1)(in glass2 cocktail2)(in glass3 cocktail3)(in glass4 cocktail4)
    )

    (:goal 
        (and
            (serve cocktail1)
            (serve cocktail2)
            (serve cocktail3)
            (serve cocktail4)
        )
    )

)
