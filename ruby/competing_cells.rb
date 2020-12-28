class CompetingCells
  EDGE_STATE = 0

  def run(states, days)
    days.times do
      states = calculate_states(states)
    end
    states
  end

  private

  def calculate_cell(left, right)
    # 0 & 0 = 0
    # 0 & 1 = 1
    # 1 & 0 = 1
    # 1 & 1 = 0

    left ^ right # xor
  end

  def calculate_states(states)
    output = []
    states.each.with_index do |_value, index|
      if index == 0
        # First index
        output[index] = calculate_cell(EDGE_STATE, states[index + 1])
      elsif index == (states.size - 1)
        # Last index
        output[index] = calculate_cell(states[index - 1], EDGE_STATE)
      else
        output[index] = calculate_cell(states[index - 1], states[index + 1])
      end
    end
    output
  end
end