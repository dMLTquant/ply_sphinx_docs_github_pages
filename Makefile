
# using the makefile inside the docs folder
# clean the current build then
# test build docs in local environment and 
# start python http.server
live_docs:
	@cp -a ./README.rst ./docsource/README.rst
	make -C ./docsource html && python3 -m http.server 8000 --bind 127.0.0.1 --directory ./docsource/_build/html  

# manual
github_docs:
	rm -rf docs
	mkdir ./docs && touch ./docs/.nojekyll
	@cp -a ./README.rst ./docsource/README.rst
	@make -C ./docsource html
	@cp -a ./docsource/_build/html/. ./docs

# automatic github action push or pull request
github_action_pre_check:
	rm -rf docs
	mkdir ./docs && touch ./docs/.nojekyll
	cp -a ./README.rst ./docsource/README.rst

github_action_docs:
	@make -C ./docsource github_docs html
	@cp -a ./docsource/_build/html/. ./docs