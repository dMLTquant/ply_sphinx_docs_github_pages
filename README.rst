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

