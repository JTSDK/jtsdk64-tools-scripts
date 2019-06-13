import os
import setuptools

import jt64env

here = os.path.dirname(os.path.abspath(__file__))

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name=jt64env.__title__,
    version=jt64env.__version__,
    author=jt64env.__author__,
    license=jt64env.__license__,
    author_email=jt64env.__author__,
    long_description=long_description,
    long_description_content_type="text/markdown",

    python_requires='>=3.5.*',
    project_urls={
        'Packaging tutorial': 'https://packaging.python.org/tutorials/distributing-packages/',
        'jt64env source': 'https://github.com/KI7MT/jtsdk64-tools-scripts',
    },
    packages=setuptools.find_packages(),
    install_requires=['colorconsole'],
    entry_points={
        'console_scripts': ['jt64env = jt64env.__main__:main'],
    },
    classifiers=[
        "Natural Language :: English",
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Topic :: Utilities",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: POSIX :: Linux",
        "Operating System :: Microsoft :: Windows",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        ],
    url='https://github.com/KI7MT/jtsdk64-tools-scripts',
)
