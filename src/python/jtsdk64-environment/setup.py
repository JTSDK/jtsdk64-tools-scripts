import os
import setuptools

here = os.path.dirname(os.path.abspath(__file__))

# Package meta-data
version_info = (0, 0, 1)
__title__ = "jt64env"
__version__ = '.'.join(str(c) for c in version_info)
__name__ = "jt64env"
__author__ = "Greg Beam, KI7MT"
__license__ = "GPLv3"
__email__ = "ki7mt@yahoo.com"

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name=__title__,
    version=__version__,
    author=__author__,
    license=__license__,
    author_email=__email__,
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
