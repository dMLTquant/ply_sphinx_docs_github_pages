######################################################
Host reStructured Text Sphinx docs on GitHub Pages
######################################################

******************************************************
Step 01: Project folder
******************************************************

.. important:: 
    
    The project folder structure is based on the concept that actual source code will be hosted 
    inside the repository and therefore in order to achieve separation of concern the documentation 
    and all associated workflow is placed in the **docsource** directory while the built site that GitHub Pages
    will serve is saved in the **docs** directory.

.. code:: 

  project-name
  ├── README.rst
  ├── .gitignore
  └── docs
  │   └── .gitkeep
  └── docsource
      └── .gitkeep

******************************************************
Step 02: sphinx-quickstart
******************************************************

.. important:: 
    
    In order to replicate this project the following have been used: 
    ``anaconda navigator (v1.10.0)``,
    ``python (v3.8.5)``,
    ``sphinx-quickstart (v3.4.1)``

**Spinx** comes with a built-in utility to help start the documentation process: `sphinx-doc.org: Getting Started <https://www.sphinx-doc.org/en/master/usage/quickstart.html>`_
Using **sphinx-quickstart** interactive tool you can quickly generate a complete documentation 
directory and sample Makefile to be used with sphinx-build. More information can be 
found at `sphinx-doc.org: sphinx-quickstart <https://www.sphinx-doc.org/en/master/man/sphinx-quickstart.html?highlight=sphinx-quickstart>`_

.. code:: bash

    cd docsource && sphinx-quickstart --no-sep

--no-sep    if specified, create build directory under source directory.

.. code:: 

  project-name
  ├── README.rst
  ├── .gitignore
  ├── docs
  │   └── .gitkeep
  └── docsource
      ├── _build
      │   └── .gitkeep
      ├── _static
      │   └── .gitkeep
      ├── _templates
      │   └── .gitkeep
      ├── .gitkeep
      ├── conf.py
      ├── index.rst
      ├── make.bat
      └── Makefile

******************************************************
Step 03: test if setup has been successful
******************************************************

.. tip:: 
    
    Use **python** built-in **http.server** to serve local files. More information on **python http.server** 
    can be found here `docs.python.org: http.server <https://docs.python.org/3/library/http.server.html>`_

**one line command**

.. code:: bash

    make -C ./docsource html && python3 -m http.server 8000 --bind 127.0.0.1 --directory ./docsource/_build/html

**or using the step by step approach**

.. code:: bash

    cd ./docsource
    make html
    cd ./_build/html
    python3 -m http.server 8000 --bind 127.0.0.1 

Now navigate to `localhost:8000 <http://localhost:8000>`_. 

.. warning:: 
    
    Consider adding the **_build** and **_autosummary** directories to ``.gitignore`` to avoid committing these files to GitHub.
    This folder is only used as a local development/testing environment and will not be used to serve the actual GitHub Pages website.
    This repo contains these files for illustration purpose. 

******************************************************
Step 04: add python module/package and test setup
******************************************************

.. code::

    project-name
    ├── .gitignore
    ├── docs/
    │   └── .gitkeep
    ├── docsource/
    │   ├── .gitkeep
    │   ├── _autosummary/           # sphinx `autosummary` extension generated directory/content
    │   ├── _build/
    │   │   ├── doctrees/           # sphinx generated directory/content during the `make html` command
    │   │   └── html/               # sphinx generated directory/content during the `make html` command
    │   ├── _static/
    │   │   └── .gitkeep
    │   ├── _templates/             # templates needed by `autosummary` and `autodocs`
    │   │   ├── .gitkeep
    │   │   ├── class.rst
    │   │   └── module.rst
    │   ├── conf.py
    │   ├── index.rst
    │   ├── make.bat
    │   └── Makefile
    ├── fibonacci/                  # example python module/package
    │   ├── .DS_Store
    │   ├── __init__.py
    │   ├── approx_fib.py
    │   └── approx_fib_test.py
    ├── Makefile
    ├── multiplication/             # example python module/package
    │   ├── .DS_Store
    │   ├── __init__.py
    │   ├── multiply.py
    │   ├── multiply_again.py
    │   └── multiply_test.py
    ├── mytoolbox/                  # example python module/package (by JamesALeedham/Sphinx-Autosummary-Recursion)
    │   ├── .DS_Store
    │   ├── __init__.py
    │   ├── mymodule1.py
    │   ├── mymodule2.py
    │   └── mysubpackage/
    │       ├── __init__.py
    │       ├── mymodule3.py
    │       └── mysubsubpackage/
    │           ├── __init__.py
    │           └── mymodule4.py
    └── README.rst

04.01 add ``autodoc`` and ``autosummary`` extensions
======================================================

Add the built-in sphinx extensions: **autodoc** and **autosummary** by replacing:

