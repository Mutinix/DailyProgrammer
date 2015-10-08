import itertools
import functools
import operator
import sys

"""
vampires.py

A vampire number v is a number v=xy with an even number n of digits formed by
multiplying a pair of n/2-digit numbers (where the digits are taken from the
original number in any order) x and y together. Pairs of trailing zeros are not
allowed. If v is a vampire number, then x and y are called its "fangs."
"""

def vampire(n=4, m=2):
    for fangs in itertools.combinations_with_replacement(range(10, 100), m):
        product = functools.reduce(operator.mul, fangs, 1)
        result = ''.join(sorted(str(product)))
        fangcomb = ''.join([str(x) for x in fangs])
        fangordercomb = ''.join(sorted(fangcomb))

        if result == fangordercomb and len(result) == n:
            fangtext = '*'.join([str(fang) for fang in fangs])
            print "%d = %s" % (product, fangtext)

if __name__ == "__main__":
    if len(sys.argv) == 3:
        vampire(int(sys.argv[1]), int(sys.argv[2]))
    else:
        vampire()