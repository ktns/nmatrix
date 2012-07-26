# = NMatrix
#
# A linear algebra library for scientific computation in Ruby.
# NMatrix is part of SciRuby.
#
# NMatrix was originally inspired by and derived from NArray, by
# Masahiro Tanaka: http://narray.rubyforge.org
#
# == Copyright Information
#
# SciRuby is Copyright (c) 2010 - 2012, Ruby Science Foundation
# NMatrix is Copyright (c) 2012, Ruby Science Foundation
#
# Please see LICENSE.txt for additional copyright notices.
#
# == Contributing
#
# By contributing source code to SciRuby, you agree to be bound by
# our Contributor Agreement:
#
# * https://github.com/SciRuby/sciruby/wiki/Contributor-Agreement
#
# == extconf.rb
#
# Configuration file for the NMatrix C/C++ extension.

require 'mkmf'

# Configure our compilers and compiler options.
#
# FIXME: Get this to work with clang and clang++.

#$CFLAGS							= '-I. -fPIC -Wall -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector -mtune=native'
CONFIG['CXXFLAGS']	= '-std=c++11 -O3'

#if clang_pp_path = find_executable('clang++')
#	CONFIG['CC']					= clang_pp_path
#	CONFIG['CXX']					= clang_pp_path
#	CONFIG['LDSHARED']		= 'llvm-link -shared'
#	CONFIG['LDSHAREDXX']	= 'llvm-link -shared'
#	
#	CONFIG['CXXFLAGS']	+= ' -O4'
#	$LDFLAGS	= '-O4'
#	
#else
#	CONFIG['CXXFLAGS'] += ' -O3'
#end

# Necessary header files.
find_header('ruby/config.h') 

# List the source files that need to be compiled.
$srcs = [
	'data/data.cpp',
	
	'storage/storage.cpp',
	'storage/dense.cpp'
]

$objs = $srcs.map { |f| f.sub('.cpp', '.o') }

# Create the actual Makefile.
create_makefile('NMatrix')
