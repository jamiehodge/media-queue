require "rake"

namespace :queue do

  desc "environment"
  task :environment do
    require_relative "../queue"
    require_relative "../worker"
  end

  desc "job count"
  task count: :environment do
    puts Media::Worker.new.queue.count
  end

  desc "create queue"
  task create: :environment do
    QC::Setup.create
  end

  desc "drop queue"
  task drop: :environment do
    QC::Setup.drop
  end

  desc "work queue"
  task work: :environment do
    trap("INT")  { exit }
    trap("TERM") { @worker.stop }

    @worker = Media::Worker.new
    @worker.start
  end
end
