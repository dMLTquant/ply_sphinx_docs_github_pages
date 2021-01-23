# using the makefile inside the docs folder
# clean the current build then
# test build docs in local environment and 
# start python http.server
live_docs:
	@cp -a ./README.rst ./docsource/README.rst
	make -C ./docsource html && python3 -m http.server 8000 --bind 127.0.0.1 --directory ./docsource/_build/html  

# build docs
github_docs:
	rm -rf docs
	mkdir ./docs && touch ./docs/.nojekyll
	@cp -a ./README.rst ./docsource/README.rst
	@make -C ./docsource html
	@cp -a ./docsource/_build/html/. ./docs

# automatic github action push or pull request
github_action_docs:
	rm -rf docs
	mkdir docs && touch docs/.nojekyll
	@cp -a README.rst docsource/README.rst
	rm -rf docsource/_build && mkdir docsource/_build 
	rm -rf docsource/_autosummary
	pipx run poetry run sphinx-build -b html docsource docsource/_build/html
	@cp -a docsource/_build/html/* docs
