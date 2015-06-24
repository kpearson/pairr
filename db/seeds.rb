
lang = Language.create([{ name: "JavaScript" }, { name: "Java" }, { name: "Ruby" }, { name: "C" }, { name: "CSS" }, { name: "PHP" }, { name: "Python" }, { name: "C++" }, { name: "Objective-C" }, { name: "C#" }, { name: "Shell" }, { name: "R" }, { name: "CoffeeScript" }, { name: "Go" }, { name: "Perl" }, { name: "Scala" }, { name: "VimL" }, { name: "Clojure" }, { name: "Haskell" }, { name: "Erlang" }, { name: "Rust" }, { name: "Swift" }])

users_json = ActiveSupport::JSON.decode(File.read('db/users.json'))
users_json.each do |user|
  u = User.create!(name: user['login'], bio: user["description"], uid: user["id"], provider: "github", image_url: user["avatar_url"], token: "123456789")
  4.times { u.languages << lang.shuffle.sample }
end

