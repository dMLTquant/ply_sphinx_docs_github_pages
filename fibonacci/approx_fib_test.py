"""Unit Approximate Fibonacci sequence"""
import unittest
import fibonacci.approx_fib as fib


class TestFib(unittest.TestCase):
    """Testing Approximate Fibonacci sequence Function"""

    def test_successful_approx_fib(self):
        """Check if the the 5 element in the Fibonacci sequence (1 2 3 5 8 13) is 8"""
        self.assertEqual(fib.approx_fib(5), 8)


if __name__ == '__main__':
    unittest.main()
