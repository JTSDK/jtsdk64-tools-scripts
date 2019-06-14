# JTSDK64-Tools ( jt64common )

| Application Data ||
| ---| --- |
| Package             | `jt64common`
| Version             | 0.0.1
| Topic               | Communications, Ham Radio
| Development Status  | 2 - Beta
| Distributions       | Windows, Linux
| Arch                | x86-64
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library, colorconsole
| Virtual Environment | [Miniconda Python]

## Development Status

This package is in `Beta`. The package was tested using [Miniconda Python][]
with a default virtual environment creation e.g. (`conda create -n jtpy python=3`).

## Description

Common utilities / functions for use with JTSDK64 Tools Python Scripts.

## Requirements

- If running [JTSDK64-Tools][], install [Install Miniconda Python][] if you'venot done so.
- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

During `Beta` testing, installation will pull yhe application from
[test.pypi.org][]. After `Beta` testing, the package will be moved to the main
[PyPi][] repository where it will remain.

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtpy first
conda activate jtpy

# Install command: note the space after trailing /
pip install -i https://test.pypi.org/simple/ jt64common

```

## Usage

```bash
    Provides:
      1. Common utilities for use with JTSDK64 Tools Python Scripts

    usage: None by users

```
## Uninstall

Open a condole, and type the following:

```bash
# If using JTSDK64-Tools, active jtpy first
conda activate jtpy

# Uninstall command
pip uninstall jt64common
```

[Install Miniconda Python]: https://github.com/KI7MT/jtsdk-dotnet-core/wiki/Install-Python
[JTSDK64-Tools]: https://github.com/KI7MT/jtsdk64-tools-scripts
[test.pypi.org]: https://test.pypi.org/project/jt64common/
[PyPi]: https://pypi.org/
[Miniconda Python]: https://docs.conda.io/en/latest/miniconda.html
[Python]: https://www.python.org/