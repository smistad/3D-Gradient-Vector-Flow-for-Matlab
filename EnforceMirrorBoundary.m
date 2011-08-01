function [f] = EnforceMirrorBoundary(f)
    % This function enforces the mirror boundary conditions
    % on the 3D input image f. The values of all voxels at 
    % the boundary is set to the values of the voxels 2 steps 
    % inward
    [N M O] = size(f);

    xi = 2:M-1;
    yi = 2:N-1;
    zi = 2:O-1;

    % Coners
    f([1 N], [1 M], [1 O]) = f([3 N-2], [3 M-2], [3 O-2]);

    % Edges
    f([1 N], [1 M], zi) = f([3 N-2], [3 M-2], zi);
    f(yi, [1 M], [1 O]) = f(yi, [3 M-2], [3 O-2]);
    f([1 N], xi, [1 O]) = f([3 N-2], xi, [3 O-2]);

    % Faces
    f([1 N], xi, zi) = f([3 N-2], xi, zi);
    f(yi, [1 M], zi) = f(yi, [3 M-2], zi);
    f(yi, xi, [1 O]) = f(yi, xi, [3 O-2]);   
end
