"""Unit Test for Multiply"""
import unittest
import multiplication.multiply as mpi


class TestMultiply(unittest.TestCase):
    """Testing Multiply Function"""

    def test_successful_multiply_2(self):
        """Check if returns the 2 times of input integer"""
        self.assertEqual(mpi.multiply_2(5), 10)


if __name__ == '__main__':
    unittest.main()
