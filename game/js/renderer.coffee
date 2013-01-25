FPS = 30

class @Renderer
  constructor: (@board, @canvas) ->
    @width = @canvas.width
    @height = @canvas.height

    @context = @canvas.getContext('2d')
    @interval = new Interval(1.0 / FPS * 1000, @loop)

  clear: ->
    @context.fillStyle = '#fff'
    @context.fillRect(0, 0, @width, @height)

  start: -> @interval.start()
  pause: -> @interval.stop()

  translatePosition: (x, y) -> [x * @width, y * @height]

  loop: =>
    @clear()

    ball = @board.ball

    @context.beginPath();
    @context.arc(@translatePosition(ball.x, ball.y)..., 50, 2 * Math.PI, false)
    @context.fillStyle = '#ff0000'

    @context.fill()