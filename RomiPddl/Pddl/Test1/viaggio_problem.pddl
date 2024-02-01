(define (problem viaggio_problem) 
    (:domain viaggio)
(:objects 
    agent car plane home aiport_a airport_b
)

(:init
    (AGENT agent)(VEHICLE car)(VEHICLE plane)
    (PLACE home)(PLACE aiport_a)(PLACE airport_b)
    (at_agent home)
)

(:goal (and
    (at_agent car))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

)
