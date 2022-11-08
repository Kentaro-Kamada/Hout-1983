library(tidyverse)
library(kamaken)

data <- read_csv('01_rawdata/table1.csv')

dat <- str_c('dat [', str_c(data$n, collapse = ' '), ']')


# perfect mobility ------------------------------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B}', 
    dat = dat,
    see = 'see 123',
    path = 'lem/tab9/PM'
)

lem_gof('lem/tab9/PM/out/see123.out')

# quasi-perfect mobility (constrained) --------------------------------------------------------


lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,1)}',
    des = 'des [1 0 0 0 0
                0 1 0 0 0
                0 0 1 0 0
                0 0 0 1 0
                0 0 0 0 1]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab9/QPM-C'
)

lem_gof('lem/tab9/QPM-C/out/see123.out')


# symmetrical diagonals (constrained) ---------------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,2)}',
    des = 'des [1 2 0 0 0
                2 1 2 0 0
                0 2 1 2 0
                0 0 2 1 2
                0 0 0 2 1]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab9/SD-C'
)


lem_gof('lem/tab9/SD-C/out/see123.out')


# diagonals (constrained) ---------------------------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,3)}',
    des = 'des [1 2 0 0 0
                3 1 2 0 0
                0 3 1 2 0
                0 0 3 1 2
                0 0 0 3 1]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab9/D-C'
)


lem_gof('lem/tab9/D-C/out/see123.out')



# quasi-perfect mobility ----------------------------------------------------------------------

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
    path = 'lem/tab9/QPM'
)

lem_gof('lem/tab9/QPM/out/see123.out')


# quasi-symmetrical diagonals (constrained) ---------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,6)}',
    des = 'des [1 6 0 0 0
                6 2 6 0 0
                0 6 3 6 0
                0 0 6 4 6
                0 0 0 6 5]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab9/QSD-C'
)

lem_gof('lem/tab9/QSD-C/out/see123.out')


# quasi-diagonals (constrained) ---------------------------------------------------------------


lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,7)}',
    des = 'des [1 6 0 0 0
                7 2 6 0 0
                0 7 3 6 0
                0 0 7 4 6
                0 0 0 7 5]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab9/QD-C'
)

lem_gof('lem/tab9/QD-C/out/see123.out')


# quasi-symmetrical diagonals ---------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,9)}',
    des = 'des [1 6 0 0 0
                6 2 7 0 0
                0 7 3 8 0
                0 0 8 4 9
                0 0 0 9 5]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab9/QSD'
)

lem_gof('lem/tab9/QSD/out/see123.out')


# quasi-diagonals -----------------------------------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,13)}',
    des = 'des [1  6  0  0  0
                7  2  8  0  0
                0  9  3 10  0
                0  0 11  4 12
                0  0  0 13  5]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab9/QD'
)

lem_gof('lem/tab9/QD/out/see123.out')


# table9

tibble(
  path = fs::dir_ls('lem/tab9', recurse = T, regexp = '\\.out'),
  model = str_extract(path, '(?<=lem/tab9/).+(?=/out)'),
  gof = map(path, lem_gof)
) %>% 
  unnest(gof) %>% 
  arrange(desc(df.residual)) 
  



# crossing parameters -------------------------------------------------------------------

# 4つのマトリクスを足すと対角セルからの境界の数になる

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,1) fac(AB,1) fac(AB,1) fac(AB,1)}',
    des = 'des [0 1 1 1 1
                1 0 0 0 0
                1 0 0 0 0
                1 0 0 0 0
                1 0 0 0 0
    
                0 0 1 1 1
                0 0 1 1 1
                1 1 0 0 0
                1 1 0 0 0
                1 1 0 0 0
                
                0 0 0 1 1
                0 0 0 1 1
                0 0 0 1 1
                1 1 1 0 0
                1 1 1 0 0
    
                0 0 0 0 1
                0 0 0 0 1
                0 0 0 0 1
                0 0 0 0 1
                1 1 1 1 0]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab11/CP'
)

lem_gof('lem/tab11/CP/out/see123.out')


# Rでつくってみる
data %>% 
  mutate(
    cross1 = case_when(A == B ~ 0,
                       A <= 1 & B > 1 ~ 1,
                       A > 1 & B <= 1 ~ 1,
                       TRUE ~ 0),
    cross2 = case_when(A == B ~ 0,
                       A <= 2 & B > 2 ~ 1,
                       A > 2 & B <= 2 ~ 1,
                       TRUE ~ 0),
    cross3 = case_when(A == B ~ 0,
                       A <= 3 & B > 3 ~ 1,
                       A > 3 & B <= 3 ~ 1,
                       TRUE ~ 0),
    cross4 = case_when(A == B ~ 0,
                       A <= 4 & B > 4 ~ 1,
                       A > 4 & B <= 4 ~ 1,
                       TRUE ~ 0),
  ) %>% 
  glm(n ~ factor(A) + factor(B) + cross1 + cross2 + cross3 + cross4, data = ., family = 'poisson') %>% 
  broom::glance() 
  


