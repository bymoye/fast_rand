from setuptools import setup, Extension
from Cython.Build import cythonize

setup(
    name="rand_int",
    ext_modules=cythonize(
        Extension(
            name="rand_int",
            sources=["rand_int.pyx"],
            language=["c++"],
            extra_compile_args=["-std=c++17","-O2"],
        ),
        compiler_directives={
            'language_level': 3,
            'boundscheck': False,
            'wraparound': False
        },
    ),
    author="bymoye",
    author_email="s3moye@gmail.com",
    version="0.0.1",
    description="Modified from Pyewacket, contains only integer random numbers.",
    license="Free for non-commercial use",
    classifiers=[
    "Development Status :: 5 - Production/Stable",
    "Programming Language :: Python :: 3.6",
    "Programming Language :: Python :: 3.7",
    "Programming Language :: Python :: 3.8",
    "Programming Language :: Python :: 3.9",
    "Programming Language :: Python :: 3.10",
    "Programming Language :: Cython",
    "Programming Language :: C++",
    "Operating System :: POSIX :: Linux",
    "Operating System :: MacOS :: MacOS X",
    "Topic :: Software Development :: Libraries :: Python Modules",
    ],
    python_requires='>=3.6'
)