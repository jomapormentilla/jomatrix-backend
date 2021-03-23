class PostSerializer
    def initialize(post_object)
        @post = post_object
    end

    def to_serialized_json
        @post.to_json(
            :include => [
                :comments,
                :likes
            ],
            :except => [
                
            ]
        )
    end
end