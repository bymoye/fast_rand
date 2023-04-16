# cython: language_level=3
# distutils: language = c++
cimport cython
from libc.stdint cimport int64_t, uint64_t

cdef extern from "nazo_rand.hpp" namespace "Storm":
    void seed(uint64_t seed)
    int64_t uniform_int_variate_noargs()
    int64_t random_range(int64_t start, int64_t stop, int64_t step)
    int64_t random_below(int64_t number)
    int64_t uniform_int_variate(int64_t a, int64_t b)
    double uniform_real_variate_noargs()
    double uniform_real_variate(double a, double b)

cpdef int random_integer_noargs():
    return uniform_int_variate_noargs()

cpdef void shuffle(list array):
    for i in reversed(range(len(array) - 1)):
        j = randrange(i, len(array), 1)
        array[i], array[j] = array[j], array[i]


cpdef int randbelow(int a):
    return random_below(a)

cpdef int randint(int a, int b):
    return uniform_int_variate(a, b)

@cython.boundscheck(False)
@cython.wraparound(False)
cpdef object random_choice(object elements):
    cdef Py_ssize_t index = randbelow(len(elements))
    return elements[index]

@cython.boundscheck(False)
@cython.wraparound(False)
cpdef list random_sample(object container, Py_ssize_t count):
    cdef Py_ssize_t container_length = len(container)
    cdef Py_ssize_t i, j
    cdef list result = [None] * count
    cdef list temp = list(container)

    if count > container_length:
        raise ValueError("Sample larger than population")

    for i in range(count):
        j = uniform_int_variate(i, container_length - 1)
        result[i] = temp[j]
        temp[j] = temp[i]

    return result

cpdef int randrange(int start, int stop=0, int step=1):
    if stop == 0:
        stop, start = start, 0
    return random_range(start, stop, step)


cpdef double random_double(double a, double b):
    return uniform_real_variate(a, b)


cpdef double random_double_noargs():
    return uniform_real_variate_noargs()
