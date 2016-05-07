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
  
  def rock_n_roll do
    Enum.reduce(@animals_and_sentences, [], fn({animal_name, _}, acc) -> acc ++ [song_paragraph(animal_name)] end) |> Enum.join("\n")
  end

  def song_paragraph :fly do
    Enum.join(["I know an old lady who swallowed a fly.", List.first(@animals_and_sentences[:fly])], "\n") <> "\n"
  end
  
  def song_paragraph :horse do
    Enum.join(["I know an old lady who swallowed a horse.", "She's dead, of course!"], "\n") <> "\n"
  end

  def song_paragraph animal_name do
    current_animal_index = Enum.find_index @animals_and_sentences, fn({x, _}) -> x == animal_name end
    {:ok, {_, [first_animal_first_sentence, _]}} = Enum.fetch(@animals_and_sentences, 0)
    Enum.join(
      List.flatten([
        "I know an old lady who swallowed a #{animal_name}.",
        List.first(@animals_and_sentences[animal_name]),
        swallowed_list(Enum.slice(@animals_and_sentences, 0, current_animal_index+1)),
        first_animal_first_sentence
        ]
      ),
      "\n"
    ) <> "\n"
  end

  def swallowed_sentence first_animal_name, {second_animal_name, [_, second_animal_second_sentence]} do
    "She swallowed the #{first_animal_name} to catch the #{second_animal_name}#{second_animal_second_sentence}"
  end
  
  def swallowed_list [a], accumulation do
    accumulation
  end

  def swallowed_list keyword_list do
    swallowed_list keyword_list, []
  end

  def swallowed_list keyword_list, accumulation do
    last_index = Enum.count(keyword_list) - 1
    previous_to_last_index = last_index - 1
    {:ok, {last_animal_name, _}} = Enum.fetch(@animals_and_sentences, last_index)
    {:ok, previous_to_last_animal} = Enum.fetch(@animals_and_sentences, previous_to_last_index)
    new_accumulation = accumulation ++ [swallowed_sentence(last_animal_name, previous_to_last_animal)]
    swallowed_list(Enum.slice(keyword_list, 0, last_index), new_accumulation)
  end
end
