describe "Loading the module", () ->
  beforeEach () ->
    module 'Required'
  it "should load the module", () ->
    inject (lazyRequire) ->
      expect(lazyRequire).not.toBe(null)

describe "loading libraries", ->
  lazyRequire = success = null
  beforeEach ->
    success = null
    module 'Required'
    inject ($injector) ->
      lazyRequire = $injector.get 'lazyRequire'
  describe "when loading succeeds", ->
    it "resolves", ->
      expect(success).toBe(null)
      runs () ->
        lazyRequire.load('http://code.jquery.com/jquery-1.11.0.min.js').then ->
          success = true
      waits(500)
      runs () ->
        expect(success).toBe(true)
  describe "when loading fails", ->
    it "rejects", ->
      expect(success).toBe(null)
      runs () ->
        lazyRequire.load('bogus.js').then (->), ->
          success = false
      waits(500)
      runs () ->
        expect(success).toBe(false)

describe "aliasing", ->
  lazyRequire = success = null
  beforeEach ->
    success = null
    module 'Required'
    inject ($injector) ->
      lazyRequire = $injector.get 'lazyRequire'
  describe "when alias is configured", ->
    it "resolves", ->
      expect(success).toBe(null)
      runs () ->
        lazyRequire.load('jquery').then ->
          success = true
      waits(500)
      runs () ->
        expect(success).toBe(true)
