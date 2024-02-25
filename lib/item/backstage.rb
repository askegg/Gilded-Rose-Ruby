class Item::Backstage < Item
  def tick
    @days_remaining -= 1
    @quality += 1

    case @days_remaining
    when 5..9
      @quality += 1
    when 3..4
      @quality += 2
    when 1
      @quality += 4
    when 0
      @quality += 2
    end

    @quality = 0 unless @days_remaining >= 0
    @quality = @quality.clamp(0, 50)
  end
end
