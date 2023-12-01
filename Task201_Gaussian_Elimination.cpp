#include<iostream>
using namespace std;

int main()
{
    double time[]={5,8,12};
    double velocity[]={106.8,177.2,279.2};

    double M[3][3]={{25,5,1},{64,8,1},{144,12,1}};
    double X[3]={106.8,177.2,279.2};

    int i,j;
    for(i=0;i<3;i++)
    {
        for(j=i+1;j<3;j++)
        {
            double ratio=M[j][i]/M[i][i];
            for(int k=0;k<3;k++)
            {
                M[j][k] -= ratio*M[i][k];
            }
            X[j] -= ratio *X[i];
        }
    }
    double b[3];
    for(i=2;i>=0;i--)
    {
        b[i]=X[i];
        for(j=i+1;j<3;j++)
        {
            b[i] -= M[i][j] * b[j];
        }
        b[i] /= M[i][i];
    }

    cout<<"a1: "<< b[0] <<endl;
    cout<<"a2: "<< b[1] <<endl;
    cout<<"a3: "<< b[2] <<endl;

    double t=6;
    double v=b[0]*t*t + b[1] * t + b[2];

    cout<<"velocity at t= 6 sec is "<<v<<endl;
    return 0;
}
