#!/bin/sh
# USAGE
#
#   ./test.sh
#
# DESCRIPTION
#
#   Generate and run a configure file to test the
#   MAY_FC_MODULE_FILENAME_FORMAT macro. All options passed to this
#   script are passed onto configure, so autoconf options or environment
#   variables can be used in the usual way to set the compiler.
#
# LICENSE
#
#   Copyright (c) 2014 Andy May <ajmay81@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

cat << _EOF_ > configure.ac
AC_INIT(test,test)
m4_include([may_fc_module_filename_format.m4])
MAY_FC_MODULE_FILENAME_FORMAT()
AC_OUTPUT
_EOF_
autoconf -Wall configure.ac > configure
rm -rf autom4te.cache configure.ac
chmod +x configure
./configure ${*}
rm -f configure config.log config.status
