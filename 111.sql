﻿
insert into data_dic (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values ('20180028', '2126', '05', '上传', '2', 'Yes', null, null, null, null, null, null, null, '01', null, '03', '00', '0', '2014-05-15 00:', '2014-05-15 00:', '99999999', '02', '10008170013', '2014-05-', '10008170013', null, null, '1');
insert into data_dic (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values ('20180029', '2126', 'ignore', '上传', '5', 'No', null, null, null, null, null, null, null, '01', null, '03', '00', '0', '2014-05-15 00:', '2014-05-15 00:', '99999999', '02', '10008170013', '2014-05-', '10008170013', null, null, '1');
update tb_tableinfo set data_dic='2126' where ordnum = 'AS';