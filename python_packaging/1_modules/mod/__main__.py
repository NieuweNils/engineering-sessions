from .util import location, list_of_vals, print_argument, Cats
from .package.util import Dogs
from .package import Spider

if __name__ == "__main__":
    print(location)
    for val in list_of_vals:
        print(f"val: {val}")
    print_argument("hello there")
    print(f"cats == cool ? -> {Cats.cool}")
    print(f"dogs == cool ? -> {Dogs.also_cool}")
    print(f"spider == scary ? -> {Spider.scary}")
