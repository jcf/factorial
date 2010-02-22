/* Author: Jamie Rumbelow */
factorial := method(n, 
	if(n == 0, return 1)
	res := 1
	1 to(n) foreach(i, res = res * i) 
)