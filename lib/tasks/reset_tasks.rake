desc "Reset task completion status"
task :reset_task_completion => :environment do
  all_tasks = TaskWeekday.all
  all_tasks.each do |task|
    task.update_attributes(complete: false)
  end
end