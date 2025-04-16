function [result_new, result_base, upd_base] = struct_diff(struct_new, struct_base)
% struct_diff - Compare two structs and return the differences.
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

    fields_new = fieldnames(struct_new);
    fields_base = fieldnames(struct_base);

    new_diff_base = setdiff(fields_new, fields_base);
    base_diff_new = setdiff(fields_base, fields_new);
    assert(numel(base_diff_new)==0);

    result_new = struct();

    for i = 1:numel(new_diff_base)
        result_new.(new_diff_base{i}) = struct_new.(new_diff_base{i});
    end

    result_base = struct_base;
    upd_base = struct();

    field_intersect = intersect(fields_new, fields_base);
    for i = 1:numel(field_intersect)
        if ~isequal(struct_new.(field_intersect{i}), struct_base.(field_intersect{i}))
            upd_base.(field_intersect{i}) = struct_new.(field_intersect{i});
            result_base = rmfield(result_base, field_intersect{i});
            warning('base struct field updated and placed in the new struct')
        end
    end
end
