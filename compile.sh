#/bin/sh

pecl-gen -f --dir="." pHash.xml && \
	phpize &&
	sed -i -e 's/function_entry/zend_function_entry/g' ./pHash.cpp && \
	./configure && \
	make