def brie_tick
  @days_remaining -= 1
  @quality += 1
  @quality += 1 if @days_remaining <= 0

  @quality = @quality.clamp(0,50)
end