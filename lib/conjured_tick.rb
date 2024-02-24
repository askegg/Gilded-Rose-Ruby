def conjured_tick
  @days_remaining -= 1
  @quality -= 1

  case @days_remaining
    when 0..4
      @quality -= 1
  end

  @quality -= 3 if @days_remaining < 0
  @quality = @quality.clamp(0,50)
end