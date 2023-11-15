(define (problem <problem name>)
    (:domain <domain name>)
    
    ;; objects
    (:objects 
        room_a room_b                   ; two rooms
        ball_1 ball_2 ball_3 ball_4     ; four balls
        left right                      ; two grippers
        
    )
    
    ;; initial state
    (:init 
    ; Literals that define "types" (they do not change)
    (ROOM room_a) (ROOM room_b)
    (BALL ball_1) (BALL ball_2) (BALL ball_3) (BALL ball_4)
    (GRIPPER)
    
    
    )
    
    
)