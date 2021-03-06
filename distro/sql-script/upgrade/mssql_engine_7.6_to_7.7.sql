
-- add historic external task log
create table ACT_HI_EXT_TASK_LOG (
    ID_ nvarchar(64) not null,
    TIMESTAMP_ datetime2 not null,
    EXT_TASK_ID_ nvarchar(64) not null,
    RETRIES_ integer,
    TOPIC_NAME_ nvarchar(255),
    WORKER_ID_ nvarchar(255),
    PRIORITY_ numeric(19,0) NOT NULL DEFAULT 0,
    ERROR_MSG_ nvarchar(4000),
    ERROR_DETAILS_ID_ nvarchar(64),
    ACT_ID_ nvarchar(255),
    ACT_INST_ID_ nvarchar(64),
    EXECUTION_ID_ nvarchar(64),
    PROC_INST_ID_ nvarchar(64),
    PROC_DEF_ID_ nvarchar(64),
    PROC_DEF_KEY_ nvarchar(255),
    TENANT_ID_ nvarchar(64),
    STATE_ integer,
    primary key (ID_)
);

create index ACT_HI_EXT_TASK_LOG_PROCINST on ACT_HI_EXT_TASK_LOG(PROC_INST_ID_);
create index ACT_HI_EXT_TASK_LOG_PROCDEF on ACT_HI_EXT_TASK_LOG(PROC_DEF_ID_);
create index ACT_HI_EXT_TASK_LOG_PROC_DEF_KEY on ACT_HI_EXT_TASK_LOG(PROC_DEF_KEY_);
create index ACT_HI_EXT_TASK_LOG_TENANT_ID on ACT_HI_EXT_TASK_LOG(TENANT_ID_);
create index ACT_IDX_EXT_TASK_ERR_DETAILS ON ACT_RU_EXT_TASK(ERROR_DETAILS_ID_);

-- salt for password hashing
ALTER TABLE ACT_ID_USER
  ADD SALT_ nvarchar(255);