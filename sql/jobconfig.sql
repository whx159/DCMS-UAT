prompt Importing table report_job_config...
set feedback off
set define off
insert into report_job_config (JOB_ID, JOB_NAME, JOB_CLASS_NAME, JOB_TIME, JOB_STAUTS, JUST_WORKDATE_RUN, JOB_REMARK, JOB_LST_TM, JOB_LST_TRL, SYSNAME, COUNTRY, STATUS)
values ('100012', 'DetailExceptionReportGeneJob', 'com.huateng.hsbc.job.THDetailExceptionReportGeneJog', '0 0 * * * ?', '1', 'N', 'DetailExceptionReportGeneJob', '20180824101701', 'test1', 'OTHER', 'THHBAP', '1');

insert into report_job_config (JOB_ID, JOB_NAME, JOB_CLASS_NAME, JOB_TIME, JOB_STAUTS, JUST_WORKDATE_RUN, JOB_REMARK, JOB_LST_TM, JOB_LST_TRL, SYSNAME, COUNTRY, STATUS)
values ('100013', 'DetailExceptionReportGeneJob', 'com.huateng.hsbc.job.IDDetailExceptionReportGeneJog', '0 0 * * * ?', '1', 'N', 'DetailExceptionReportGeneJob', '20180824101701', 'test1', 'OTHER', 'IDHBAP', '1');

prompt Done.
