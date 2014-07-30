1. Why is there no db:setup command in Rakefile, but we call bundle exec rake db:setup; where is the rake command definition? Is there a default Rakefile somewhere in the Gem? I thought a Rake task have to be explicitly defined
in our RakeFile.

2. What exactly does this line do? require File.expand_path('../boot', __FILE__)
I have seen this line in many files. Why do this instead of just do 'require' OR 'require_relative'?
