transpile = require('wisp/lib/engine/node').transpile


module.exports = class WispCompiler
  brunchPlugin: yes
  type: 'javascript'
  extension: 'wisp'

  constructor: (@config) ->
    return

  compile: (data, path, callback) ->
    try
      result = transpile data
      result = result.replace /exports/g, 'module.exports'
    catch err
      error = err
    finally
      callback error, result
