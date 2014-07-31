1. Why is there no db:setup command in Rakefile, but we call bundle exec rake db:setup; where is the rake command definition? Is there a default Rakefile somewhere in the Gem? I thought a Rake task have to be explicitly defined
in our RakeFile.

2. What does the "as" part mean in this syntax? What purpose does it serve?
get  '/l/:short_name', to: 'links#show',   as: 'link'