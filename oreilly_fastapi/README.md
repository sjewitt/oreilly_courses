### CLI starting of uvicorn:

`$ uvicorn api.main:app --reload`

### venv best practice

rather than 

`$ python -m venv .` 

(i.e. create venv artefacts at current location) use 

`$ python -m venv .venv` 

to create a hidden folcer with venv artefacts - start with 

`$ source .venv/bin/activare`

# test with a REST client

 - e.g. POSTman, insomnia(?)

## Effectively, TDD with a POST request from Postman to ctreate a - um - post 