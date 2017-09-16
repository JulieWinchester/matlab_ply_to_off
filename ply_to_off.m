path(pathdef);
addpath(path,genpath(pwd));

meshDir = '/Users/julie/data/collate_simp_smooth';
outDir = '/Users/julie/data/collate_off';
ext = '.ply';

[meshNames, meshPaths] = get_mesh_names(meshDir, ext);

for i = 1:length(meshPaths)
	disp(i);
	disp(meshNames{i});
	[V, F] = read_ply(meshPaths{i});
	write_off(fullfile(outDir, [meshNames{i} '.off']), V, F);
end