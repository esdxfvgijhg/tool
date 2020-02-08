#! /bin/zsh

p=0
for i in {1..50}; do 
	for j in {1..50}; do 
	if [[ $i -ne $j ]]; then
		for k in {1..50}; do 
		if [[ $j -ne $k ]]; then
			for l in {1..50}; do 
			if [[ $k -ne $l ]]; then
				for m in {1..50}; do 
				if [[ $l -ne $m ]]; then
					for n in {1..12}; do 
						for o in {1..12}; do 
						if [[ $n -ne $o ]]; then
							print $p $i $j $k $l $m $n $o;
							((p++));
						fi
						done
					done
				fi
				done
			fi
			done
		fi
		done
	fi
	done
done
