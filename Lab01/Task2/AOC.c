#include<stdio.h>
#define PI 3.14159

int main() {
    float radius, area;
    printf("Enter the radius of the circle: ");
    scanf("%f", &radius);

    area = 2 * PI * radius * radius;
    
    printf("Area of the circle is %f\n ", area);
    return 0;
}