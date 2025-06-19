#include <iostream>
#include <cmath>
using namespace std;

extern "C" float FindMax(float iStep);

int main(int argc, char** argv)
{
	float iStep = 0.05;
	cout << "Input step: ";
	cin >> iStep;
	cout << "\nf(x):\n";
	float Res = 0.0;
	Res = FindMax(iStep);
	cout << "End!\nmax(f(x)) = " << Res << endl;

	return 0;
}

extern "C" float fun(float x)
{
	float f;
	f = (cos(x) + sin(x)) / exp(x * x);
	cout << f << endl;
	return f;
}

