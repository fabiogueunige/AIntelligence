(define (problem blocks_five)
        (:domain blocks)
        
        ; objects
        (:objects 
            block_a block_b block_c block_d block_e
            
        )
        
        ; initial state
        (:init 
            (on_table block_a)
            (on block_c block_a)
            (on_table block_b)
            (free block_b)
            (holding block_d)
            (free block_d) ; a block held by the manipulator is still "free"
            (free block_c)
            (on_table block_e)
            (free block_e)
        )
        
        ; goal state
        (:goal
            (and
                (on_table block_c)
                (on block_b block_c)
                (on block_a block_b)
                (free block_a)
                (empty)
                (on_table block_d)
                (on_table block_e)
            )
        )
)