# JTSDK64-Tools ( jt64version )

| Application Data ||
| ---| --- |
| Package             | `jt64gentc`
| Version             | 0.0.1
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

- If running [JTSDK64-Tools][], install [Install Miniconda Python][].
- Any [Python][] version >= 3.5, virtual or native installation.
- No special modules or distributions are required.

## Installation

During `Beta` testing, installation will pull yhe application from
[test.pypi.org][]. After `Beta` testing, the package will be moved to the main
[PyPi][] repository where it will remain.

Open a condole, and type the following:

```bash
# If using JTSDK64-Tools, active jtpy first
conda activate jtpy

# Install command: note the space after trailing /
pip install -i https://test.pypi.org/simple/ jt64gentc
```

## Usage

```bash
    Provides:
      1. Generate Tool Chain files based on supported QT versions.

    usage: jt64gentc

      Created (x) number of file and places them in `JTSDK-Tool\tools\tcfiles`.
```

| ![Application Versions](docs/images/jt64gentc.PNG?raw=true) |
|:--:|
| *JTSDK64 Generate Tool Chain Files* |

## Uninstall

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first
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
