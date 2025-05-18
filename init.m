function [] = init(year,first_name,last_name,project_title,args)
% Main initialization script
%
%   BSD 3-Clause License
%
%   Copyright (c) 2024, Maksim Elizarev
%
%   Redistribution and use in source and binary forms, with or without
%   modification, are permitted provided that the following conditions are met:
%
%   1. Redistributions of source code must retain the above copyright notice, this
%      list of conditions and the following disclaimer.
%
%   2. Redistributions in binary form must reproduce the above copyright notice,
%      this list of conditions and the following disclaimer in the documentation
%      and/or other materials provided with the distribution.
%
%   3. Neither the name of the copyright holder nor the names of its
%      contributors may be used to endorse or promote products derived from
%      this software without specific prior written permission.
%
%   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
%   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
%   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
%   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
%   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
%   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
%   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
%   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
%   OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
%   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
arguments
    year (1,1) int32
    first_name char
    last_name char
    project_title char
    args.self_delete (1,1) logical = true;
    args.reset_test (1,1) logical = true;
end

print_info();
print_logo();

% Reset repository files
delete_file('CHANGELOG.md');
reset_file('.release-please-manifest.json', '{}\n');
reset_file('.gitattributes', '\n');
delete_file('version.txt');

reset_file('README.md', ...
"# " + project_title + "\n\n" + ...
"![CI](../../actions/workflows/ci.yml/badge.svg?branch=main)\n\n"+...
"## Source Template Repository\n\n"+...
"Generated from matlab-repo-init\n\n"+...
"[`matlab-repo-init`](https://github.com/djmaxus/matlab-repo-init)\n"+...
"![GitHub License](https://img.shields.io/github/license/djmaxus/matlab-repo-init)\n"+...
"<!-- markdownlint-disable MD033 -->\n"+...
"<img src=""doc/matlab-repo-init.png"" width=200 alt=""logo"">\n"+...
"<!-- markdownlint-enable MD033 -->\n"+...
"\n");

if args.reset_test
    reset_file('test.m',"warning('not implemented');\n");
end

delete_file('.github/workflows/sync-mirror.yml');

cspell_default = struct('version','0.2',...
'language','en',...
'words',[],...
'flagWords',[],...
'ignorePaths',["CHANGELOG.md";"**/*.yml";"**/*.m";"**/*.json"],...
'ignoreWords',[]);
reset_file('.cspell.json',jsonencode(cspell_default,PrettyPrint=true)+"\n");

rmdir('.vscode','s'); % TODO keep cff schema in settings
rmdir('.github/actions','s'); % TODO add printed notification

% Set license details
full_name = [first_name, ' ', last_name];
set_license('LICENSE',year,full_name);

% CITATION.cff
reset_cff(first_name,last_name,project_title);

if ~args.self_delete
    return;
end

% self-delete template resetter
this_file = mfilename();
delete(which(this_file));

end

function reset_file(name,lines)
arguments
    name char
    lines = ""
end

full_file = fullfile(pwd, name);
[fid, err_msg] = fopen(full_file, 'w');

if fid == -1
    error(['Could not open ', name,' for writing: ',err_msg]);
end

fprintf(fid, lines);
fclose(fid);
fprintf([name, ' has been reset.\n']);
end

function set_license(file_name,year,full_name)
full_file = fullfile(pwd, file_name);

license_text=read_to_char(file_name);

upd_license_text = regexprep(license_text,'Copyright \(c\) (.*?)\n', ...
    ['Copyright (c) ',num2str(year),', ', full_name,'\n']);

[fid, err_msg] = fopen(full_file,'w');
if fid == -1
    error(['Could not open ', file_name,' for writing: ',err_msg]);
end
fprintf(fid,'%s',upd_license_text);
fclose(fid);
end

function reset_cff(first_name,last_name,project_title)
reset_file('CITATION.cff', ...
"# https://github.com/citation-file-format/citation-file-format\n" + ...
"cff-version: 1.2.0\n" + ...
"type: software\n" + ...
"message: >-\n" + ...
"  If you use this software,\n" + ...
"  please put the copyright NOTICE.txt in your developments\n" + ...
"  and cite it using metadata in this file.\n" + ...
"title: """ + project_title + """\n" + ...
"authors:\n" + ...
"  - family-names: " + last_name + "\n" + ...
"    given-names: " + first_name + "\n" + ...
"# doi:\n"...
);
end

function read_char = read_to_char(file_name)
full_file = fullfile(pwd, file_name);
[fid, err_msg] = fopen(full_file,'r');
if fid == -1
    error(['Could not open ', file_name,' for reading: ',err_msg]);
end
read_char = fread(fid,'*char')';
fclose(fid);
end

function print_info()
[fid, ~] = fopen('version.txt','r');
version_str=fread(fid,'*char')';
fclose(fid);

fprintf('%s%s',"matlab-repo-init v",version_str);
end

function print_logo()
fprintf(...
"                              0000000000000\n"+...
"      $> matlab init      00000           00000\n"+...
"000                    0000                   000\n"+...
"  0000              0000\n"+...
"     0000000000000000\n"+...
"                              0000000000000\n"+...
"                          00000           00000\n"+...
"000                    0000                   000\n"+...
"  0000              0000      0000000000000\n"+...
"     0000000000000000     00000           00000\n"+...
"000                    0000                   000\n"+...
"  0000              0000      $> git commit\n"+...
"     0000000000000000\n"+...
"\n");
end

function delete_file(file_relative_path)
file_fill_path = fullfile(pwd, file_relative_path);
delete(file_fill_path);
fprintf([file_relative_path, ' has been deleted.\n']);
end
