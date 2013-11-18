require_relative "queue"

module Media
  module Queueable

    def schedule(queue = Queue, params = {})
      queue.enqueue("#{self}.call", params)
    end

    def call(params = {})
      new(params).call
    end
  end
end
