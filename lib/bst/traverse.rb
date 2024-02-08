# frozen_string_literal: true

# modules to traverse the tree in different orders:
module Traverse
  def level_order(&block)
    curr = @root
    collected = [@root]
    queue = []
    loop do
      curr.kids.call.each do |k|
        next if k.nil?

        queue << k
        collected << k
      end
      curr = queue.shift
      break if queue.empty?
    end
    return collected.map(&:data) unless block_given?

    block.call(collected.shift) until collected.empty?
  end

  # LNR
  def in_order(queue = [], &block)
    return if nil?

    if block_given?
      left.nil? || left.in_order(&block)
      block.call(self)
      right.nil? || right.in_order(&block)
    else
      left.nil? || left.in_order(queue)
      queue << data
      right.nil? || right.in_order(queue)
    end

    queue unless block_given?
  end

  # NLR
  def pre_order(queue = [], &block)
    return if nil?

    if block_given?
      block.call(self)
      left.nil? || left.pre_order(&block)
      right.nil? || right.pre_order(&block)
    else
      queue << data
      left.nil? || left.pre_order(queue)
      right.nil? || right.pre_order(queue)
    end

    queue unless block_given?
  end

  # LRN
  def post_order(queue = [], &block)
    return if nil?

    if block_given?
      left.nil? || left.post_order(&block)
      right.nil? || right.post_order(&block)
      block.call(self)
    else
      left.nil? || left.post_order(queue)
      right.nil? || right.post_order(queue)
      queue << data
    end

    queue unless block_given?
  end
end
