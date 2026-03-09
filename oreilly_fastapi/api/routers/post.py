from fastapi import APIRouter
from fastapi.exceptions import HTTPException
from api.models import post as userpost



router = APIRouter()


@router.post('/post', response_model=userpost.UserPost,status_code=201) # which is standard return code for create
async def create_post(post:userpost.UserPostIn) -> userpost.UserPost:    # returns new Post
    try:
        data = post.model_dump()
        # print(data)
        # simulate autoids:
        last_record_id = len(post_table)
        new_record_id = last_record_id + 1
        new_post = {**data, "id":new_record_id}
        post_table[last_record_id] = new_post
        # MUST return correct type, or will fail with 
        # fastapi.exceptions.ResponseValidationError: 1 validation error:
        # {'type': 'model_attributes_type', 'loc': ('response',), 'msg': 'Input should be a valid dictionary or object to extract fields from', 'input': None}
        return new_post # which is a UserPost...
    except Exception as ex:
        print(ex)


@router.get('/post')
async def root() -> list[userpost.UserPost]:
    # neat. but why not create a list in the forst place?
    return list(post_table.values())


@router.get("/post/{post_id}/comments",response_model=list[userpost.Comment])
async def get_comments_for_post(post_id:int) -> list[userpost.Comment]:
    post = find_post(post_id)
    if not post:
        raise HTTPException(status_code=404, detail="post not found")
    return [
        comment for comment in comment_table.values() if comment['post_id'] == post_id  # list compehension!!!!!!!!!!!!!
    ]


@router.get("/post/{post_id}",response_model=list[userpost.UserPostWithComments])
async def get_post_with_comments(post_id:int):
    post = find_post(post_id)
    if not post:
        raise HTTPException(status_code=404, detail="post not found")
    _out = userpost.UserPostWithComments(
        post=find_post(post_id),
        comments=get_comments_for_post(post_id)
    )
    return _out


@router.post('/comment', response_model=userpost.Comment, status_code=201) # which is standard return code for create
async def create_comment(comment:userpost.CommentIn) -> userpost.Comment:    # returns new Post
    # try:
    #     # we first need to ensure the post actually exists:
  
    post = find_post(comment.post_id)
    if not post:
        print(comment)
        # if a known exception, raise it as soon as possible to prevent
        #  unnecessary processing before the exception is raised
        # he also mentions that raising an exception allows to return something (an exception)
        # that is not the defined return type!!
        raise HTTPException(status_code=404,detail="post not found")
    data = comment.model_dump()
    # he reverted to comment.dict() ?
    # comment.dict
    # actually he didn't - it's deprecated...
    # print(data)
    # simulate autoids:
    last_record_id = len(comment_table)
    new_record_id = last_record_id + 1
    new_comment = {**data, "id":new_record_id}
    comment_table[last_record_id] = new_comment
    return new_comment # which is a Comment...

            
    # except Exception as ex:
    #     print(ex)






# utilities
def find_post(post_id:int) -> userpost.UserPost:
    return post_table.get(post_id,None)


# mock the database as dicts:
post_table = {}
comment_table={}