def stock_picker(stock_prices)
  best_days = []
  max_profit = 0

  stock_prices.each_with_index do |price, day|
    buy_price = price
    buy_day = day
    
    stock_prices.each_with_index do |price, day|
      sell_price = price
      sell_day = day
      if (sell_day > buy_day)
        profit = (buy_price * -1) + sell_price
      else 
        profit = 0
      end
      if (profit > max_profit)
        max_profit = profit
        best_days[0] = buy_day
        best_days[1] = sell_day
      end
    end
  end
  best_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12