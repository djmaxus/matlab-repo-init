function plan = buildfile()
import matlab.buildtool.tasks.CodeIssuesTask
plan = buildplan(localfunctions);

task = "check";
plan(task) = CodeIssuesTask;
plan.DefaultTasks = task;

end
