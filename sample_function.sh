#!/bin/bash
hello_all (){
	printf "Hello %s\n" $@;
}
echo parameters provided: $*

pars=($@)
rev_pars=$(echo ${pars[*]} | rev)

echo 'now calling hello_all function ...'

hello_all $rev_pars
