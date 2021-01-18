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

**Spinx** comes with a built-in utility to help start the documentation process. 
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
  └── docs
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
    
    Use **python** built-in **http.server** to serve local files. More information on **python http.server** can be found here
`docs.python.org: http.server <https://docs.python.org/3/library/http.server.html>`_

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
    
    Consider adding the **_build** directory to ``.gitignore`` to avoid committing these files to GitHub.
    This folder is only used as a local development/testing environment and will not be used to serve the actual GitHub Pages website.
    This repo contains these files for illustration purpose. 