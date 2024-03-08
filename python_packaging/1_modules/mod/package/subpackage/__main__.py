from .util import location, list_of_vals, print_argument, Spider

if __name__ == "__main__":
    print(location)
    for val in list_of_vals:
        print(f"val: {val}")
    print_argument("hello there")
    print(f"spider == scary ? -> {Spider.scary}")
