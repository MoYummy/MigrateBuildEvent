#!/usr/bin/env ruby
require 'thor'
require_relative 'migrate_cpp'
require_relative 'migrate_dot_net'

class CLI < Thor
  def initialize(*args)
    super
  end
    
  desc 'migrate-cpp SRC.vcxproj [DEST]', 'Migrate SRC (to DEST)'
  def migrate_cpp(src_file, dest_file = nil)
    MigrateCpp.migrate(src_file, dest_file)
  end
    
  desc 'migrate-dot-net SRC.csproj [DEST]', 'Migrate SRC (to DEST)'
  def migrate_dot_net(src_file, dest_file = nil)
    MigrateDotNet.migrate(src_file, dest_file)
  end
end
CLI.start(ARGV)