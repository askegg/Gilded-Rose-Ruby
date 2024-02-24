class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    if @name == "Normal Item"
      return normal_tick
    end

    if @name == "Aged Brie"
      return brie_tick
    end

    if @name == "Sulfuras, Hand of Ragnaros"
      return sulfuras_tick
    end

    if @name == "Backstage passes to a TAFKAL80ETC concert"
      return backstage_tick
    end

    if @name == "Conjured Mana Cake"
      return conjured_tick
    end

    if @name != "Aged Brie" and @name != "Backstage passes to a TAFKAL80ETC concert"
      if @quality > 0
        if @name != "Sulfuras, Hand of Ragnaros"
          @quality = @quality - 1
        end
      end

    else
      if @quality < 50
        @quality = @quality + 1

        if @name == "Backstage passes to a TAFKAL80ETC concert"
          if @days_remaining < 11
            if @quality < 50
              @quality = @quality + 1
            end
          end

          if @days_remaining < 6
            if @quality < 50
              @quality = @quality + 1
            end
          end
        end
      end
    end

    if @name != "Sulfuras, Hand of Ragnaros"
      @days_remaining = @days_remaining - 1
    end

    if @days_remaining < 0
      if @name != "Aged Brie"
        if @name != "Backstage passes to a TAFKAL80ETC concert"
          if @quality > 0
            if @name != "Sulfuras, Hand of Ragnaros"
              @quality = @quality - 1
            end
          end
        else
          @quality = @quality - @quality
        end

      else
        if @quality < 50
          @quality = @quality + 1
        end
      end

    end
  end
end

def normal_tick
  @days_remaining -= 1
  @quality -= 1 if @quality > 1
  @quality -= 1 if @days_remaining < 0
end

def brie_tick
  @days_remaining -= 1
  @quality += 1
  @quality += 1 if @days_remaining <= 0

  @quality = @quality.clamp(0,50)
end

def sulfuras_tick
end

def backstage_tick
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

  @quality = @quality.clamp(0,50)
  @quality = 0 unless @days_remaining >= 0
end

def conjured_tick
  @days_remaining -= 1

  case @days_remaining
    when 0..4
      @quality -= 2
  end

  @quality -= 4 if @days_remaining < 0
  @quality = @quality.clamp(0,50)
end
