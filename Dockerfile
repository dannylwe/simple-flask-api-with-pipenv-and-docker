FROM python:3.7-alpine

RUN pip install pipenv
COPY Pipfile /tmp
RUN cd /tmp && pipenv lock --requirements > requirements.txt

RUN pip install -r /tmp/requirements.txt
COPY  . /api
WORKDIR /api
ENTRYPOINT ["python"]
CMD ["run.py"]
EXPOSE 9000
