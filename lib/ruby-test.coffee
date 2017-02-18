RubyTestView = require './ruby-test-view'

module.exports =
  config:
    minitestAllCommand:
      title: "Minitest command: Run all tests"
      type: 'string'
      default: "ruby -I test test"
    minitestFileCommand:
      title: "Minitest command: Run test file"
      type: 'string'
      default: "ruby -I test {relative_path}"
    minitestSingleCommand:
      title: "Minitest command: Run current test"
      type: 'string'
      default: "ruby {relative_path} -n \"/{regex}/\""
    testAllCommand:
      title: "Ruby Test command: Run all tests"
      type: 'string'
      default: "ruby -I test test"
    testFileCommand:
      title: "Ruby Test command: Run test in file"
      type: 'string'
      default: "ruby -I test {relative_path}"
    testSingleCommand:
      title: "Ruby Test command: Run test at line number"
      type: 'string'
      default: "ruby -I test {relative_path}:{line_number}"
    rspecAllCommand:
      title: "RSpec command: run all specs"
      type: 'string',
      default: "rspec --tty spec"
    rspecFileCommand:
      title: "RSpec command: run spec file"
      type: 'string',
      default: "rspec --tty {relative_path}"
    rspecSingleCommand:
      title: "RSpec command: run spec at current line"
      type: 'string',
      default: "rspec --tty {relative_path}:{line_number}"
    cucumberAllCommand:
      title: "Cucumber command: Run all features"
      type: 'string',
      default: "cucumber --color features"
    cucumberFileCommand:
      title: "Cucumber command: Run features file"
      type: 'string',
      default: "cucumber --color {relative_path}"
    cucumberSingleCommand:
      title: "Cucumber command: Run features at current line"
      type: 'string',
      default: "cucumber --color {relative_path}:{line_number}"
    pythonAllCommand: #TODO: fixme
      title: "Unittest command: Run all python test files"
      type: 'string',
      default: "python {relative_path}"
    pythonFileCommand:
      title: "Unittest command: Run python file"
      type: 'string',
      default: "python {relative_path}"
    pythonSingleCommand: #TODO: fixme
      title: "Unittest command: Run python file at current line"
      type: 'string',
      default: "python {relative_path}"
    shell:
      type: 'string',
      default: "bash"
    specFramework:
      type: 'string'
      default: ''
      enum: ['', 'rspec', 'minitest']
      description: 'RSpec and Minitest spec files look very similar to each other, and ruby-test often can\'t tell them apart. Choose your preferred *_spec.rb framework.'
    testFramework:
      type: 'string'
      default: ''
      enum: ['', 'minitest', 'test']
      description: 'Minitest test files and Test::Unit files look very similar to each other, and ruby-test often can\'t tell them apart. Choose your preferred *_test.rb framework.'

  rubyTestView: null

  activate: (state) ->
    @rubyTestView = new RubyTestView(state.rubyTestViewState)

  deactivate: ->
    @rubyTestView.destroy()

  serialize: ->
    rubyTestViewState: @rubyTestView.serialize()
