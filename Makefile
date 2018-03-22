.DELETE_ON_ERROR:

serialize_cxx  = .generated/serialize.cpp
serialize_java = .generated/serialize.java

default: build_all generate_serializers

.PHONY: build_all
build_all:
	stack build						\
		--ghc-options=-Wall				\
		--ghc-options=-Wcompat				\
		--ghc-options=-Werror				\
		--ghc-options=-Wincomplete-record-updates	\
		--ghc-options=-Wincomplete-uni-patterns		\
		--ghc-options=-Wredundant-constraints

.PHONY: generate_serializers
generate_serializers: build_all $(serialize_cxx)

$(serialize_cxx):
	stack exec -- serialize-gen --cxx
	test -f $@

$(serialize_java):
	stack exec -- serialize-gen --java
	test -f $@

.PHONY: test
test: test_serialize_cxx test_serialize_java

.PHONY: test_serialize_cxx
test_serialize_cxx: $(serialize_cxx) test/serialize_cxx/main.cpp
	mkdir -p .build
	g++ $^ -o .build/$@
	.build/$@

.PHONY: test_serialize_java
test_serialize_java: $(serialize_java)
	# false
