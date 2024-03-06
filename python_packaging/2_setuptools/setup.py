import sys
from pathlib import Path

from setuptools import setup, find_packages

install_requirements = [
    'uwsgi==2.0.*'
]

test_requirements = ['pytest']

base_dir = Path(__file__).parent
src_dir = base_dir / "src"

# When executing the setup.py, we need to be able to import ourselves, this
# means that we need to add the src/ directory to the sys.path.
sys.path.insert(0, str(src_dir))

about = {}
with open(str(src_dir / "example" / "__about__.py")) as f:
    exec(f.read(), about)

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name=about["__title__"],
    version=about["__version__"],

    description=about["__summary__"],
    long_description=long_description,
    long_description_content_type="text/markdown",

    author=about["__author__"],
    author_email=about["__email__"],

    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
    ],
    scripts=['src/example/bin/run_app'],
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    install_requires=install_requirements,
    extras_require={
        'test': test_requirements,
    },
    include_package_data=True,

    python_requires='>=3.11.3',
)
