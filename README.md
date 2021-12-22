# Kinetic

This is an example of Config as Data, using Jupyter Notebooks to generate and
manipulate Kubernetes Resource Model (KRM) object manifests (YAML).

A example pipeline is defined in `kinetic.ipynb`.

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/karlkfi/kinetic/blob/main/kinetic.ipynb)

# jupyter-krm

This example includes a docker image, which containerizes the requirements for
executing the `kinetic.ipynb` notebook. 

To build this image locally:

```
make image
```

The jupyter-krm image has two modes of operation:

- Interactive mode
- Headless mode

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
