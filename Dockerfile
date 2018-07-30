FROM alpine

ENV var1=value1 var2=value2

RUN echo $var1 > /varvaluefile && \
    echo $var2 >> /varvaluefile
