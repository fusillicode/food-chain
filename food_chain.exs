defmodule FoodChain do
  @animals_and_sentences [
    { :fly, ["I don't know why she swallowed the fly. Perhaps she'll die.", "."] },
    { :spider, ["It wriggled and jiggled and tickled inside her.", " that wriggled and jiggled and tickled inside her."] },
    { :bird, ["How absurd to swallow a bird!", "."] },
    { :cat, ["Imagine that, to swallow a cat!", "."] },
    { :dog, ["What a hog, to swallow a dog!", "."] },
    { :goat, ["Just opened her throat and swallowed a goat!", "."] },
    { :cow, ["I don't know how she swallowed a cow!", "."] },
    { :horse, ["She's dead, of course!", "."] }
  ]

  def rock_n_roll :fly do
    Enum.join(["I know an old lady who swallowed a fly.", List.first(@animals_and_sentences[:fly])], "\n") <> "\n"
  end

  def rock_n_roll animal_name do
    current_animal_index = Enum.find_index @animals_and_sentences, fn({x, _}) -> x == animal_name end
    previous_animal_index = current_animal_index - 1
    {:ok, {previous_animal, [previous_animal_first_sentence, previous_animal_second_sentence]}} = Enum.fetch(@animals_and_sentences, previous_animal_index)
    Enum.join([
      "I know an old lady who swallowed a #{animal_name}.",
      List.first(@animals_and_sentences[animal_name]),
      "She swallowed the #{animal_name} to catch the #{previous_animal}#{previous_animal_second_sentence}",
      previous_animal_first_sentence
    ], "\n") <> "\n"
  end
end

# 1 iteration
# I know an old lady who swallowed a {animal}
# {current_animal_first_sentence}
#
# other iterations
# I know an old lady who swallowed a {animal}
# {current_animal_first_sentence}
# She swallowed the {current_animal} to catch the {previous_animal}{current_animal_second_sentence}
# ...
# {first_animal_first_sentence}

# I know an old lady who swallowed a fly.
# I don't know why she swallowed the fly. Perhaps she'll die.
#
# I know an old lady who swallowed a spider.
# It wriggled and jiggled and tickled inside her.
# She swallowed the spider to catch the fly.
# I don't know why she swallowed the fly. Perhaps she'll die.
#
# I know an old lady who swallowed a bird.
# How absurd to swallow a bird!
# She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
# She swallowed the spider to catch the fly.
# I don't know why she swallowed the fly. Perhaps she'll die.
#
# I know an old lady who swallowed a cat.
# Imagine that, to swallow a cat!
# She swallowed the cat to catch the bird.
# She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
# She swallowed the spider to catch the fly.
# I don't know why she swallowed the fly. Perhaps she'll die.
#
# I know an old lady who swallowed a dog.
# What a hog, to swallow a dog!
# She swallowed the dog to catch the cat.
# She swallowed the cat to catch the bird.
# She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
# She swallowed the spider to catch the fly.
# I don't know why she swallowed the fly. Perhaps she'll die.
#
# I know an old lady who swallowed a goat.
# Just opened her throat and swallowed a goat!
# She swallowed the goat to catch the dog.
# She swallowed the dog to catch the cat.
# She swallowed the cat to catch the bird.
# She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
# She swallowed the spider to catch the fly.
# I don't know why she swallowed the fly. Perhaps she'll die.
#
# I know an old lady who swallowed a cow.
# I don't know how she swallowed a cow!
# She swallowed the cow to catch the goat.
# She swallowed the goat to catch the dog.
# She swallowed the dog to catch the cat.
# She swallowed the cat to catch the bird.
# She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
# She swallowed the spider to catch the fly.
# I don't know why she swallowed the fly. Perhaps she'll die.
#
# I know an old lady who swallowed a horse.
# She's dead, of course!
