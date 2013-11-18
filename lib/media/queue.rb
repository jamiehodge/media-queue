require "queue_classic"

require_relative "queueable"
require_relative "worker"

module Media
  Queue = QC.default_queue
end
