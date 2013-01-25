class @Board 
  constructor: (@tickDelay) ->
    
  
  start: (x0, y0, dx, dy) ->
    [@x, @y, @dx, @dy] = [x0, y0, dx, dy]
    @time = window.setInterval @next_tick, @tickDelay
    @last_time = new Date()

  next_tick: =>
    time = ((new Date())- @last_time)/1000
    console.log "Tick", time
    x = @x + @dx*time
    y = @y + @dy*time

    if x < 0 or x > 1 
      @dy *= -1
      y = @y + @dy*time
    if y < 0 or y > 1 
      @dx *= -1
      x = @x + @dx*time

    [@x, @y] = [x, y]
    @last_time = new Date()

  stop: ->
    window.clearInterval @timer

  ball_position: () ->
    [@x, @y]


