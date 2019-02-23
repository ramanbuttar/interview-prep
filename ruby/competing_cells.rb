class CompetingCells
  def run(states, days)
    days.times do
      states = calculate_state(states)
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

  def calculate_state(states, edge_state=0)
    states.map.with_index do |_value, index|
      if index == 0
        # First index
        calculate_cell(edge_state, states[index + 1])
      elsif index == (states.size - 1)
        # Last index
        calculate_cell(states[index - 1], edge_state)
      else
        calculate_cell(states[index - 1], states[index + 1])
      end
    end
  end
end