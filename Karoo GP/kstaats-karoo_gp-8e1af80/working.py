import math

'''
Optimum Solution obtained for the following params:
    Features not used - Mixing Rate
        Regression, Min depth = 6, Max Depth = 10, Min nodes = 10, Population = 1000
        Function - sqrt(2)*sqrt(x1)/2 + 2*sqrt(x1) + 0.3*sqrt(x1)/square(3) + 3.53553390593274*sqrt(x1)/x4 - 1.82574185835055*x1*sin(x3) + 1.41421356237309*sqrt(2)*x1 - sqrt(x2)*sqrt(x3)*sin(x1) + sqrt(x2)/sin(x2) + sqrt(x2)/sin(x1) - 1.41421356237309*x2*sin(x3) - sqrt(x3)*sin(x1) + sqrt(x3) + 1.03333333333333*x3 + 6.66666666666667*x3/square(x2) + 3*sqrt(x4)*sin(5) - 1.59104041332268*sqrt(x4) + x4 + square(0.1)/3 - square(0.3) - square(2) + 2*sqrt(5)*square(x1)/25 + 0.1*sqrt(3)*sin(x2)/sin(5) + 2.70710678118655*sin(x2) - 2*sin(x4) + sin(5) + 0.316227766016838/sin(5) + 0.821844675272815 + 3*sqrt(5)*sin(2)/5 + sqrt(2) + 0.316227766016838/sin(x3) - 0.29552020666134*square(x1)/square(0.5) - 0.774945745265543/(square(0.3)*sin(x4)) + 0.499167083234141*sin(x4)/x4 + 5.47722557505166/sqrt(x3) + sqrt(2)/sqrt(x2)
'''
def sqrt(x):
    return x**0.5
    
def square(x):
    return x**2

def mean_sqr_err(x,y):
    n = len(x)
    a = []
    for i in range(n):
        z=(x[i]-y[i])**2
        a.append(z)
    return sum(a)

def sin(x):
    return math.sin(x)
        
def f(a1,a2,a3,a4,n):
    y = []
    for i in range(0,n):
        x1=a1[i]
        x2=a2[i]
        x3=a3[i]
        x4=a4[i]
        z = sqrt(2)*sqrt(x1)/2 + 2*sqrt(x1) + 0.3*sqrt(x1)/square(3) + 3.53553390593274*sqrt(x1)/x4 - 1.82574185835055*x1*sin(x3) + 1.41421356237309*sqrt(2)*x1 - sqrt(x2)*sqrt(x3)*sin(x1) + sqrt(x2)/sin(x2) + sqrt(x2)/sin(x1) - 1.41421356237309*x2*sin(x3) - sqrt(x3)*sin(x1) + sqrt(x3) + 1.03333333333333*x3 + 6.66666666666667*x3/square(x2) + 3*sqrt(x4)*sin(5) - 1.59104041332268*sqrt(x4) + x4 + square(0.1)/3 - square(0.3) - square(2) + 2*sqrt(5)*square(x1)/25 + 0.1*sqrt(3)*sin(x2)/sin(5) + 2.70710678118655*sin(x2) - 2*sin(x4) + sin(5) + 0.316227766016838/sin(5) + 0.821844675272815 + 3*sqrt(5)*sin(2)/5 + sqrt(2) + 0.316227766016838/sin(x3) - 0.29552020666134*square(x1)/square(0.5) - 0.774945745265543/(square(0.3)*sin(x4)) + 0.499167083234141*sin(x4)/x4 + 5.47722557505166/sqrt(x3) + sqrt(2)/sqrt(x2)
        y.append(float("{0:.2f}".format(z)))
    return y

x1=[2,2,2,2,2,4,4,4,4,4,6,6,6,6,8,8,8,8]
x2=[5,10,15,20,20,5,5,10,15,20,5,10,15,20,5,10,15,20]
x3=[30,40,50,60,60,40,60,30,60,50,50,60,30,40,60,50,40,30]
x4=[4,5.5,7,8.5,4,7,5.5,8.5,4,5.5,8.5,7,5.5,4,5.5,4,8.5,7]
x5=[60,80,100,120,100,120,80,100,80,60,80,60,120,100,100,120,60,80]
yexp=[43.87,172.41,21.46,39.15,62,29.01,190,56.72,116.86,126.89,36.24,33.49,23.27,11.87,35.44,3.89,14.21,12.44]

n = len(yexp)
y=f(x1,x2,x3,x4,n)

print("Number of Datasets:",n,end='\n\n')
print("Mean Squared Error:",mean_sqr_err(y,yexp),end='\n\n')
for i in range(n):
    print("Obtained Value: "+str(y[i])+'\t'+"Expected Value: "+str(yexp[i]).expandtabs(20)+'\t'+"Error: "+("{0:.2f}".format(y[i]-yexp[i])).expandtabs(30))