# quasi-crossing parameter (constrained) ------------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,1) fac(AB,1) fac(AB,1) fac(AB,1) fac(AB,1)}',
    des = 'des [0 1 1 1 1
                1 0 0 0 0
                1 0 0 0 0
                1 0 0 0 0
                1 0 0 0 0
    
                0 0 1 1 1
                0 0 1 1 1
                1 1 0 0 0
                1 1 0 0 0
                1 1 0 0 0
                
                0 0 0 1 1
                0 0 0 1 1
                0 0 0 1 1
                1 1 1 0 0
                1 1 1 0 0
    
                0 0 0 0 1
                0 0 0 0 1
                0 0 0 0 1
                0 0 0 0 1
                1 1 1 1 0
    
                1 0 0 0 0
                0 1 0 0 0
                0 0 1 0 0
                0 0 0 1 0
                0 0 0 0 1]',
    dat = dat, 
    see = 'see 123', 
    path = 'lem/tab11/QCP-C'
)

lem_gof('lem/tab11/QCP-C/out/see123.out')


# Rでつくってみる
data %>% 
  mutate(
    cross1 = case_when(A == B ~ 0,
                       A <= 1 & B > 1 ~ 1,
                       A > 1 & B <= 1 ~ 1,
                       TRUE ~ 0),
    cross2 = case_when(A == B ~ 0,
                       A <= 2 & B > 2 ~ 1,
                       A > 2 & B <= 2 ~ 1,
                       TRUE ~ 0),
    cross3 = case_when(A == B ~ 0,
                       A <= 3 & B > 3 ~ 1,
                       A > 3 & B <= 3 ~ 1,
                       TRUE ~ 0),
    cross4 = case_when(A == B ~ 0,
                       A <= 4 & B > 4 ~ 1,
                       A > 4 & B <= 4 ~ 1,
                       TRUE ~ 0),
    diag = case_when(A == B ~ 1, TRUE ~ 0)
  ) %>% 
  glm(n ~ factor(A) + factor(B) + cross1 + cross2 + cross3 + cross4 + diag, data = ., family = 'poisson') %>% 
  broom::glance() 


# quasi-crossing parameter ------------------------------------------------------

lem(man = 'man 2', 
    dim = 'dim 5 5', 
    lab = 'lab A B', 
    mod = 'mod {A B fac(AB,1) fac(AB,1) fac(AB,1) fac(AB,1) fac(AB,3)}',
    des = 'des [0 1 1 1 1
                1 0 0 0 0
                1 0 0 0 0
                1 0 0 0 0
                1 0 0 0 0
    
                0 0 1 1 1
                0 0 1 1 1
                1 1 0 0 0
                1 1 0 0 0
                1 1 0 0 0
                
                0 0 0 1 1
                0 0 0 1 1
                0 0 0 1 1
                1 1 1 0 0
                1 1 1 0 0
    
                0 0 0 0 1
                0 0 0 0 1
                0 0 0 0 1
                0 0 0 0 1
                1 1 1 1 0
    
                0 0 0 0 0
                0 1 0 0 0
                0 0 2 0 0
                0 0 0 3 0
                0 0 0 0 0]',
    dat = dat, 
    dum = 'dum 1 1',
    see = 'see 123', 
    path = 'lem/tab11/QCP'
)

lem_gof('lem/tab11/QCP/out/see123.out')


# Rでつくってみる
data %>% 
  mutate(
    cross1 = case_when(A == B ~ 0,
                       A <= 1 & B > 1 ~ 1,
                       A > 1 & B <= 1 ~ 1,
                       TRUE ~ 0),
    cross2 = case_when(A == B ~ 0,
                       A <= 2 & B > 2 ~ 1,
                       A > 2 & B <= 2 ~ 1,
                       TRUE ~ 0),
    cross3 = case_when(A == B ~ 0,
                       A <= 3 & B > 3 ~ 1,
                       A > 3 & B <= 3 ~ 1,
                       TRUE ~ 0),
    cross4 = case_when(A == B ~ 0,
                       A <= 4 & B > 4 ~ 1,
                       A > 4 & B <= 4 ~ 1,
                       TRUE ~ 0),
    diag = case_when(A == 1 & B == 1 ~ 1, 
                     A == 2 & B == 2 ~ 2, 
                     A == 3 & B == 3 ~ 3, 
                     A == 4 & B == 4 ~ 4, 
                     A == 5 & B == 5 ~ 5, 
                     TRUE ~ 0)
  ) %>% 
  glm(n ~ factor(A) + factor(B) + cross1 + cross2 + cross3 + cross4 + factor(diag), data = ., family = 'poisson') %>% 
  broom::tidy()


# Table11

tibble(
  path = fs::dir_ls('lem/tab11', recurse = T, regexp = '\\.out'),
  model = str_extract(path, '(?<=lem/tab11/).+(?=/out)'),
  gof = map(path, lem_gof)
) %>% 
  unnest(gof) %>% 
  arrange(desc(df.residual)) 



