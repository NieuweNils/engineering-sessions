from example.util import location, list_of_vals, print_argument, Cats
from example.package.util import Dogs
from example.package import Spider


def main():
    print(location)
    for val in list_of_vals:
        print(f"val: {val}")
    print_argument("hello there")
    print(f"cats == cool ? -> {Cats.cool}")
    print(f"dogs == cool ? -> {Dogs.also_cool}")
    print(f"spider == scary ? -> {Spider.scary}")
