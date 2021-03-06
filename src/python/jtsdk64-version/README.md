# JTSDK64-Tools ( jt64version )

| Application Data ||
| ---| --- |
| Package             | `jt64version`
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

Simple [Python][] script to print application versions associated with
[JTSDK64-Tools][]

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
pip install -i https://test.pypi.org/simple/ jt64version
```

## Usage

```bash
    In the console, type: jt64version

    Print Application Versions associated with `JTSDK64-Tools`

    optional arguments:
      None
```

| ![Application Versions](docs/images/jt64version.PNG?raw=true) |
|:--:|
| *JTSDK64 Application Versions* |


This action apply's only to those that installed `jt64version` using `pip`.

```bash
# JTSDK64-Tools Env and type the following.
# Ensure jtpy is the active Python environment
conda activate jtpy

# Uninstall command
pip uninstall jt64version
```

[Install Miniconda Python]: https://github.com/KI7MT/jtsdk-dotnet-core/wiki/Install-Python
[JTSDK64-Tools]: https://github.com/KI7MT/jtsdk64-tools-scripts
[test.pypi.org]: https://test.pypi.org/project/jt64version/
[PyPi]: https://pypi.org/
[Miniconda Python]: https://docs.conda.io/en/latest/miniconda.html
[Python]: https://www.python.org/