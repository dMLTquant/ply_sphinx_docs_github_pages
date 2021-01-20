"""

Configuration module, tells where data files are to.

"""

import math

_SQRT_5 = math.sqrt(5)
_PHI = (1 + _SQRT_5) / 2


def approx_fib(n):
    """
    Approximate Fibonacci sequence

    Args:
        n (int): The place in Fibonacci sequence to approximate

    Returns:
        float: The approximate value in Fibonacci sequence
    """
    # ...
    return round(_PHI**(n+1) / _SQRT_5)


# print(approx_fib(5))
