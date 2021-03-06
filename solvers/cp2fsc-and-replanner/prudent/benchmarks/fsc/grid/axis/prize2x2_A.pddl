(define (problem prize2x2)
  (:domain grid-A)
  (:objects x1 x2 - xpos y1 y2 - ypos)
  (:init
    (suc-x x1 x2)
    (suc-y y1 y2)
    (top-row y2) (bottom-row y1) (leftmost-col x1) (rightmost-col x2)
    (agent-x x1) (agent-y y1)
    (oneof (prize x1 y1) (prize x2 y1)
           (prize x1 y2) (prize x2 y2)
    )
  )
  (:goal (got-it))
)

