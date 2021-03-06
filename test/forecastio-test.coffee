chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'forecastio', ->
  process.env.HUBOT_FORECAST_IO_API_KEY = '12345'
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/forecastio')(@robot)

  #it 'registers a respond listener', ->
  #  expect(@robot.respond).to.have.been.calledWith(/weather in Jackson Heights, NY/)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/weather in (.*)/i)
