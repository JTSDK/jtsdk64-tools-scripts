# JTSDK64-Tools ( jt64gentc )

| Application Data ||
| ---| --- |
| Package             | `jt64gentc`
| Version             | 0.0.3
| Topic               | Communications, Ham Radio
| Development Status  | 2 - Beta
| Distributions       | Windows, Linux
| Arch                | x86-64
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library, colorconsole
| Virtual Environment | [Miniconda Python]

## Development Status

This package is in `Beta`. The package was tested using
[Miniconda Python][] with a default virtual environment creation e.g.
(`conda create -n jtpy python=3`).

## Description

Simple [Python][] script to generate QT Tool Chain files based on a list of
supported versions.

## Requirements

If using the self-contained executable, there is no requirement to
[Install Miniconda Python][], otherwise, see the following:

- If running [JTSDK64-Tools][], install [Install Miniconda Python][].
- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

During `Beta` testing, the application will be delivered in a self-contained
Windows executable; no action is required. To install manually, use the
following steps:

Open a condole, and type the following:

```bash
# If using JTSDK64-Tools, active jtpy first
conda activate jtpy

# Install command: note the space after trailing /
pip install -i https://test.pypi.org/simple/ jt64gentc
```

## Usage

```bash
    In the console, type: jt64env

    Generates Tool Chain files based on supported QT versions. Created files
    are placed in the `JTSDK-Tool\tools\tcfiles` directory.

    optional arguments:
      -h, --help       show this help message and exit
      -s, --supported  list supported QT versions
      -v, --version    display module version
```

| ![Application Versions](docs/images/jt64gentc.PNG?raw=true) |
|:--:|
| *JTSDK64 Generate Tool Chain Files* |

## Uninstall

This action apply's only to those that installed `jt64gentc` using `pip`.

```bash
# JTSDK64-Tools Env and type the following.
# Ensure jtpy is the active Python environment
conda activate jtpy

# Uninstall command
pip uninstall jt64gentc
```

[Install Miniconda Python]: https://github.com/KI7MT/jtsdk-dotnet-core/wiki/Install-Python
[JTSDK64-Tools]: https://github.com/KI7MT/jtsdk64-tools-scripts
[test.pypi.org]: https://test.pypi.org/project/jt64version/
[PyPi]: https://pypi.org/
[Miniconda Python]: https://docs.conda.io/en/latest/miniconda.html
[Python]: https://www.python.org/
