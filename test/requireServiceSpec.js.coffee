describe "Loading the module", () ->
  beforeEach () ->
    module 'Required'
  it "should load the module", () ->
    inject (lazyRequire) ->
      expect(lazyRequire).not.toBe(null)
  it "should load jquery", () ->
    inject (lazyRequire) ->
      success = false
      runs () -> 
        lazyRequire.load('http://code.jquery.com/jquery-1.11.0.min.js').then ->
          success = true
      waits(500)
      runs () ->
        expect(success).toBe(true)