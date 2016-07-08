

// "Radiuses" for the 4 points
p0r=1;
p1r=1;
p2r=1;
p3r=1;
sine30=sin(30);
cosine30=cos(30);

fudge=p0r/4 - 0    ;

// 		p0				+y
//						|
//		p3				o----- +x
//						|
// p2		p1			|

p0=[0,p0r,p0r/-4];
p1=[ cosine30 * p1r, sine30 * -p1r , p1r/-4];
p2=[cosine30 * -p2r , sine30 * -p2r, p2r/-4];
p3=[0,0,p3r*3/4];

echo ("sine30 = ", sine30);
echo ("cosine30 = ", cosine30);
echo ("p0 = ", p0);
echo ("p1 = ", p1);
echo ("p2 = ", p2);
echo ("p3 = ", p3);

polyhedron(	points = [ p0, p1, p2, p3 ],
				triangles = [ [0, 1, 2], [0, 1, 3] , [1, 2, 3], [0, 3, 2] ], convexity = N);

rotate([180,0,0])
polyhedron(	points = [ p0, p1, p2, p3 ],
				triangles = [ [0, 1, 2], [0, 1, 3] , [1, 2, 3], [0, 3, 2] ], convexity = N);

//rotate([0,0,-30])	cube([p1r,0.01,p1r]);
