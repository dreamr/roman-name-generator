gem 'minitest'

require 'minitest/spec'
require 'minitest/autorun'
require 'mocha'
require 'turn'
require 'simplecov'
SimpleCov.start

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
$:.unshift File.join(File.dirname(__FILE__), '..', 'test')

require 'roman_name_generator'

MiniTest::Spec.class_eval do
  def self.shared_examples
    @shared_examples ||= {}
  end
end

module MiniTest::Spec::SharedExamples
  def shared_examples_for(desc, &block)
    MiniTest::Spec.shared_examples[desc] = block
  end

  def it_must_behave_like(desc)
    self.instance_eval do
      MiniTest::Spec.shared_examples[desc].call
    end
  end
end

Object.class_eval { include(MiniTest::Spec::SharedExamples) }

Turn.config do |c|
 # use one of output formats:
 # :outline  - turn's original case/test outline mode [default]
 # :progress - indicates progress with progress bar
 # :dotted   - test/unit's traditional dot-progress mode
 # :pretty   - new pretty reporter
 # :marshal  - dump output as YAML (normal run mode only)
 # :cue      - interactive testing
 c.format  = :outline
 # turn on invoke/execute tracing, enable full backtrace
 c.trace   = true
 # use humanized test names (works only with :outline format)
 c.natural = true
end
