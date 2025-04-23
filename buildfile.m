function plan = buildfile()

plan = buildplan(localfunctions);
plan.DefaultTasks = ["check","test"];

warning_threshold = Inf;
if warning_threshold ~= 0
    warning('Code Analyzer warnings are allowed for this codebase');
end

if isMATLABReleaseOlderThan("R2023b")
    plan("test") = matlab.buildtool.Task( ...
    Description="Run tests", ...
    Actions=@(~) assert(run_tests()) );

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

function flag = run_tests()
    flag = true;
    test_results = runtests("IncludeSubfolders",true);
    for test_result=test_results
        flag = flag & (test_result.Failed == 0);
    end
end
