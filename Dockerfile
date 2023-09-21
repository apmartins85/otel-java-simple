FROM bitnami/java
COPY ./build/libs/java-simple.jar ./
COPY ./opentelemetry-javaagent.jar ./
EXPOSE 8080
ENV JAVA_TOOL_OPTIONS="-javaagent:opentelemetry-javaagent.jar" OTEL_TRACES_EXPORTER=otlp OTEL_METRICS_EXPORTER=otlp OTEL_LOGS_EXPORTER=otlp
ENTRYPOINT ["java","-jar","java-simple.jar"]