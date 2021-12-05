# encoding: utf-8
# 英語の並び変え作成
require 'io/console'
require_relative './ex_sen.rb'
require_relative './opening.rb'
require_relative './data.rb'
require_relative './play.rb'

STDIN.binmode
$mode = :open
while true
  break if $mode == :quit

  case $mode
  when :open
    Opening.do
  when :play
    Play.do
  when :data
    Data.do
  end
end