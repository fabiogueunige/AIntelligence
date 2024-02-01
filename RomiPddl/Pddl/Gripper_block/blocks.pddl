(define (domain blocks) ; domain name must match problem's name
    ; we require STRIPS: classical planning with no negative preconditions
    (:requirements
        :strips                 ; basic preconditions and effects             
        :equality               ; to use = in prediction 
        :negative-preconditions ; to use not in preconditions
    )
    
    (:predicates
        ; block b1 is on top of b2
        (on ?b1 ?b2)
        ; block b is on the table
        (on_table ?b)
        ; block b is free
        (free ?b)
        ; the gripper is holding ball ?b
        (holding ?b)
        ; gripper ?g is empty
        (empty )
    )

    (:action stack
        ; stack one block on top of another
        :parameters (?b1 ?b2)
        :precondition ( and (holding ?b1) (free ?b2) )
        :effect ( and ( not (holding ?b1) ) (not (free ?b2)) (on ?b1 ?b2) )
    )
    
    
    (:action unstack
        ; unstack one block on top of another
        :parameters (?b1 ?b2)
        :precondition ( and (empty ) (on ?b1 ?b2) (free ?b1) )
        :effect ( and ( not (empty ) ) (not (on ?b1 ?b2) ) (holding ?b1) (free ?b2) )
    )
    

    (:action putdown 
        ; Put down a block on the table
        :parameters(?b)
        :precondition ( and (holding ?b) )
        :effect(and (not (holding ?b)) (on_table ?b) (empty) )
    
    )
    
    (:action pickup 
        ; Pick up a block from the table
        :parameters(?b)
        :precondition ( and (empty ) (free ?b) )
        :effect(and (holding ?b) (not (empty)) (not (on_table ?b)) )
    
    )
    
    
)