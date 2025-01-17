FROM mcr.microsoft.com/playwright

RUN apt update
RUN apt install python3-pip -y

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN playwright install && playwright install-deps
COPY ./background.mp4 /app/assets/mp4/background.mp4

# tricks for pytube : https://github.com/elebumm/RedditVideoMakerBot/issues/142 
# (NOTE : This is no longer useful since pytube was removed from the dependencies)
# RUN sed -i 's/re.compile(r"^\\w+\\W")/re.compile(r"^\\$*\\w+\\W")/' /usr/local/lib/python3.8/dist-packages/pytube/cipher.py

CMD ["python3", "main.py"]
