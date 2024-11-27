function [] = reset_template()
% Define the paths for CHANGELOG.md, version.txt, and README.md
changelogPath = fullfile(pwd, 'CHANGELOG.md');
versionPath = fullfile(pwd, 'version.txt');
readmePath = fullfile(pwd, 'README.md');

% Reset the content of CHANGELOG.md
fid = fopen(changelogPath, 'w');
if fid ~= -1
    fclose(fid);
    fprintf('CHANGELOG.md has been reset.\n');
else
    error('Could not open CHANGELOG.md for writing.');
end

% Write "0.0.1" to version.txt
fid = fopen(versionPath, 'w');
if fid ~= -1
    fprintf(fid, '0.0.1\n');
    fclose(fid);
    fprintf('version has been set to "0.0.1".\n');
else
    error('Could not open version.txt for writing.');
end

% Reset the content of README.md
fid = fopen(readmePath, 'w');
if fid ~= -1
    fprintf(fid, '# README\n\n');
    fprintf(fid, '![MATLAB checks](../../actions/workflows/matlab-ci.yml/badge.svg)\n');
    fclose(fid);
    fprintf('README.md has been reset.\n');
else
    error('Could not open README.md for writing.');
end

% Delete unneeded workflow file
syncMirrorWorkflowPath = fullfile(pwd, '.github/workflows/sync-mirror.yml');
delete(syncMirrorWorkflowPath)

% Create a figure for the UI
hFig = figure('Name', 'Licenses to Keep', 'Position', [300, 300, 300, 150], 'MenuBar', 'none', 'NumberTitle', 'off');

% Create checkboxes for MIT and APACHE 2.0 licenses
mitCheckbox = uicontrol('Style', 'checkbox', 'String', 'MIT License', 'Position', [50, 80, 100, 30]);
apacheCheckbox = uicontrol('Style', 'checkbox', 'String', 'Apache 2.0 License', 'Position', [50, 50, 150, 30]);

% Create Confirm button
uicontrol('Style', 'pushbutton', 'String', 'Confirm', 'Position', [100, 20, 100, 30], 'Callback', @confirmCallback);

% Callback function for the Confirm button
    function confirmCallback(~, ~)
        % Determine the selected licenses
        mitSelected = get(mitCheckbox, 'Value');
        apacheSelected = get(apacheCheckbox, 'Value');

        % Define the license file paths
        mitLicensePath = fullfile(pwd, 'LICENSE-MIT');
        apacheLicensePath = fullfile(pwd, 'LICENSE-APACHE');

        % Delete the LICENSE-MIT file if MIT is not selected
        if ~mitSelected && exist(mitLicensePath, 'file')
            delete(mitLicensePath);
            fprintf('LICENSE-MIT has been deleted.\n');
        end

        % Delete the LICENSE-APACHE file if Apache 2.0 is not selected
        if ~apacheSelected && exist(apacheLicensePath, 'file')
            delete(apacheLicensePath);
            fprintf('LICENSE-APACHE has been deleted.\n');
        end

        % Close the figure after confirmation
        close(hFig);
    end
end
