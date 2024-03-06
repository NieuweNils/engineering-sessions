fun fact: a wheel is reference to "cheese wheels", that are sold in a cheese shop https://wiki.python.org/moin/CheeseShop

(Guido van Rossum, creator/former BDOAT of Python is Dutch :') )

# What is a wheel?

A Python .whl file is essentially a ZIP (.zip) archive with a specially crafted filename that tells installers what Python versions and platforms the wheel will support.
A wheel is a type of built distribution. In this case, built means that the wheel comes in a ready-to-install format and allows you to skip the build stage required with source distributions.
A wheel filename is broken down into parts separated by hyphens:

```{dist}-{version}(-{build})?-{python}-{abi}-{platform}.whl```


Each section in {brackets} is a tag, or a component of the wheel name that carries some meaning about what the wheel contains and where the wheel will or will not work.

Here’s an illustrative example using a cryptography wheel:

```cryptography-2.9.2-cp35-abi3-macosx_10_9_x86_64.whl```

# Types of wheels
There are several different variations of wheels, and the wheel’s type is reflected in its filename:

- A `universal wheel` contains py2.py3-none-any.whl. It supports both Python 2 and Python 3 on any OS and platform. The majority of wheels listed on the Python Wheels website are universal wheels.

- A `pure-Python wheel` contains either py3-none-any.whl or py2.none-any.whl. It supports either Python 3 or Python 2, but not both. It’s otherwise the same as a universal wheel, but it’ll be labeled with either py2 or py3 rather than the py2.py3 label.

- A `platform wheel` supports a specific Python version and platform. It contains segments indicating a specific Python version, ABI, operating system, or architecture.

# Building wheels

```bash
# pure-Python wheel
python setup.py sdist bdist_wheel 
# universal wheel
$ python setup.py bdist_wheel --universal
# platform wheel 
# step 1 --> get compiler for non python code
# step 2 --> edit setup for 
```
