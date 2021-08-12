# ElfHam 🧝🍖

ElfHam is an extremely simple utility gem that's useful for transform CSVs.

## tldr;

```ruby
require "elf_ham"

# Load your CSV:
elf_ham = ElfHam.new(ARGF.read)

# Filter rows:
elf_ham.select { |row| row["header2"] != "b" }

# Transform rows:
elf_ham.transform do |row|
  row["header3"] = "elfham"
end

# Print the result
puts elf_ham.output
```

## Instructions

1. Install the gem:

   ```sh
   gem install elf_ham
   ```

2. Create a transformation script:

   ```sh
   echo '#!/usr/bin/env ruby

   require "elf_ham"

   puts ElfHam.new(ARGF.read).select do |row|
     row["header2"] != "b"
   end.transform do |row|
     row["header3"] = "elfham"
   end.output' > transform.rb
   ```

3. Make the script executable:

   ```sh
   chmod u+x transform.rb
   ```

4. Edit the script to your liking.

5. Run it:

   ```sh
   transform.rb path/to/your.csv > transformed.csv

   # or

   cat path/to/your.csv | transform.rb > transformed.csv
   ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/jarednorman/elf_ham. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [code of
conduct](https://github.com/jarednorman/elf_ham/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ElfHam project's codebases, issue trackers, chat
rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/jarednorman/elf_ham/blob/main/CODE_OF_CONDUCT.md).
