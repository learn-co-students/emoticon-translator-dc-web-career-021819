# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  library = YAML.load_file(file_path)
  output = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |emotion, emoticons|
    en_emoticon = emoticons[0]
    ja_emoticon = emoticons[1]
    output["get_meaning"][ja_emoticon] = emotion
    output["get_emoticon"][en_emoticon] = ja_emoticon
  end
output
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].has_key?(emoticon)
    return library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"].has_key?(emoticon)
    return library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  
end