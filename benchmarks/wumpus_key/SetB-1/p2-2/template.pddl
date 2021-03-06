(define (problem wumpus_paper)
  (:domain full-wumpus)
  (:objects p_1_1 p_1_2 p_1_3 p_1_4 p_1_5 p_2_1 p_2_2 p_2_3 p_2_4 p_2_5 p_3_1 p_3_2 p_3_3 p_3_4 p_3_5 p_4_1 p_4_2 p_4_3 p_4_4 p_4_5 p_5_1 p_5_2 p_5_3 p_5_4 p_5_5 - pos
            k_1 k_2 k_3 k_4 k_5 - key
  )
   (:init


    ;;; HYPS <hyp>

 
    ;; Known
    (at p_1_1)
    (alive)

    (opens k_1 p_1_5)
    (opens k_2 p_4_5)
    (opens k_3 p_5_5)
    (opens k_4 p_3_5)
    (opens k_5 p_2_5)


    ;; Adjacencies
(adj p_1_1 p_1_2) (adj p_1_1 p_2_1) (adj p_1_2 p_1_1) (adj p_1_2 p_1_3) (adj p_1_2 p_2_2) (adj p_1_3 p_1_2) (adj p_1_3 p_1_4) (adj p_1_3 p_2_3) (adj p_1_4 p_1_3) (adj p_1_4 p_1_5) (adj p_1_4 p_2_4) (adj p_1_5 p_1_4) (adj p_1_5 p_2_5) (adj p_2_1 p_1_1) (adj p_2_1 p_2_2) (adj p_2_1 p_3_1) (adj p_2_2 p_1_2) (adj p_2_2 p_2_1) (adj p_2_2 p_2_3) (adj p_2_2 p_3_2) (adj p_2_3 p_1_3) (adj p_2_3 p_2_2) (adj p_2_3 p_2_4) (adj p_2_3 p_3_3) (adj p_2_4 p_1_4) (adj p_2_4 p_2_3) (adj p_2_4 p_2_5) (adj p_2_4 p_3_4) (adj p_2_5 p_1_5) (adj p_2_5 p_2_4) (adj p_3_1 p_2_1) (adj p_3_1 p_3_2) (adj p_3_1 p_4_1) (adj p_3_2 p_2_2) (adj p_3_2 p_3_1) (adj p_3_2 p_3_3) (adj p_3_2 p_4_2) (adj p_3_3 p_2_3) (adj p_3_3 p_3_2) (adj p_3_3 p_3_4) (adj p_3_3 p_4_3) (adj p_3_4 p_2_4) (adj p_3_4 p_3_3) (adj p_3_4 p_3_5) (adj p_3_4 p_4_4) (adj p_3_5 p_2_5) (adj p_3_5 p_3_4) (adj p_4_1 p_3_1) (adj p_4_1 p_4_2) (adj p_4_1 p_5_1) (adj p_4_2 p_3_2) (adj p_4_2 p_4_1) (adj p_4_2 p_4_3) (adj p_4_2 p_5_2) (adj p_4_3 p_3_3) (adj p_4_3 p_4_2) (adj p_4_3 p_4_4) (adj p_4_3 p_5_3) (adj p_4_4 p_3_4) (adj p_4_4 p_4_3) (adj p_4_4 p_4_5) (adj p_4_4 p_5_4) (adj p_4_5 p_3_5) (adj p_4_5 p_4_4) (adj p_5_2 p_4_2) (adj p_5_2 p_5_1) (adj p_5_2 p_5_3) (adj p_5_3 p_4_3) (adj p_5_3 p_5_2) (adj p_5_3 p_5_4) (adj p_5_4 p_4_4) (adj p_5_4 p_5_3) (adj p_5_4 p_5_5) (adj p_5_5 p_4_5) (adj p_5_5 p_5_4) 
    ;; Unknows
    (invariant (wumpus p_1_1) (not (wumpus p_1_1)))
    (invariant (stench p_1_1) (not (stench p_1_1)))
    (invariant (pit p_1_1) (not (pit p_1_1)))
    (invariant (breeze p_1_1) (not (breeze p_1_1)))
    (invariant (safe p_1_1) (not (safe p_1_1)))
    (invariant (wumpus p_1_2) (not (wumpus p_1_2)))
    (invariant (stench p_1_2) (not (stench p_1_2)))
    (invariant (pit p_1_2) (not (pit p_1_2)))
    (invariant (breeze p_1_2) (not (breeze p_1_2)))
    (invariant (safe p_1_2) (not (safe p_1_2)))
    (invariant (wumpus p_1_3) (not (wumpus p_1_3)))
    (invariant (stench p_1_3) (not (stench p_1_3)))
    (invariant (pit p_1_3) (not (pit p_1_3)))
    (invariant (breeze p_1_3) (not (breeze p_1_3)))
    (invariant (safe p_1_3) (not (safe p_1_3)))
    (invariant (wumpus p_1_4) (not (wumpus p_1_4)))
    (invariant (stench p_1_4) (not (stench p_1_4)))
    (invariant (pit p_1_4) (not (pit p_1_4)))
    (invariant (breeze p_1_4) (not (breeze p_1_4)))
    (invariant (safe p_1_4) (not (safe p_1_4)))
    (invariant (wumpus p_1_5) (not (wumpus p_1_5)))
    (invariant (stench p_1_5) (not (stench p_1_5)))
    (invariant (pit p_1_5) (not (pit p_1_5)))
    (invariant (breeze p_1_5) (not (breeze p_1_5)))
    (invariant (safe p_1_5) (not (safe p_1_5)))
    (invariant (wumpus p_2_1) (not (wumpus p_2_1)))
    (invariant (stench p_2_1) (not (stench p_2_1)))
    (invariant (pit p_2_1) (not (pit p_2_1)))
    (invariant (breeze p_2_1) (not (breeze p_2_1)))
    (invariant (safe p_2_1) (not (safe p_2_1)))
    (invariant (wumpus p_2_2) (not (wumpus p_2_2)))
    (invariant (stench p_2_2) (not (stench p_2_2)))
    (invariant (pit p_2_2) (not (pit p_2_2)))
    (invariant (breeze p_2_2) (not (breeze p_2_2)))
    (invariant (safe p_2_2) (not (safe p_2_2)))
    (invariant (wumpus p_2_3) (not (wumpus p_2_3)))
    (invariant (stench p_2_3) (not (stench p_2_3)))
    (invariant (pit p_2_3) (not (pit p_2_3)))
    (invariant (breeze p_2_3) (not (breeze p_2_3)))
    (invariant (safe p_2_3) (not (safe p_2_3)))
    (invariant (wumpus p_2_4) (not (wumpus p_2_4)))
    (invariant (stench p_2_4) (not (stench p_2_4)))
    (invariant (pit p_2_4) (not (pit p_2_4)))
    (invariant (breeze p_2_4) (not (breeze p_2_4)))
    (invariant (safe p_2_4) (not (safe p_2_4)))
    (invariant (wumpus p_2_5) (not (wumpus p_2_5)))
    (invariant (stench p_2_5) (not (stench p_2_5)))
    (invariant (pit p_2_5) (not (pit p_2_5)))
    (invariant (breeze p_2_5) (not (breeze p_2_5)))
    (invariant (safe p_2_5) (not (safe p_2_5)))
    (invariant (wumpus p_3_1) (not (wumpus p_3_1)))
    (invariant (stench p_3_1) (not (stench p_3_1)))
    (invariant (pit p_3_1) (not (pit p_3_1)))
    (invariant (breeze p_3_1) (not (breeze p_3_1)))
    (invariant (safe p_3_1) (not (safe p_3_1)))
    (invariant (wumpus p_3_2) (not (wumpus p_3_2)))
    (invariant (stench p_3_2) (not (stench p_3_2)))
    (invariant (pit p_3_2) (not (pit p_3_2)))
    (invariant (breeze p_3_2) (not (breeze p_3_2)))
    (invariant (safe p_3_2) (not (safe p_3_2)))
    (invariant (wumpus p_3_3) (not (wumpus p_3_3)))
    (invariant (stench p_3_3) (not (stench p_3_3)))
    (invariant (pit p_3_3) (not (pit p_3_3)))
    (invariant (breeze p_3_3) (not (breeze p_3_3)))
    (invariant (safe p_3_3) (not (safe p_3_3)))
    (invariant (wumpus p_3_4) (not (wumpus p_3_4)))
    (invariant (stench p_3_4) (not (stench p_3_4)))
    (invariant (pit p_3_4) (not (pit p_3_4)))
    (invariant (breeze p_3_4) (not (breeze p_3_4)))
    (invariant (safe p_3_4) (not (safe p_3_4)))
    (invariant (wumpus p_3_5) (not (wumpus p_3_5)))
    (invariant (stench p_3_5) (not (stench p_3_5)))
    (invariant (pit p_3_5) (not (pit p_3_5)))
    (invariant (breeze p_3_5) (not (breeze p_3_5)))
    (invariant (safe p_3_5) (not (safe p_3_5)))
    (invariant (wumpus p_4_1) (not (wumpus p_4_1)))
    (invariant (stench p_4_1) (not (stench p_4_1)))
    (invariant (pit p_4_1) (not (pit p_4_1)))
    (invariant (breeze p_4_1) (not (breeze p_4_1)))
    (invariant (safe p_4_1) (not (safe p_4_1)))
    (invariant (wumpus p_4_2) (not (wumpus p_4_2)))
    (invariant (stench p_4_2) (not (stench p_4_2)))
    (invariant (pit p_4_2) (not (pit p_4_2)))
    (invariant (breeze p_4_2) (not (breeze p_4_2)))
    (invariant (safe p_4_2) (not (safe p_4_2)))
    (invariant (wumpus p_4_3) (not (wumpus p_4_3)))
    (invariant (stench p_4_3) (not (stench p_4_3)))
    (invariant (pit p_4_3) (not (pit p_4_3)))
    (invariant (breeze p_4_3) (not (breeze p_4_3)))
    (invariant (safe p_4_3) (not (safe p_4_3)))
    (invariant (wumpus p_4_4) (not (wumpus p_4_4)))
    (invariant (stench p_4_4) (not (stench p_4_4)))
    (invariant (pit p_4_4) (not (pit p_4_4)))
    (invariant (breeze p_4_4) (not (breeze p_4_4)))
    (invariant (safe p_4_4) (not (safe p_4_4)))
    (invariant (wumpus p_4_5) (not (wumpus p_4_5)))
    (invariant (stench p_4_5) (not (stench p_4_5)))
    (invariant (pit p_4_5) (not (pit p_4_5)))
    (invariant (breeze p_4_5) (not (breeze p_4_5)))
    (invariant (safe p_4_5) (not (safe p_4_5)))
    (invariant (wumpus p_5_1) (not (wumpus p_5_1)))
    (invariant (stench p_5_1) (not (stench p_5_1)))
    (invariant (pit p_5_1) (not (pit p_5_1)))
    (invariant (breeze p_5_1) (not (breeze p_5_1)))
    (invariant (safe p_5_1) (not (safe p_5_1)))
    (invariant (wumpus p_5_2) (not (wumpus p_5_2)))
    (invariant (stench p_5_2) (not (stench p_5_2)))
    (invariant (pit p_5_2) (not (pit p_5_2)))
    (invariant (breeze p_5_2) (not (breeze p_5_2)))
    (invariant (safe p_5_2) (not (safe p_5_2)))
    (invariant (wumpus p_5_3) (not (wumpus p_5_3)))
    (invariant (stench p_5_3) (not (stench p_5_3)))
    (invariant (pit p_5_3) (not (pit p_5_3)))
    (invariant (breeze p_5_3) (not (breeze p_5_3)))
    (invariant (safe p_5_3) (not (safe p_5_3)))
    (invariant (wumpus p_5_4) (not (wumpus p_5_4)))
    (invariant (stench p_5_4) (not (stench p_5_4)))
    (invariant (pit p_5_4) (not (pit p_5_4)))
    (invariant (breeze p_5_4) (not (breeze p_5_4)))
    (invariant (safe p_5_4) (not (safe p_5_4)))
    (invariant (wumpus p_5_5) (not (wumpus p_5_5)))
    (invariant (stench p_5_5) (not (stench p_5_5)))
    (invariant (pit p_5_5) (not (pit p_5_5)))
    (invariant (breeze p_5_5) (not (breeze p_5_5)))
    (invariant (safe p_5_5) (not (safe p_5_5)))
 
    ;; Inference rules
    (invariant (not (wumpus p_1_1)) (stench p_1_2))
    (invariant (not (pit p_1_1)) (breeze p_1_2))
    (invariant (not (wumpus p_1_1)) (stench p_2_1))
    (invariant (not (pit p_1_1)) (breeze p_2_1))
    (invariant (not (wumpus p_1_1)) (not (at p_1_1)) (not (alive)))
    (invariant (not (pit p_1_1)) (not (at p_1_1)) (not (alive)))
    (invariant (wumpus p_1_1) (pit p_1_1) (safe p_1_1))
    (invariant (not (wumpus p_1_2)) (stench p_1_1))
    (invariant (not (pit p_1_2)) (breeze p_1_1))
    (invariant (not (wumpus p_1_2)) (stench p_1_3))
    (invariant (not (pit p_1_2)) (breeze p_1_3))
    (invariant (not (wumpus p_1_2)) (stench p_2_2))
    (invariant (not (pit p_1_2)) (breeze p_2_2))
    (invariant (not (wumpus p_1_2)) (not (at p_1_2)) (not (alive)))
    (invariant (not (pit p_1_2)) (not (at p_1_2)) (not (alive)))
    (invariant (wumpus p_1_2) (pit p_1_2) (safe p_1_2))
    (invariant (not (wumpus p_1_3)) (stench p_1_2))
    (invariant (not (pit p_1_3)) (breeze p_1_2))
    (invariant (not (wumpus p_1_3)) (stench p_1_4))
    (invariant (not (pit p_1_3)) (breeze p_1_4))
    (invariant (not (wumpus p_1_3)) (stench p_2_3))
    (invariant (not (pit p_1_3)) (breeze p_2_3))
    (invariant (not (wumpus p_1_3)) (not (at p_1_3)) (not (alive)))
    (invariant (not (pit p_1_3)) (not (at p_1_3)) (not (alive)))
    (invariant (wumpus p_1_3) (pit p_1_3) (safe p_1_3))
    (invariant (not (wumpus p_1_4)) (stench p_1_3))
    (invariant (not (pit p_1_4)) (breeze p_1_3))
    (invariant (not (wumpus p_1_4)) (stench p_1_5))
    (invariant (not (pit p_1_4)) (breeze p_1_5))
    (invariant (not (wumpus p_1_4)) (stench p_2_4))
    (invariant (not (pit p_1_4)) (breeze p_2_4))
    (invariant (not (wumpus p_1_4)) (not (at p_1_4)) (not (alive)))
    (invariant (not (pit p_1_4)) (not (at p_1_4)) (not (alive)))
    (invariant (wumpus p_1_4) (pit p_1_4) (safe p_1_4))
    (invariant (not (wumpus p_1_5)) (stench p_1_4))
    (invariant (not (pit p_1_5)) (breeze p_1_4))
    (invariant (not (wumpus p_1_5)) (stench p_2_5))
    (invariant (not (pit p_1_5)) (breeze p_2_5))
    (invariant (not (wumpus p_1_5)) (not (at p_1_5)) (not (alive)))
    (invariant (not (pit p_1_5)) (not (at p_1_5)) (not (alive)))
    (invariant (wumpus p_1_5) (pit p_1_5) (safe p_1_5))
    (invariant (not (wumpus p_2_1)) (stench p_1_1))
    (invariant (not (pit p_2_1)) (breeze p_1_1))
    (invariant (not (wumpus p_2_1)) (stench p_2_2))
    (invariant (not (pit p_2_1)) (breeze p_2_2))
    (invariant (not (wumpus p_2_1)) (stench p_3_1))
    (invariant (not (pit p_2_1)) (breeze p_3_1))
    (invariant (not (wumpus p_2_1)) (not (at p_2_1)) (not (alive)))
    (invariant (not (pit p_2_1)) (not (at p_2_1)) (not (alive)))
    (invariant (wumpus p_2_1) (pit p_2_1) (safe p_2_1))
    (invariant (not (wumpus p_2_2)) (stench p_1_2))
    (invariant (not (pit p_2_2)) (breeze p_1_2))
    (invariant (not (wumpus p_2_2)) (stench p_2_1))
    (invariant (not (pit p_2_2)) (breeze p_2_1))
    (invariant (not (wumpus p_2_2)) (stench p_2_3))
    (invariant (not (pit p_2_2)) (breeze p_2_3))
    (invariant (not (wumpus p_2_2)) (stench p_3_2))
    (invariant (not (pit p_2_2)) (breeze p_3_2))
    (invariant (not (wumpus p_2_2)) (not (at p_2_2)) (not (alive)))
    (invariant (not (pit p_2_2)) (not (at p_2_2)) (not (alive)))
    (invariant (wumpus p_2_2) (pit p_2_2) (safe p_2_2))
    (invariant (not (wumpus p_2_3)) (stench p_1_3))
    (invariant (not (pit p_2_3)) (breeze p_1_3))
    (invariant (not (wumpus p_2_3)) (stench p_2_2))
    (invariant (not (pit p_2_3)) (breeze p_2_2))
    (invariant (not (wumpus p_2_3)) (stench p_2_4))
    (invariant (not (pit p_2_3)) (breeze p_2_4))
    (invariant (not (wumpus p_2_3)) (stench p_3_3))
    (invariant (not (pit p_2_3)) (breeze p_3_3))
    (invariant (not (wumpus p_2_3)) (not (at p_2_3)) (not (alive)))
    (invariant (not (pit p_2_3)) (not (at p_2_3)) (not (alive)))
    (invariant (wumpus p_2_3) (pit p_2_3) (safe p_2_3))
    (invariant (not (wumpus p_2_4)) (stench p_1_4))
    (invariant (not (pit p_2_4)) (breeze p_1_4))
    (invariant (not (wumpus p_2_4)) (stench p_2_3))
    (invariant (not (pit p_2_4)) (breeze p_2_3))
    (invariant (not (wumpus p_2_4)) (stench p_2_5))
    (invariant (not (pit p_2_4)) (breeze p_2_5))
    (invariant (not (wumpus p_2_4)) (stench p_3_4))
    (invariant (not (pit p_2_4)) (breeze p_3_4))
    (invariant (not (wumpus p_2_4)) (not (at p_2_4)) (not (alive)))
    (invariant (not (pit p_2_4)) (not (at p_2_4)) (not (alive)))
    (invariant (wumpus p_2_4) (pit p_2_4) (safe p_2_4))
    (invariant (not (wumpus p_2_5)) (stench p_1_5))
    (invariant (not (pit p_2_5)) (breeze p_1_5))
    (invariant (not (wumpus p_2_5)) (stench p_2_4))
    (invariant (not (pit p_2_5)) (breeze p_2_4))
    (invariant (not (wumpus p_2_5)) (stench p_3_5))
    (invariant (not (pit p_2_5)) (breeze p_3_5))
    (invariant (not (wumpus p_2_5)) (not (at p_2_5)) (not (alive)))
    (invariant (not (pit p_2_5)) (not (at p_2_5)) (not (alive)))
    (invariant (wumpus p_2_5) (pit p_2_5) (safe p_2_5))
    (invariant (not (wumpus p_3_1)) (stench p_2_1))
    (invariant (not (pit p_3_1)) (breeze p_2_1))
    (invariant (not (wumpus p_3_1)) (stench p_3_2))
    (invariant (not (pit p_3_1)) (breeze p_3_2))
    (invariant (not (wumpus p_3_1)) (stench p_4_1))
    (invariant (not (pit p_3_1)) (breeze p_4_1))
    (invariant (not (wumpus p_3_1)) (not (at p_3_1)) (not (alive)))
    (invariant (not (pit p_3_1)) (not (at p_3_1)) (not (alive)))
    (invariant (wumpus p_3_1) (pit p_3_1) (safe p_3_1))
    (invariant (not (wumpus p_3_2)) (stench p_2_2))
    (invariant (not (pit p_3_2)) (breeze p_2_2))
    (invariant (not (wumpus p_3_2)) (stench p_3_1))
    (invariant (not (pit p_3_2)) (breeze p_3_1))
    (invariant (not (wumpus p_3_2)) (stench p_3_3))
    (invariant (not (pit p_3_2)) (breeze p_3_3))
    (invariant (not (wumpus p_3_2)) (stench p_4_2))
    (invariant (not (pit p_3_2)) (breeze p_4_2))
    (invariant (not (wumpus p_3_2)) (not (at p_3_2)) (not (alive)))
    (invariant (not (pit p_3_2)) (not (at p_3_2)) (not (alive)))
    (invariant (wumpus p_3_2) (pit p_3_2) (safe p_3_2))
    (invariant (not (wumpus p_3_3)) (stench p_2_3))
    (invariant (not (pit p_3_3)) (breeze p_2_3))
    (invariant (not (wumpus p_3_3)) (stench p_3_2))
    (invariant (not (pit p_3_3)) (breeze p_3_2))
    (invariant (not (wumpus p_3_3)) (stench p_3_4))
    (invariant (not (pit p_3_3)) (breeze p_3_4))
    (invariant (not (wumpus p_3_3)) (stench p_4_3))
    (invariant (not (pit p_3_3)) (breeze p_4_3))
    (invariant (not (wumpus p_3_3)) (not (at p_3_3)) (not (alive)))
    (invariant (not (pit p_3_3)) (not (at p_3_3)) (not (alive)))
    (invariant (wumpus p_3_3) (pit p_3_3) (safe p_3_3))
    (invariant (not (wumpus p_3_4)) (stench p_2_4))
    (invariant (not (pit p_3_4)) (breeze p_2_4))
    (invariant (not (wumpus p_3_4)) (stench p_3_3))
    (invariant (not (pit p_3_4)) (breeze p_3_3))
    (invariant (not (wumpus p_3_4)) (stench p_3_5))
    (invariant (not (pit p_3_4)) (breeze p_3_5))
    (invariant (not (wumpus p_3_4)) (stench p_4_4))
    (invariant (not (pit p_3_4)) (breeze p_4_4))
    (invariant (not (wumpus p_3_4)) (not (at p_3_4)) (not (alive)))
    (invariant (not (pit p_3_4)) (not (at p_3_4)) (not (alive)))
    (invariant (wumpus p_3_4) (pit p_3_4) (safe p_3_4))
    (invariant (not (wumpus p_3_5)) (stench p_2_5))
    (invariant (not (pit p_3_5)) (breeze p_2_5))
    (invariant (not (wumpus p_3_5)) (stench p_3_4))
    (invariant (not (pit p_3_5)) (breeze p_3_4))
    (invariant (not (wumpus p_3_5)) (stench p_4_5))
    (invariant (not (pit p_3_5)) (breeze p_4_5))
    (invariant (not (wumpus p_3_5)) (not (at p_3_5)) (not (alive)))
    (invariant (not (pit p_3_5)) (not (at p_3_5)) (not (alive)))
    (invariant (wumpus p_3_5) (pit p_3_5) (safe p_3_5))
    (invariant (not (wumpus p_4_1)) (stench p_3_1))
    (invariant (not (pit p_4_1)) (breeze p_3_1))
    (invariant (not (wumpus p_4_1)) (stench p_4_2))
    (invariant (not (pit p_4_1)) (breeze p_4_2))
    (invariant (not (wumpus p_4_1)) (stench p_5_1))
    (invariant (not (pit p_4_1)) (breeze p_5_1))
    (invariant (not (wumpus p_4_1)) (not (at p_4_1)) (not (alive)))
    (invariant (not (pit p_4_1)) (not (at p_4_1)) (not (alive)))
    (invariant (wumpus p_4_1) (pit p_4_1) (safe p_4_1))
    (invariant (not (wumpus p_4_2)) (stench p_3_2))
    (invariant (not (pit p_4_2)) (breeze p_3_2))
    (invariant (not (wumpus p_4_2)) (stench p_4_1))
    (invariant (not (pit p_4_2)) (breeze p_4_1))
    (invariant (not (wumpus p_4_2)) (stench p_4_3))
    (invariant (not (pit p_4_2)) (breeze p_4_3))
    (invariant (not (wumpus p_4_2)) (stench p_5_2))
    (invariant (not (pit p_4_2)) (breeze p_5_2))
    (invariant (not (wumpus p_4_2)) (not (at p_4_2)) (not (alive)))
    (invariant (not (pit p_4_2)) (not (at p_4_2)) (not (alive)))
    (invariant (wumpus p_4_2) (pit p_4_2) (safe p_4_2))
    (invariant (not (wumpus p_4_3)) (stench p_3_3))
    (invariant (not (pit p_4_3)) (breeze p_3_3))
    (invariant (not (wumpus p_4_3)) (stench p_4_2))
    (invariant (not (pit p_4_3)) (breeze p_4_2))
    (invariant (not (wumpus p_4_3)) (stench p_4_4))
    (invariant (not (pit p_4_3)) (breeze p_4_4))
    (invariant (not (wumpus p_4_3)) (stench p_5_3))
    (invariant (not (pit p_4_3)) (breeze p_5_3))
    (invariant (not (wumpus p_4_3)) (not (at p_4_3)) (not (alive)))
    (invariant (not (pit p_4_3)) (not (at p_4_3)) (not (alive)))
    (invariant (wumpus p_4_3) (pit p_4_3) (safe p_4_3))
    (invariant (not (wumpus p_4_4)) (stench p_3_4))
    (invariant (not (pit p_4_4)) (breeze p_3_4))
    (invariant (not (wumpus p_4_4)) (stench p_4_3))
    (invariant (not (pit p_4_4)) (breeze p_4_3))
    (invariant (not (wumpus p_4_4)) (stench p_4_5))
    (invariant (not (pit p_4_4)) (breeze p_4_5))
    (invariant (not (wumpus p_4_4)) (stench p_5_4))
    (invariant (not (pit p_4_4)) (breeze p_5_4))
    (invariant (not (wumpus p_4_4)) (not (at p_4_4)) (not (alive)))
    (invariant (not (pit p_4_4)) (not (at p_4_4)) (not (alive)))
    (invariant (wumpus p_4_4) (pit p_4_4) (safe p_4_4))
    (invariant (not (wumpus p_4_5)) (stench p_3_5))
    (invariant (not (pit p_4_5)) (breeze p_3_5))
    (invariant (not (wumpus p_4_5)) (stench p_4_4))
    (invariant (not (pit p_4_5)) (breeze p_4_4))
    (invariant (not (wumpus p_4_5)) (stench p_5_5))
    (invariant (not (pit p_4_5)) (breeze p_5_5))
    (invariant (not (wumpus p_4_5)) (not (at p_4_5)) (not (alive)))
    (invariant (not (pit p_4_5)) (not (at p_4_5)) (not (alive)))
    (invariant (wumpus p_4_5) (pit p_4_5) (safe p_4_5))
    (invariant (not (wumpus p_5_1)) (stench p_4_1))
    (invariant (not (pit p_5_1)) (breeze p_4_1))
    (invariant (not (wumpus p_5_1)) (stench p_5_2))
    (invariant (not (pit p_5_1)) (breeze p_5_2))
    (invariant (not (wumpus p_5_1)) (not (at p_5_1)) (not (alive)))
    (invariant (not (pit p_5_1)) (not (at p_5_1)) (not (alive)))
    (invariant (wumpus p_5_1) (pit p_5_1) (safe p_5_1))
    (invariant (not (wumpus p_5_2)) (stench p_4_2))
    (invariant (not (pit p_5_2)) (breeze p_4_2))
    (invariant (not (wumpus p_5_2)) (stench p_5_1))
    (invariant (not (pit p_5_2)) (breeze p_5_1))
    (invariant (not (wumpus p_5_2)) (stench p_5_3))
    (invariant (not (pit p_5_2)) (breeze p_5_3))
    (invariant (not (wumpus p_5_2)) (not (at p_5_2)) (not (alive)))
    (invariant (not (pit p_5_2)) (not (at p_5_2)) (not (alive)))
    (invariant (wumpus p_5_2) (pit p_5_2) (safe p_5_2))
    (invariant (not (wumpus p_5_3)) (stench p_4_3))
    (invariant (not (pit p_5_3)) (breeze p_4_3))
    (invariant (not (wumpus p_5_3)) (stench p_5_2))
    (invariant (not (pit p_5_3)) (breeze p_5_2))
    (invariant (not (wumpus p_5_3)) (stench p_5_4))
    (invariant (not (pit p_5_3)) (breeze p_5_4))
    (invariant (not (wumpus p_5_3)) (not (at p_5_3)) (not (alive)))
    (invariant (not (pit p_5_3)) (not (at p_5_3)) (not (alive)))
    (invariant (wumpus p_5_3) (pit p_5_3) (safe p_5_3))
    (invariant (not (wumpus p_5_4)) (stench p_4_4))
    (invariant (not (pit p_5_4)) (breeze p_4_4))
    (invariant (not (wumpus p_5_4)) (stench p_5_3))
    (invariant (not (pit p_5_4)) (breeze p_5_3))
    (invariant (not (wumpus p_5_4)) (stench p_5_5))
    (invariant (not (pit p_5_4)) (breeze p_5_5))
    (invariant (not (wumpus p_5_4)) (not (at p_5_4)) (not (alive)))
    (invariant (not (pit p_5_4)) (not (at p_5_4)) (not (alive)))
    (invariant (wumpus p_5_4) (pit p_5_4) (safe p_5_4))
    (invariant (not (wumpus p_5_5)) (stench p_4_5))
    (invariant (not (pit p_5_5)) (breeze p_4_5))
    (invariant (not (wumpus p_5_5)) (stench p_5_4))
    (invariant (not (pit p_5_5)) (breeze p_5_4))
    (invariant (not (wumpus p_5_5)) (not (at p_5_5)) (not (alive)))
    (invariant (not (pit p_5_5)) (not (at p_5_5)) (not (alive)))
    (invariant (wumpus p_5_5) (pit p_5_5) (safe p_5_5))
  
    (invariant (not (stench p_1_1)) (wumpus p_1_2) (wumpus p_2_1))
    (invariant (not (breeze p_1_1)) (pit p_1_2) (pit p_2_1))
    (invariant (not (stench p_1_2)) (wumpus p_1_1) (wumpus p_1_3) (wumpus p_2_2))
    (invariant (not (breeze p_1_2)) (pit p_1_1) (pit p_1_3) (pit p_2_2))
    (invariant (not (stench p_1_3)) (wumpus p_1_2) (wumpus p_1_4) (wumpus p_2_3))
    (invariant (not (breeze p_1_3)) (pit p_1_2) (pit p_1_4) (pit p_2_3))
    (invariant (not (stench p_1_4)) (wumpus p_1_3) (wumpus p_1_5) (wumpus p_2_4))
    (invariant (not (breeze p_1_4)) (pit p_1_3) (pit p_1_5) (pit p_2_4))
    (invariant (not (stench p_2_1)) (wumpus p_1_1) (wumpus p_2_2) (wumpus p_3_1))
    (invariant (not (breeze p_2_1)) (pit p_1_1) (pit p_2_2) (pit p_3_1))
    (invariant (not (stench p_2_2)) (wumpus p_1_2) (wumpus p_2_1) (wumpus p_2_3) (wumpus p_3_2))
    (invariant (not (breeze p_2_2)) (pit p_1_2) (pit p_2_1) (pit p_2_3) (pit p_3_2))
    (invariant (not (stench p_2_3)) (wumpus p_1_3) (wumpus p_2_2) (wumpus p_2_4) (wumpus p_3_3))
    (invariant (not (breeze p_2_3)) (pit p_1_3) (pit p_2_2) (pit p_2_4) (pit p_3_3))
    (invariant (not (stench p_2_4)) (wumpus p_1_4) (wumpus p_2_3) (wumpus p_2_5) (wumpus p_3_4))
    (invariant (not (breeze p_2_4)) (pit p_1_4) (pit p_2_3) (pit p_2_5) (pit p_3_4))
    (invariant (not (stench p_3_1)) (wumpus p_2_1) (wumpus p_3_2) (wumpus p_4_1))
    (invariant (not (breeze p_3_1)) (pit p_2_1) (pit p_3_2) (pit p_4_1))
    (invariant (not (stench p_3_2)) (wumpus p_2_2) (wumpus p_3_1) (wumpus p_3_3) (wumpus p_4_2))
    (invariant (not (breeze p_3_2)) (pit p_2_2) (pit p_3_1) (pit p_3_3) (pit p_4_2))
    (invariant (not (stench p_3_3)) (wumpus p_2_3) (wumpus p_3_2) (wumpus p_3_4) (wumpus p_4_3))
    (invariant (not (breeze p_3_3)) (pit p_2_3) (pit p_3_2) (pit p_3_4) (pit p_4_3))
    (invariant (not (stench p_3_4)) (wumpus p_2_4) (wumpus p_3_3) (wumpus p_3_5) (wumpus p_4_4))
    (invariant (not (breeze p_3_4)) (pit p_2_4) (pit p_3_3) (pit p_3_5) (pit p_4_4))
    (invariant (not (stench p_4_1)) (wumpus p_3_1) (wumpus p_4_2) (wumpus p_5_1))
    (invariant (not (breeze p_4_1)) (pit p_3_1) (pit p_4_2) (pit p_5_1))
    (invariant (not (stench p_4_2)) (wumpus p_3_2) (wumpus p_4_1) (wumpus p_4_3) (wumpus p_5_2))
    (invariant (not (breeze p_4_2)) (pit p_3_2) (pit p_4_1) (pit p_4_3) (pit p_5_2))
    (invariant (not (stench p_4_3)) (wumpus p_3_3) (wumpus p_4_2) (wumpus p_4_4) (wumpus p_5_3))
    (invariant (not (breeze p_4_3)) (pit p_3_3) (pit p_4_2) (pit p_4_4) (pit p_5_3))
    (invariant (not (stench p_4_4)) (wumpus p_3_4) (wumpus p_4_3) (wumpus p_4_5) (wumpus p_5_4))
    (invariant (not (breeze p_4_4)) (pit p_3_4) (pit p_4_3) (pit p_4_5) (pit p_5_4))
    
 (invariant (key-at k_1 p_4_1)(key-at k_2 p_4_2)(key-at k_1 p_4_3)(key-at k_2 p_4_4)(key-at k_1 p_4_5)(key-at k_2 p_3_1))
 (invariant (key-at k_1 p_4_1)(key-at k_2 p_4_2)(key-at k_1 p_4_3)(key-at k_2 p_4_4)(key-at k_1 p_4_5)(key-at k_2 p_3_4))
 (invariant (key-at k_3 p_4_1)(key-at k_3 p_4_2)(key-at k_3 p_4_3)(key-at k_3 p_4_4)(key-at k_3 p_4_5)(key-at k_3 p_3_4))
 (invariant (key-at k_4 p_4_1)(key-at k_4 p_4_2)(key-at k_4 p_4_3)(key-at k_4 p_4_4)(key-at k_4 p_4_5)(key-at k_4 p_3_1))
 (invariant (key-at k_5 p_4_1)(key-at k_5 p_4_2)(key-at k_5 p_4_3)(key-at k_5 p_4_4)(key-at k_5 p_4_5)(key-at k_5 p_5_1))

    ;;; CHANGES 
  


	)
  (:hidden
  (wumpus p_3_2)

  (stench p_2_2)
  (stench p_4_2)
  (stench p_3_1)
  (stench p_3_3)
  
  (pit p_2_3) 
  (breeze p_2_4)
  (breeze p_2_2)
  (breeze p_1_3)
  (breeze p_3_3)
 
 (safe p_1_1)
 (safe p_1_2)
 (safe p_1_3)
 (safe p_1_4)
 (safe p_1_5)

 (safe p_2_1)
 (safe p_2_2)
 (safe p_2_4)
 (safe p_2_5)

 (safe p_3_1)
 (safe p_3_3)
 (safe p_3_4)
 (safe p_3_5)

 (safe p_4_1)
 (safe p_4_2)
 (safe p_4_3)
 (safe p_4_4)
 (safe p_4_5)

 (safe p_5_1)
 (safe p_5_2)
 (safe p_5_3)
 (safe p_5_4)
 (safe p_5_5)

 (key-at k_1 p_4_4)
 (key-at k_2 p_4_4)
 (key-at k_3 p_4_4)
 (key-at k_4 p_4_4)
 (key-at k_5 p_4_4)

);; end_hidden
  (:goal (have-gold))
)
