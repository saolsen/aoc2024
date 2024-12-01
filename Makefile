# I took lots of this from the llamafile Makefiles and the cosmopolitan Makefile
# https://github.com/Mozilla-Ocho/llamafile
# https://https://github.com/jart/cosmopolitan
# 
# On macos use gmake. Can be installed with `brew install make`.

SHELL = /bin/sh
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:
.DELETE_ON_ERROR:
.FEATURES: output-sync

PREFIX = /usr/local
COSMOCC_VERSION = 3.9.7
COSMOCC = .cosmocc/$(COSMOCC_VERSION)
TOOLCHAIN = $(COSMOCC)/bin/cosmo

CC = $(TOOLCHAIN)cc
CXX = $(TOOLCHAIN)c++
AR = $(COSMOCC)/bin/ar.ape
ZIPOBJ = $(COSMOCC)/bin/zipobj
MKDEPS = $(COSMOCC)/bin/mkdeps
INSTALL = install

# make build more deterministic
LC_ALL = C.UTF-8
SOURCE_DATE_EPOCH = 0
export MODE
export TMPDIR
export LC_ALL
export SOURCE_DATE_EPOCH

FILES := $(wildcard src/*)
SRCS = $(filter %.cpp,$(FILES))
HDRS = $(filter %.h,$(AOC2024_FILES))
COMS = $(SRCS:src/%.cpp=o/%.com)

o/%.com: src/%.cpp
	@mkdir -p $(@D)
	$(CXX) -Wall -Wextra -Wshadow --std=c++11 -g -o $@ $<

.PHONY: all
all: o deps
o: $(COMS)

.PHONY: clean
clean:; rm -rf o

.PHONY: clean-deps
clean-deps:; rm -rf o .cosmocc

.PHONY: deps
deps: $(COSMOCC)

$(COSMOCC):
	mkdir -p $(COSMOCC)
	wget --compression=gzip https://github.com/jart/cosmopolitan/releases/download/$(COSMOCC_VERSION)/cosmocc-$(COSMOCC_VERSION).zip
	unzip -o cosmocc-3.9.7.zip -d .cosmocc/3.9.7
	rm cosmocc-3.9.7.zip
