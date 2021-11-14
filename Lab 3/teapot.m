% [verts, faces, cindex] = teapotGeometry;

figure
p = patch('Faces', faces, 'Vertices', verts, 'FaceVertexCData', cindex, 'FaceColor', 'interp');
view(-151, 30)
axis equal off
p.FaceAlpha = 1;
p.FaceColor = 'interp';
p.LineStyle = 'none';
colormap("copper")
l = light('Position',[-0.4 0.2 0.9],'Style','infinite');
lighting gouraud
material shiny
l.Position = [-0.1 0.6 0.8];