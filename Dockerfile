# Use the Trino base image
FROM trinodb/trino:452

# Create the plugin directory
RUN mkdir -p /usr/lib/trino/plugin/trino-event-logger

# Copy the plugin JAR files
COPY /target/dependency/*.jar /usr/lib/trino/plugin/trino-event-logger/
COPY /target/trino-event-logger*.jar /usr/lib/trino/plugin/trino-event-logger/

# Create event-listener.properties file
RUN echo "event-listener.name=telogger" > /etc/trino/event-listener.properties && \
    echo "telogger.url=jdbc:postgresql://postgres:5432/trino_db_event_listener" >> /etc/trino/event-listener.properties && \
    echo "telogger.user=trino_user" >> /etc/trino/event-listener.properties && \
    echo "telogger.password=trino_password" >> /etc/trino/event-listener.properties

# Create PostgreSQL catalog properties file
RUN mkdir -p /etc/trino/catalog && \
    echo "connector.name=postgresql" > /etc/trino/catalog/postgresql.properties && \
    echo "connection-url=jdbc:postgresql://postgres:5432/trino_db_event_listener" >> /etc/trino/catalog/postgresql.properties && \
    echo "connection-user=trino_user" >> /etc/trino/catalog/postgresql.properties && \
    echo "connection-password=trino_password" >> /etc/trino/catalog/postgresql.properties

# Start Trino
CMD ["/usr/lib/trino/bin/run-trino"]