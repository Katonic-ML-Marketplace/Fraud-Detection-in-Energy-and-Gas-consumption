FROM python:3.8.2

RUN mkdir -p data model image

COPY app.py .
COPY data/client_train.csv data/.
COPY data/invoice_train.csv data/.
COPY model/final_model.sav model/.
COPY image/logo.png image/.
COPY image/favicon.ico image/.
COPY requirements.txt .

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error --server.fileWatcherType=none
