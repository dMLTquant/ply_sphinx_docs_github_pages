
# using the makefile inside the docs folder
# clean the current build then
# test build docs in local environment and 
# start python http.server
live_docs:
	@cp -a ./README.rst ./docsource/README.rst
	make -C ./docsource html && python3 -m http.server 8000 --bind 127.0.0.1 --directory ./docsource/_build/html  

github_docs:
	rm -rf docs
	@cp -a ./README.rst ./docsource/README.rst
	@make -C ./docsource html
	@cp -a ./docsource/_build/html/. ./docs