.. code:: python 

    # -- General configuration ---------------------------------------------------

    # Add any Sphinx extension module names here, as strings. They can be
    # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
    # ones.
    extensions = [
    ]

to:

.. code:: python 

    # -- General configuration ---------------------------------------------------

    # Add any Sphinx extension module names here, as strings. They can be
    # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
    # ones.
    extensions = [
        'sphinx.ext.autodoc',  # Core Sphinx library for auto html doc generation from docstrings
        'sphinx.ext.autosummary',  # Create neat summary tables for modules/classes/methods etc
    ]
    # Turn on sphinx.ext.autosummary
    autosummary_generate = True

04.02 turn on ``sys.path``
======================================================

From `conf.py` uncomment the following code to allow ``sphinx`` to look in the correct directory 
where the pythong packages have been saved:

.. code:: python

    import os
    import sys
    sys.path.insert(0, os.path.abspath('..')) 
    # the `..` will move up one directory
    # make sure you are pointing it to the correct relative/absolute path

04.03 create ``autosummary`` templates
======================================================

Sphinx `sphinx-doc.org: autosummary <https://www.sphinx-doc.org/en/1.6/ext/autosummary.html>`_ uses Jinja stub page templates files to generate the documentation: 

- autosummary/base.rst – fallback template
- autosummary/module.rst – template for modules
- autosummary/class.rst – template for classes
- autosummary/function.rst – template for functions
- autosummary/attribute.rst – template for class attributes
- autosummary/method.rst – template for class methods

.. code:: 

    project-name
    ├── docsource/
    │   ├── _templates/             # templates needed by `autosummary` and `autodocs`
    │   │   ├── class.rst
    │   │   └── module.rst

04.05 add the ``autosummary`` directive
======================================================

This has been added to the ``index.rst`` page but can be added to any other page.

.. code:: 

    .. autosummary::
    :toctree: _autosummary
    :caption: API Reference
    :template: module.rst
    :recursive:

    fibonacci
    multiplication
    mytoolbox

04.05 modify the `make` file and remove built cache
======================================================

.. code:: bash

    %: Makefile
	rm -rf _build               # remove _build folder cache during the local build test process
	rm -rf _autosummary         # remove _autosummary folder cache during the local build test process
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

04.06 locally build the docs and preview 
======================================================

Using **python** built-in ``http.server`` module create a new **make** file in the **root** of the project and add the following command:

.. code:: bash

    # using the makefile inside the docs folder
    # clean the current build then
    # test build docs in local environment and 
    # start python http.server
    live_docs:
        @cp -a ./README.rst ./docsource/README.rst
        make -C ./docsource html && python3 -m http.server 8000 --bind 127.0.0.1 --directory ./docsource/_build/html  

This will:

- copy the latest README.rst file (guide) into the ``docsource`` directory
- run ``make html`` to build the documentation into the ``_build`` directory
- the ``make html`` command is actually saved in the ``./docsource/Makfile``
- open a new pythong ``http.server`` to show the static files saved in the previous step

To test the new setup you can run ``make live_docs`` from the **root** of the project.

******************************************************
Step 05: host static website on GitHub Pages
******************************************************

Add the following to the **root Makefile** and run ``make github_docs``:

.. code:: bash

    # manual 
    github_docs:
        rm -rf docs
        mkdir ./docs && touch ./docs/.nojekyll
        @cp -a ./README.rst ./docsource/README.rst
        @make -C ./docsource html
        @cp -a ./docsource/_build/html/. ./docs

    # automatic github action push or pull request
    github_action_docs:
        rm -rf docs
        mkdir ./docs && touch ./docs/.nojekyll
        @cp -a ./README.rst ./docsource/README.rst
        @make -C ./docsource github_docs html
        @cp -a ./docsource/_build/html/. ./docs

This will:

- remove docs folder cache that might have been previously built to allow for a fresh version 
- add a ``.nojekyll`` file to `github.blog: Bypassing Jekyll on GitHub Pages <https://github.blog/2009-12-29-bypassing-jekyll-on-github-pages/>`_
- copy the latest README.rst file (guide) into the ``docsource`` directory
- run ``make html`` to build the documentation into the ``_build`` directory
- the ``make html`` command is actually saved in the ``./docsource/Makfile``
- copy the newly built ``_build`` static files into ``docs`` required by GitHub Pages

.. important:: 

    After the repository and the **docs** directory have been committed to GitHub go to the repository
    settings and select it as the **Source** for GitHub Pages. 

******************************************************
References
******************************************************

This project has been made possible by using/reading:

- `github.com: JamesALeedham/Sphinx-Autosummary-Recursion <https://github.com/JamesALeedham/Sphinx-Autosummary-Recursion>`_
- `docslikecode.com: Yes You Can Use GitHub Pages with Python Sphinx <https://www.docslikecode.com/articles/github-pages-python-sphinx/>`_
- `github.com: annegentle/create-demo <https://github.com/annegentle/create-demo>`_