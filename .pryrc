if defined?(PryDebugger) || defined?(PryByebug)
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
    # Hit Enter to repeat last command
    Pry::Commands.command(/^$/, "repeat last command") do
      _pry_.run_command Pry.history.to_a.last
    end
end

if defined?(Hirb)
  Hirb.enable
end

# from https://gist.github.com/ingemar/112129
# stick it in your ~/.pryrc
# use 'xsel' or 'xclip' if you're in a Linux environment 
#
def _cp(obj = Readline::HISTORY.entries[-2], *options)
  if obj.respond_to?(:join) && !options.include?(:a)
    if options.include?(:s)
      obj = obj.map { |element| ":#{element.to_s}" }
    end
    out = obj.join(", ")
  elsif obj.respond_to?(:inspect)
    out = obj.is_a?(String) ? obj : obj.inspect
  end
 
  if out
    IO.popen('pbcopy', 'w') { |io| io.write(out) } 
    "copied!"
  end
end
 
def _cp_help
  puts <<-HELP
 
 
  _cp - copy stuff to OS X clipboard
 
 
  If no argument is given it takes the last line in HISTORY:
    >> 5.times { "nothing"  }
    # => 5
    >> _cp
    # => "copied!"
    Pasteboard: 5.times { "nothing"  }
 
  Copy the result of the given argument:
    >> _cp %w[foo bar]
    # => "copied!"
    Pasteboard: foo, bar
 
  Convert array elements to symbols:
    >> _cp %w[foo bar], :s
    # => "copied!"
    Pasteboard: :foo, :bar
 
  Copy an array as syntax:
    >> _cp %w[foo bar], :a
    # => "copied!"
    Pasteboard: ["foo", "bar"]
 
 
  Copy a hash:
    >> h = { foo: 'bar', 'foo' => :bar }
    # => {:foo=>"bar", "foo"=>:bar}
    # >> _cp h
    # => "copied!"
    Pasteboard: {:foo=>"bar", "foo"=>:bar}
 
 
HELP
end
