function [meshNames, meshPaths] = get_mesh_names(meshDir, ext)
% GET_MESH_NAMES - No-extension mesh names and file paths from directory

if length(strfind(ext, '.')) == 0
	ext = ['.' ext];
end
files = arrayfun(@(x) x.name, dir(meshDir), 'UniformOutput', 0);
files = files(cellfun(@(x) ~isdir(fullfile(meshDir, x)), files));
meshes = files(cellfun(@(x) length(strfind(x, ext)) > 0, files));
meshNames = cellfun(@(x) x(1:end-4), meshes, 'UniformOutput', 0);
meshPaths = cellfun(@(x) fullfile(meshDir, x), meshes, 'UniformOutput', 0);

end