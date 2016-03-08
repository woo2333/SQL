-- Top SQLs by cpu
SELECT sql_text,
 (cpu_time/1000000) "CPU_Seconds",
  disk_reads "Disk_Reads",
  buffer_gets "Buffer_Gets",
  executions "Executions",
  CASE
    WHEN rows_processed = 0
    THEN NULL
    ELSE ROUND((buffer_gets/NVL(REPLACE(rows_processed,0,1),1)))
  END "Buffer_gets/rows_proc",
  ROUND((buffer_gets/NVL(REPLACE(executions,0,1),1))) "Buffer_gets/executions",
  (elapsed_time     /1000000) "Elapsed_Seconds",
  module "Module"
FROM V$SQL S
WHERE SQL_TEXT LIKE '%Table_name%' -- ToDo ffg. ändern
ORDER BY CPU_TIME DESC nulls last;


-- Top SQLs by executions
SELECT sql_text,
  (cpu_time/1000000) "CPU_Seconds",
  disk_reads "Disk_Reads",
  buffer_gets "Buffer_Gets",
  executions "Executions",
  CASE
    WHEN rows_processed = 0
    THEN NULL
    ELSE ROUND((buffer_gets/NVL(REPLACE(rows_processed,0,1),1)))
  END "Buffer_gets/rows_proc",
  ROUND((buffer_gets/NVL(REPLACE(executions,0,1),1))) "Buffer_gets/executions",
  (elapsed_time     /1000000) "Elapsed_Seconds",
  module "Module"
FROM V$SQL S
WHERE SQL_TEXT LIKE '%Table_name%' -- ToDo ffg. ändern
ORDER BY EXECUTIONS DESC nulls last;


-- Top SQLs by Buffer Gets
SELECT sql_text,
  (cpu_time/1000000) "CPU_Seconds",
  disk_reads "Disk_Reads",
  buffer_gets "Buffer_Gets",
  executions "Executions",
  CASE
    WHEN rows_processed = 0
    THEN NULL
    ELSE ROUND((buffer_gets/NVL(REPLACE(rows_processed,0,1),1)))
  END "Buffer_gets/rows_proc",
  ROUND((buffer_gets/NVL(REPLACE(executions,0,1),1))) "Buffer_gets/executions",
  (elapsed_time     /1000000) "Elapsed_Seconds",
  module "Module"
FROM GV$SQL S
WHERE SQL_TEXT LIKE '%Table_name%' -- ToDo ffg. ändern
ORDER BY buffer_gets DESC nulls last;


-- Top SQL by Buffer gets/rows proc
SELECT sql_text,
  ROUND((cpu_time/1000000),3) "CPU_Seconds",
  disk_reads "Disk_Reads",
  buffer_gets "Buffer_Gets",
  executions "Executions",
  CASE
    WHEN rows_processed = 0
    THEN NULL
    ELSE ROUND((buffer_gets/NVL(REPLACE(rows_processed,0,1),1)))
  END "Buffer_gets/rows_proc",
  ROUND((buffer_gets/NVL(REPLACE(executions,0,1),1))) "Buffer_gets/executions",
  (elapsed_time     /1000000) "Elapsed_Seconds",
  module "Module"
FROM GV$SQL S
WHERE SQL_TEXT LIKE '%Table_name%' -- ToDo ffg. ändern
ORDER BY (BUFFER_GETS/NVL(REPLACE(ROWS_PROCESSED,0,1),1)) DESC nulls last;
