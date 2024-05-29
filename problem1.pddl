(define (problem a3t5b)
    (:domain n-table-blocks-world)
    (:objects
        B1 B2 B3 B4 B5 - block
        Y B G R P - color
        T1 T2 T3  - table
    )
    (:init
        (handempty)

        (ontable B1 T1)
        (bcolor B1 Y)

        (on B2 B1)
        (clear B2)
        (bcolor B2 B)

        (ontable B3 T2)
        (clear B3)
        (bcolor B3 Y)

        (ontable B4 T3)
        (clear B4)
        (bcolor B4 G)

        (ontable B5 T3)
        (clear B5)
        (bcolor B5 R)

    )

    (:goal (and
        (colors_on_table Y R T3)
    ))
)