# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every "0 0 31 1,3,5,7,8,10,12 *" do
  runner "UpdateThumbnailWorker.perform_at(0)"
end

every "0 0 30 4,6,9,11 *" do
  runner "UpdateThumbnailWorker.perform_at(0)"
end

every "0 0 28 2 *" do
  runner "UpdateThumbnailWorker.perform_at(0)"
end

# Learn more: http://github.com/javan/whenever
