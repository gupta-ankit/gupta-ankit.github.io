tag_dir = "blog/tag"

posts_dir = "#{File.dirname(__FILE__)}/../_posts"

def generate_tag_page(tag)
  tag_dir = "#{File.dirname(__FILE__)}/../blog/tag"
  File.open(tag_dir + "/#{tag}.md", 'w') do |f|
    content = <<~EOF
    ---
    layout: tag
    tag: #{tag}
    ---
    EOF
    f.write(content)
  end
end

(Dir["#{posts_dir}/*.html"] + Dir["#{posts_dir}/*.md"]).each do |f|
  File.readlines(f).each do |line|
    if line.start_with?("tags") || line.start_with?("tag")
      _, tags = line.split(":")
      unless tags.empty?
        tags.split.each do |tag|
          if tag.downcase != tag
            puts "#{tag} does not match convention"
          end
          generate_tag_page(tag)
        end
      end
      break
    end
  end
end