readBodyMesh = stlread('platform.stl'); %read in mesh from stl
 bodyMesh(2).Points = readBodyMesh.Points;
 bodyMesh(2).Conns = readBodyMesh.ConnectivityList;
 bodyMesh(2).newPos = bodyMesh(2).Points(:,3)-0.04; % move body down 3 meters in z-direction
TR = triangulation(bodyMesh(2).Conns,[bodyMesh(2).Points(:,1:2),bodyMesh(2).newPos]); %recreate triangulation

stlwrite(TR,'moved_platform.stl','text') %write new stl