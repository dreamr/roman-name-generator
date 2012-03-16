#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rubygems'
require 'rake'
require 'rake/testtask'

Dir.glob('lib/tasks/*.rake').each { |file| import file }
task :default => :test