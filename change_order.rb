# 英語の並び変え作成

require 'io/console'
require_relative './ex_sen.rb'
require_relative './opening.rb'
STDIN.binmode
$mode = :open
while true
  break if $mode == :quit

  case $mode
  when :open
    Opening.do
  end
end