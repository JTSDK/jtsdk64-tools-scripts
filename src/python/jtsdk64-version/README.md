# JTSDK64-Tools ( jt64env )

| Application Data ||
| ---| --- |
| Package             | `jt64env`
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

Simple [Python][] script to print various environment variables associated
with [JTSDK64-Tools][]

## Requirements

- If running [JTSDK64-Tools][], install [Install Miniconda Python][] if you've not done so.
- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

During `Beta` testing, installation will pull yhe application from
[test.pypi.org][]. After `Beta` testing, the package will be moved to the main
[PyPi][] repository where it will remain.

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first
conda activate jtpy

# Install command: note the space after trailing /
pip install -i https://test.pypi.org/simple/ jtenv

```

## Usage

```bash
    Provides:
      1. Prints JTSDK64 Environment Variables

    usage: jtenv

      Print Environment Variables associated with `JTSDK64-Tools`
```

## Uninstall

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first
conda activate jtsdk-py

# Uninstall command
pip uninstall jtenv

```
[Install Miniconda Python]: https://github.com/KI7MT/jtsdk-dotnet-core/wiki/Install-Python
[JTSDK64-Tools]: https://github.com/KI7MT/jtsdk64-tools-scripts
[test.pypi.org]: https://test.pypi.org/project/jt64env/
[PyPi]: https://pypi.org/
[Miniconda Python]: https://docs.conda.io/en/latest/miniconda.html
[Python]: https://www.python.org/