import math

def sqrt(x):
    return x**0.5
    
def square(x):
    return x**2

def sin(x):
    return math.sin(x)
        
def f(x1,x2,x3,x4):
    y = 2*sqrt(x1) + 0.3*sqrt(x1)/square(3) + 3.53553390593274*sqrt(x1)/x4 - 1.82574185835055*x1*sin(x3) + 1.41421356237309*sqrt(2)*x1 - sqrt(x2)*sqrt(x3)*sin(x1) + sqrt(x2)/sin(x2) + sqrt(x2)/sin(x1) - 1.41421356237309*x2*sin(x3) - sqrt(x3)*sin(x1) + sqrt(x3) + sqrt(2)*sqrt(x3)/(2*square(2)) + 1.03333333333333*x3 + 6.66666666666667*x3/square(x2) + 3*sqrt(x4)*sin(5) - 1.59104041332268*sqrt(x4) + x4 + square(0.1)/3 - square(0.3) - square(2) + 2*sqrt(5)*square(x1)/25 + 0.1*sqrt(3)*sin(x2)/sin(5) + sin(x2) - 2*sin(x4) + 0.992270977819637 + 3*sqrt(5)*sin(2)/5 + sqrt(2) + 0.632455532033676/sin(x3) - 0.29552020666134*square(x1)/square(0.5) - 0.774945745265543/(square(0.3)*sin(x4)) + 0.499167083234141*sin(x4)/x4 + 5.47722557505166/sqrt(x3) + sqrt(2)/sqrt(x2)
    return y

x1=6
x2=15
x3=30
x4=5.5
yexp = 23.27
print(f(x1,x2,x3,x4),yexp)

x1=6
x2=20
x3=40
x4=4
yexp=11.87
print(f(x1,x2,x3,x4),yexp)

x1=8
x2=5
x3=60
x4=5.5
yexp=35.44
print(f(x1,x2,x3,x4),yexp)

