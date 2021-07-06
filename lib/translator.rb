# require modules here
require "yaml"

def load_library (path)
  # code goes here
  
  gov = YAML.load_file(path)
 
  outhash = {"get_meaning" => {}, "get_emoticon" => {}}
  gov.each do |k, v|
    outhash["get_meaning"][v[1]] = k
    outhash["get_emoticon"][v[0]] = v[1]
  end
  outhash
end

def get_japanese_emoticon (path, emoticon)
  # code goes here
  library = load_library (path)
  if (library["get_emoticon"].include? (emoticon))
    return library["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (path, emoticon)
  # code goes here
  library = load_library (path)

  if (library["get_meaning"].include? (emoticon))
    return library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end