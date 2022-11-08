library(tidyverse)
library(kamaken)

data <- read_csv('01_rawdata/table1.csv')

dat <- str_c('dat [', str_c(data$n, collapse = ' '), ']')


# perfect mobility（参考） ------------------------------------------------------------------------
# Chap1, Table4

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B}', 
    dat = dat,
    see = 'see 123',
    path = 'lem/tab4'
    )

lem_gof('lem/tab4/out/see123.out')


# quasi-perfect mobility (quasi-independence model) ----------------------------------------------------------------------


lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,5)}',
    des = 'des [1 0 0 0 0
                0 2 0 0 0
                0 0 3 0 0
                0 0 0 4 0
                0 0 0 0 5]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab6'
    )

lem_gof('lem/tab6/out/see123.out')



# corners model -------------------------------------------------------------------------------


lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,9)}',
    des = 'des [1 6 0 0 0
                7 2 0 0 0
                0 0 3 0 0
                0 0 0 4 8
                0 0 0 9 5]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab7'
)

lem_gof('lem/tab7/out/see123.out')


# quasi-symmetry ---------------------------------------------------------------------



lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,10)}',
    des = 'des [0  1  5  8 10
                1  0  2  6  9
                5  2  0  3  7
                8  6  3  0  4
               10  9  7  4  0]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab8B'
)

lem_gof('lem/tab8B/out/see123.out')



# symmetry ------------------------------------------------------------------------------------
# 本の自由度が間違ってる

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {fac(A,B,4) fac(AB,10)}',
    des = 'des [1 2 3 4 0 
                1 2 3 4 0
                0  1  5  8 10
                1  0  2  6  9
                5  2  0  3  7
                8  6  3  0  4
               10  9  7  4  0]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab8A'
)

lem_gof('lem/tab8A/out/see123.out')





