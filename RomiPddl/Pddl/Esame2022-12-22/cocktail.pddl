(define (domain domain_name)
    (:requirements 
        :strips     
    )

    (:predicates 
        (GLASS ?x)(CLIENT ?c) (DISPENSER ?d)

        (empty ?x) (serve ?c) (full ?x)
        (take_glass ?g) (take_dispenser ?d)
        (in ?g ?c)
    )

    (:action fetch-glasses
        :parameters (?x ?d)
        :precondition (and (GLASS ?x)(DISPENSER ?d))
        :effect (and (take_dispenser ?d)(take_glass ?x))
    )
    (:action fill-glass
        :parameters (?d ?x ?c)
        :precondition (and(GLASS ?x)(DISPENSER ?d)(CLIENT ?c)
                        (take_dispenser ?d)(take_glass ?x)(empty ?x)(in ?x ?c))
        :effect (and (full ?x)(not(empty ?x)))
    )
    (:action serve
        :parameters (?c ?d ?x)
        :precondition (and (CLIENT ?c)(full ?x)
                        (take_dispenser ?d)(take_glass ?x))
        :effect (and (serve ?c)(not (take_glass ?x))(not(full ?x)))
    )
    
    


)