class KeepDriving
  DRIVING_TIME_THRESHOLD = 12 # hours
  BREAK_TIME_THRESHOLD = 8 # hours

  def run(schedule)
    driving_time = 0

    schedule.size.times do |index|
      index = schedule.size - 1 - index

      start_time = schedule[index][0]
      end_time = schedule[index][1]

      diff = end_time - start_time
      driving_time += diff

      if driving_time >= DRIVING_TIME_THRESHOLD
        return false
      end

      if index > 0
        prev_end_time = schedule[index - 1][1]
        break_time = start_time - prev_end_time
        if break_time >= BREAK_TIME_THRESHOLD
          driving_time = diff
        end
      end
    end

    true
  end
end