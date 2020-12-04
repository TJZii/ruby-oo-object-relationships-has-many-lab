class Author

    attr_accessor :name, :posts

    @@post_count = 0

    def self.post_count
        @@post_count
    end

    def initialize(name)
        @name = name
        @posts = []
    end
    
    def posts
        Post.all.select { |post| post.author = self}
    end

    def add_post(post)
        @posts << post
        post.author = self
        @@post_count += 1
    end

    def add_post_by_title(title)
        newPost = Post.new(title)
        self.add_post(newPost)
        @@post_count += 1
    end

end