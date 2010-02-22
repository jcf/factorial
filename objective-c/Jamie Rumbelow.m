// Author: Jamie Rumbelow
NSUInteger Factorial(NSUInteger num) {
	if (num <= 1) {
		return 1;
	} else {
		return  num * [Factorial num-1];
	}
}