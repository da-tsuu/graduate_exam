100.times do |i|
    User.create!(username: "sample#{i + 1}", email: "sample#{i + 1}@example.com", password: "password")
  end
  100.times do |i|
    Post.create!(content: "sample#{i + 1}", youtube_url: "kmVHbV6gPF0", user_id: i + 1)
  end