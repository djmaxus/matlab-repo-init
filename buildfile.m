function plan = buildfile()

plan = buildplan(localfunctions);
plan.DefaultTasks = ["check","test"];

warning_threshold = 0;

if isMATLABReleaseOlderThan("R2023b")
    plan("test") = matlab.buildtool.Task( ...
    Description="Run tests", ...
    Actions=@(~) assert(runtests().Failed == 0));

    plan("check") = matlab.buildtool.Task(...
    Description="Identify code issues", ...
    Actions=@(~) assert(code_issues(warning_threshold)));

    return;
end

plan("check") = matlab.buildtool.tasks.CodeIssuesTask(WarningThreshold=warning_threshold);
plan("test") = matlab.buildtool.tasks.TestTask;

end

function flag = code_issues(warning_threshold)
    issues = codeIssues().Issues;
    disp(issues);
    errors = find(issues.Severity == 'error');
    warnings = find(issues.Severity == 'warning');
    flag = (numel(errors) == 0) && (numel(warnings) <= warning_threshold);
end
