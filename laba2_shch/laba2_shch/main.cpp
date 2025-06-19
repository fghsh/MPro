#include <iostream>
using namespace std;
extern "C" float SumR(int k, float x);
int main(int argc, char** argv)
{
	int n;
	float x;
	cout << "Input x ,n" << endl;
	cin >> x >> n;
	double R = 0.0;
	R = SumR(n, x);
	cout << "Result" << R << endl;
	return 0;
}
 
extern "C" float fun_el(int k, float x)
{
	float f;
	f = pow(x,-k) / sin(k*x);
	cout << f << endl;
	return f;
}
