prompt Importing table sys_params...
set feedback off
set define off
insert into sys_params (PARAMGROUP_ID, PARAM_ID, PARAM_NAME, PARAM_VAL, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER, SYS_NAME)
values ('DCMS', 'THQFLAG', 'detail 异常天数', '2', 'detail 异常天数', '4', 'F', 'F', '20171017', '20171017153321', 'dlzl', 'DCMS');

insert into sys_params (PARAMGROUP_ID, PARAM_ID, PARAM_NAME, PARAM_VAL, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER, SYS_NAME)
values ('DCMS', 'IDQFLAG', 'detail 异常天数', '2', 'detail 异常天数', '4', 'F', 'F', '20171017', '20171017153321', 'dlzl', 'DCMS');

prompt Done.
