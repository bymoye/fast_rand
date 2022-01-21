# rand_int
Modified from [Pyewacket](https://github.com/BrokenShell/Pyewacket), contains only integer random numbers.

`rand_int.choice(seq: list|Tuple) -> Any`
example：
```python
from rand_int import choice
temp = [1,2,3,4,5,6]
choice(temp) 
```

`rand_int.randbelow(a: int) -> int`
example:
```python
from rand_int import randbelow
randbelow(10)   # -> [0, 10)
randbelow(0)    # -> [0, 0) => 0
randbelow(-10)  # -> (-10, 0]
```

`rand_int.randint(a: int , b: int) -> int`
example:
```python
from rand_int import randint
randint(1, 10)   # -> [1, 10]
randint(10, 1)   # -> [1, 10]
randint(10, 10)  # -> [10, 10] => 10
```

`rand_int.randrange(start: int , stop: int = 0 , step: int = 1 )`
example:
```python
from rand_int import randrange
randrange(10)           # -> [0, 10) by whole numbers
randrange(1, 10)        # -> [1, 10) by whole numbers
randrange(1, 10, 2)     # -> [1, 10) by 2, odd numbers
randrange(-10)          # -> [-10, 0) by 1
randrange(10, 1)        # -> [1, 10) by 1
randrange(10, 0, 2)     # -> [0, 10) by 2, even numbers
randrange(10, 10, 0)    # -> [10, 10) => 10
```