# python package install
FROM kennethreitz/pipenv as build

ADD . /app
WORKDIR /app

RUN pipenv install \
 && pipenv lock -r > requirements.txt \
 && pipenv run python setup.py bdist_wheel

# runnable container
FROM python:3.9-alpine

COPY --from=build /app/dist/*.whl .
COPY j2 /usr/local/bin/j2

RUN python3 -m pip install *.whl

CMD ["j2"]
