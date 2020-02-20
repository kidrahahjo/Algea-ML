import math

'''
Optimum Solution obtained for the following params:
    1. Features not used - Mixing Rate, Highest dataset dropped - Not so smart
        Regression, Min depth = 6, Max Depth = 10, Min nodes = 10, Population = 1000
        Function - sqrt(2)*sqrt(x1)/2 + 2*sqrt(x1) + 0.3*sqrt(x1)/square(3) + 3.53553390593274*sqrt(x1)/x4 - 1.82574185835055*x1*sin(x3) + 1.41421356237309*sqrt(2)*x1 - sqrt(x2)*sqrt(x3)*sin(x1) + sqrt(x2)/sin(x2) + sqrt(x2)/sin(x1) - 1.41421356237309*x2*sin(x3) - sqrt(x3)*sin(x1) + sqrt(x3) + 1.03333333333333*x3 + 6.66666666666667*x3/square(x2) + 3*sqrt(x4)*sin(5) - 1.59104041332268*sqrt(x4) + x4 + square(0.1)/3 - square(0.3) - square(2) + 2*sqrt(5)*square(x1)/25 + 0.1*sqrt(3)*sin(x2)/sin(5) + 2.70710678118655*sin(x2) - 2*sin(x4) + sin(5) + 0.316227766016838/sin(5) + 0.821844675272815 + 3*sqrt(5)*sin(2)/5 + sqrt(2) + 0.316227766016838/sin(x3) - 0.29552020666134*square(x1)/square(0.5) - 0.774945745265543/(square(0.3)*sin(x4)) + 0.499167083234141*sin(x4)/x4 + 5.47722557505166/sqrt(x3) + sqrt(2)/sqrt(x2)
    2. Features not used - None
        Regression, Min depth = 6, Max Depth = 10, Min nodes = 10, Population = 1000
        Function - sqrt(x1)*sin(x5) - 0.948683298050514*sqrt(3)*sqrt(x1) + sqrt(3)*sqrt(x1)*square(x4)*sin(x3)/square(3) - 10.0*x1**2*square(0.3) - sqrt(5)*x1*square(0.3)/square(5) + x1 + sqrt(x3) + 0.479425538604203*x3/square(0.5) - 2*sqrt(x5) + square(0.3)*sin(x1) + square(2) + sqrt(5)*square(x2)*sin(x1)*sin(x3)/5 + 0.479425538604203*square(x4)*sin(3) + sin(x1)*sin(x3) + 0.1*sin(x1) + 0.4*sqrt(3)*sin(x1) - 1.45227744249483 + 4*sin(2) + 2*sqrt(3)/x3 + 5.15537546757536*sqrt(x3)*square(0.5)*sin(x1)/(x2*sin(x3)) + 10.0*sqrt(x3)*square(0.5)/(x2*sin(x3)) + 19.2450089729875*sqrt(3)*x3*square(0.3)*square(0.5)*sin(x1)/(x2*sin(x5)) + 10.0*sin(x3)/x2 + 57.7350269189626*x3*square(0.5)*sin(x5)/(sqrt(x1)*x2*sin(5))
    3. Features not used - None
        Matching, Min depth = 6, Max Depth = 10, Min nodes = 10, Population = 1000
        Function - No function obtained
    4. Features not used - Mixing Rate, Dataset dropped smartly (39.15)
        Regression, Min depth = 6, Max Depth = 10, Min nodes = 10, Population = 1000
        Function - -sqrt(x2)/sin(x2) + x2/square(x2) - x3*sin(x4) - 0.547722557505166*x3 + 3.12874446440023*sqrt(x4)*sin(x2) + 4*square(0.1)*sin(x4) - 3*square(0.3) - square(0.5) + square(2)/sin(x4) + square(5)*sin(x4) + 10.0166861316348*sin(5)*sin(x3) - 2*sin(x4) - sqrt(5) + 0.390961208455688 - sin(5) + 11.0*sin(3) + 2*sqrt(2) + 0.625748892880046*sqrt(2)*square(5)/square(0.5) - 1.41421356237309*sin(x1)/square(0.3) + 0.0591040413322679*sqrt(5)*square(0.3)/square(0.1) - 0.29552020666134*sqrt(5)/square(0.1) + 2.0*x3/sqrt(x1)
'''

def sqrt(x):
    return x**0.5
    
def square(x):
    return x**2

def mean_err(x,y,sq=True):
    n = len(x)
    a = []
    for i in range(n):
        if sq:
            z=(x[i]-y[i])**2
        else:
            z=(x[i]-y[i])
        a.append(abs(z))
    return sum(a)

def sin(x):
    return math.sin(x)
        
def f(a1,a2,a3,a4,a5,n):
    y = []
    for i in range(0,n):
        x1=a1[i]
        x2=a2[i]
        x3=a3[i]
        x4=a4[i]
        x5=a5[i]
        z = -0.29552020666134*sqrt(x1)/square(0.1) - x2 + 3.33333333333333*x2/square(x1) - sqrt(x3)/sin(x2) - x3*sin(x4) + sqrt(3)*sqrt(x4)/3 + sqrt(x4) + square(0.3)*sin(x4) - square(0.5) - sqrt(5)*square(0.5)*sin(2)/(5*square(2)) + square(2)/sin(x4)**2 - square(3) - 0.547722557505166*sqrt(2)*square(5) + square(x1)*sin(x4) - 10.0166861316348*sin(2)*sin(x1)*sin(x3)*sin(x4) + 33.3889537721159*sin(x1)*sin(x3) - 3.33333333333333*sin(x1) - 10.0166861316348*sin(x2)*sin(x3) - sin(2)*sin(x2) + sin(3)*sin(x2) + 3.96013315568248*sin(x3) + 10.0166861316348*sin(2)*sin(x3) - 2*sin(x4) - sin(2) + 2*sqrt(2) + 8.69736485052473 - 6/sin(x4) - 3/sin(x2) + 0.0591040413322679*sqrt(5)/square(x3) + 0.625748892880046*sqrt(2)*square(5)/square(0.5) - 1.41421356237309*sin(x1)/square(0.3) - 3.38386336182412*sin(5)**2/x3 + sqrt(5)/x3 + 0.29552020666134*square(0.3)/(sqrt(x2)*square(0.1)) + 2.0*x3/sqrt(x1) 
        y.append(float("{0:.2f}".format(z)))
    return y

x1=[2,2,2,2,2,4,4,4,4,4,6,6,6,6,8,8,8,8]
x2=[5,10,15,20,20,5,5,10,15,20,5,10,15,20,5,10,15,20]
x3=[30,40,50,60,60,40,60,30,60,50,50,60,30,40,60,50,40,30]
x4=[4,5.5,7,8.5,4,7,5.5,8.5,4,5.5,8.5,7,5.5,4,5.5,4,8.5,7]
x5=[60,80,100,120,100,120,80,100,80,60,80,60,120,100,100,120,60,80]
yexp=[43.87,172.41,21.46,39.15,62,29.01,190,56.72,116.86,126.89,36.24,33.49,23.27,11.87,35.44,3.89,14.21,12.44]

n = len(yexp)
y=f(x1,x2,x3,x4,x5,n)

print("Number of Datasets:",n,end='\n\n')
print("Mean Squared Error:",mean_err(y,yexp,False),end='\n\n')
for i in range(n):
    print("Obtained Value: "+str(y[i])+'\t'+"Expected Value: "+str(yexp[i]).expandtabs(20)+'\t'+"Error: "+("{0:.2f}".format(y[i]-yexp[i])).expandtabs(30))