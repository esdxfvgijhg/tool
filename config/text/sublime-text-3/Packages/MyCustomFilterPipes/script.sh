#!/bin/sh
echo "$1" | sed -z -r '
	s/\n\n+/ŧ/g
	s/(%[^\n]+)/\1þ/g
	s/\.[ \t]*\n/vgyhn/g
	s/}[ \t]*\n/pvkglyhn/g
	
	s/\n[\t ]*/ /g
	s/\t+//g
	
	s/(\.)[ \t]+([^0-9])/\1\n\2/g
	s/([,:;])[ \t]+([^0-9])/\1\n\t\2/g
	
	s/vgyhn/\.\n/g
	s/pvkglyhn/\}\n/g
	s/ŧ/\n\n/g
	s/þ[ \t]*/\n/g
	
	s/\- //g'
