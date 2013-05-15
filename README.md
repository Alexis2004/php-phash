PHP binding for pHash library
=============================

This is a standalone PHP extension created using CodeGen_PECL 1.1.3

Modifying source code
---------------------

You can add custom code to the CodeGen_PECL XML source pHash.xml and then rebuild extension as it shown below.


Building on UNIX etc.
---------------------

To compile your new extension, you will have to execute the following steps:

	$ pear install CodeGen_PECL		# Once before first extension compiling
	$ ./compile.sh


Building on Windows
-------------------

The extension provides the VisualStudio V6 project file pHash.dsp

To compile the extension you open this file using VisualStudio, select the apropriate configuration for your installation (either "Release_TS" or "Debug_TS") and create "php_pHash.dll"

After successfull compilation you have to copy the newly created "pHash.dll" to the PHP extension directory (default: `C:\PHP\extensions`).


Testing
-------

You can now load the extension using a php.ini directive

	extension="pHash.[so|dll]"

or load it at runtime using the dl() function

	dl("pHash.[so|dll]");

The extension should now be available, you can test this using the extension_loaded() function:

	if (extension_loaded("pHash"))
		echo "pHash loaded :)";
	else
		echo "something is wrong :(";

The extension will also add its own block to the output of phpinfo().


Differences with original version
---------------------------------

1. Added function `ph_mh_imagehash` for calculating Marr-Hildreth wavelet based image hash:

		resource ph_mh_imagehash(string file, float alpha=2.0, float level=1.0)

2. Added functions `ph_dct_imagehash_to_array` and `ph_mh_imagehash_to_array` for exporting DCT and Marr-Hildreth pHash from internal resource representation into bytes array:
   
		array ph_dct_imagehash_to_array(resource h)
		array ph_mh_imagehash_to_array(resource h)

3. Build script `compile.sh` for easy extension building and making it compatible with PHP 5.3/5.4.
