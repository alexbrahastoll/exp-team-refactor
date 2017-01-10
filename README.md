# Team refactor

Refactoring of a provided Ruby class.

Developed by Alex Braha Stoll as part of Reedsy's Engineer Evaluation (this is the answer to Q3).

*You can see the answers for the other questions [here](https://gist.github.com/alexbrahastoll/3b5ccc192936b14c9716914412cf65cc).*

## Improvements

The refactor I did in the `Team` class was driven by the following objectives:

1. To make method names unambiguous: `#<<` became `#add_member` and `#presentation_print` became
`#print_member_names`

2. To make the implementation simpler and shorter: see `#add_member` and `#print_member_names`

3. To use attribute accessors (the advantage over instance variables is to be able to transform
  the data when setting or getting)

4. To replace all print methods with just one. The new `#print_member_names` solves the problem with
a functional programming inspired approach. Besides that, it is also simple and very flexible

## Usage

First, clone this repo.

Then, install the gems by running `bundle install`.

*The only gem actually used is RSpec.*

To run the specs, execute `bundle exec rspec`.
