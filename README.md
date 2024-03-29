# J2 - the minimalist Jinja2 CLI

## Inspiration

I wanted a simple CLI for Jinja2 that operated similarly to Helm:
* Render a template from a file
* Pass custom values from a yaml file
* Override custom values directly on the command line
* Allow custom filters to be provided from a file

This CLI aims to provide these features in the simplest way possible.

## Usage

    ❯ j2 --help
    a minimalist Jinja2 CLI

    usage: j2 [-h] [--values [value.yaml]] [--set my.value=42]
              template

    positional arguments:
      template              Template file to process

    optional arguments:
      -h, --help            show this help message and exit
      --values [value.yaml]
                            Input values file path; "-" to use stdin
      --filters [filters.py]
                            Custom Jinja2 filters from Python file. Loads all
                            top-level functions and registers them as filters.
      --set my.value=42     Set values on the command line. Can be used multiple
                            times.

## Docker

The `j2` CLI is available as a Docker image hosted on Docker Hub:
https://hub.docker.com/r/thecodesmith/j2.

Run `j2` locally in Docker with an alias like this:

    alias j2='docker run -it --rm -w /app -v $PWD:/app thecodesmith/j2 j2'

## Examples

Basic usage:

    j2 manifest.j2 --values values.yaml > manifest.yaml

With custom values overridden on the command line:

    j2 manifest.j2 --values values.yaml --set app.namespace=foo > manifest.yaml

With custom filters defined in a file:

    j2 manifest.j2 --filters filters.py > manifest.yaml

Where the filters file looks like this:

```python
def parentheses(value):
    """ Usage: {{ var | parentheses }} """
    return '(' + value + ')'
```
