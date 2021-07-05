require "yaml"

def load_library(path)
  library = YAML.load_file(path)
  get_meaning = {}
  get_emoticon = {}
  library.each do |key, value|
    get_meaning.merge!(value[1] => key)
    get_emoticon.merge!(value[0] => value[1])
  end
  return_hash = {}
  return_hash.merge!("get_meaning" => get_meaning)
  return_hash.merge!("get_emoticon" => get_emoticon)
  return return_hash
end

def get_japanese_emoticon(path, emoticon)
  load_library(path)["get_emoticon"].each do |key, value|
    if key == (emoticon)
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  load_library(path)["get_meaning"].each do |key, value|
    if key == (emoticon)
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end
