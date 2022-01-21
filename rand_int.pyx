# cython: language_level=3
# distutils: language = c++

"""
@ Author : bymoye
@ createtime: 2022.1.21
@ engine: Storm
@ Modified from Pyewacket
"""
import itertools as _itertools

__all__ = (
    "seed",
    "randbelow", "randint", "randrange",
    "shuffle", "choice",
)

cdef extern from "Rand.hpp":
    void       _seed         "Storm::Engine::cyclone.seed"(unsigned long long)
    long long  _randbelow    "Storm::random_below"(long long)
    long long  _randint      "Storm::uniform_int_variate"(long long, long long)
    long long  _randrange    "Storm::random_range"(long long, long long, long long)

def seed(rseed:int = 0) -> void:
    _seed(rseed)

def choice(seq):
    if len(seq) == 0:
        return None
    return seq[_randbelow(len(seq))]

def shuffle(array:list) -> None:
    for i in reversed(range(len(array) - 1)):
        j = _randrange(i, len(array), 1)
        array[i], array[j] = array[j], array[i]


def randbelow(a:int) -> int:
    return _randbelow(a)

def randint(a:int,b:int) -> int:
        return _randint(a, b)

def randrange(start:int,stop:int=0,step:int=1) -> int:
    return _randrange(start, stop, step)
