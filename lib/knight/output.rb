# frozen_string_literal: true

# input/output
module Output
  def header
    <<~HEADER
      =========KNIGHT MOVES=========

            By Sean Garwood
            Crofton, MD
            February 15, 2023

            matltc.com
      ==============================
    HEADER
  end

  def bye
    <<~BYE
      ==============================

             Thanks for playing!
          If you're here from TOP,
                keep at it!

      ==============================
    BYE
  end

  def print_path
    path.each { |c| puts c }
  end

  def to_s
    <<~OUTPUT
      #{header}
      one possible shortest path:\n
      #{print_path}
      #{bye}
    OUTPUT
  end
end
