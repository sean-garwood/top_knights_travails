# frozen_string_literal: true

# input/output
module Output
  def header
    <<~HEADER
      =========KNIGHT MOVES=========

            By Sean Garwood
            Crofton, MD
            February 23, 2024

            matltc.com
      ------------------------------
    HEADER
  end

  def bye
    <<~BYE

      ------------------------------

         If you're here from TOP,
               keep at it!

      ==============================
    BYE
  end

  def params
    <<~PARAMS
      If the Knight starts at #{label(origin)}
      and is destined for #{label(destination)}, it will
      take #{number_of_moves} moves:
    PARAMS
  end

  def print_path
    find_sq = ->(c) { label(c) }
    path.each_with_index.map { |c, i| "#{i}. #{find_sq.call(c)}" }.join("\n")
  end

  def to_s
    <<~EXIT
      #{header}
      #{params}
      #{print_path}
      #{bye}
    EXIT
  end
end
