require "rubygems"
require 'irb/completion'
require "ap"
require "interactive_editor"

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end

