from pydantic import BaseModel

# this is the shit I was struggling with yesterday, with/without a thing ID...
class UserPostIn(BaseModel):
    body:str


class UserPost(UserPostIn):
    id:int


# now we want a comment on a post:
class CommentIn(BaseModel):
    body:str
    post_id:int


# and we need a return value with an ID
class Comment(CommentIn):
    id:int


# and a wrapper class for post with comments:
# my guess:
class UserPostWithCommentsSilas(UserPost):
    id:int                  
    comments:list[Comment]

# he does this (which was my initial guess)
class UserPostWithComments(BaseModel):
    post: UserPost                  
    comments: list[Comment]