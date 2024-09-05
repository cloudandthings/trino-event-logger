CREATE TABLE queries (
                         id INT NOT NULL AUTO_INCREMENT,
                         query_id VARCHAR(50),
                         catalog VARCHAR(256),
                         `schema` VARCHAR(256),
                         environment VARCHAR(256),
                         query_text LONGTEXT NOT NULL,
                         query_plan LONGTEXT,
                         created TIMESTAMP(6) NOT NULL,
                         finished TIMESTAMP(6) NOT NULL,
                         query_state VARCHAR(32) NOT NULL,
                         error_info LONGTEXT,
                         cpu_time BIGINT,
                         failed_cpu_time BIGINT,
                         wall_time BIGINT,
                         queued_time BIGINT,
                         scheduled_time BIGINT,
                         failed_scheduled_time BIGINT,
                         waiting_time BIGINT,
                         analysis_time BIGINT,
                         planning_time BIGINT,
                         execution_time BIGINT,
                         input_blocked_time BIGINT,
                         failed_input_blocked_time BIGINT,
                         output_blocked_time BIGINT,
                         failed_output_blocked_time BIGINT,
                         peak_user_memory_bytes BIGINT,
                         peak_task_user_memory BIGINT,
                         peak_task_total_memory BIGINT,
                         physical_input_bytes BIGINT,
                         physical_input_rows BIGINT,
                         processed_input_bytes BIGINT,
                         processed_input_rows BIGINT,
                         internal_network_bytes BIGINT,
                         internal_network_rows BIGINT,
                         total_bytes BIGINT,
                         total_rows BIGINT,
                         output_bytes BIGINT,
                         output_rows BIGINT,
                         written_bytes BIGINT,
                         written_rows BIGINT,
                         cumulative_memory DOUBLE,
                         failed_cumulative_memory DOUBLE,
                         completed_splits BIGINT,
                         stage_gc_statistics LONGTEXT,
                         PRIMARY KEY(id),
                         UNIQUE INDEX(query_id),
                         INDEX(created, finished)
);