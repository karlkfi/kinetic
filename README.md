# Kinetic

This is an example of Config as Data, using Jupyter Notebooks to generate and
manipulate Kubernetes Resource Model (KRM) object manifests (YAML).

A example pipeline is defined in `kinetic.ipynb`.

# Usage

The `jupyter-krm` containter image containerizes the dependencies for
executing the `kinetic.ipynb` notebook. 

To build the `jupyter-krm` image:

```
make image
```

The `jupyter-krm` image has two modes of operation:

- Interactive mode
- Headless mode

In both modes, the local package directory will be mounted into the container,
to serve as both input and output.

In addition to manipulating packages of KRM manifests, kinetic can also generate
manifests or render manifest templates with tools like helm or kustomize.

## Interactive mode

Interactive mode is used for editing the notebook.

This mode allows partial or full execution of the notebook's code cells, which
is useful while authoring or editing the notebook.

Each code cell can optionally print or display output, which can aid in 
visualizing the KRM objects and debugging the code.

To use interactive mode:

```
make edit
```

The output of the container execution will print a URL.
Open this URL in a browser to enter Jupyter Notebooks.

Then navigate to the `work` directory and select `kinetic.ipynb` to edit the
notebook.

## Headless mode

Headless mode is used for executing the notebook.

This mode only allows full execution of the notebook's code cells, which
is useful for programatically rendering KRM objects and packages in a
predictable, repeatable way.

To use headless mode:

```
make exec
```

# KRM SDK

The example pipeline currently includes what is loosely titled the "KRM SDK".
In the future, this module could be extracted to its own codebase and published
to PyPI.

The KRM SDK includes classes and functions for manipulating packages of
yaml files, which include one or more KRM objects.

# Colab

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/karlkfi/kinetic/blob/main/kinetic.ipynb)

While designed to be run locally or in CI/CD, you can also experiment with
kinetic in [Google Colab](https://colab.research.google.com/).

When running the notebook in Colab, add the following code cell at the top, to
install dependencies:

```
# Install kpt
!wget https://github.com/GoogleContainerTools/kpt/releases/download/v1.0.0-beta.9/kpt_linux_amd64 -O /usr/local/bin/kpt
!chmod a+x /usr/local/bin/kpt
!kpt version

# Install kubernetes client
!pip install kubernetes

# Enable interactive table display
%load_ext google.colab.data_table
```

Colab should come with `pandas` and `pyyaml` pre-installed.
