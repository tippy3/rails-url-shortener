# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 公開前に必ずパスワードを変更すること
User.create(name: "tippy", password: "initialpassword", admin: true)
User.create(name: "admin", password: "initialpassword", admin: true)
3.times do |i|
  User.create(name: "user#{i+1}", password: "initialpassword", admin: false)
end

Url.create(short_url: "cal", long_url: "https://calendar.google.com/calendar/r/month", user_id: 1)
Url.create(short_url: "sfs", long_url: "https://vu.sfc.keio.ac.jp/sfc-sfs/", user_id: 1 )
Url.create(short_url: "rails", long_url: "http://web.sfc.keio.ac.jp/~hattori/script-lang/", user_id: 5)
Url.create(short_url: "progate", long_url: "https://prog-8.com/dashboard", user_id: 2)
Url.create(short_url: "hhlab", long_url: "https://github.com/hhlab", user_id: 3)
Url.create(short_url: "maps", long_url: "https://www.google.co.jp/maps/", user_id: 2)
Url.create(short_url: "kosmos", long_url: "https://search.lib.keio.ac.jp/discovery/search?vid=81SOKEI_KEIO:KEIO&lang=ja", user_id: 3)
Url.create(short_url: "lib", long_url: "http://www.sfc.lib.keio.ac.jp/", user_id: 4)
Url.create(short_url: "drive", long_url: "https://drive.google.com/drive/my-drive", user_id: 4)
Url.create(short_url: "s15499dt", long_url: "https://web.sfc.keio.ac.jp/~s15499dt/", user_id: 5)
Url.create(short_url: "0120", long_url: "https://drive.google.com/file/d/1v2C5wZ_fbO38evEbV0Em09RxK95GlO2V/view?usp=sharing", user_id: 1)
Url.create(short_url: "repo", long_url: "https://github.com/tippy3/url-shortener", user_id: 1)
