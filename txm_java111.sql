/*
Navicat MySQL Data Transfer

Source Server         : 29
Source Server Version : 50540
Source Host           : 10.23.0.29:3306
Source Database       : txm_java

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2021-03-11 18:20:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bnd_apply_bom
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_bom`;
CREATE TABLE `bnd_apply_bom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gds_seqno` decimal(19,0) DEFAULT NULL COMMENT '序号',
  `endprd_seqno` decimal(19,0) DEFAULT NULL COMMENT '成品序号',
  `endprd_gds_mtno` varchar(30) DEFAULT NULL COMMENT '成品料号',
  `mtpck_seqno` decimal(19,0) DEFAULT NULL COMMENT '料件序号',
  `mtpck_gds_mtno` varchar(30) DEFAULT NULL COMMENT '料件料号',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '单耗版本号',
  `dec_cm` decimal(19,9) DEFAULT NULL COMMENT '凈耗',
  `dec_dm` decimal(18,9) DEFAULT NULL COMMENT '有形损耗率',
  `intgb_loss_rate` decimal(18,9) DEFAULT NULL COMMENT '无形损耗率',
  `bond_mtpck_prpr` decimal(19,9) DEFAULT NULL COMMENT '保税料件比率',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `bom_versions` varchar(30) DEFAULT NULL COMMENT '开始有效日期Z(8)',
  `exe_markcd` varchar(1) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL COMMENT '结束有效日期Z(8)',
  `modf_markcd` varchar(1) DEFAULT NULL,
  `bizop_etpsno` varchar(10) DEFAULT NULL,
  `etps_preent_no` varchar(64) DEFAULT NULL,
  `item_type` varchar(1) DEFAULT NULL,
  `opers_status` varchar(1) DEFAULT NULL,
  `file_no` varchar(18) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`endprd_gds_mtno`,`mtpck_gds_mtno`,`ucns_verno`,`bom_versions`,`expiration_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_apply_edi_flag
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_edi_flag`;
CREATE TABLE `bnd_apply_edi_flag` (
  `id` int(10) NOT NULL DEFAULT '0',
  `qualification_flag` varchar(1) DEFAULT NULL COMMENT '资质备案标志',
  `ehandbook_flag` varchar(1) DEFAULT NULL COMMENT '账册备案标志',
  `declare_flag` varchar(1) DEFAULT NULL COMMENT '报核备案标志',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_apply_ehandbook_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_ehandbook_d`;
CREATE TABLE `bnd_apply_ehandbook_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gds_seqno` decimal(19,0) DEFAULT NULL COMMENT '序号',
  `item_no` varchar(15) DEFAULT NULL COMMENT '料号',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `item_spec` varchar(300) DEFAULT NULL COMMENT '规格型号',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '申报计量单位',
  `lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '法定计量单位',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '第二法定计量单位',
  `currency` varchar(3) DEFAULT NULL COMMENT '币制',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商品编码',
  `lvyrlf_modecd` varchar(6) DEFAULT NULL COMMENT '征免方式',
  `etps_exe_markcd` varchar(4) DEFAULT NULL COMMENT '企业执行标志',
  `modf_markcd` varchar(4) DEFAULT NULL COMMENT '法检',
  `company_code` varchar(10) DEFAULT NULL COMMENT '备注',
  `etps_preent_no` varchar(64) DEFAULT NULL,
  `item_type` varchar(1) DEFAULT NULL,
  `opers_status` varchar(1) DEFAULT NULL,
  `file_no` varchar(18) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_apply_ehandbook_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_ehandbook_h`;
CREATE TABLE `bnd_apply_ehandbook_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_no` varchar(18) DEFAULT NULL,
  `data_state` varchar(1) DEFAULT NULL,
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '账册变更次数',
  `etps_preent_no` varchar(64) DEFAULT NULL COMMENT '企业内部编号',
  `bizop_etps_sccd` varchar(18) DEFAULT NULL COMMENT '经营单位社会信用代码',
  `bizop_etpsno` varchar(10) DEFAULT NULL COMMENT '经营单位编码',
  `bizop_etps_nm` varchar(512) DEFAULT NULL COMMENT '经营单位名称',
  `prcs_etps_sccd` varchar(18) DEFAULT NULL COMMENT '加工单位社会信用代码',
  `prcs_etpsno` varchar(10) DEFAULT NULL COMMENT '加工单位编码',
  `prcs_etps_nm` varchar(512) DEFAULT NULL COMMENT '加工单位名称',
  `dec_dm` varchar(18) DEFAULT NULL COMMENT '申报单位社会信用代码',
  `dcl_etpsno` varchar(10) DEFAULT NULL COMMENT '申报单位编码',
  `dcl_etps_nm` varchar(512) DEFAULT NULL COMMENT '申报单位名称',
  `dcl_etps_typecd` varchar(25) DEFAULT NULL COMMENT '申报单位类型',
  `input_code` varchar(10) DEFAULT NULL COMMENT '录入单位编码',
  `input_credit_code` varchar(18) DEFAULT NULL COMMENT '录入单位社会信用代码',
  `input_name` varchar(512) DEFAULT NULL COMMENT '录入单位名称',
  `ems_type` varchar(25) DEFAULT NULL COMMENT '账册类型',
  `finish_valid_time` date DEFAULT NULL COMMENT '账册结束有效期',
  `dcl_typecd` varchar(25) DEFAULT NULL COMMENT '申报类型',
  `actl_imp_total_amt` decimal(19,5) DEFAULT NULL COMMENT '实际进口总金额',
  `actl_exp_total_amt` decimal(19,5) DEFAULT NULL COMMENT '实际出口总金额',
  `apcret_not` varchar(64) DEFAULT NULL COMMENT '批准证编号',
  `netwk_etps_arcrp_no` varchar(64) DEFAULT NULL COMMENT '企业档案库编号',
  `max_tovr_amt` decimal(25,5) DEFAULT NULL COMMENT '最大周转金额（万美金)',
  `dcl_time` date DEFAULT NULL COMMENT '申报日期',
  `rcnt_vclr_time` date DEFAULT NULL COMMENT '最近核销日期',
  `input_date` date DEFAULT NULL COMMENT '录入日期',
  `ucns_dcl_segcd` varchar(8) DEFAULT NULL COMMENT '单耗申报环节',
  `vclr_prid_val` decimal(19,5) DEFAULT NULL COMMENT '核销周期',
  `ucns_verno_cntr_fla` varchar(1) DEFAULT NULL COMMENT '单耗版本号控制标志',
  `material_count` decimal(19,5) DEFAULT NULL COMMENT '料件项数',
  `endprd_item_cnt` decimal(19,5) DEFAULT NULL COMMENT '成品项数',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `master_cuscd` varchar(4) DEFAULT NULL COMMENT '主管海关',
  `imp_max_account` decimal(19,5) DEFAULT NULL COMMENT '最大进口金额（美元）',
  `vclr_typecd` varchar(1) DEFAULT NULL COMMENT '核销类型',
  `usagetypecd` varchar(4) DEFAULT NULL COMMENT '账册用途',
  `putrec_appr_time` date DEFAULT NULL COMMENT '备案批准日期',
  `cash_payment_date` date DEFAULT NULL COMMENT '变更批准日期',
  `exe_markcd` varchar(4) DEFAULT NULL COMMENT '账册执行标志',
  `ehvtyp` varchar(1) DEFAULT NULL COMMENT '核销方式',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`etps_preent_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_apply_invt_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_invt_d`;
CREATE TABLE `bnd_apply_invt_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部清單編號',
  `filing_serial_no` int(19) DEFAULT NULL COMMENT '備案序號(對應底賬序號）',
  `item_no` varchar(30) DEFAULT NULL COMMENT '商品料號',
  `declare_qty` decimal(19,3) DEFAULT NULL COMMENT '申報數量',
  `legal_qty` double(19,5) DEFAULT NULL COMMENT '法定數量',
  `sec_legal_qty` double(19,5) DEFAULT NULL COMMENT '第二法定數量',
  `unit_price` decimal(19,5) DEFAULT NULL COMMENT '企業申報單價',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣制',
  `country_code` varchar(3) DEFAULT NULL COMMENT '原產國 (地區)',
  `final_destination_country` varchar(3) DEFAULT NULL COMMENT '最終目的國',
  `exempting_method` varchar(1) DEFAULT NULL COMMENT '征免方式',
  `ucns_verno` decimal(8,0) DEFAULT NULL COMMENT '單耗版本號',
  `customs_declaration_commodity_no` double(19,0) DEFAULT NULL COMMENT '報關單商品序號',
  `gross_weight` decimal(19,3) DEFAULT NULL COMMENT '毛重',
  `net_weigh` decimal(19,3) DEFAULT NULL COMMENT '淨重',
  `rmk` varchar(512) DEFAULT NULL COMMENT '備注',
  `enterprise_declared_total_price` double(19,2) DEFAULT NULL COMMENT '企業申報總價',
  `circulation_declaration_no` double(19,0) DEFAULT NULL COMMENT '流轉申報表序號',
  `mis_bill_id` varchar(30) DEFAULT NULL COMMENT '內部單據編號',
  `batch_no` varchar(30) DEFAULT NULL COMMENT '批次號',
  `exg_version_mis` varchar(30) DEFAULT NULL COMMENT '工單單耗版本號',
  `gds_seqno` decimal(19,0) DEFAULT NULL COMMENT '商品序號',
  `doc_po_no` varchar(25) DEFAULT NULL COMMENT '內部業務單據編號',
  `invoice_no` varchar(30) DEFAULT NULL COMMENT '發票號碼',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '商品名稱',
  `item_spec` varchar(300) DEFAULT NULL COMMENT '商品規格型號',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '申報計量單位',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商品編碼',
  `import_export_mark_code` varchar(1) DEFAULT NULL COMMENT '進出口標記代碼',
  `oper_status` varchar(1) DEFAULT NULL COMMENT 'OPERSTATUS',
  `file` varchar(18) DEFAULT NULL COMMENT 'FILE',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1110 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_apply_invt_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_invt_h`;
CREATE TABLE `bnd_apply_invt_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部清單編號',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '備案編號',
  `part_sign_code` varchar(4) DEFAULT NULL COMMENT '料件成品標記代碼',
  `import_export_mark_code` varchar(4) DEFAULT NULL COMMENT '進出口標記代碼',
  `supervision_mode_code` varchar(6) DEFAULT NULL COMMENT '監管方式代碼',
  `transport_code` varchar(6) DEFAULT NULL COMMENT '運輸方式代碼',
  `import_export_gate` varchar(4) DEFAULT NULL COMMENT '進出境關別',
  `master_cuscd` varchar(4) DEFAULT NULL COMMENT '主管海關',
  `origin_destination_country` varchar(3) DEFAULT NULL COMMENT '起運/運抵國(地區）',
  `declaration_flag` varchar(1) DEFAULT NULL COMMENT '是否報關標志',
  `customs_declaration_type_code` varchar(25) DEFAULT NULL COMMENT '報關類型代碼',
  `apcret_no` varchar(64) DEFAULT NULL COMMENT '申請表編號',
  `mis_bill_id` varchar(30) DEFAULT NULL COMMENT '內部單據編號',
  `mis_factory_code` varchar(4) DEFAULT NULL COMMENT '工廠代碼',
  `bill_to` varchar(10) DEFAULT NULL COMMENT '提運單號',
  `declare_port` varchar(4) DEFAULT NULL COMMENT '申報地關區代碼',
  `trade_country` varchar(3) DEFAULT NULL COMMENT '貿易國',
  `invoice_no` varchar(30) DEFAULT NULL COMMENT '發票號碼',
  `rmk` varchar(512) DEFAULT NULL COMMENT '備注',
  `bizop_etpsno` varchar(10) DEFAULT NULL COMMENT 'company_code',
  `corresponding_customs_unit_code` varchar(10) DEFAULT NULL COMMENT '對應報關單單位編號',
  `correntry_dcletps_nm` varchar(512) DEFAULT NULL COMMENT '對應報關單單位名稱',
  `correntry_dcletps_ccd` varchar(512) DEFAULT NULL COMMENT '對應報關單信用代碼',
  `related_customs_declaration_no` varchar(64) DEFAULT NULL COMMENT '關聯報關單編號',
  `associated_list_no` varchar(64) DEFAULT NULL COMMENT '關聯清單編號',
  `related_record_no` varchar(64) DEFAULT NULL COMMENT '關聯備案編號',
  `customs_declaration_type` varchar(1) DEFAULT NULL COMMENT '報關單類型',
  `list_type` varchar(1) DEFAULT NULL COMMENT '清單類型',
  `circulation_type` varchar(1) DEFAULT NULL COMMENT '流轉類型',
  `dict_type` varchar(1) DEFAULT NULL COMMENT '歸併類型',
  `oper_status` varchar(1) DEFAULT NULL COMMENT 'OPERSTATUS',
  `file` varchar(18) DEFAULT NULL COMMENT 'FILE',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_apply_qualification_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_qualification_d`;
CREATE TABLE `bnd_apply_qualification_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_no` varchar(18) DEFAULT NULL,
  `data_state` varchar(1) DEFAULT NULL COMMENT '数据状态',
  `g_no` decimal(19,0) DEFAULT NULL COMMENT '序号',
  `mtno` varchar(30) DEFAULT NULL COMMENT '料号',
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `expiration_flag` varchar(1) DEFAULT NULL COMMENT '物料型态',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '变更次数',
  `gdecd` varchar(10) DEFAULT NULL COMMENT '商品编码',
  `gds_nm` varchar(512) DEFAULT NULL COMMENT '商品名称',
  `modf_markcd` varchar(4) DEFAULT NULL COMMENT '修改标志',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`seq_no`,`expiration_flag`,`gdecd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_apply_qualification_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_apply_qualification_h`;
CREATE TABLE `bnd_apply_qualification_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_no` varchar(18) DEFAULT NULL,
  `data_state` varchar(1) DEFAULT NULL,
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `et_arcrp_no` varchar(64) DEFAULT NULL COMMENT '档案库编号',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '变更次数',
  `etps_preent_no` varchar(64) DEFAULT NULL COMMENT '企业内部编号',
  `master_cuscd` varchar(4) DEFAULT NULL COMMENT '主管海关',
  `bizop_etps_sccd` varchar(18) DEFAULT NULL COMMENT '经营单位社会信用代码',
  `bizop_etpsno` varchar(10) DEFAULT NULL COMMENT '经营单位编码',
  `bizop_etps_nm` varchar(512) DEFAULT NULL COMMENT '经营单位名称',
  `prcs_etps_sccd` varchar(18) DEFAULT NULL COMMENT '加工单位社会信用代码',
  `prcs_etpsno` varchar(10) DEFAULT NULL COMMENT '加工单位编码',
  `prcs_etps_nm` varchar(512) DEFAULT NULL COMMENT '加工单位名称',
  `dec_dm` varchar(18) DEFAULT NULL COMMENT '申报单位社会信用代码',
  `dcl_etpsno` varchar(10) DEFAULT NULL COMMENT '申报单位编码',
  `dcl_etps_nm` varchar(512) DEFAULT NULL COMMENT '申报单位名称',
  `dcl_etps_typecd` varchar(25) DEFAULT NULL COMMENT '申报单位类型',
  `conc_addr` varchar(512) DEFAULT NULL COMMENT '联系地址',
  `telephone_no` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `finish_valid_time` date DEFAULT NULL COMMENT '结束有效期',
  `prcs_prdc_ablt_amt` decimal(25,5) DEFAULT NULL COMMENT '加工生产能力（万美元）',
  `apcret_no` varchar(64) DEFAULT NULL COMMENT '批准证编号',
  `risk_assure_markcd` varchar(4) DEFAULT NULL COMMENT '风险担保标志',
  `rlt_form_no` varchar(64) DEFAULT NULL COMMENT '关联单证号',
  `dcl_source_markcd` varchar(4) DEFAULT NULL COMMENT '申报来源标记代码',
  `dcl_typecd` varchar(25) DEFAULT NULL COMMENT '申报类型',
  `dcl_time` date DEFAULT NULL COMMENT '申报日期',
  `emapv_stucd` varchar(4) DEFAULT NULL COMMENT '审批状态代码',
  `exe_markcd` varchar(4) DEFAULT NULL COMMENT '执行标志',
  `putrec_appr_time` date DEFAULT NULL COMMENT '备案批准日期',
  `chg_appr_time` date DEFAULT NULL COMMENT '变更批准日期',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `input_code` varchar(10) DEFAULT NULL COMMENT '录入单位编码',
  `input_credit_code` varchar(18) DEFAULT NULL COMMENT '录入单位社会信用代码',
  `input_name` varchar(512) DEFAULT NULL COMMENT '录入单位名称',
  `input_date` date DEFAULT NULL COMMENT '录入日期',
  `ems_type` varchar(1) DEFAULT NULL COMMENT '资质类型',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`etps_preent_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_carry_cif_price
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_cif_price`;
CREATE TABLE `bnd_carry_cif_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '報關單號',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM',
  `fee_amount` decimal(18,5) DEFAULT NULL COMMENT '運費額',
  `fee_rate` decimal(9,5) DEFAULT NULL COMMENT '運費率',
  `insur_amount` decimal(18,5) DEFAULT NULL COMMENT '保費額',
  `insur_rate` decimal(9,5) DEFAULT NULL COMMENT '保費率',
  `other_amount` decimal(18,5) DEFAULT NULL COMMENT '雜費',
  `transaction_code` varchar(1) DEFAULT NULL COMMENT '成交方式代碼',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '成交方式',
  `fee_curr` varchar(3) DEFAULT NULL COMMENT '運費幣別',
  `insur_curr` varchar(3) DEFAULT NULL COMMENT '保費幣別',
  `other_curr` varchar(3) DEFAULT NULL COMMENT '雜費幣別',
  `cif_price` decimal(18,5) DEFAULT NULL COMMENT 'CIF單價',
  `declaration_price` decimal(18,5) DEFAULT NULL COMMENT '申報總價',
  `declare_qty` decimal(18,5) DEFAULT NULL COMMENT '數量',
  `enterprise_declared_total_price` double(18,5) DEFAULT NULL COMMENT '金額',
  `decalre_rate` decimal(9,5) DEFAULT NULL COMMENT '報關清單匯率',
  `fee_exchange_rate` decimal(9,5) DEFAULT NULL COMMENT '運費匯率',
  `insur_exchange_rate` decimal(9,5) DEFAULT NULL COMMENT '保費匯率',
  `other_exchange_rate` decimal(9,5) DEFAULT NULL COMMENT '雜費匯率',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `declaration_no` (`declaration_no`,`item_no`)
) ENGINE=InnoDB AUTO_INCREMENT=636300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_invoice_file
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_invoice_file`;
CREATE TABLE `bnd_carry_invoice_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(9) DEFAULT NULL COMMENT '顧客代碼                              ',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT 'INVOICE號碼                           ',
  `carton_qty` decimal(11,0) DEFAULT NULL COMMENT '包裝數                           ',
  `customer_item_spec` varchar(30) DEFAULT NULL COMMENT '中文品名                              ',
  `packing_qty` decimal(14,3) DEFAULT NULL COMMENT '數量                                  ',
  `amt_cn` decimal(13,2) DEFAULT NULL COMMENT '金額                                  ',
  `selling_price` decimal(13,5) DEFAULT NULL COMMENT '單價                                  ',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別                                  ',
  `unit` varchar(3) DEFAULT NULL COMMENT '單位                                  ',
  `trade_mode` varchar(3) DEFAULT NULL COMMENT '貿易方式                              ',
  `fax_no` varchar(20) DEFAULT NULL COMMENT '傳真                                  ',
  `cable_address` varchar(20) DEFAULT NULL COMMENT '電報挂號                              ',
  `telephone_no` varchar(20) DEFAULT NULL COMMENT '電話                                  ',
  `cop_list_no` varchar(20) DEFAULT NULL COMMENT '企業歸併前清單編號                    ',
  `ship_to_name` varchar(60) DEFAULT NULL COMMENT '出貨對象名稱                          ',
  `address2_dbcs` varchar(90) DEFAULT NULL COMMENT '地址                                  ',
  `ship_no` varchar(20) DEFAULT NULL COMMENT 'FMPERN                                  ',
  `departure_code` varchar(30) DEFAULT NULL COMMENT 'FMSHFR                                  ',
  `ship_to_code` varchar(30) DEFAULT NULL COMMENT 'FMSHTO                                  ',
  `shipped_date` date DEFAULT NULL COMMENT '實際出貨日                            ',
  `invoice_date` date DEFAULT NULL COMMENT '開票日                                ',
  `net_weight` decimal(14,3) DEFAULT NULL COMMENT '保稅數量/淨重                       ',
  `gross_weight` decimal(14,3) DEFAULT NULL COMMENT '毛重                                  ',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '對應報關單商品號                      ',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '版次                                  ',
  `invoice_type` varchar(3) DEFAULT NULL COMMENT '發票類型                              ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `cop_list_no` (`cop_list_no`)
) ENGINE=InnoDB AUTO_INCREMENT=62172 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_invt_list
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_invt_list`;
CREATE TABLE `bnd_carry_invt_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部清單編號',
  `apply_date` date DEFAULT NULL COMMENT '申報日期',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'TDK ITEM',
  `img_no` varchar(9) DEFAULT NULL COMMENT '備案序號',
  `country_code` varchar(3) DEFAULT NULL COMMENT '原產國',
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供應商',
  `vendor_ems` varchar(20) DEFAULT NULL COMMENT '供應商手冊',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '申報單位',
  `already_declared_qty` decimal(13,3) DEFAULT NULL COMMENT '已報數量',
  `already_declared_amount` decimal(13,2) DEFAULT NULL COMMENT '已報金額',
  `already_declared_weight` decimal(13,3) DEFAULT NULL COMMENT '已報重量',
  `expiration_flag` varchar(1) DEFAULT NULL COMMENT '已轉標誌',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `k1` (`internal_number`,`invoice_no`,`item_no`,`country_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3067 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_monthly_ac
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_monthly_ac`;
CREATE TABLE `bnd_carry_monthly_ac` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(10) DEFAULT NULL COMMENT '基准年月',
  `vendor_no` varchar(7) DEFAULT NULL COMMENT '供應商代碼',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'TDK ITEM',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '備案序號',
  `country_code` varchar(3) DEFAULT NULL COMMENT '原產國',
  `vendor_ems` varchar(20) DEFAULT NULL COMMENT '供應商手冊',
  `arrival_date` date DEFAULT NULL COMMENT '日期',
  `po_boarding_qty` double(13,3) DEFAULT NULL COMMENT '購買數量',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '申報單位',
  `declared_qty` double(13,3) DEFAULT NULL COMMENT '申報數量',
  `declared_amount` double(13,2) DEFAULT NULL COMMENT '申報金額',
  `declared_weight` double(13,3) DEFAULT NULL COMMENT '申報重量',
  `already_declared_qty` double(13,3) DEFAULT NULL COMMENT '已報數量',
  `already_declared_amount` double(13,2) DEFAULT NULL COMMENT '已報金額',
  `already_declared_weight` double(13,3) DEFAULT NULL COMMENT '已報重量',
  `complete_declared_qty` double(13,3) DEFAULT NULL COMMENT '已轉數量',
  `complete_declared_amount` double(13,2) DEFAULT NULL COMMENT '已轉金額',
  `complete_declared_weight` double(13,3) DEFAULT NULL COMMENT '已轉重量',
  `expiration_flag` varchar(1) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `UK1` (`yyyymm`,`invoice_no`,`item_no`,`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14821 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_carry_po_controller
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_po_controller`;
CREATE TABLE `bnd_carry_po_controller` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL,
  `item_spec` varchar(255) DEFAULT NULL,
  `um_physical_inventory` varchar(3) DEFAULT NULL,
  `data_state` varchar(10) DEFAULT NULL COMMENT '状态',
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供应商代码',
  `img_no` varchar(10) DEFAULT NULL COMMENT '归并项号',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key01` (`vendor_no`,`img_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_vendor_arrival
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_vendor_arrival`;
CREATE TABLE `bnd_carry_vendor_arrival` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供應商代碼',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'TDK ITEM',
  `img_no` varchar(10) DEFAULT NULL COMMENT '備案序號',
  `country_code` varchar(3) DEFAULT NULL COMMENT '原產國',
  `vendor_ems` varchar(20) DEFAULT NULL COMMENT '供應商手冊',
  `arrival_date` date DEFAULT NULL COMMENT '日期',
  `po_boarding_qty` double(13,3) DEFAULT NULL COMMENT '購買數量',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '申報單位',
  `declared_qty` double(13,3) DEFAULT NULL COMMENT '申報數量',
  `declared_amount` double(13,2) DEFAULT NULL COMMENT '申報金額',
  `declared_weight` double(13,3) DEFAULT NULL COMMENT '申報重量',
  `expiration_flag` varchar(1) DEFAULT NULL COMMENT '失效日期',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  `already_declared_qty` double(13,3) DEFAULT NULL,
  `already_declared_amount` double(13,2) DEFAULT NULL,
  `already_declared_weight` double(13,3) DEFAULT NULL,
  `complete_declared_qty` double(13,3) DEFAULT NULL,
  `complete_declared_amount` double(13,2) DEFAULT NULL,
  `complete_declared_weight` double(13,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K1` (`invoice_no`,`item_no`,`country_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3459 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_vendor_basic
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_vendor_basic`;
CREATE TABLE `bnd_carry_vendor_basic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(10) NOT NULL COMMENT '供應商代碼',
  `type` varchar(5) DEFAULT NULL COMMENT '來料 1 進料 2',
  `ten_digit_code` varchar(10) DEFAULT NULL COMMENT '十位數編碼',
  `organization_code` varchar(18) DEFAULT NULL COMMENT '組織結構 / 三證合一代碼',
  `transfer_out_code` varchar(5) DEFAULT NULL COMMENT '轉出地代碼',
  `customs_name` varchar(30) DEFAULT NULL COMMENT '轉出地主管海關',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`,`vendor_no`),
  UNIQUE KEY `uk1` (`vendor_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_vendor_detailed
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_vendor_detailed`;
CREATE TABLE `bnd_carry_vendor_detailed` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供應商代碼',
  `ems_no` varchar(15) DEFAULT NULL COMMENT '供應商手冊',
  `manual_effective_date` date DEFAULT NULL COMMENT '手冊生效日',
  `manual_expiry_date` date DEFAULT NULL COMMENT '手冊到期日',
  `vendor_img_no` decimal(5,0) unsigned DEFAULT NULL COMMENT '項號(供应商项号)',
  `vendor_item_no` varchar(35) DEFAULT NULL COMMENT '供應商 ITEM',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '中文品名',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '供應商商編',
  `item_spec` varchar(80) DEFAULT NULL COMMENT '規範申報',
  `lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '供應商交易單位',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '單位代碼',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT 'TDK 與供應商換算係數',
  `img_no` varchar(10) DEFAULT NULL COMMENT 'TDK 項號',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'TDK ITEM',
  `supervsion_unit` varchar(10) DEFAULT NULL COMMENT 'TDK 監管單位',
  `supervsion_unit_code` varchar(3) DEFAULT NULL COMMENT 'TDK 監管單位（代码）',
  `legal_unit` varchar(10) DEFAULT NULL COMMENT 'TDK 法定單位',
  `legal_unit_code` varchar(3) DEFAULT NULL COMMENT 'TDK 法定單位代碼',
  `lawf_unitcd_cf` decimal(18,0) DEFAULT NULL COMMENT 'TDK 與法定換算係數',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT 'TDK 購買單位',
  `cf_purchase` decimal(11,0) DEFAULT NULL COMMENT 'TDK 購買係數',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk1` (`vendor_no`,`ems_no`,`vendor_item_no`,`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=781 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_vendor_ems_master
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_vendor_ems_master`;
CREATE TABLE `bnd_carry_vendor_ems_master` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(7) DEFAULT NULL COMMENT '供應商代碼',
  `vendor_ems` varchar(20) DEFAULT NULL COMMENT '供應商賬冊',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `expiration_date` date DEFAULT NULL COMMENT '失效日期',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Key1` (`vendor_no`,`vendor_ems`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_vendor_lock
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_vendor_lock`;
CREATE TABLE `bnd_carry_vendor_lock` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供應商代碼',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `K1` (`vendor_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_carry_vendor_upload
-- ----------------------------
DROP TABLE IF EXISTS `bnd_carry_vendor_upload`;
CREATE TABLE `bnd_carry_vendor_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供應商代碼',
  `type` varchar(1) DEFAULT NULL,
  `ten_digit_code` varchar(10) DEFAULT NULL,
  `organization_code` varchar(18) DEFAULT NULL,
  `transfer_out_code` varchar(5) DEFAULT NULL,
  `customs_name` varchar(30) DEFAULT NULL,
  `ems_no` varchar(64) DEFAULT NULL COMMENT '供應商手冊',
  `manual_effective_date` date DEFAULT NULL COMMENT '生效日期',
  `manual_expiry_date` date DEFAULT NULL COMMENT '手冊到期日',
  `vendor_img_no` varchar(10) DEFAULT NULL COMMENT '項號(供应商项号)',
  `vendor_item_no` varchar(35) DEFAULT NULL COMMENT '供應商 ITEM',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '中文品名',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '供應商商編',
  `item_spec` varchar(50) DEFAULT NULL COMMENT '規範申報',
  `lawf_unitcd` varchar(10) DEFAULT NULL COMMENT '供應商交易單位',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '單位代碼',
  `cf_physical_inventory` varchar(18) DEFAULT NULL COMMENT 'TDK 與供應商換算係數',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'TDK ITEM',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `uk1` (`vendor_no`,`ems_no`,`vendor_item_no`,`item_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_domestic_batch_lot
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_batch_lot`;
CREATE TABLE `bnd_domestic_batch_lot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(10) DEFAULT NULL COMMENT 'batch',
  `mo_no` varchar(10) DEFAULT NULL COMMENT '製造訂單號碼                          ',
  `fg_gi_qty` decimal(13,3) DEFAULT NULL COMMENT '入庫數量                              ',
  `fg_use_qty` decimal(13,3) DEFAULT NULL COMMENT '已抵扣數量                            ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `batch_no` (`batch_no`,`mo_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_convert_detail
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_convert_detail`;
CREATE TABLE `bnd_domestic_convert_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '年月',
  `type` varchar(1) DEFAULT NULL COMMENT '1=保税 2=非保税',
  `fg_img_no` decimal(19,0) DEFAULT NULL COMMENT '成品歸併項號',
  `endprd_gds_mtno` varchar(30) DEFAULT NULL COMMENT '成品料号',
  `fg_description_dbcs` varchar(30) DEFAULT NULL COMMENT '成品中文品名',
  `fg_um_bond` varchar(3) DEFAULT NULL COMMENT '成品監管單位',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '单耗版本号',
  `raw_img_no` decimal(19,0) DEFAULT NULL COMMENT '材料歸併項號',
  `mtpck_gds_mtno` varchar(30) DEFAULT NULL COMMENT '料件料号',
  `raw_description_dbcs` varchar(30) DEFAULT NULL COMMENT '材料中文品名',
  `raw_um_bond` varchar(3) DEFAULT NULL COMMENT '材料監管單位',
  `dec_cm` decimal(18,9) DEFAULT NULL COMMENT '單耗     ',
  `dec_dm` decimal(9,5) DEFAULT NULL COMMENT '損耗     ',
  `fg_qty` decimal(18,5) DEFAULT NULL COMMENT '內銷數量',
  `raw_qty` decimal(18,5) DEFAULT NULL COMMENT '材料数量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `yyyymm` (`yyyymm`,`type`,`endprd_gds_mtno`,`ucns_verno`,`raw_img_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3254 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_convert_total
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_convert_total`;
CREATE TABLE `bnd_domestic_convert_total` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '基準年月                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '項號                                  ',
  `type` varchar(10) DEFAULT NULL COMMENT 'bond,nonbond,upload',
  `domestic_qty` decimal(15,5) DEFAULT NULL COMMENT '內銷折算數                            ',
  `domestic_wet` decimal(15,5) DEFAULT NULL COMMENT '內銷折算重量                          ',
  `domestic_amt` decimal(13,2) DEFAULT NULL COMMENT '內銷折算金額                          ',
  `domestic_qty_paytax` decimal(13,5) DEFAULT NULL COMMENT '內銷材料已補數                        ',
  `domestic_wet_paytax` decimal(15,5) DEFAULT NULL COMMENT '內銷材料已補重量                      ',
  `domestic_amt_paytax` decimal(13,2) DEFAULT NULL COMMENT '內銷材料已補金額                      ',
  `nonbond_qty` decimal(15,5) DEFAULT NULL COMMENT '非保税內銷折算數                            ',
  `nonbond_wet` decimal(15,5) DEFAULT NULL COMMENT '非保税內銷折算重量                          ',
  `nonbond_amt` decimal(13,2) DEFAULT NULL COMMENT '非保税內銷折算金額                          ',
  `nonbond_qty_paytax` decimal(13,5) DEFAULT NULL COMMENT '非保税內銷材料已補數                        ',
  `nonbond_wet_paytax` decimal(15,5) DEFAULT NULL COMMENT '非保税內銷材料已補重量                      ',
  `nonbond_amt_paytax` decimal(13,2) DEFAULT NULL COMMENT '非保税內銷材料已補金額                      ',
  `upload_qty` decimal(13,5) DEFAULT NULL COMMENT '上载材料数量',
  `upload_qty_paytax` int(11) DEFAULT NULL COMMENT '上载材料已补',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yyyymm` (`yyyymm`,`item_no`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1568 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_date_list
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_date_list`;
CREATE TABLE `bnd_domestic_date_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `month` varchar(6) DEFAULT NULL COMMENT '年月',
  `complete_flag` varchar(1) DEFAULT NULL COMMENT '完成标识',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_invoice_batch
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_invoice_batch`;
CREATE TABLE `bnd_domestic_invoice_batch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '年月',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `packing_serial` int(5) DEFAULT NULL COMMENT '裝箱序號                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批號                                  ',
  `release_status` varchar(2) DEFAULT NULL COMMENT '發行狀態                              ',
  `transaction_qty` decimal(11,1) DEFAULT NULL COMMENT 'TRANSACTION QTY                         ',
  `transaction_date` date DEFAULT NULL COMMENT '异动日期',
  `bond_type` varchar(2) DEFAULT NULL COMMENT '保税类别',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`packing_serial`,`lot_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_invoice_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_invoice_d`;
CREATE TABLE `bnd_domestic_invoice_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '年月',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `packing_serial` int(5) DEFAULT NULL COMMENT '裝箱序號                              ',
  `dn_no` varchar(10) DEFAULT NULL COMMENT 'DN号码',
  `customer_no` varchar(10) DEFAULT NULL COMMENT '顧客代碼                              ',
  `invoice_type` varchar(3) DEFAULT NULL COMMENT '发票类型',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '品名（中文）                          ',
  `customer_item_code` varchar(52) DEFAULT NULL COMMENT '顧客品名代碼                          ',
  `unit` varchar(3) DEFAULT NULL COMMENT '計量單位（銷售）                      ',
  `customer_item_spec` varchar(62) DEFAULT NULL COMMENT '顧客品名（中文）                      ',
  `customer_po` varchar(30) DEFAULT NULL COMMENT '顧客購買訂單號碼                      ',
  `po_no` varchar(30) DEFAULT NULL COMMENT '購買訂單號碼                          ',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '包裝數                                ',
  `carton_no_from` int(5) DEFAULT NULL COMMENT '箱號ＦＲＯＭ                          ',
  `carton_no_to` int(5) DEFAULT NULL COMMENT '箱號ＴＯ                              ',
  `net_weigh` decimal(13,3) DEFAULT NULL COMMENT '淨重                                  ',
  `caton_weight` decimal(15,3) DEFAULT NULL COMMENT '箱重                                  ',
  `sampling_principle` int(3) DEFAULT NULL COMMENT '賣價                                  ',
  `mrpcode` varchar(10) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼                        ',
  `so_no` varchar(10) DEFAULT NULL COMMENT 'SO订单',
  `packing_amt` decimal(15,2) DEFAULT NULL COMMENT '金额',
  `original_invoice` varchar(10) DEFAULT NULL COMMENT '退货原发票',
  `catton_qty_by_dn` int(5) DEFAULT NULL COMMENT 'DN的箱数',
  `pallet_qty` decimal(13,3) DEFAULT NULL COMMENT 'DN的板数',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_nonbond_material
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_nonbond_material`;
CREATE TABLE `bnd_domestic_nonbond_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '年月',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `packing_serial` int(5) DEFAULT NULL COMMENT '裝箱序號                              ',
  `invoice_type` varchar(1) DEFAULT NULL COMMENT '發票型態                              ',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '单耗版本号',
  `transaction_qty` decimal(11,1) DEFAULT NULL COMMENT 'TRANSACTION QTY                         ',
  `bond_type` varchar(2) DEFAULT NULL COMMENT '保税类别',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批號                                  ',
  `item_no_wh` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '品名（中文）',
  `material_bonded_logo` varchar(1) DEFAULT NULL COMMENT '材料保稅區分',
  `fg_gi_date` date DEFAULT NULL COMMENT '成品MO入庫日期                          ',
  `fg_gi_qty` decimal(11,1) DEFAULT NULL COMMENT '成品MO入库數量                          ',
  `mo_no` varchar(10) DEFAULT NULL COMMENT '製造訂單號碼                          ',
  `mrpcode` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼                        ',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站代碼                            ',
  `item_no_psa` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `item_descrip_en` varchar(60) DEFAULT NULL COMMENT '品名                                  ',
  `item_spec` varchar(40) DEFAULT NULL COMMENT '品名規格                              ',
  `fg_actual_qty` decimal(13,3) DEFAULT NULL COMMENT '本站實際投入數                        ',
  `material_count` decimal(4,0) DEFAULT NULL COMMENT '材料流水號                            ',
  `material_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代碼                          ',
  `material_item_description` varchar(60) DEFAULT NULL COMMENT '材料品名                              ',
  `material_specification` varchar(40) DEFAULT NULL COMMENT '材料品名規格                          ',
  `material_lot_no` varchar(10) DEFAULT NULL COMMENT '材料批號                              ',
  `actual_materail_qty` decimal(20,9) DEFAULT NULL COMMENT '實際材料數                            ',
  `material_defect_qty` decimal(20,9) DEFAULT NULL COMMENT '材料不良數                            ',
  `loss_qty` decimal(20,9) DEFAULT NULL COMMENT '損耗數                                ',
  `actual_um` varchar(3) DEFAULT NULL COMMENT '實際單位                              ',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '計量單位（入出庫）                    ',
  `product_loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '凈耗                                  ',
  `loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '損耗                                  ',
  `componentparent_itemc` decimal(20,9) DEFAULT NULL COMMENT '材料用量                              ',
  `component_qtyparent_qty` decimal(13,3) DEFAULT NULL COMMENT '製品用量                              ',
  `sap_mo` varchar(12) DEFAULT NULL COMMENT 'MFSAPM                                  ',
  `material_bom_ver` decimal(9,0) DEFAULT NULL COMMENT 'MFBOMV                                  ',
  `material_item_no_1` varchar(15) DEFAULT NULL COMMENT '1阶材料品名',
  `materail_qty_1` decimal(20,9) DEFAULT NULL COMMENT '1阶材料用量',
  `return_document` varchar(10) DEFAULT NULL COMMENT '退货联络书',
  `mo_type` varchar(1) DEFAULT NULL COMMENT 'mo类型',
  `recycle_qty` decimal(18,9) DEFAULT NULL COMMENT '再生数量',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '成品盘点换算系数',
  `shipped_date` date DEFAULT NULL COMMENT '出货日期',
  `raw_description_dbcs` varchar(100) DEFAULT NULL COMMENT '材料中文品名',
  `raw_img_no` decimal(9,0) DEFAULT NULL COMMENT '材料项号',
  `raw_io_unit` varchar(3) DEFAULT NULL COMMENT '材料在库单位',
  `raw_custom_unit` varchar(3) DEFAULT NULL COMMENT '材料监管单位',
  `raw_custom_cf` decimal(18,9) DEFAULT NULL COMMENT '材料的监管换算系数',
  `raw_bond_logo` varchar(1) DEFAULT NULL COMMENT '材料的保税标识',
  `convert_mo` varchar(10) DEFAULT NULL COMMENT '折算的mo',
  `convert_version` decimal(9,0) DEFAULT NULL COMMENT '折算版本',
  `dec_dm` decimal(19,9) DEFAULT NULL COMMENT '净耗',
  `dec_cm` decimal(19,9) DEFAULT NULL COMMENT '损耗',
  `fg_img_no` int(9) DEFAULT NULL COMMENT '成品项号',
  `fg_io_unit` varchar(3) DEFAULT NULL COMMENT '成品在库单位',
  `fg_custom_unit` varchar(3) DEFAULT NULL COMMENT '成品监管单位',
  `fg_custom_qty` decimal(18,9) DEFAULT NULL COMMENT '成品的监管出货数量',
  `father_lot` varchar(10) DEFAULT NULL COMMENT '上阶MO',
  `father_qty` decimal(18,9) DEFAULT NULL COMMENT '上阶数量',
  `conver_times` int(3) unsigned DEFAULT NULL COMMENT '折算阶数',
  `root_lot` varchar(10) DEFAULT NULL COMMENT '第一阶MO',
  `root_item_no` varchar(15) DEFAULT NULL COMMENT '第一階品番',
  `root_qty` decimal(18,9) DEFAULT NULL COMMENT '第一阶MO的数量',
  `lot_2` varchar(10) DEFAULT NULL COMMENT '第2阶MO',
  `item_no_2` varchar(15) DEFAULT NULL COMMENT '第2階品番',
  `qty_2` decimal(18,9) DEFAULT NULL COMMENT '第2阶MO的数量',
  `lot_3` varchar(10) DEFAULT NULL COMMENT '第3阶MO',
  `item_no_3` varchar(15) DEFAULT NULL COMMENT '第3階品番',
  `qty_3` decimal(18,9) DEFAULT NULL COMMENT '第3阶MO的数量',
  `lot_4` varchar(10) DEFAULT NULL COMMENT '第4阶MO',
  `item_no_4` varchar(15) DEFAULT NULL COMMENT '第4階品番',
  `qty_4` decimal(18,9) DEFAULT NULL COMMENT '第4阶MO的数量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `yyyymm` (`yyyymm`,`invoice_no`,`lot_no`,`conver_times`)
) ENGINE=InnoDB AUTO_INCREMENT=152273 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_nonbond_material_copy1
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_nonbond_material_copy1`;
CREATE TABLE `bnd_domestic_nonbond_material_copy1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '年月',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `packing_serial` int(5) DEFAULT NULL COMMENT '裝箱序號                              ',
  `invoice_type` varchar(1) DEFAULT NULL COMMENT '發票型態                              ',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '单耗版本号',
  `transaction_qty` decimal(11,1) DEFAULT NULL COMMENT 'TRANSACTION QTY                         ',
  `bond_type` varchar(2) DEFAULT NULL COMMENT '保税类别',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批號                                  ',
  `item_no_wh` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '品名（中文）',
  `material_bonded_logo` varchar(1) DEFAULT NULL COMMENT '材料保稅區分',
  `fg_gi_date` date DEFAULT NULL COMMENT '成品MO入庫日期                          ',
  `fg_gi_qty` decimal(11,1) DEFAULT NULL COMMENT '成品MO入库數量                          ',
  `mo_no` varchar(10) DEFAULT NULL COMMENT '製造訂單號碼                          ',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站代碼                            ',
  `item_no_psa` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `mrpcode` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼                        ',
  `item_descrip_en` varchar(60) DEFAULT NULL COMMENT '品名                                  ',
  `item_spec` varchar(40) DEFAULT NULL COMMENT '品名規格                              ',
  `fg_actual_qty` decimal(13,3) DEFAULT NULL COMMENT '本站實際投入數                        ',
  `material_count` decimal(4,0) DEFAULT NULL COMMENT '材料流水號                            ',
  `material_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代碼                          ',
  `material_item_description` varchar(60) DEFAULT NULL COMMENT '材料品名                              ',
  `material_specification` varchar(40) DEFAULT NULL COMMENT '材料品名規格                          ',
  `material_lot_no` varchar(10) DEFAULT NULL COMMENT '材料批號                              ',
  `actual_materail_qty` decimal(20,9) DEFAULT NULL COMMENT '實際材料數                            ',
  `material_defect_qty` decimal(20,9) DEFAULT NULL COMMENT '材料不良數                            ',
  `loss_qty` decimal(20,9) DEFAULT NULL COMMENT '損耗數                                ',
  `actual_um` varchar(3) DEFAULT NULL COMMENT '實際單位                              ',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '計量單位（入出庫）                    ',
  `product_loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '凈耗                                  ',
  `loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '損耗                                  ',
  `componentparent_itemc` decimal(20,9) DEFAULT NULL COMMENT '材料用量                              ',
  `component_qtyparent_qty` decimal(13,3) DEFAULT NULL COMMENT '製品用量                              ',
  `sap_mo` varchar(12) DEFAULT NULL COMMENT 'MFSAPM                                  ',
  `material_bom_ver` decimal(9,0) DEFAULT NULL COMMENT 'MFBOMV                                  ',
  `material_item_no_1` varchar(15) DEFAULT NULL COMMENT '1阶材料品名',
  `materail_qty_1` decimal(20,9) DEFAULT NULL COMMENT '1阶材料用量',
  `return_document` varchar(10) DEFAULT NULL COMMENT '退货联络书',
  `mo_type` varchar(1) DEFAULT NULL COMMENT 'mo类型',
  `recycle_qty` decimal(18,9) DEFAULT NULL COMMENT '再生数量',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '成品盘点换算系数',
  `shipped_date` date DEFAULT NULL COMMENT '出货日期',
  `raw_description_dbcs` varchar(100) DEFAULT NULL COMMENT '材料中文品名',
  `raw_img_no` decimal(9,0) DEFAULT NULL COMMENT '材料项号',
  `raw_io_unit` varchar(3) DEFAULT NULL COMMENT '材料在库单位',
  `raw_custom_unit` varchar(3) DEFAULT NULL COMMENT '材料监管单位',
  `raw_custom_cf` decimal(18,9) DEFAULT NULL COMMENT '材料的监管换算系数',
  `raw_bond_logo` varchar(1) DEFAULT NULL COMMENT '材料的保税标识',
  `convert_mo` varchar(10) DEFAULT NULL COMMENT '折算的mo',
  `convert_version` decimal(9,0) DEFAULT NULL COMMENT '折算版本',
  `ucns_qty` decimal(19,9) DEFAULT NULL COMMENT '净耗',
  `dec_cm` decimal(19,9) DEFAULT NULL COMMENT '损耗',
  `fg_img_no` int(9) DEFAULT NULL COMMENT '成品项号',
  `fg_io_unit` varchar(3) DEFAULT NULL COMMENT '成品在库单位',
  `fg_custom_unit` varchar(3) DEFAULT NULL COMMENT '成品监管单位',
  `fg_custom_qty` decimal(18,9) DEFAULT NULL COMMENT '成品的监管出货数量',
  `root_lot` varchar(10) DEFAULT NULL COMMENT '第一阶MO',
  `root_qty` decimal(18,9) DEFAULT NULL COMMENT '第一阶MO的数量',
  `father_lot` varchar(10) DEFAULT NULL COMMENT '上阶MO',
  `father_qty` decimal(18,9) DEFAULT NULL COMMENT '上阶数量',
  `conver_times` int(3) unsigned DEFAULT NULL COMMENT '折算阶数',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `yyyymm` (`yyyymm`,`invoice_no`,`lot_no`,`conver_times`)
) ENGINE=InnoDB AUTO_INCREMENT=80092 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_domestic_plan_ship
-- ----------------------------
DROP TABLE IF EXISTS `bnd_domestic_plan_ship`;
CREATE TABLE `bnd_domestic_plan_ship` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '年月                                  ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '单耗版本号',
  `plan_qty` decimal(13,3) DEFAULT NULL COMMENT '計劃出貨數                            ',
  `actual_qty` decimal(13,3) DEFAULT NULL COMMENT '實際出貨數                            ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_airway_list
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_airway_list`;
CREATE TABLE `bnd_export_airway_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `flight_no` varchar(16) DEFAULT NULL COMMENT '班機或航次 1',
  `master_airway_bill` varchar(25) DEFAULT NULL COMMENT '主提單號碼',
  `house_airway_bill` varchar(25) DEFAULT NULL COMMENT '分提單號碼',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208461 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_audit_ok
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_audit_ok`;
CREATE TABLE `bnd_export_audit_ok` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `premium` varchar(20) DEFAULT NULL COMMENT '保費',
  `shipped_date` date DEFAULT NULL COMMENT '出貨日期',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `transport_code` varchar(1) DEFAULT NULL COMMENT '運輸方式',
  `shipping_condition_code` varchar(1) DEFAULT NULL COMMENT '運送方式',
  `forwarder_code` varchar(2) DEFAULT NULL COMMENT '貨運公司',
  `goods_type` varchar(1) DEFAULT NULL COMMENT '貨物類型',
  `invoice_type` varchar(1) DEFAULT NULL COMMENT '發票形態',
  `tax_code2` varchar(1) DEFAULT NULL COMMENT '稅率別2',
  `audit` varchar(1) DEFAULT NULL COMMENT '是否審核',
  `audit_supervisor` varchar(10) DEFAULT NULL COMMENT '審核主管代碼',
  `master_airway_bill` varchar(25) DEFAULT NULL COMMENT '主提單號碼',
  `special_relationship` varchar(4) DEFAULT NULL COMMENT '特殊關係',
  `price_effect` varchar(4) DEFAULT NULL COMMENT '價格影響',
  `royalties` varchar(4) DEFAULT NULL COMMENT '支付特許權使用費',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '清單編號',
  `audit_comfirm` varchar(5) DEFAULT NULL COMMENT '審核確認',
  `country_code` varchar(70) DEFAULT NULL COMMENT '貿易國',
  `terms_trade` varchar(20) DEFAULT NULL COMMENT '成交方式',
  `destination_country` varchar(30) DEFAULT NULL COMMENT '目的國',
  `ship_to_name1_dbcs` varchar(160) DEFAULT NULL COMMENT ' SOLD TO',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '發票別數量',
  `price` decimal(13,5) DEFAULT NULL COMMENT '发票别单价',
  `unit` varchar(3) DEFAULT NULL COMMENT '發票別單位',
  `total_netwet` decimal(12,6) DEFAULT NULL COMMENT '淨重',
  `gross_weight` decimal(9,3) DEFAULT NULL COMMENT '毛重',
  `amt_foreign` decimal(13,2) DEFAULT NULL COMMENT '發票別金額',
  `currency` varchar(3) DEFAULT NULL COMMENT '發票別幣別',
  `packing_volume` varchar(10) DEFAULT NULL COMMENT '總體積',
  `pieces` decimal(5,0) DEFAULT NULL COMMENT '總件數',
  `invoice_pieces` decimal(5,0) DEFAULT NULL COMMENT '發票別出貨總件數',
  `packing_code` varchar(3) DEFAULT NULL COMMENT '包裝代碼',
  `so_no` varchar(2) DEFAULT NULL COMMENT 'so_no前两位',
  `bond_type` varchar(2) DEFAULT NULL COMMENT '保税类别',
  `declare_date` date DEFAULT NULL COMMENT '申报日期',
  `total_packing_qty` decimal(14,3) DEFAULT NULL COMMENT '形式发票总数量',
  `total_amt_foreign` decimal(13,2) DEFAULT NULL COMMENT '形式发票总金额',
  `port_name` varchar(30) DEFAULT NULL COMMENT '目的港',
  `freight` varchar(30) DEFAULT NULL COMMENT '运费',
  `gds_nm` varchar(30) DEFAULT NULL COMMENT '货名(中文名称)',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=887 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_audit_temp
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_audit_temp`;
CREATE TABLE `bnd_export_audit_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `premium` varchar(20) DEFAULT NULL COMMENT '保費',
  `shipped_date` date DEFAULT NULL COMMENT '出貨日期',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `transport_code` varchar(1) DEFAULT NULL COMMENT '運輸方式',
  `shipping_condition_code` varchar(1) DEFAULT NULL COMMENT '運送方式',
  `forwarder_code` varchar(2) DEFAULT NULL COMMENT '貨運公司',
  `goods_type` varchar(1) DEFAULT NULL COMMENT '貨物類型',
  `invoice_type` varchar(1) DEFAULT NULL COMMENT '發票形態',
  `tax_code2` varchar(1) DEFAULT NULL COMMENT '稅率別2',
  `audit` varchar(1) DEFAULT NULL COMMENT '是否審核',
  `audit_supervisor` varchar(10) DEFAULT NULL COMMENT '審核主管代碼',
  `master_airway_bill` varchar(25) DEFAULT NULL COMMENT '主提單號碼',
  `special_relationship` varchar(4) DEFAULT NULL COMMENT '特殊關係',
  `price_effect` varchar(4) DEFAULT NULL COMMENT '價格影響',
  `royalties` varchar(4) DEFAULT NULL COMMENT '支付特許權使用費',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '清單編號',
  `audit_comfirm` varchar(5) DEFAULT NULL COMMENT '審核確認',
  `country_code` varchar(70) DEFAULT NULL COMMENT '貿易國',
  `terms_trade` varchar(20) DEFAULT NULL COMMENT '成交方式',
  `destination_country` varchar(30) DEFAULT NULL COMMENT '目的國',
  `ship_to_name1_dbcs` varchar(160) DEFAULT NULL COMMENT ' SOLD TO',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '發票別數量',
  `price` decimal(13,5) DEFAULT NULL COMMENT '发票别单价',
  `unit` varchar(3) DEFAULT NULL COMMENT '發票別單位',
  `total_netwet` decimal(12,6) DEFAULT NULL COMMENT '淨重',
  `gross_weight` decimal(9,3) DEFAULT NULL COMMENT '毛重',
  `amt_foreign` decimal(13,2) DEFAULT NULL COMMENT '發票別金額',
  `currency` varchar(3) DEFAULT NULL COMMENT '發票別幣別',
  `packing_volume` varchar(10) DEFAULT NULL COMMENT '總體積',
  `pieces` decimal(5,0) DEFAULT NULL COMMENT '總件數',
  `invoice_pieces` decimal(5,0) DEFAULT NULL COMMENT '發票別出貨總件數',
  `packing_code` varchar(3) DEFAULT NULL COMMENT '包裝代碼',
  `so_no` varchar(2) DEFAULT NULL COMMENT 'so_no前两位',
  `bond_type` varchar(2) DEFAULT NULL COMMENT '保税类别',
  `declare_date` date DEFAULT NULL COMMENT '申报日期',
  `total_packing_qty` decimal(14,3) DEFAULT NULL COMMENT '形式发票总数量',
  `total_amt_foreign` decimal(13,2) DEFAULT NULL COMMENT '形式发票总金额',
  `port_name` varchar(30) DEFAULT NULL COMMENT '目的港',
  `freight` varchar(30) DEFAULT NULL COMMENT '运费',
  `gds_nm` varchar(30) DEFAULT NULL COMMENT '货名(中文名称)',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_cabinet_type
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_cabinet_type`;
CREATE TABLE `bnd_export_cabinet_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `declare_port` varchar(4) DEFAULT NULL COMMENT '口岸',
  `declare_date` date DEFAULT NULL COMMENT '清單申報日期',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '歸併前清單編號',
  `city_name_dbcs` varchar(3) DEFAULT NULL COMMENT '目的港',
  `type_LCL` int(2) DEFAULT NULL COMMENT 'LCL',
  `type_20` int(2) DEFAULT NULL COMMENT '20',
  `type_40` int(2) DEFAULT NULL COMMENT '40',
  `type_45` int(2) DEFAULT NULL COMMENT '45',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`declare_port`,`declare_date`,`internal_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15428 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_delivery_note_controller
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_delivery_note_controller`;
CREATE TABLE `bnd_export_delivery_note_controller` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `sold_to` varchar(10) DEFAULT NULL COMMENT 'sold_to',
  `ship_to` varchar(10) DEFAULT NULL COMMENT 'ship_to',
  `type` varchar(1) DEFAULT NULL COMMENT '类型',
  `type_nm` varchar(30) DEFAULT NULL COMMENT '类型描述',
  `sold_to_name` varchar(40) DEFAULT NULL,
  `ship_to_name` varchar(40) DEFAULT NULL,
  `delivery_note_name` varchar(30) DEFAULT NULL COMMENT '送货单名称',
  `flag` varchar(1) DEFAULT NULL COMMENT ' 使用标志',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `key01` (`sold_to`,`ship_to`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_export_delivery_note_file
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_delivery_note_file`;
CREATE TABLE `bnd_export_delivery_note_file` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '发票',
  `shipped_date` date DEFAULT NULL,
  `flag1` varchar(10) DEFAULT NULL COMMENT '是否可做送貨單',
  `flag2` varchar(1) DEFAULT NULL COMMENT '送貨單已做標識',
  `sold_to_name` varchar(40) DEFAULT NULL,
  `port_description` varchar(30) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `type_nm` varchar(30) DEFAULT NULL COMMENT '送貨單方式',
  `delivery_note_name` varchar(30) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `key01` (`invoice_no`,`flag1`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4404 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_export_delivery_note_temp
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_delivery_note_temp`;
CREATE TABLE `bnd_export_delivery_note_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shipped_date` date DEFAULT NULL COMMENT '出貨日期 ',
  `packing_amout_qty` decimal(13,3) DEFAULT NULL COMMENT '包裝數  ',
  `amt_cn` decimal(13,2) DEFAULT NULL COMMENT '裝箱金額（本國）',
  `amt_foreign` decimal(13,2) DEFAULT NULL COMMENT '裝箱金額（外幣）',
  `currency` varchar(3) DEFAULT NULL COMMENT '貨幣代碼   ',
  `box_from` decimal(5,0) DEFAULT NULL COMMENT '總箱數  ',
  `total_netwet` decimal(13,3) DEFAULT NULL COMMENT '總淨重   ',
  `total_grosswet` decimal(13,3) DEFAULT NULL COMMENT '總箱重 ',
  `shipping_condition_code` varchar(2) DEFAULT NULL COMMENT '運送方式  ',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `customer_no` varchar(9) DEFAULT NULL COMMENT '顧客代碼                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `customer_item_code` varchar(30) DEFAULT NULL COMMENT '顧客品名代碼                          ',
  `customer_po` varchar(10) DEFAULT NULL COMMENT '顧客購買訂單號碼                      ',
  `po_no` varchar(30) DEFAULT NULL COMMENT '購買訂單號碼                          ',
  `packing_qty` decimal(13,3) DEFAULT NULL COMMENT '包裝數                                ',
  `net_weigh` decimal(9,3) DEFAULT NULL COMMENT '淨重   ',
  `caton_weight` decimal(9,3) DEFAULT NULL COMMENT '箱重     ',
  `sampling_principle` decimal(13,5) DEFAULT NULL COMMENT '賣價    ',
  `catton_qty_by_dn` decimal(4,0) DEFAULT NULL COMMENT ' DN的箱数',
  `carton_no_from` decimal(4,0) DEFAULT NULL COMMENT '箱號ＦＲＯＭ    ',
  `carton_no_to` decimal(4,0) DEFAULT NULL COMMENT '箱號ＴＯ  ',
  `dn_qty` decimal(11,1) DEFAULT NULL COMMENT 'dn别數量',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '计量单位（入出库）',
  `item_spec` varchar(60) DEFAULT NULL COMMENT '品名规格',
  `rohs_flag` varchar(1) DEFAULT NULL COMMENT '保税标识',
  `customer_name_abbr` varchar(30) DEFAULT NULL COMMENT '顧客簡稱',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_export_fgreturn_so
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_fgreturn_so`;
CREATE TABLE `bnd_export_fgreturn_so` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `so_no` varchar(10) DEFAULT NULL COMMENT 'SO订单',
  `return_so` varchar(10) DEFAULT NULL COMMENT '退货SO',
  `original_invoice` varchar(10) DEFAULT NULL COMMENT '退货原发票',
  `original_shpd_date` date DEFAULT NULL COMMENT 'original_shpd_date',
  `customer_no` varchar(10) DEFAULT NULL COMMENT '顾客代码',
  `invoice_type` varchar(1) DEFAULT NULL COMMENT '發票型態                              ',
  `statement_customer_no` varchar(9) DEFAULT NULL COMMENT '負責付款之顧客                        ',
  `tax_code2` varchar(1) DEFAULT NULL COMMENT '税率别代码２',
  `return_date` int(8) DEFAULT NULL COMMENT '计划退货日期',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `so_qty` decimal(13,3) DEFAULT NULL COMMENT '退货数量',
  `price0` decimal(13,5) DEFAULT NULL COMMENT '价格',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `return_reason` varchar(3) DEFAULT NULL COMMENT '退货原因',
  `bond_flag` varchar(2) DEFAULT NULL COMMENT '保稅標誌',
  `material_document` varchar(10) DEFAULT NULL COMMENT '入庫憑證',
  `actual_return_date` date DEFAULT NULL COMMENT 'actual_return_date',
  `actual_return_qty` decimal(13,3) DEFAULT NULL COMMENT 'actual_return_qty',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_freight
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_freight`;
CREATE TABLE `bnd_export_freight` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `salesman_territory_code` varchar(12) NOT NULL DEFAULT '' COMMENT '地區別',
  `shipping_condition_code` varchar(2) DEFAULT NULL COMMENT '運輸方式',
  `shipping_employee` varchar(30) DEFAULT NULL COMMENT '運輸業者',
  `declaration_no` int(9) DEFAULT NULL COMMENT '報關單號    Z(8)9',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `shipped_date` date DEFAULT NULL COMMENT '出貨日期',
  `division_code` varchar(1) DEFAULT NULL COMMENT '所屬部門',
  `departure_place` varchar(20) DEFAULT NULL COMMENT '出發地',
  `destination` varchar(100) DEFAULT NULL COMMENT '目的地',
  `box_from` int(5) DEFAULT NULL COMMENT '件數',
  `net_weigh` decimal(11,3) DEFAULT NULL COMMENT '重量',
  `selling_price` decimal(13,5) DEFAULT NULL COMMENT '單價',
  `price_method` varchar(20) DEFAULT NULL COMMENT '計價方式',
  `freight_code` decimal(13,5) DEFAULT NULL COMMENT '運費B',
  `other_cost` decimal(13,5) DEFAULT NULL COMMENT '其他費用',
  `freight` decimal(13,5) DEFAULT NULL COMMENT '總運費',
  `statement_customer_no` varchar(9) DEFAULT NULL COMMENT '負責付款之顧客                        ',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '包裝數                                ',
  `amt_cn` decimal(13,2) DEFAULT NULL COMMENT '裝箱金額（本國)                ',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分類代碼                          ',
  `remark1` varchar(160) DEFAULT NULL COMMENT '備  注',
  `name_operator` varchar(20) DEFAULT NULL COMMENT '簽收人',
  `sign_in_time` date DEFAULT NULL COMMENT '簽收時間',
  `remark2` varchar(20) DEFAULT NULL COMMENT '備  注',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`,`salesman_territory_code`),
  UNIQUE KEY `invoice_no` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6512 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_freight_upload
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_freight_upload`;
CREATE TABLE `bnd_export_freight_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `freight` decimal(13,5) DEFAULT NULL COMMENT '总运费',
  `upload_date` date DEFAULT NULL COMMENT '更新时间',
  `error_flag` varchar(1) DEFAULT NULL COMMENT '错误标志',
  `error_reason` varchar(30) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_general_trade
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_general_trade`;
CREATE TABLE `bnd_export_general_trade` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `declare_date` date DEFAULT NULL COMMENT '报关日期',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '报关单号',
  `declaration_amt` decimal(13,2) DEFAULT NULL COMMENT '报关单金额',
  `declare_port` varchar(4) DEFAULT NULL COMMENT '申报口岸',
  `list_no` varchar(18) DEFAULT NULL COMMENT '统一编码',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '发票号码',
  `terms_trade` varchar(4) DEFAULT NULL COMMENT '贸易方式',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30843 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_general_trade_temp
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_general_trade_temp`;
CREATE TABLE `bnd_export_general_trade_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '报关单号',
  `declaration_amt` decimal(13,2) DEFAULT NULL COMMENT '报关单金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_invoice_batch
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_invoice_batch`;
CREATE TABLE `bnd_export_invoice_batch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `packing_serial` int(5) DEFAULT NULL COMMENT '裝箱序號                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批號                                  ',
  `release_status` varchar(2) DEFAULT NULL COMMENT '發行狀態                              ',
  `transaction_qty` decimal(11,1) DEFAULT NULL COMMENT 'TRANSACTION QTY                         ',
  `transaction_amt` decimal(13,2) DEFAULT NULL COMMENT '金额',
  `transaction_date` date DEFAULT NULL COMMENT '异动日期',
  `bond_type` varchar(2) DEFAULT NULL COMMENT '保税类别',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`packing_serial`,`lot_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1121251 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_invoice_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_invoice_d`;
CREATE TABLE `bnd_export_invoice_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `packing_serial` int(5) DEFAULT NULL COMMENT '裝箱序號                              ',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `customer_no` varchar(10) DEFAULT NULL COMMENT '顧客代碼                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '品名（中文）                          ',
  `customer_item_code` varchar(52) DEFAULT NULL COMMENT '顧客品名代碼                          ',
  `unit` varchar(3) DEFAULT NULL COMMENT '計量單位（銷售）                      ',
  `customer_item_spec` varchar(62) DEFAULT NULL COMMENT '顧客品名（中文）                      ',
  `customer_po` varchar(30) DEFAULT NULL COMMENT '顧客購買訂單號碼                      ',
  `po_no` varchar(30) DEFAULT NULL COMMENT '購買訂單號碼                          ',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '包裝數                                ',
  `carton_no_from` decimal(5,0) DEFAULT NULL COMMENT '箱號ＦＲＯＭ                          ',
  `carton_no_to` decimal(5,0) DEFAULT NULL COMMENT '箱號ＴＯ                              ',
  `net_weigh` decimal(13,3) DEFAULT NULL COMMENT '淨重                                  ',
  `caton_weight` decimal(15,3) DEFAULT NULL COMMENT '箱重                                  ',
  `sampling_principle` decimal(13,5) DEFAULT NULL COMMENT '賣價                                  ',
  `mrpcode` varchar(10) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼                        ',
  `so_no` varchar(10) DEFAULT NULL COMMENT 'SO订单',
  `packing_amt` decimal(15,2) DEFAULT NULL COMMENT '金额',
  `original_invoice` varchar(10) DEFAULT NULL COMMENT '退货原发票',
  `catton_qty_by_dn` decimal(5,0) DEFAULT NULL COMMENT 'DN的箱数',
  `pallet_qty` decimal(13,3) DEFAULT NULL COMMENT 'DN的板数',
  `dn_no` varchar(10) DEFAULT NULL COMMENT 'DN号码',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `packing_serial` (`packing_serial`,`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=340270 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_invoice_freight
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_invoice_freight`;
CREATE TABLE `bnd_export_invoice_freight` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `port_code` varchar(3) DEFAULT NULL COMMENT '港口代碼',
  `shipping_condition_code` varchar(1) DEFAULT NULL COMMENT '出貨方式',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '貿易條件',
  `freight_base` varchar(15) DEFAULT NULL COMMENT '運費標準',
  `cabinet_type` varchar(3) DEFAULT NULL COMMENT '櫃型',
  `unit_price` decimal(18,5) DEFAULT NULL COMMENT '單價',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`port_code`,`shipping_condition_code`,`terms_trade`,`cabinet_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_invoice_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_invoice_h`;
CREATE TABLE `bnd_export_invoice_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `release_status` varchar(2) DEFAULT NULL COMMENT '發行狀態                              ',
  `statement_customer_no` varchar(9) DEFAULT NULL COMMENT '負責付款之顧客                        ',
  `shipped_date` date DEFAULT NULL COMMENT '出货日期',
  `shipping_condition_code` varchar(2) DEFAULT NULL COMMENT '运送方式',
  `ship_to_name1_dbcs` varchar(160) DEFAULT NULL COMMENT '出货对象名１（中文）',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '贸易条件',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `shipping_date_rate` decimal(9,5) DEFAULT NULL COMMENT '匯率（出貨日）                        ',
  `packing_date_rate` decimal(9,5) DEFAULT NULL COMMENT '匯率（裝箱日）                        ',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '包裝數                                ',
  `amt_cn` decimal(13,2) DEFAULT NULL COMMENT '裝箱金額（本國）　                    ',
  `amt_foreign` decimal(13,2) DEFAULT NULL COMMENT '裝箱金額（外幣）                      ',
  `box_qty` decimal(3,0) DEFAULT NULL COMMENT '箱号 FROM',
  `total_netwet` decimal(11,3) DEFAULT NULL COMMENT '總淨重                                ',
  `total_grosswet` decimal(11,3) DEFAULT NULL COMMENT '總箱數                                ',
  `invoice_type` varchar(3) DEFAULT NULL COMMENT '發票型態                              ',
  `so_type` varchar(3) DEFAULT NULL COMMENT 'so类型',
  `departure_date` date DEFAULT NULL COMMENT '实际出货日期',
  `bill_to` varchar(10) DEFAULT NULL COMMENT 'bill to',
  `port_description` varchar(30) DEFAULT NULL COMMENT '目的港口',
  `forwarder_code` varchar(20) DEFAULT NULL COMMENT '货运公司',
  `pallet_qty` decimal(10,0) DEFAULT NULL COMMENT '发票总板数',
  `product_country_code` varchar(2) DEFAULT NULL COMMENT '生产国家代码',
  `packing_code` varchar(2) DEFAULT NULL COMMENT '包装代码',
  `customer_no` varchar(10) DEFAULT NULL COMMENT 'sold to',
  `mrp_code` varchar(10) DEFAULT NULL COMMENT 'MRP',
  `bond_type` varchar(2) DEFAULT NULL COMMENT '01,02,03',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=174053 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_list_convert
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_list_convert`;
CREATE TABLE `bnd_export_list_convert` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `item_no` varchar(15) DEFAULT NULL COMMENT '商品貨號',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '出貨版本',
  `unit_price` decimal(18,5) DEFAULT NULL COMMENT '企業申報單價',
  `enterprise_declared_total_price` decimal(18,5) DEFAULT NULL COMMENT '企業申報總價',
  `legal_qty` decimal(18,9) DEFAULT NULL COMMENT '法定數量',
  `sec_legal_qty` decimal(18,9) DEFAULT NULL COMMENT '第二法定數量',
  `weight` decimal(18,9) DEFAULT NULL COMMENT '重量',
  `declare_qty` decimal(18,5) DEFAULT NULL COMMENT '申報數量',
  `gross_weight` decimal(18,5) DEFAULT NULL COMMENT '毛重',
  `net_weigh` decimal(18,5) DEFAULT NULL COMMENT '淨重',
  `packing_qty` decimal(18,5) DEFAULT NULL COMMENT '出貨數量',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_other_invoice_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_other_invoice_d`;
CREATE TABLE `bnd_export_other_invoice_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `express_id` int(5) DEFAULT NULL COMMENT '序號',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '中英文品名',
  `item_spec` varchar(40) DEFAULT NULL COMMENT '規格',
  `unit_price` decimal(19,5) DEFAULT NULL COMMENT '單價',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2206 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_other_invoice_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_other_invoice_h`;
CREATE TABLE `bnd_export_other_invoice_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name_operator` varchar(10) DEFAULT NULL COMMENT '維護者姓名',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'MRP基準代碼',
  `shipped_date` date DEFAULT NULL COMMENT '出貨日期',
  `box_from` decimal(5,0) DEFAULT NULL COMMENT '件數',
  `packing_code1` varchar(11) DEFAULT NULL COMMENT '包裝',
  `net_weight` decimal(11,3) DEFAULT NULL COMMENT '淨重',
  `gross_weight` decimal(11,3) DEFAULT NULL COMMENT '毛重',
  `declare_qty` decimal(11,1) DEFAULT NULL COMMENT '數量',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '單位',
  `origin_country` varchar(6) DEFAULT NULL COMMENT '原產地',
  `packing_volume` varchar(10) DEFAULT NULL COMMENT '體積',
  `trading_country` varchar(6) DEFAULT NULL COMMENT '貿易國',
  `whether_tdk` varchar(4) DEFAULT NULL COMMENT '是否TDK',
  `type` varchar(1) DEFAULT NULL COMMENT '類別',
  `shipping_condition_code` varchar(1) DEFAULT NULL COMMENT '運輸方式',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '貿易條件',
  `amt_foreign` decimal(13,2) DEFAULT NULL COMMENT 'IV總金額',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `contract_no` varchar(10) DEFAULT NULL COMMENT '合同編號',
  `destination` varchar(10) DEFAULT NULL COMMENT '目的地',
  `ship_to1` varchar(50) DEFAULT NULL COMMENT 'SHIP TO 1',
  `ship_to2` varchar(50) DEFAULT NULL COMMENT 'SHIP TO 2',
  `ship_to3` varchar(50) DEFAULT NULL COMMENT 'SHIP TO 3',
  `ship_to4` varchar(50) DEFAULT NULL COMMENT 'SHIP TO 4',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登录人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_name` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1210 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_export_return_replacement
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_return_replacement`;
CREATE TABLE `bnd_export_return_replacement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `so_no` varchar(10) DEFAULT NULL COMMENT 'AASONO                                  ',
  `return_so` varchar(10) DEFAULT NULL COMMENT '退貨聯絡書                            ',
  `indication_type` varchar(2) DEFAULT NULL COMMENT '指示類別                              ',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '原出貨發票                            ',
  `replacement_invoice` varchar(10) DEFAULT NULL COMMENT '補貨出貨發票                          ',
  `return_invoice` varchar(10) DEFAULT NULL COMMENT '退貨發票                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `statement_customer_no` varchar(9) DEFAULT NULL COMMENT '負責付款顧客                          ',
  `ship_to_code` varchar(4) DEFAULT NULL COMMENT '出貨對象                              ',
  `item_spec` varchar(30) DEFAULT NULL COMMENT '品名規格                              ',
  `customer_item_code` varchar(30) DEFAULT NULL COMMENT '顧客品名代碼                          ',
  `state` varchar(2) DEFAULT NULL COMMENT '狀態                                  ',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '原裝箱數                              ',
  `indication_qty` decimal(13,3) DEFAULT NULL COMMENT '指示數量                              ',
  `input_date` date DEFAULT NULL COMMENT '指示日期                              ',
  `lost_qty` decimal(13,3) DEFAULT NULL COMMENT '落帳數                                ',
  `plan_shipping_date` date DEFAULT NULL COMMENT '計畫補貨日或退貨日                    ',
  `actual_shipping_date` date DEFAULT NULL COMMENT '實際補貨日或退貨日                    ',
  `custom_flag` varchar(1) DEFAULT NULL COMMENT '報關標示                              ',
  `alternate_field` varchar(2) DEFAULT NULL COMMENT '備用1                                 ',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT 'AAEXGV                                  ',
  `customer_no` varchar(9) DEFAULT NULL COMMENT 'AACUNR                                  ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `so_no` (`so_no`,`return_so`,`indication_type`,`invoice_no`,`customer_item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_export_shipment
-- ----------------------------
DROP TABLE IF EXISTS `bnd_export_shipment`;
CREATE TABLE `bnd_export_shipment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `customer_so` varchar(10) DEFAULT NULL COMMENT '顧客訂單號碼 /DN',
  `invoice_type` varchar(10) DEFAULT NULL COMMENT '发票类型',
  `transaction_code` varchar(2) DEFAULT NULL COMMENT '異動代碼                              ',
  `mrpcode` varchar(10) DEFAULT NULL COMMENT 'mrp',
  `invoice_date` date DEFAULT NULL COMMENT '發票日                                ',
  `customer_no` varchar(10) DEFAULT NULL COMMENT '顾客代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `statement_customer_no` varchar(9) DEFAULT NULL COMMENT '負責付款之顧客                        ',
  `sold_qty` decimal(18,5) DEFAULT NULL COMMENT '贩卖數量',
  `amt_cny` decimal(13,2) DEFAULT NULL COMMENT '販賣金額（本國）                      ',
  `amt_foreign` decimal(13,2) DEFAULT NULL COMMENT '販賣金額（外幣）                      ',
  `selling_price` decimal(13,5) DEFAULT NULL COMMENT '賣價                                  ',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `rate` double(9,5) DEFAULT NULL COMMENT '汇率',
  `shipped_date` date DEFAULT NULL COMMENT '出库日期',
  `shutdown_reason_code` varchar(3) DEFAULT NULL COMMENT '原因代码',
  `transaction_date` date DEFAULT NULL COMMENT '异动日期',
  `customer_item_code` varchar(52) DEFAULT NULL COMMENT '顾客料号',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_no` (`invoice_no`,`customer_so`)
) ENGINE=InnoDB AUTO_INCREMENT=172450 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_change_log
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_change_log`;
CREATE TABLE `bnd_if_change_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tctype` varchar(30) DEFAULT NULL,
  `tcstdt` varchar(8) DEFAULT NULL,
  `tcsttm` varchar(8) DEFAULT NULL,
  `tcendd` varchar(8) DEFAULT NULL,
  `tcendt` varchar(8) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_change_time2
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_change_time2`;
CREATE TABLE `bnd_if_change_time2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `iffile` varchar(30) DEFAULT NULL,
  `iffild` varchar(40) DEFAULT NULL,
  `ifsrcs` varchar(10) DEFAULT NULL,
  `iflstd` decimal(8,0) DEFAULT NULL,
  `iflstt` decimal(8,0) DEFAULT NULL,
  `iffreq` varchar(30) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fassist4_invoice
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fassist4_invoice`;
CREATE TABLE `bnd_if_fassist4_invoice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `akivnr` varchar(10) DEFAULT NULL COMMENT '發票號碼invoice_no',
  `akdnno` varchar(10) DEFAULT NULL COMMENT 'DN号码dn_no',
  `aksono` varchar(10) DEFAULT NULL COMMENT 'AKSONOso_no',
  `akivtp` varchar(3) DEFAULT NULL COMMENT '订单类型invoice_type',
  `akcunr` varchar(10) DEFAULT NULL COMMENT '顧客代碼customer_no',
  `akstmt` varchar(10) DEFAULT NULL COMMENT '負責付款之顧客statement_customer_no',
  `akcurr` varchar(3) NOT NULL COMMENT '貨幣代碼currency',
  `akshpd` varchar(8) DEFAULT NULL COMMENT '出貨日期shipped_date',
  `akdpdt` varchar(8) DEFAULT NULL COMMENT '实际出货日期departure_date',
  `akbill` varchar(10) DEFAULT NULL COMMENT 'billtobill_to',
  `akplqt` int(5) DEFAULT NULL COMMENT '发票总板数pallet_qty',
  `akctqt` int(5) DEFAULT NULL COMMENT '发票总箱数carton_qty',
  `aktrmc` varchar(3) DEFAULT NULL COMMENT '貿易條件代碼terms_trade',
  `akshpc` varchar(2) DEFAULT NULL COMMENT '運送方式shipping_condition_code',
  `akport` varchar(30) DEFAULT NULL COMMENT '目的港口port_description',
  `akitnr` varchar(18) DEFAULT NULL COMMENT '品名代碼item_no',
  `aksapr` decimal(15,5) DEFAULT NULL COMMENT '賣價sampling_principle',
  `akltno` varchar(10) DEFAULT NULL COMMENT '批號lot_no',
  `aktrqt` decimal(15,3) DEFAULT NULL COMMENT 'transaction_qty',
  `aktpkq` decimal(15,3) DEFAULT NULL COMMENT '发票总数量total_packing_qty',
  `akcawt` decimal(15,3) DEFAULT NULL COMMENT '箱重caton_weight',
  `akntwt` decimal(13,3) DEFAULT NULL COMMENT '淨重net_weigh',
  `akbont` varchar(2) DEFAULT NULL COMMENT '保税类型bond_type',
  `akoivn` varchar(10) DEFAULT NULL COMMENT '退货原发票original_invoice',
  `akpkam` decimal(15,2) DEFAULT NULL COMMENT 'AKPKAMpacking_amt',
  `aksntp` varchar(1) DEFAULT NULL COMMENT '接口类型send_type',
  `akcupo` varchar(30) DEFAULT NULL COMMENT '顧客購買訂單號碼customer_po',
  `akpono` varchar(30) DEFAULT NULL COMMENT '購買訂單號碼po_no',
  `akctnf` int(5) DEFAULT NULL COMMENT '箱號ＦＲＯＭcarton_no_from',
  `akctnt` int(5) DEFAULT NULL COMMENT '箱號ＴＯcarton_no_to',
  `akctnq` int(5) DEFAULT NULL COMMENT 'DN总箱数catton_qty_by_dn',
  `akpltq` int(5) DEFAULT NULL COMMENT 'DN总板数pallet_qty',
  `akfrgc` varchar(20) DEFAULT NULL COMMENT '货运公司forwarder_code',
  `akstat` varchar(2) DEFAULT NULL COMMENT '处理标识state',
  `akupdt` varchar(14) DEFAULT NULL,
  `akcpnr` varchar(52) DEFAULT NULL COMMENT '顧客品名代碼customer_item_code',
  `akcpdd` varchar(62) DEFAULT NULL COMMENT '顧客品名（中文）customer_item_spec',
  `akbasq` bigint(18) NOT NULL COMMENT '价格单位price_base_qty',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `akivnr` (`akivnr`,`akdnno`,`akltno`)
) ENGINE=InnoDB AUTO_INCREMENT=462902 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fassist4_pgi
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fassist4_pgi`;
CREATE TABLE `bnd_if_fassist4_pgi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sdivnr` varchar(10) DEFAULT NULL,
  `sdivdt` varchar(8) DEFAULT NULL,
  `sdstat` varchar(1) DEFAULT NULL,
  `sdupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fcaip_declare_list
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fcaip_declare_list`;
CREATE TABLE `bnd_if_fcaip_declare_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internal_number` varchar(64) DEFAULT NULL COMMENT '内部清单编号',
  `bill_no` varchar(64) DEFAULT NULL COMMENT '核注清单号',
  `list_no` varchar(18) DEFAULT NULL COMMENT '清单统一编号',
  `list_declare_date` date DEFAULT NULL COMMENT '清单申报日',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '报关单号',
  `ie_date` date DEFAULT NULL COMMENT '进出口日期',
  `declare_date` date DEFAULT NULL COMMENT '报关单申报日期',
  `transaction_code` varchar(2) DEFAULT NULL COMMENT '異動代碼                              ',
  `fee_mark` varchar(1) DEFAULT NULL,
  `fee_rate` decimal(18,5) DEFAULT NULL,
  `fee_curr` varchar(3) DEFAULT NULL,
  `insur_mark` varchar(1) DEFAULT NULL,
  `insur_rate` decimal(18,5) DEFAULT NULL,
  `insur_curr` varchar(3) DEFAULT NULL,
  `other_mark` varchar(1) DEFAULT NULL,
  `other_rate` decimal(18,5) DEFAULT NULL,
  `other_curr` varchar(3) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `error_message` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `internal_number` (`internal_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11761 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_if_fepo_asn
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fepo_asn`;
CREATE TABLE `bnd_if_fepo_asn` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `snivnr` varchar(10) DEFAULT NULL COMMENT '到貨發票',
  `snivln` decimal(4,0) DEFAULT NULL COMMENT '發票行號',
  `snstat` varchar(2) DEFAULT NULL COMMENT '發票狀態',
  `snvdnr` varchar(7) DEFAULT NULL COMMENT '供應商代碼',
  `snmrpc` varchar(3) DEFAULT NULL COMMENT ' MRP',
  `snitnr` varchar(15) DEFAULT NULL COMMENT '材料品番',
  `snvinr` varchar(30) DEFAULT NULL COMMENT '供應商品番',
  `snpopr` decimal(13,5) DEFAULT NULL COMMENT '購買單價',
  `snpbdq` decimal(13,3) DEFAULT NULL COMMENT '在途數量',
  `snpbam` decimal(13,2) DEFAULT NULL COMMENT '在途金額',
  `sncurr` varchar(3) DEFAULT NULL COMMENT '比別',
  `snpbdt` varchar(8) DEFAULT NULL COMMENT '在途日期',
  `snpoum` varchar(3) DEFAULT NULL COMMENT '購買單位',
  `snpocf` decimal(11,5) DEFAULT NULL COMMENT '換算係數',
  `snntwt` decimal(13,5) DEFAULT NULL COMMENT '總淨重',
  `sngrwt` decimal(13,5) DEFAULT NULL COMMENT '總毛重',
  `snvctg` varchar(5) DEFAULT NULL COMMENT '原產國',
  `sngfnr` varchar(15) DEFAULT NULL COMMENT '關封號碼',
  `sngfsn` decimal(4,0) DEFAULT NULL COMMENT '關封序號',
  `snpnct` varchar(3) DEFAULT NULL COMMENT '板代碼',
  `snpsum` decimal(6,0) DEFAULT NULL COMMENT '總板數',
  `snboct` varchar(3) DEFAULT NULL COMMENT '包裝代碼',
  `snbsum` decimal(6,0) DEFAULT NULL COMMENT '總箱數',
  `sngfdi` varchar(15) DEFAULT NULL COMMENT '工發地',
  `sntran` varchar(2) DEFAULT NULL COMMENT '運送方式',
  `sntrmc` varchar(3) DEFAULT NULL COMMENT '貿易條件',
  `snupdt` decimal(14,0) DEFAULT NULL COMMENT '更新日期',
  `snrcdt` varchar(1) DEFAULT NULL COMMENT '記錄類型',
  `snpono` varchar(10) DEFAULT NULL COMMENT ' PO NO.',
  `snpoln` varchar(5) DEFAULT NULL COMMENT ' PO LINE',
  `snflag` varchar(1) DEFAULT NULL COMMENT ' 1已處理',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=829802 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fepo_gr
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fepo_gr`;
CREATE TABLE `bnd_if_fepo_gr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grivnr` varchar(10) DEFAULT NULL COMMENT '到貨發票',
  `grrgdc` varchar(8) DEFAULT NULL COMMENT '到貨日期',
  `grtype` varchar(1) DEFAULT NULL COMMENT ' A:到貨C:取消到貨',
  `grstat` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `grupdt` decimal(8,0) DEFAULT NULL COMMENT 'UPDATE DATE',
  `gruptm` decimal(6,0) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235337 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_batch_lot
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_batch_lot`;
CREATE TABLE `bnd_if_fmts_batch_lot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blcoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `blpkno` varchar(14) DEFAULT NULL COMMENT 'PACK_NO',
  `blpkdt` varchar(8) DEFAULT NULL COMMENT 'PACK DATE',
  `blitnr` varchar(15) DEFAULT NULL COMMENT 'PROD_PN.',
  `blbach` varchar(10) DEFAULT NULL COMMENT 'BATCH NO.',
  `blbexg` decimal(9,0) DEFAULT NULL COMMENT 'BATCH BOM_VER.',
  `blsapm` varchar(12) DEFAULT NULL COMMENT 'SAP MO',
  `blmonr` varchar(10) DEFAULT NULL COMMENT 'LOT NO.',
  `bllexg` decimal(9,0) DEFAULT NULL COMMENT 'LOT NO BOM_VER',
  `bllotq` decimal(13,3) DEFAULT NULL COMMENT 'PACK_QTY',
  `blrcdt` varchar(1) DEFAULT NULL COMMENT 'RECORD TYPE',
  `blstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `blupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_mo
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_mo`;
CREATE TABLE `bnd_if_fmts_mo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mococe` varchar(10) DEFAULT NULL COMMENT '部門代碼                              ',
  `moyymm` varchar(6) DEFAULT NULL COMMENT '關帳年月                              ',
  `momonr` varchar(12) DEFAULT NULL COMMENT 'SAP製造訂單號碼                       ',
  `moltno` varchar(10) DEFAULT NULL COMMENT 'MTS LOT號                             ',
  `mobach` varchar(10) DEFAULT NULL COMMENT 'LOT 入庫批次                          ',
  `mowipn` varchar(40) DEFAULT NULL COMMENT 'WIP_ID                                  ',
  `moitnr` varchar(15) DEFAULT NULL COMMENT '品番                                  ',
  `motype` varchar(4) DEFAULT NULL COMMENT 'SAP MO類型  ZP01正常 ZP39再生  ZP02 重工 ZP34转品番                      ',
  `molotp` varchar(1) DEFAULT NULL COMMENT 'LOT類型 N正常 S分割 M合并 C转品番',
  `mortnr` varchar(15) DEFAULT NULL COMMENT '製造途程代碼                          ',
  `morvnr` varchar(6) DEFAULT NULL COMMENT '製造途程版本                          ',
  `moplnq` decimal(10,3) DEFAULT NULL COMMENT '投入數                                ',
  `morgdd` decimal(8,0) DEFAULT NULL COMMENT '開始日                                ',
  `mowips` varchar(2) DEFAULT NULL COMMENT '順序號                                ',
  `mocops` decimal(4,0) DEFAULT NULL COMMENT '當前工序                              ',
  `mocwkn` varchar(10) DEFAULT NULL COMMENT '當前工作站                            ',
  `moline` varchar(10) DEFAULT NULL COMMENT '生產線                                ',
  `mojobn` varchar(15) DEFAULT NULL COMMENT '工作代碼                              ',
  `mocunr` varchar(10) DEFAULT NULL COMMENT '顧客代碼                              ',
  `mojob2` varchar(10) DEFAULT NULL COMMENT '捺印號                                ',
  `moflag` varchar(1) DEFAULT NULL COMMENT '標示A,D,U, P修改投入数，M修改remark   ',
  `mostat` varchar(1) DEFAULT NULL COMMENT '狀態                                  ',
  `moupsr` varchar(10) DEFAULT NULL,
  `moupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6437 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_mo_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_mo_d`;
CREATE TABLE `bnd_if_fmts_mo_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `odcoce` varchar(10) DEFAULT NULL COMMENT '部門代碼                              ',
  `odmonr` varchar(12) DEFAULT NULL COMMENT 'SAP MO號碼                            ',
  `odrtnr` varchar(12) DEFAULT NULL COMMENT 'ROUING GROUP+COUNT                      ',
  `odopsq` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `odwoce` varchar(8) DEFAULT NULL COMMENT '工作站                                ',
  `odctky` varchar(10) DEFAULT NULL COMMENT 'CONTROL KEY                             ',
  `odrseq` varchar(15) DEFAULT NULL COMMENT 'SEQNO.                                ',
  `odspsa` varchar(3) DEFAULT NULL COMMENT '線邊倉                                ',
  `odflag` varchar(1) DEFAULT NULL COMMENT '標示                                  ',
  `odstat` varchar(1) DEFAULT NULL COMMENT '狀態                                  ',
  `odupsr` varchar(10) DEFAULT NULL,
  `odupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45501 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_mo_defect
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_mo_defect`;
CREATE TABLE `bnd_if_fmts_mo_defect` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mdcoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `mdyymm` varchar(6) DEFAULT NULL COMMENT 'STAKE_MONTH',
  `mdsapm` varchar(12) DEFAULT NULL COMMENT 'SAP_MO',
  `mdmonr` varchar(10) DEFAULT NULL COMMENT 'MTS_LOT',
  `mdwipi` varchar(40) DEFAULT NULL COMMENT 'WIP_ID',
  `mditnr` varchar(15) DEFAULT NULL COMMENT 'ITEM NO.',
  `mdopsq` decimal(4,0) DEFAULT NULL COMMENT 'OPERATION SEQUENCE NO.',
  `mdwknr` varchar(10) DEFAULT NULL COMMENT 'WORK CENTER NO.',
  `mddfcd` varchar(10) DEFAULT NULL COMMENT 'DEFECT CODE',
  `mddftq` decimal(13,3) DEFAULT NULL COMMENT 'DEFECT QTY',
  `mdrcdt` varchar(1) DEFAULT NULL COMMENT 'RECORD TYPE',
  `mdstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `mdupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_mo_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_mo_h`;
CREATE TABLE `bnd_if_fmts_mo_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mhcoce` varchar(10) DEFAULT NULL COMMENT '部門代碼                              ',
  `mhplnt` varchar(4) DEFAULT NULL COMMENT '關帳年月                              ',
  `mhmonr` varchar(12) DEFAULT NULL COMMENT '製造訂單號碼                          ',
  `mhtype` varchar(4) DEFAULT NULL COMMENT 'SAP MO類型                            ',
  `mhpdvr` varchar(4) DEFAULT NULL COMMENT 'MO生產版本                            ',
  `mhitnr` varchar(18) DEFAULT NULL COMMENT '品番                                  ',
  `mhitds` varchar(40) DEFAULT NULL COMMENT 'ITEM DESCRIPTIONS                       ',
  `mhplnq` decimal(13,1) DEFAULT NULL COMMENT '投入數                                ',
  `mhpstd` decimal(8,0) DEFAULT NULL COMMENT '計劃開始日                            ',
  `mhpcpd` decimal(8,0) DEFAULT NULL COMMENT '計劃完成日                            ',
  `mhstlc` varchar(4) DEFAULT NULL COMMENT 'STORAGE LOCATION                        ',
  `mhbbom` decimal(13,3) DEFAULT NULL COMMENT 'BOM基數                               ',
  `mhrtnr` varchar(20) DEFAULT NULL COMMENT '製造途程代碼                          ',
  `mhpdsv` varchar(3) DEFAULT NULL COMMENT '生產管理者                            ',
  `mhcpit` varchar(18) DEFAULT NULL COMMENT '參考品番                              ',
  `mhioum` varchar(3) DEFAULT NULL COMMENT '單位                                  ',
  `mhmdqa` varchar(25) DEFAULT NULL COMMENT '模穴/等級                           ',
  `mhcunr` varchar(14) DEFAULT NULL COMMENT '顧客代碼                              ',
  `mhrgdd` decimal(8,0) DEFAULT NULL COMMENT '開始日                                ',
  `mhlotc` varchar(1) DEFAULT NULL COMMENT '批次管理區分                          ',
  `mhbond` varchar(1) DEFAULT NULL COMMENT '保稅標示                              ',
  `mhpfct` varchar(10) DEFAULT NULL COMMENT '利潤中心                              ',
  `mhlbfg` varchar(1) DEFAULT NULL,
  `mhflag` varchar(1) DEFAULT NULL,
  `mhstat` varchar(1) DEFAULT NULL,
  `mhupsr` varchar(10) DEFAULT NULL,
  `mhupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `mhcoce` (`mhcoce`,`mhmonr`,`mhupdt`,`mhflag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7216 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_mo_recycle
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_mo_recycle`;
CREATE TABLE `bnd_if_fmts_mo_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ricoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `rimonr` varchar(10) DEFAULT NULL COMMENT 'MTS LOT',
  `riopsq` decimal(4,0) DEFAULT NULL COMMENT 'RECY_OPR_ID',
  `ridmon` varchar(10) DEFAULT NULL COMMENT 'DEFECT MTS LOT',
  `ridops` int(4) DEFAULT NULL COMMENT 'DEF_OPR_ID',
  `ridqty` decimal(13,5) DEFAULT NULL COMMENT 'RECY_QTY',
  `rircdt` varchar(1) DEFAULT NULL COMMENT 'RECORD TYPE',
  `ristat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `riupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_mo_remark
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_mo_remark`;
CREATE TABLE `bnd_if_fmts_mo_remark` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lrcoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `lrmonr` varchar(10) DEFAULT NULL COMMENT 'LOT NO',
  `lrwipn` varchar(40) DEFAULT NULL COMMENT 'WIP_ID',
  `lrwknr` varchar(10) DEFAULT NULL COMMENT 'WORKCENTER.',
  `lrrmk1` varchar(10) DEFAULT NULL COMMENT 'REMARK1.',
  `lrrmk2` varchar(10) DEFAULT NULL COMMENT 'REMARK2.',
  `lrrmk3` varchar(10) DEFAULT NULL COMMENT 'REMARK3.',
  `lrrmk4` varchar(10) DEFAULT NULL COMMENT 'REMARK4.',
  `lrrmk5` varchar(10) DEFAULT NULL COMMENT 'REMARK5.',
  `lrrmk6` varchar(10) DEFAULT NULL COMMENT 'REMARK6.',
  `lrflag` varchar(1) DEFAULT NULL COMMENT 'A-ADD  D-DELETE',
  `lrstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `lropid` varchar(10) DEFAULT NULL COMMENT 'UPDATE OPERATOR ID',
  `lrupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_mo_version
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_mo_version`;
CREATE TABLE `bnd_if_fmts_mo_version` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bvcoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `bvbach` varchar(10) DEFAULT NULL COMMENT 'BATCH_NO',
  `bvitnr` varchar(15) DEFAULT NULL COMMENT 'PROD_PN',
  `bvexgv` decimal(9,0) DEFAULT NULL COMMENT 'BOM_VER.',
  `bvcrtd` varchar(8) DEFAULT NULL COMMENT 'CRE_DATE',
  `bvmold` varchar(2) DEFAULT NULL COMMENT 'MOLD',
  `bvquag` varchar(2) DEFAULT NULL COMMENT 'QUALITY GRADE',
  `bvcunr` varchar(12) DEFAULT NULL COMMENT 'CUSTOMER CODE',
  `bvstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `bvupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_process_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_process_d`;
CREATE TABLE `bnd_if_fmts_process_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pmcoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `pmyymm` varchar(6) DEFAULT NULL COMMENT 'STAKE_MONTH',
  `pmwipi` varchar(40) DEFAULT NULL COMMENT 'WIP_ID',
  `pmwips` decimal(2,0) DEFAULT NULL COMMENT 'WIP_SEQ',
  `pmsapm` varchar(12) DEFAULT NULL COMMENT 'SAP_MO',
  `pmmonr` varchar(10) DEFAULT NULL COMMENT 'MTS_LOT',
  `pmopsq` decimal(4,0) DEFAULT NULL COMMENT 'OPERATION SEQUENCE NO.',
  `pmwknr` varchar(10) DEFAULT NULL COMMENT 'WORK CENTER NO.',
  `pmmitn` varchar(15) DEFAULT NULL COMMENT 'MATERIAL ITEM NO.',
  `pmmlot` varchar(10) DEFAULT NULL COMMENT 'MATERIAL LOT NO.',
  `pmbomv` decimal(9,0) DEFAULT NULL COMMENT 'BOM_VER',
  `pmmqty` decimal(18,9) DEFAULT NULL COMMENT 'MATERIAL QTY',
  `pmdftq` decimal(18,9) DEFAULT NULL COMMENT 'MATERIAL DEFECT QTY',
  `pmlosq` decimal(18,9) DEFAULT NULL COMMENT 'MATERIAL LOSS QTY',
  `pmrcdt` varchar(1) DEFAULT NULL COMMENT 'RECORD TYPE',
  `pmstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `pmupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `pmvdlo` varchar(10) DEFAULT NULL COMMENT 'VENDOR LOT NO.',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_process_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_process_h`;
CREATE TABLE `bnd_if_fmts_process_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phcoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `phyymm` varchar(6) DEFAULT NULL COMMENT 'STAKE_MONTH',
  `phwipi` varchar(40) DEFAULT NULL COMMENT 'WIP_ID',
  `phwips` decimal(2,0) DEFAULT NULL COMMENT 'WIP_SEQ',
  `phsapm` varchar(12) DEFAULT NULL COMMENT 'SAP_MO',
  `phmonr` varchar(10) DEFAULT NULL COMMENT 'MTS_LOT',
  `phitnr` varchar(15) DEFAULT NULL COMMENT 'ITEM NO.',
  `phopsq` decimal(4,0) DEFAULT NULL COMMENT 'OPERATION SEQUENCE NO.',
  `phwknr` varchar(10) DEFAULT NULL COMMENT 'WORK CENTER NO.',
  `phintm` decimal(14,0) DEFAULT NULL COMMENT 'IN_TIME',
  `phoutt` decimal(14,0) DEFAULT NULL COMMENT 'OUT_TIME',
  `phinqt` decimal(13,3) DEFAULT NULL COMMENT 'IN_QTY',
  `phoutq` decimal(13,3) DEFAULT NULL COMMENT 'OUT_QTY',
  `phngqt` decimal(13,3) DEFAULT NULL COMMENT 'NG_QTY',
  `phrcdt` varchar(1) DEFAULT NULL COMMENT 'RECORD TYPE',
  `phstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `phpack` varchar(15) DEFAULT NULL COMMENT 'PACKING',
  `phupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_process_m
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_process_m`;
CREATE TABLE `bnd_if_fmts_process_m` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `macoce` varchar(10) DEFAULT NULL COMMENT '部門代碼                              ',
  `mamonr` varchar(12) DEFAULT NULL COMMENT 'SAP MO                                  ',
  `maitnr` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `maopid` decimal(4,0) DEFAULT NULL COMMENT '綁定工序                              ',
  `mamlot` varchar(10) DEFAULT NULL COMMENT '指定材料批號                          ',
  `macitm` varchar(15) DEFAULT NULL COMMENT '材料品名代碼                          ',
  `maalgr` varchar(2) DEFAULT NULL COMMENT '替代材料組別                          ',
  `maairo` varchar(2) DEFAULT NULL COMMENT '替代材料順序                          ',
  `mauspi` varchar(3) DEFAULT NULL COMMENT '替代材料比率                          ',
  `macpri` decimal(20,9) DEFAULT NULL COMMENT '材料單耗                              ',
  `mabol1` decimal(13,3) DEFAULT NULL COMMENT '材料凈耗                              ',
  `mabol2` decimal(13,3) DEFAULT NULL COMMENT '材料損耗                              ',
  `maflag` varchar(1) DEFAULT NULL COMMENT '狀態                                  ',
  `mastat` varchar(1) DEFAULT NULL COMMENT '狀態                                  ',
  `maupsr` varchar(10) DEFAULT NULL,
  `maupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65537 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_send_log
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_send_log`;
CREATE TABLE `bnd_if_fmts_send_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ixtask` varchar(20) DEFAULT NULL,
  `ixupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_split_merge
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_split_merge`;
CREATE TABLE `bnd_if_fmts_split_merge` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `smcoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `smyymm` varchar(6) DEFAULT NULL COMMENT 'STAKE_MONTH',
  `smactn` varchar(1) DEFAULT NULL COMMENT 'S-SPLIT M-MERGE C.TRANSFER',
  `smosap` varchar(12) DEFAULT NULL COMMENT 'ORIGINAL SAP_MO',
  `smomon` varchar(10) DEFAULT NULL COMMENT 'ORIGINAL MTS LOT NO.',
  `smtsap` varchar(12) DEFAULT NULL COMMENT 'TARGET SAP_MO',
  `smtmon` varchar(10) DEFAULT NULL COMMENT 'TARGET MTS LOT NO.',
  `smwknr` varchar(10) DEFAULT NULL COMMENT 'WORK CENTER NO.',
  `smoqty` decimal(13,3) DEFAULT NULL COMMENT 'FROM QTY',
  `smtqty` decimal(13,3) DEFAULT NULL COMMENT 'TO QTY',
  `smpqty` decimal(13,3) DEFAULT NULL COMMENT 'PROCESS QTY',
  `smstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `smupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fmts_wip
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fmts_wip`;
CREATE TABLE `bnd_if_fmts_wip` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `wicoce` varchar(10) DEFAULT NULL COMMENT 'CO_CODE',
  `wiyymm` varchar(6) DEFAULT NULL COMMENT 'STAKE_MONTH',
  `wisapm` varchar(12) DEFAULT NULL COMMENT 'SAP_MO',
  `wimonr` varchar(10) DEFAULT NULL COMMENT 'MTS_LOT',
  `wiwknr` varchar(10) DEFAULT NULL COMMENT 'WIP_PROC_ID',
  `wiitnr` varchar(15) DEFAULT NULL COMMENT 'ITEM NO.',
  `wilots` varchar(2) DEFAULT NULL COMMENT 'LOT_STATUS',
  `wiopsq` decimal(4,0) DEFAULT NULL COMMENT 'OPERATION SEQUENCE NO.',
  `wiinqt` decimal(13,3) DEFAULT NULL COMMENT 'IN_QTY',
  `wiwipq` decimal(13,3) DEFAULT NULL COMMENT 'WIP-QTY',
  `wioutq` decimal(13,3) DEFAULT NULL COMMENT 'OUT_QTY',
  `wingqt` decimal(13,3) DEFAULT NULL COMMENT 'NG_QTY',
  `wiindt` varchar(8) DEFAULT NULL COMMENT 'START_DATE',
  `wiflag` varchar(1) DEFAULT NULL COMMENT 'FLAG',
  `wistat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `wiupdt` varchar(14) DEFAULT NULL COMMENT 'UPDATE TIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53013 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_average_price
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_average_price`;
CREATE TABLE `bnd_if_fsap_average_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `m2itnr` varchar(18) DEFAULT NULL,
  `m2avgp` decimal(11,2) DEFAULT NULL,
  `m2avgn` decimal(5,0) DEFAULT NULL,
  `m2stat` decimal(1,0) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_customer
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_customer`;
CREATE TABLE `bnd_if_fsap_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(10) DEFAULT NULL COMMENT '顾客代码',
  `account_group` varchar(4) DEFAULT NULL COMMENT 'CSACCG',
  `customer_name1_dbcs` varchar(160) DEFAULT NULL COMMENT '顾客中文名称',
  `customer_name1` varchar(70) DEFAULT NULL COMMENT '顾客名称',
  `customer_name_abbr_dbcs` varchar(60) DEFAULT NULL COMMENT '顾客中文简称',
  `customer_name_abbr` varchar(25) DEFAULT NULL COMMENT '顾客简称',
  `address1_dbcs` varchar(250) DEFAULT NULL COMMENT '中文地址',
  `address1` varchar(145) DEFAULT NULL COMMENT '地址',
  `invoice_type` varchar(1) DEFAULT NULL COMMENT '发票型态',
  `tax_code2` varchar(1) DEFAULT NULL COMMENT '税率别代码2',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `country_code` varchar(2) DEFAULT NULL COMMENT '国家代码',
  `city_name_dbcs` varchar(100) DEFAULT NULL COMMENT '城市名',
  `state` varchar(1) DEFAULT NULL COMMENT '0未处理1已处理',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`customer_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2296 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_fgreturn
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_fgreturn`;
CREATE TABLE `bnd_if_fsap_fgreturn` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `srsono` varchar(10) DEFAULT NULL COMMENT 'SO订单so_no',
  `srrkpz` varchar(10) DEFAULT NULL COMMENT '入庫憑證material_document',
  `srrkpi` varchar(6) DEFAULT NULL COMMENT '入庫憑證項號md_item',
  `srcxpz` varchar(10) DEFAULT NULL COMMENT '沖銷憑證reverse_document',
  `srcxpi` varchar(6) DEFAULT NULL COMMENT '沖銷憑證項號rd_item',
  `srtrdt` varchar(8) DEFAULT NULL COMMENT '异动日期transaction_date',
  `sritnr` varchar(15) DEFAULT NULL COMMENT '品名代码item_no',
  `srltno` varchar(10) DEFAULT NULL COMMENT '批號lot_no',
  `srtrqt` decimal(11,1) DEFAULT NULL COMMENT 'BATCH入库数量transaction_qty',
  `srstat` varchar(1) DEFAULT NULL COMMENT '状态state',
  `srupdt` varchar(14) DEFAULT NULL COMMENT '更新时间update_time',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1940 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_fgreturn_so
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_fgreturn_so`;
CREATE TABLE `bnd_if_fsap_fgreturn_so` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sosono` varchar(10) DEFAULT NULL COMMENT 'SO订单so_no ',
  `sodfno` varchar(10) DEFAULT NULL COMMENT '退货SOreturn_so',
  `sooivn` varchar(10) DEFAULT NULL COMMENT '退货原发票original_invoice',
  `socunr` varchar(10) DEFAULT NULL COMMENT '顾客代码customer_no',
  `sostmt` varchar(10) DEFAULT NULL COMMENT '負責付款之顧客                        statement_customer_no',
  `sopshd` varchar(8) DEFAULT NULL COMMENT '计划退货日期return_date',
  `soitnr` varchar(15) DEFAULT NULL COMMENT '品名代码item_no',
  `sosoqt` decimal(13,3) DEFAULT NULL COMMENT '退货数量so_qty',
  `sopric` decimal(13,5) DEFAULT NULL COMMENT '价格price0',
  `socurr` varchar(3) DEFAULT NULL COMMENT '币别currency',
  `sorttp` varchar(3) DEFAULT NULL COMMENT '退货原因return_reason',
  `sobdfg` varchar(2) DEFAULT NULL COMMENT '保稅標誌bond_flag',
  `sodelf` varchar(1) DEFAULT NULL COMMENT '刪除標誌delete_flag',
  `sostat` varchar(1) DEFAULT NULL COMMENT '状态state',
  `soupdt` varchar(14) DEFAULT NULL COMMENT '更新时间',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3109 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_item
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_item`;
CREATE TABLE `bnd_if_fsap_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `m1itnr` varchar(18) DEFAULT NULL COMMENT '品番',
  `m1mttp` varchar(4) DEFAULT NULL COMMENT '类别',
  `m1prfg` varchar(1) DEFAULT NULL COMMENT '購買品區分',
  `m1prsf` varchar(1) DEFAULT NULL COMMENT '採購材料樣品區分',
  `m1itdd` varchar(100) DEFAULT NULL COMMENT '中文品名描述',
  `m1itds` varchar(60) DEFAULT NULL COMMENT '英文品名描述',
  `m1spec` varchar(40) DEFAULT NULL COMMENT '品名規格',
  `m1icls` varchar(5) DEFAULT NULL COMMENT '品名分類',
  `m1hscd` varchar(17) DEFAULT NULL COMMENT 'HS-CODE',
  `m1rate` decimal(5,2) DEFAULT NULL COMMENT '稅率',
  `m1ioum` varchar(3) DEFAULT NULL COMMENT '基本單位',
  `m1pium` varchar(3) DEFAULT NULL COMMENT '監管單位',
  `m1picf` decimal(18,9) DEFAULT NULL COMMENT '監管單位与基本單位換算係數',
  `m1wtum` varchar(3) DEFAULT NULL COMMENT '淨重重量单位',
  `m1wrnt` decimal(8,0) DEFAULT NULL COMMENT '淨重重量个数',
  `m1ntwt` decimal(18,9) DEFAULT NULL COMMENT '淨重',
  `m1bond` varchar(1) DEFAULT NULL COMMENT '保稅區分',
  `m1mrpc` varchar(3) DEFAULT NULL COMMENT '部門（MRP)',
  `m1gnbr` varchar(9) DEFAULT NULL COMMENT '归并项号',
  `m1egnr` varchar(30) DEFAULT NULL COMMENT '圖面編號',
  `m1std4` varchar(4) DEFAULT NULL COMMENT '有鹵無鹵區分',
  `m1pltq` decimal(13,3) DEFAULT NULL COMMENT '台板載運數',
  `m1itgp` varchar(9) DEFAULT NULL COMMENT '機種別',
  `m1stdc` decimal(11,2) DEFAULT NULL COMMENT '标准成本',
  `m1sdcn` decimal(5,0) DEFAULT NULL COMMENT '標準成本個數',
  `m1srt1` varchar(5) DEFAULT NULL COMMENT '分類代碼1',
  `m1srt2` varchar(5) DEFAULT NULL COMMENT '分類代碼2',
  `m1srt3` varchar(5) DEFAULT NULL COMMENT '分類代碼3',
  `m1srt4` varchar(5) DEFAULT NULL COMMENT '分類代碼4',
  `m1srt5` varchar(5) DEFAULT NULL COMMENT '分類代碼5',
  `m1srt6` varchar(5) DEFAULT NULL COMMENT '分類代碼6',
  `m1srt7` varchar(5) DEFAULT NULL COMMENT '分類代碼7',
  `m1srt8` varchar(5) DEFAULT NULL COMMENT '分類代碼8',
  `m1srt9` varchar(5) DEFAULT NULL COMMENT '分類代碼9',
  `m1srt0` varchar(5) DEFAULT NULL COMMENT '分類代碼10',
  `m1itza` varchar(1) DEFAULT NULL COMMENT 'Usage code',
  `m1stkc` varchar(1) DEFAULT NULL COMMENT 'stock code',
  `m1rohs` varchar(1) DEFAULT NULL COMMENT 'Rohs flag',
  `m1stat` decimal(1,0) DEFAULT NULL,
  `m1titd` varchar(100) DEFAULT NULL COMMENT '中文品名',
  `m1updt` decimal(14,0) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334220 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_item_bk
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_item_bk`;
CREATE TABLE `bnd_if_fsap_item_bk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `material_type` varchar(4) DEFAULT NULL COMMENT '0',
  `procurement_flag` varchar(1) DEFAULT NULL COMMENT '0',
  `procurement_sample_flag` varchar(1) DEFAULT NULL COMMENT '0',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '品名（中文）',
  `item_descrip_en` varchar(60) DEFAULT NULL COMMENT '品名英文描述',
  `item_spec` varchar(40) DEFAULT NULL COMMENT '品名规格',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分类代码',
  `hs_code` varchar(17) DEFAULT NULL COMMENT '商编',
  `ie_tax_rate` decimal(5,2) DEFAULT NULL COMMENT '税率',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '计量单位（入出库）',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '计量单位（盘点）',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '盘点单位换算系数',
  `um_weight` varchar(3) DEFAULT NULL COMMENT '计量单位（重量）',
  `warranty_period` decimal(8,0) DEFAULT NULL COMMENT '保证期间',
  `net_weigh` decimal(13,3) DEFAULT NULL COMMENT '净重',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT '保税标志',
  `mrpcode` varchar(10) DEFAULT NULL COMMENT 'mrp',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '归并项号',
  `engineering_drawing_no` varchar(30) DEFAULT NULL COMMENT '技术图面编号',
  `safety_standard_code4` varchar(4) DEFAULT NULL COMMENT '安规标准４',
  `pallet_qty` decimal(13,3) DEFAULT NULL COMMENT '台板载运数',
  `item_group_code` varchar(9) DEFAULT NULL COMMENT '机种别',
  `standard_cost` decimal(16,7) DEFAULT NULL COMMENT '标准成本',
  `standard_cost_number` decimal(5,0) DEFAULT NULL COMMENT '0',
  `sorting_key1` varchar(5) DEFAULT NULL COMMENT '分类代码１',
  `sorting_key2` varchar(5) DEFAULT NULL COMMENT '分类代码２',
  `sorting_key3` varchar(5) DEFAULT NULL COMMENT '分类代码３',
  `sorting_key4` varchar(5) DEFAULT NULL COMMENT '分类代码４',
  `sorting_key5` varchar(5) DEFAULT NULL COMMENT '分类代码５',
  `sorting_key6` varchar(5) DEFAULT NULL COMMENT '分类代码６',
  `sorting_key7` varchar(5) DEFAULT NULL COMMENT '分类代码７',
  `sorting_key8` varchar(5) DEFAULT NULL COMMENT '分类代码８',
  `sorting_key9` varchar(5) DEFAULT NULL COMMENT '分类代码９',
  `sorting_key10` varchar(5) DEFAULT NULL COMMENT '分类代码１０',
  `itemized_application_code` varchar(1) DEFAULT NULL COMMENT '品名应用代码',
  `stock_code` varchar(1) DEFAULT NULL COMMENT '常备区分',
  `rohs_flag` varchar(1) DEFAULT NULL COMMENT '0',
  `state` varchar(1) DEFAULT NULL COMMENT '状态',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_iv_cancel
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_iv_cancel`;
CREATE TABLE `bnd_if_fsap_iv_cancel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `scivnr` varchar(35) DEFAULT NULL,
  `sccndt` varchar(8) DEFAULT NULL,
  `scstat` varchar(1) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_mbom
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_mbom`;
CREATE TABLE `bnd_if_fsap_mbom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bsitnr` varchar(18) DEFAULT NULL COMMENT 'ITEM NO.',
  `bsbomn` varchar(8) DEFAULT NULL COMMENT 'BOM NUMBER',
  `bsaltb` varchar(2) DEFAULT NULL COMMENT 'ALTERNATIVE BOM',
  `bscktn` varchar(4) DEFAULT NULL COMMENT 'ITEM NUMBER',
  `bsbinn` varchar(8) DEFAULT NULL COMMENT 'BOM ITEM NODE NUMBER',
  `bscitm` varchar(18) DEFAULT NULL COMMENT 'COMPONENT ITEM NO.',
  `bsaigr` varchar(2) DEFAULT NULL COMMENT 'AIT. ITEM GROUP',
  `bsairo` varchar(2) DEFAULT NULL COMMENT 'AIT. RANKING ORDER',
  `bsaist` varchar(1) DEFAULT NULL COMMENT 'AIT. ITEM STRATEGY',
  `bsaiup` decimal(3,0) DEFAULT NULL COMMENT 'AIT. ITEM USAGE PROB. %',
  `bsbsqt` decimal(13,3) DEFAULT NULL COMMENT 'BASE QTY',
  `bscprq` decimal(13,3) DEFAULT NULL COMMENT 'COMPONENT QTY',
  `bslosq` decimal(13,3) DEFAULT NULL COMMENT 'LOSS QTY',
  `bsstdl` varchar(8) DEFAULT NULL COMMENT 'EFFECTIVE DATE/MFG LOT',
  `bsltdl` varchar(8) DEFAULT NULL COMMENT 'EXPIRY DATE/MFG LOT',
  `bsstat` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101507 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_psa_mrp
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_psa_mrp`;
CREATE TABLE `bnd_if_fsap_psa_mrp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `psa_mrp` varchar(30) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_purchase_price
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_purchase_price`;
CREATE TABLE `bnd_if_fsap_purchase_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bpvdnr` varchar(10) DEFAULT NULL COMMENT '供货商代码',
  `bpitnr` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `bpvinr` varchar(35) DEFAULT NULL COMMENT 'BPVINR                                  ',
  `bptrmc` varchar(3) DEFAULT NULL COMMENT '贸易条件',
  `bppoum` varchar(3) DEFAULT NULL COMMENT '购买单位',
  `bppocf` varchar(11) DEFAULT NULL COMMENT '购买单位换算系数',
  `bpcurr` varchar(3) DEFAULT NULL COMMENT '币别',
  `bpstdt` date DEFAULT NULL COMMENT '生效日',
  `bpltdt` date DEFAULT NULL COMMENT '失效日',
  `bpppr1` decimal(18,5) DEFAULT NULL COMMENT '購買價格區間１                        ',
  `bpstat` varchar(1) DEFAULT NULL COMMENT '状态',
  `bpupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41764 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_return_po
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_return_po`;
CREATE TABLE `bnd_if_fsap_return_po` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(30) DEFAULT NULL COMMENT '購買訂單號碼                          ',
  `po_no_line` decimal(5,0) DEFAULT NULL COMMENT '購買訂單行號                          ',
  `plan_return_date` date DEFAULT NULL COMMENT 'plan_return_date',
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供货商代码',
  `vendor_type` varchar(1) DEFAULT NULL COMMENT '供货商型态',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `price0` decimal(13,5) DEFAULT NULL COMMENT '价格',
  `po_qty` decimal(13,3) DEFAULT NULL COMMENT 'po_qty',
  `net_weigh` decimal(13,3) DEFAULT NULL COMMENT '净重',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '购买单位',
  `cf_purchase` decimal(11,5) DEFAULT NULL COMMENT '购买单位换算系数',
  `return_certificate` varchar(10) DEFAULT NULL COMMENT 'return_certificate',
  `return_certificate_item` decimal(4,0) DEFAULT NULL COMMENT 'return_certificate_item',
  `reverse_document` varchar(10) DEFAULT NULL COMMENT '沖銷憑證',
  `rd_item` varchar(6) DEFAULT NULL COMMENT '沖銷憑證項號',
  `actual_return_date` varchar(8) DEFAULT NULL COMMENT 'actual_return_date',
  `actual_return_qty` decimal(13,3) DEFAULT NULL COMMENT 'actual_return_qty',
  `original_invoice` varchar(10) DEFAULT NULL COMMENT '退货原发票',
  `return_invoice` varchar(10) DEFAULT NULL COMMENT '退貨發票                              ',
  `record_type` varchar(1) NOT NULL COMMENT 'record_type',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT 'delete_flag',
  `batch_no` varchar(10) DEFAULT NULL COMMENT 'BATCH NO.',
  `batch_quantity` decimal(13,3) DEFAULT NULL COMMENT 'batch_quantity',
  `batch_price` decimal(16,5) DEFAULT NULL COMMENT 'batch_price',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `invoice_no_line` decimal(4,0) DEFAULT NULL COMMENT '發票行號                              ',
  `state` varchar(1) DEFAULT NULL COMMENT '状态',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_routing
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_routing`;
CREATE TABLE `bnd_if_fsap_routing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rdgrpn` varchar(8) DEFAULT NULL COMMENT 'GROUP NO.',
  `rdgrpc` varchar(2) DEFAULT NULL COMMENT 'GROUP COUNTER',
  `rdortn` varchar(15) DEFAULT NULL COMMENT 'OLD TASK LIST',
  `rditnr` varchar(18) DEFAULT NULL COMMENT 'ITEM NO.',
  `rdopsq` varchar(4) DEFAULT NULL COMMENT 'OPERATION SEQUENCE NO',
  `rdopdc` varchar(90) DEFAULT NULL COMMENT 'OPERATION DESC.',
  `rdwknr` varchar(8) DEFAULT NULL COMMENT 'WORK CENTER NO.',
  `rdctrk` varchar(4) DEFAULT NULL COMMENT 'CONTROL KEY',
  `rdstdt` varchar(8) DEFAULT NULL COMMENT 'EFFECTIVE DATE',
  `rdltdt` varchar(8) DEFAULT NULL COMMENT 'EXPIRY DATE',
  `rdnbom` varchar(1) DEFAULT NULL COMMENT 'NO-BOM FLAG',
  `rddltf` varchar(1) DEFAULT NULL COMMENT 'DELETE FALG',
  `rdtopd` varchar(90) DEFAULT NULL COMMENT 'OPERATION DESC.',
  `rdstat` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `rdupdt` decimal(14,0) DEFAULT NULL COMMENT 'UPDATE TEIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1385 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_routing_mbom
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_routing_mbom`;
CREATE TABLE `bnd_if_fsap_routing_mbom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rbgrpn` varchar(8) DEFAULT NULL COMMENT 'GROUP NO.',
  `rbgrpc` varchar(2) DEFAULT NULL COMMENT 'GROUP COUNTER',
  `rbitnr` varchar(18) DEFAULT NULL COMMENT 'ITEM NO.',
  `rbopsq` varchar(4) DEFAULT NULL COMMENT 'OPERATION SEQUENCE NO',
  `rbwknr` varchar(8) DEFAULT NULL COMMENT 'WORK CENTER NO.',
  `rbbomn` varchar(8) DEFAULT NULL COMMENT 'BOM NUMBER',
  `rbaltb` varchar(2) DEFAULT NULL COMMENT 'ALTERNATIVE BOM',
  `rbcktn` varchar(4) DEFAULT NULL COMMENT 'ITEM NUMBER',
  `rbbinn` varchar(8) DEFAULT NULL COMMENT 'BOM ITEM NODE NUMBER',
  `rbcitm` varchar(18) DEFAULT NULL COMMENT 'COMPONENT ITEM NO.',
  `rbdltf` varchar(1) DEFAULT NULL COMMENT 'DELETE FLAG',
  `rbstat` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `rbupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28581 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_sample_consume
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_sample_consume`;
CREATE TABLE `bnd_if_fsap_sample_consume` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ccmrpc` varchar(3) DEFAULT NULL COMMENT 'MRP基准代码',
  `ccmdoc` varchar(10) DEFAULT NULL COMMENT 'MD号',
  `ccdoci` varchar(4) DEFAULT NULL COMMENT 'MD序号',
  `ccdoch` varchar(60) DEFAULT NULL COMMENT 'MD表头',
  `ccdocn` varchar(16) DEFAULT NULL COMMENT '关联文档',
  `ccpsdt` decimal(8,0) DEFAULT NULL COMMENT '异动日期',
  `ccdocd` decimal(8,0) DEFAULT NULL COMMENT '文档日期',
  `ccdoct` decimal(6,0) DEFAULT NULL COMMENT '文档时间',
  `ccitnr` varchar(18) DEFAULT NULL COMMENT '品名代码',
  `cctrqt` decimal(11,1) DEFAULT NULL COMMENT 'TRANSACTION QTY                         ',
  `ccumcd` varchar(3) DEFAULT NULL COMMENT '单位',
  `ccltno` varchar(10) DEFAULT NULL COMMENT '批號                                  ',
  `cccoct` varchar(10) DEFAULT NULL COMMENT '成本 中心',
  `ccpsac` varchar(3) DEFAULT NULL COMMENT 'PSA',
  `ccmvtp` varchar(3) DEFAULT NULL COMMENT '异动类型',
  `ccusid` varchar(12) DEFAULT NULL COMMENT '用户ID',
  `ccstat` varchar(1) DEFAULT NULL COMMENT '状态',
  `ccupdt` varchar(14) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1248450 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_stock
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_stock`;
CREATE TABLE `bnd_if_fsap_stock` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bayymm` varchar(6) DEFAULT NULL COMMENT 'STAKE MONTH',
  `baflag` varchar(1) DEFAULT NULL COMMENT 'FLAG',
  `bamrpc` varchar(3) DEFAULT NULL COMMENT 'MRP',
  `baitnr` varchar(18) DEFAULT NULL COMMENT 'ITEM NO.',
  `basttp` varchar(3) DEFAULT NULL COMMENT 'STORAGE TYPE',
  `baltno` varchar(10) DEFAULT NULL COMMENT 'BATCH',
  `bababf` varchar(1) DEFAULT NULL COMMENT 'BALANCE BOND FLAG',
  `baohdq` decimal(16,3) DEFAULT NULL COMMENT 'ON HAND QTY',
  `baioum` varchar(3) DEFAULT NULL COMMENT 'U/M (INCOMING & OUTGOING)',
  `basklc` varchar(10) DEFAULT NULL COMMENT 'STOCK LOCATION',
  `bapric` decimal(13,2) DEFAULT NULL COMMENT 'PRICE',
  `baprcn` decimal(5,0) DEFAULT NULL COMMENT 'PRICE NUMBER',
  `bastca` varchar(1) DEFAULT NULL COMMENT 'STOCK CATEGORY',
  `baspsi` varchar(1) DEFAULT NULL COMMENT 'SPECIAL STOCK INDICATOR',
  `baspsn` varchar(16) DEFAULT NULL COMMENT 'SPECIAL STOCK NUMBER',
  `bastat` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `baupdt` decimal(14,0) DEFAULT NULL COMMENT 'UPDATE TEIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80276 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_stock_copy1
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_stock_copy1`;
CREATE TABLE `bnd_if_fsap_stock_copy1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bayymm` varchar(6) DEFAULT NULL COMMENT 'STAKE MONTH',
  `baflag` varchar(1) DEFAULT NULL COMMENT 'FLAG',
  `bamrpc` varchar(3) DEFAULT NULL COMMENT 'MRP',
  `baitnr` varchar(18) DEFAULT NULL COMMENT 'ITEM NO.',
  `basttp` varchar(3) DEFAULT NULL COMMENT 'STORAGE TYPE',
  `baltno` varchar(10) DEFAULT NULL COMMENT 'BATCH',
  `bababf` varchar(1) DEFAULT NULL COMMENT 'BALANCE BOND FLAG',
  `baohdq` decimal(16,3) DEFAULT NULL COMMENT 'ON HAND QTY',
  `baioum` varchar(3) DEFAULT NULL COMMENT 'U/M (INCOMING & OUTGOING)',
  `basklc` varchar(10) DEFAULT NULL COMMENT 'STOCK LOCATION',
  `bapric` decimal(13,2) DEFAULT NULL COMMENT 'PRICE',
  `baprcn` decimal(5,0) DEFAULT NULL COMMENT 'PRICE NUMBER',
  `bastca` varchar(1) DEFAULT NULL COMMENT 'STOCK CATEGORY',
  `baspsi` varchar(1) DEFAULT NULL COMMENT 'SPECIAL STOCK INDICATOR',
  `baspsn` varchar(16) DEFAULT NULL COMMENT 'SPECIAL STOCK NUMBER',
  `bastat` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `baupdt` decimal(14,0) DEFAULT NULL COMMENT 'UPDATE TEIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80276 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_unit_cost
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_unit_cost`;
CREATE TABLE `bnd_if_fsap_unit_cost` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(18) DEFAULT NULL COMMENT '品名代码',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `unit_cost` decimal(15,2) DEFAULT NULL COMMENT 'COST',
  `csot_number` decimal(13,3) DEFAULT NULL COMMENT 'COST NUMBER',
  `state` varchar(1) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=496014 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_fsap_vendor
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_fsap_vendor`;
CREATE TABLE `bnd_if_fsap_vendor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(10) DEFAULT NULL COMMENT 'vendor_no',
  `vendor_name1_dbcs` varchar(160) DEFAULT NULL COMMENT 'vendor_name1_dbcs',
  `vendor_name1` varchar(70) DEFAULT NULL COMMENT 'vendor_name1',
  `vendor_name_abbr_dbcs` varchar(60) DEFAULT NULL COMMENT 'vendor_name_abbr_dbcs',
  `vendor_name_abbr` varchar(25) DEFAULT NULL COMMENT 'vendor_name_abbr',
  `address1_dbcs` varchar(250) DEFAULT NULL COMMENT 'address1_dbcs',
  `address1` varchar(145) DEFAULT NULL COMMENT 'address1',
  `vmi_or_jit` varchar(3) DEFAULT NULL COMMENT 'vmi_or_jit',
  `custom_approved_no` varchar(10) DEFAULT NULL COMMENT 'custom_approved_no',
  `currency` varchar(3) DEFAULT NULL COMMENT 'currency',
  `country_code` varchar(2) DEFAULT NULL COMMENT 'country_code',
  `state` varchar(1) DEFAULT NULL COMMENT 'state',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2448 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_subcon_item_detail
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_subcon_item_detail`;
CREATE TABLE `bnd_if_subcon_item_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `apply_no` varchar(14) DEFAULT NULL COMMENT '申請表編號',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '供應商',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外類別',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'PSA',
  `item_no` varchar(18) DEFAULT NULL COMMENT '品名代碼',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '工序',
  `standard_cost` decimal(13,7) DEFAULT NULL COMMENT '委外單價',
  `currency` varchar(3) DEFAULT NULL COMMENT 'CURRENCY',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '中文名稱',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '監管單位',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '盤點單位換算係數',
  `img_no` decimal(5,0) DEFAULT NULL COMMENT '歸併項號',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商編',
  `date_from` date DEFAULT NULL COMMENT '有效日期',
  `date_to` date DEFAULT NULL COMMENT '失效日期',
  `data_state` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `update_date` varchar(14) DEFAULT NULL COMMENT 'UPDATE TEIME',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `apply_no` (`apply_no`,`vendor_code`,`psa_code`,`item_no`,`operation_sequence_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_subcon_item_mts
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_subcon_item_mts`;
CREATE TABLE `bnd_if_subcon_item_mts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `apply_no` varchar(14) DEFAULT NULL COMMENT '申請表編號',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '委外供應商',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外類型',
  `operation_amount` decimal(14,2) DEFAULT NULL COMMENT '備案金額',
  `back_amount` decimal(14,2) DEFAULT NULL COMMENT '撥回金額',
  `available_amount` decimal(14,2) DEFAULT NULL COMMENT '可用金額',
  `date_from` date DEFAULT NULL COMMENT '有效日期',
  `date_to` date DEFAULT NULL COMMENT '失效日期',
  `data_state` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `update_date` varchar(14) DEFAULT NULL COMMENT 'UPDATE TEIME',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `apply_no` (`apply_no`,`vendor_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_subcon_material_detail
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_subcon_material_detail`;
CREATE TABLE `bnd_if_subcon_material_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `apply_no` varchar(14) DEFAULT NULL COMMENT '申請表編號',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '供應商',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外類型',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'PSA',
  `material_no` varchar(18) DEFAULT NULL COMMENT '品名代碼',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '工序',
  `standard_cost` decimal(13,7) DEFAULT NULL COMMENT '委外單價',
  `currency` varchar(3) DEFAULT NULL COMMENT 'CURRENCY',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在庫單位',
  `date_from` date DEFAULT NULL COMMENT '有效日期',
  `date_to` date DEFAULT NULL COMMENT '失效日期',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `apply_no` (`apply_no`,`vendor_code`,`psa_code`,`material_no`,`operation_sequence_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_if_subcon_material_sap
-- ----------------------------
DROP TABLE IF EXISTS `bnd_if_subcon_material_sap`;
CREATE TABLE `bnd_if_subcon_material_sap` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `apply_no` varchar(14) DEFAULT NULL COMMENT '申請表編號',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '供應商代碼',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外類型',
  `operation_amount` decimal(14,2) DEFAULT NULL COMMENT '備案金額',
  `output_amount` decimal(14,2) DEFAULT NULL COMMENT '撥出金額',
  `available_amount` decimal(14,2) DEFAULT NULL COMMENT '可用金額',
  `date_from` date DEFAULT NULL COMMENT '有效日期',
  `date_to` date DEFAULT NULL COMMENT '失效日期',
  `data_state` decimal(1,0) DEFAULT NULL COMMENT '0-SEND 1-COMPLETED',
  `flag` varchar(1) DEFAULT NULL COMMENT 'A-ADD  U-UPDATE',
  `update_date` decimal(14,0) DEFAULT NULL COMMENT 'UPDATE TEIME',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `apply_no` (`apply_no`,`vendor_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_import_asn
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_asn`;
CREATE TABLE `bnd_import_asn` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(30) DEFAULT NULL COMMENT '購買訂單號碼                          ',
  `po_no_line` decimal(5,0) DEFAULT NULL COMMENT '購買訂單行號                          ',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `invoice_no_line` decimal(4,0) DEFAULT NULL COMMENT '發票行號                              ',
  `state` varchar(2) DEFAULT NULL COMMENT ' WEB狀態                              ',
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供應商代碼                            ',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '貿易條件                              ',
  `mrpcode` varchar(10) DEFAULT NULL COMMENT ' MRP代碼                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `vendor_item_no` varchar(35) DEFAULT NULL COMMENT '供應商品名代碼                        ',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '計量單位（購買）                      ',
  `cf_purchase` decimal(11,5) DEFAULT NULL COMMENT '購買換算係數                          ',
  `purchase_price` double(13,5) DEFAULT NULL COMMENT '載運單價                              ',
  `purchase_qty` decimal(11,1) DEFAULT NULL COMMENT '購買訂單數量                          ',
  `po_boarding_qty` double(11,3) DEFAULT NULL COMMENT '交貨數量                              ',
  `po_boarding_amt` decimal(13,2) DEFAULT NULL COMMENT '交貨金額                              ',
  `note` varchar(60) DEFAULT NULL COMMENT '備註                                  ',
  `consignment_date` decimal(8,0) DEFAULT NULL COMMENT '發貨日期                              ',
  `plant_place` varchar(15) DEFAULT NULL COMMENT '工發地                                ',
  `trans_mode` varchar(2) DEFAULT NULL COMMENT '運輸方式                              ',
  `pallet_code` varchar(3) DEFAULT NULL COMMENT '板代碼                                ',
  `pad_qty` decimal(6,0) DEFAULT NULL COMMENT '總板數                                ',
  `packing_code` varchar(3) DEFAULT NULL COMMENT '包裝代碼                              ',
  `box_qty` decimal(6,0) DEFAULT NULL COMMENT '總箱數                                ',
  `original_producing_area` varchar(5) DEFAULT NULL COMMENT '源產國                                ',
  `gross_weight` decimal(13,5) DEFAULT NULL COMMENT '毛重                                  ',
  `totoal_net_weight` decimal(13,5) DEFAULT NULL COMMENT '總凈重                                ',
  `custom_approved_no` varchar(15) DEFAULT NULL COMMENT '關封號',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`invoice_no_line`)
) ENGINE=InnoDB AUTO_INCREMENT=877618 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_import_custom_regulatory
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_custom_regulatory`;
CREATE TABLE `bnd_import_custom_regulatory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商編',
  `regulatory_credentials_code` varchar(10) DEFAULT NULL COMMENT '監管證件號碼',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`ccc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2012 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_import_declaration
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_declaration`;
CREATE TABLE `bnd_import_declaration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `declare_no` varchar(20) DEFAULT NULL COMMENT '報關單號',
  `declare_amt` decimal(13,2) DEFAULT NULL COMMENT '報關金額',
  `currency` varchar(3) DEFAULT NULL COMMENT ' IV幣別',
  `declaration_date` date DEFAULT NULL COMMENT '報關日期',
  `text_contents1` varchar(7) DEFAULT NULL COMMENT '備注1',
  `text_contents2` varchar(5) DEFAULT NULL COMMENT '備注2',
  `text_contents3` varchar(4) DEFAULT NULL COMMENT '備注3',
  `text_contents4` varchar(2) DEFAULT NULL COMMENT '備注4',
  `invoice_amt` decimal(13,2) DEFAULT NULL COMMENT ' IV金額',
  `submit_date` date DEFAULT NULL COMMENT '送交日期',
  `tax_no` varchar(20) DEFAULT NULL COMMENT '核銷單號',
  `ie_flag` varchar(1) DEFAULT NULL COMMENT '進出口標志',
  `list_no` varchar(18) DEFAULT NULL COMMENT '清單統一編號',
  `import_export_gate` varchar(4) DEFAULT NULL COMMENT '進/出口岸',
  `vendor_no` varchar(9) DEFAULT NULL COMMENT '供應商代碼',
  `custom_approved_no` varchar(10) DEFAULT NULL COMMENT '海關承認書號碼',
  `supervision_mode_code` varchar(4) DEFAULT NULL COMMENT '監管方式',
  `import_export_date` date DEFAULT NULL COMMENT '进出口日期',
  `return_so1` varchar(10) DEFAULT NULL COMMENT '退货联络书编号1',
  `return_so2` varchar(10) DEFAULT NULL COMMENT '退货联络书编号2',
  `return_so3` varchar(10) DEFAULT NULL COMMENT '退货联络书编号3',
  `return_so4` varchar(10) DEFAULT NULL COMMENT '退货联络书编号4',
  `return_so5` varchar(10) DEFAULT NULL COMMENT '退货联络书编号5',
  `return_so6` varchar(10) DEFAULT NULL COMMENT '退货联络书编号6',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登录人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`invoice_no`,`declare_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42715 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_import_fee
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_fee`;
CREATE TABLE `bnd_import_fee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(15) DEFAULT NULL COMMENT '发票号',
  `vendor_no` varchar(7) DEFAULT NULL COMMENT '供货商代码',
  `charged_weight` double(12,2) DEFAULT NULL COMMENT '计费重量',
  `entry_clearance_no` varchar(30) DEFAULT NULL COMMENT '入境通关单号',
  `quarantine_fee` double(10,2) DEFAULT NULL COMMENT '检疫费',
  `currency_1` varchar(3) DEFAULT NULL COMMENT '币别1',
  `sanitation_treatment_fee` double(10,2) DEFAULT NULL COMMENT '卫生处理费',
  `currency_2` varchar(3) DEFAULT NULL COMMENT '币别2',
  `quarantine_value` double(16,2) DEFAULT NULL COMMENT '检疫货值',
  `currency_3` varchar(3) DEFAULT NULL COMMENT '币别3',
  `publish_freight` double(12,2) DEFAULT NULL COMMENT '公布运费',
  `currency_4` varchar(3) DEFAULT NULL COMMENT '币别4',
  `freight` double(12,2) DEFAULT NULL COMMENT '运费',
  `currency_5` varchar(3) DEFAULT NULL COMMENT '币别5',
  `fuel_cost` double(12,2) DEFAULT NULL COMMENT '燃油费',
  `currency_6` varchar(3) DEFAULT NULL COMMENT '币别6',
  `premium_rate` double(7,5) DEFAULT NULL COMMENT '保险费率',
  `port_of_discharge_fee` double(12,2) DEFAULT NULL COMMENT '启运港费用',
  `currency_7` varchar(3) DEFAULT NULL COMMENT '币别7',
  `exchange_fee` double(12,2) DEFAULT NULL COMMENT '换单费',
  `currency_8` varchar(3) DEFAULT NULL COMMENT '币别8',
  `other_fee` double(16,2) DEFAULT NULL COMMENT '其他费用',
  `currency_9` varchar(3) DEFAULT NULL COMMENT '币别9',
  `note` varchar(60) DEFAULT NULL COMMENT '备注',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_import_nonbond_cccspec
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_nonbond_cccspec`;
CREATE TABLE `bnd_import_nonbond_cccspec` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '歸并項號',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商編',
  `item_spec` varchar(500) DEFAULT NULL COMMENT '規格型號',
  `e_item_spec` varchar(200) DEFAULT NULL COMMENT '英文規格型號',
  `note` varchar(50) DEFAULT NULL COMMENT '備注',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`item_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_import_operation
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_operation`;
CREATE TABLE `bnd_import_operation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(15) DEFAULT NULL COMMENT '发票号码',
  `mrp_code_1` varchar(1) DEFAULT NULL COMMENT 'MRP代码1',
  `mrp_code_2` varchar(1) DEFAULT NULL COMMENT 'MRP代码2',
  `mrp_code_3` varchar(1) DEFAULT NULL COMMENT 'MRP代码3',
  `mrp_code_4` varchar(1) DEFAULT NULL COMMENT 'MRP代码4',
  `mrp_code_5` varchar(1) DEFAULT NULL COMMENT 'MRP代码5',
  `mrp_code_6` varchar(1) DEFAULT NULL COMMENT 'MRP代码6',
  `mrp_code_7` varchar(1) DEFAULT NULL COMMENT 'MRP代码7',
  `mrp_code_8` varchar(1) DEFAULT NULL COMMENT 'MRP代码8',
  `mrp_code_9` varchar(1) DEFAULT NULL COMMENT 'MRP代码9',
  `mrp_code_10` varchar(1) DEFAULT NULL COMMENT 'MRP代码9',
  `mrpcode` varchar(50) DEFAULT NULL COMMENT 'MRP代码10',
  `type_1` varchar(1) DEFAULT NULL COMMENT '类别1',
  `type_2` varchar(1) DEFAULT NULL COMMENT '类别2',
  `type_3` varchar(1) DEFAULT NULL COMMENT '类别3',
  `type_4` varchar(1) DEFAULT NULL COMMENT '类别4',
  `type_5` varchar(1) DEFAULT NULL COMMENT '类别4',
  `type` varchar(5) DEFAULT NULL COMMENT '类别5',
  `pieces` int(4) DEFAULT NULL COMMENT '件数',
  `industrial_development_date` date DEFAULT NULL COMMENT '工发日1',
  `receiving_date` date DEFAULT NULL COMMENT '收件日1',
  `industrial_development_type` varchar(2) DEFAULT NULL COMMENT '工发方式',
  `industrial_development_place` varchar(15) DEFAULT NULL COMMENT '工发地',
  `ori_no` varchar(12) DEFAULT NULL COMMENT '原始发票号码',
  `net_weight` double(11,2) DEFAULT NULL COMMENT '净重',
  `gross_weight` double(11,2) DEFAULT NULL COMMENT '毛重',
  `rcnt_vclr_time` date DEFAULT NULL COMMENT '收到提单日期',
  `depart_port_date` date DEFAULT NULL COMMENT '出发港工发日',
  `depart_flight_no` varchar(30) DEFAULT NULL COMMENT '出发港航班号',
  `transit_port_arrival_date` date DEFAULT NULL COMMENT '中转港到港日',
  `transit_port_industrial_development_date` date DEFAULT NULL COMMENT '中转港工发日',
  `transit_port_flight_no` varchar(30) DEFAULT NULL COMMENT '中转港航班号',
  `bl_no` varchar(21) DEFAULT NULL COMMENT '提单号',
  `bl_gross` double(11,2) DEFAULT NULL COMMENT '提单毛重',
  `bl_volume` double(11,3) DEFAULT NULL COMMENT '提单体积',
  `last_arrival_date` date DEFAULT NULL COMMENT '最后到港日期',
  `arrival_date` date DEFAULT NULL COMMENT '到货日期',
  `declaration_amount` double(15,2) DEFAULT NULL COMMENT '报关金额',
  `de_currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `iv_amount` double(15,2) DEFAULT NULL COMMENT 'IV金额',
  `iv_currency` varchar(3) DEFAULT NULL,
  `customs_broker` varchar(3) DEFAULT NULL COMMENT '报关员',
  `declaration_date` date DEFAULT NULL COMMENT '报关提出日期',
  `regress_date` date DEFAULT NULL COMMENT '回归日期',
  `clearance_lt` double(5,1) DEFAULT NULL COMMENT '通关L/T',
  `whole_course_lt` double(5,1) DEFAULT NULL COMMENT '全程L/T',
  `carrier` varchar(10) DEFAULT NULL COMMENT '携带者',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '贸易条件',
  `forwarder_code` varchar(6) DEFAULT NULL COMMENT '货运公司',
  `container_no` varchar(100) DEFAULT NULL COMMENT '柜号',
  `reason_delay` varchar(142) DEFAULT NULL COMMENT '延迟原因',
  `express_no` varchar(20) DEFAULT NULL COMMENT '快递单号码',
  `pass_date` date DEFAULT NULL COMMENT '放行日期',
  `note` varchar(70) DEFAULT NULL COMMENT '备注',
  `reduction_tax_no` varchar(32) DEFAULT NULL COMMENT '减免税号',
  `declaration_no` varchar(38) DEFAULT NULL COMMENT '报关单号',
  `note_1` varchar(10) DEFAULT NULL COMMENT '备用1',
  `note_2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `note_3` varchar(11) DEFAULT NULL COMMENT '备用3',
  `note_4` varchar(11) DEFAULT NULL COMMENT '备用4',
  `special_supervision_area` varchar(1) DEFAULT NULL COMMENT '特殊监管区',
  `actual_declaration_date` date DEFAULT NULL,
  `packing_code` varchar(3) DEFAULT NULL COMMENT '装箱代码',
  `plant_code` varchar(3) DEFAULT NULL COMMENT '版代码',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间login_time',
  `passState` varchar(3) DEFAULT '' COMMENT '发行状态',
  `freight_code` varchar(3) DEFAULT NULL COMMENT '货运公司代码',
  `fn_no` varchar(142) DEFAULT NULL COMMENT '分单号',
  `pay_state` varchar(3) DEFAULT '' COMMENT '付汇状态',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登录人员login_oid',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间update_time',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新操作员代码update_oid',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序update_program',
  PRIMARY KEY (`id`),
  KEY `key` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3776 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_import_return_po
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_return_po`;
CREATE TABLE `bnd_import_return_po` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(30) DEFAULT NULL COMMENT '購買訂單號碼                          ',
  `po_no_line` decimal(5,0) DEFAULT NULL COMMENT '購買訂單行號                          ',
  `po_type` varchar(2) DEFAULT NULL COMMENT 'po_type',
  `plan_return_date` date DEFAULT NULL COMMENT 'plan_return_date',
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供货商代码',
  `vendor_type` varchar(1) DEFAULT NULL COMMENT '供货商型态',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `price0` decimal(13,5) DEFAULT NULL COMMENT '价格',
  `po_qty` decimal(13,3) DEFAULT NULL COMMENT 'po_qty',
  `net_weigh` decimal(13,3) DEFAULT NULL COMMENT '净重',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '购买单位',
  `cf_purchase` decimal(11,5) DEFAULT NULL COMMENT '购买单位换算系数',
  `original_invoice` varchar(10) DEFAULT NULL COMMENT '退货原发票',
  `actual_return_qty` decimal(13,3) DEFAULT NULL COMMENT 'actual_return_qty',
  `actual_return_date` date DEFAULT NULL COMMENT 'actual_return_date',
  `return_invoice` varchar(10) DEFAULT NULL COMMENT '退貨發票                              ',
  `actual_replace_qty` decimal(13,3) DEFAULT NULL COMMENT 'actual_replace_qty',
  `actual_replace_date` date DEFAULT NULL COMMENT 'actual_replace_date',
  `replace_invoice` varchar(10) DEFAULT NULL COMMENT 'replace_invoice',
  `batch_no` varchar(10) DEFAULT NULL COMMENT 'BATCH NO.',
  `batch_quantity` decimal(13,3) DEFAULT NULL COMMENT 'batch_quantity',
  `batch_price` decimal(16,5) DEFAULT NULL COMMENT 'batch_price',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `invoice_no_line` decimal(4,0) DEFAULT NULL COMMENT '發票行號                              ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_import_temp_file
-- ----------------------------
DROP TABLE IF EXISTS `bnd_import_temp_file`;
CREATE TABLE `bnd_import_temp_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `country_code` varchar(5) DEFAULT NULL COMMENT '国家代码',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '购买单位',
  `cf_purchase` decimal(11,5) DEFAULT NULL COMMENT '购买单位换算系数',
  `unit_price` decimal(18,5) DEFAULT NULL COMMENT '監管單價                              ',
  `enterprise_declared_total_price` decimal(18,5) DEFAULT NULL COMMENT '企业申报总价',
  `declare_qty` decimal(18,5) DEFAULT NULL COMMENT '報關單數量                            ',
  `net_weigh` decimal(18,5) DEFAULT NULL COMMENT '净重',
  `gross_weight` decimal(18,5) DEFAULT NULL COMMENT '毛重',
  `po_boarding_qty` decimal(18,5) DEFAULT NULL COMMENT '载途数量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`item_no`,`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_allocated_component
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_allocated_component`;
CREATE TABLE `bnd_master_allocated_component` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mfg_order_request_no` varchar(10) DEFAULT NULL COMMENT '制造订单／请求号码                    ',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作业顺序号码                          ',
  `component_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代码                          ',
  `component_revision_no` decimal(3,0) DEFAULT NULL COMMENT '材料版数                              ',
  `stock_location` varchar(6) DEFAULT NULL COMMENT '料架                                  ',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批号                                  ',
  `component_item_type` varchar(1) DEFAULT NULL COMMENT '材料品名型态                          ',
  `reason_code` varchar(2) DEFAULT NULL COMMENT '原因代码                              ',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT '保税区分                              ',
  `alternative_item_no` varchar(15) DEFAULT NULL COMMENT '替代品名代码                          ',
  `alternative_revision_no` decimal(3,0) DEFAULT NULL COMMENT '替代品版数                            ',
  `mrpcode` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基准代码                        ',
  `warehouse_code` varchar(2) DEFAULT NULL COMMENT '仓库别                                ',
  `dept` varchar(5) DEFAULT NULL COMMENT '课别                                  ',
  `plant_code` varchar(2) DEFAULT NULL COMMENT '生产场所代码                          ',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站代码                            ',
  `account_code` varchar(8) DEFAULT NULL COMMENT '会计科目代码                          ',
  `vendor_no` varchar(7) DEFAULT NULL COMMENT '供货商代码                            ',
  `issue_price` decimal(13,5) DEFAULT NULL COMMENT '出库单价                              ',
  `plan_issue_date` date DEFAULT NULL COMMENT '计划出库日                            ',
  `actual_issue_date` date DEFAULT NULL COMMENT '实际出库日                            ',
  `require_qty` decimal(20,9) DEFAULT NULL COMMENT '需求量                                ',
  `plan_issue_qty` decimal(20,9) DEFAULT NULL COMMENT '计划出库数量                          ',
  `allocated_qty` decimal(20,9) DEFAULT NULL COMMENT '已引当数                              ',
  `actual_issue_qty` decimal(20,9) DEFAULT NULL COMMENT '实际出库数                            ',
  `consumption` decimal(20,9) DEFAULT NULL COMMENT '工程已使用量                          ',
  `return_component_qty_work` decimal(20,9) DEFAULT NULL COMMENT 'RETURN COMPONENT    QTY WORK            ',
  `allocate_status` varchar(1) DEFAULT NULL COMMENT '引当状态                              ',
  `issue_finish_flag` varchar(1) DEFAULT NULL COMMENT '出库完了区分                          ',
  `picking_batch_no` decimal(4,0) DEFAULT NULL COMMENT '出库处理号码                          ',
  `request_no` varchar(10) DEFAULT NULL COMMENT '请求号码                              ',
  `slip_no` varchar(10) DEFAULT NULL COMMENT '出库传票号码                          ',
  `component_sequence_no` decimal(3,0) DEFAULT NULL COMMENT '材料序号                              ',
  `safety_standard_flag` varchar(1) DEFAULT NULL COMMENT '安规标准要求区分                      ',
  `transaction_code` varchar(2) DEFAULT NULL COMMENT '异动代码                              ',
  `expiry_flag` varchar(1) DEFAULT NULL COMMENT '失效区分                              ',
  `in_out_stock_flag` varchar(1) DEFAULT NULL COMMENT '入出库工程在库区分                    ',
  `yield` decimal(5,1) DEFAULT NULL COMMENT '良品率                                ',
  `lot_no_code` varchar(1) DEFAULT NULL COMMENT '批号指定状况                          ',
  `component_item_applicode` varchar(1) DEFAULT NULL COMMENT '构成品应用代码                        ',
  `component_qtyparent_qty` decimal(11,1) DEFAULT NULL COMMENT '制品用量                              ',
  `componentparent_itemc` decimal(20,9) DEFAULT NULL COMMENT '材料用量                              ',
  `consistent_lot_no` varchar(10) DEFAULT NULL COMMENT '制番                                  ',
  `product_loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '凈耗                                  ',
  `loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '损耗                                  ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`mfg_order_request_no`,`operation_sequence_no`,`component_item_no`,`component_revision_no`,`stock_location`,`lot_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3144612 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_batch_lot
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_batch_lot`;
CREATE TABLE `bnd_master_batch_lot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(10) DEFAULT NULL COMMENT 'BATCH NO.',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'PROD_PN.',
  `pack_date` date DEFAULT NULL COMMENT 'PACK DATE',
  `batch_bom_ver` decimal(9,0) DEFAULT NULL COMMENT 'BATCH BOM_VER.',
  `sap_mo` varchar(12) DEFAULT NULL COMMENT 'SAP MO',
  `mo_no` varchar(10) DEFAULT NULL COMMENT 'LOT NO.',
  `lot_bom_ver` decimal(9,0) DEFAULT NULL COMMENT 'LOT NO BOM_VER',
  `pack_qty` decimal(13,3) DEFAULT NULL COMMENT 'PACK_QTY',
  `domestic_use_qty` decimal(13,3) DEFAULT NULL COMMENT '内销已抵扣数量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`batch_no`,`mo_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=320869 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_batch_lot_copy1
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_batch_lot_copy1`;
CREATE TABLE `bnd_master_batch_lot_copy1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(10) DEFAULT NULL COMMENT 'BATCH NO.',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'PROD_PN.',
  `pack_date` date DEFAULT NULL COMMENT 'PACK DATE',
  `batch_bom_ver` decimal(9,0) DEFAULT NULL COMMENT 'BATCH BOM_VER.',
  `sap_mo` varchar(12) DEFAULT NULL COMMENT 'SAP MO',
  `mo_no` varchar(10) DEFAULT NULL COMMENT 'LOT NO.',
  `lot_bom_ver` decimal(9,0) DEFAULT NULL COMMENT 'LOT NO BOM_VER',
  `pack_qty` decimal(13,3) DEFAULT NULL COMMENT 'PACK_QTY',
  `domestic_use_qty` decimal(13,3) DEFAULT NULL COMMENT '内销已抵扣数量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`batch_no`,`mo_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55692 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_beginning_balance
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_beginning_balance`;
CREATE TABLE `bnd_master_beginning_balance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `data_state` varchar(1) DEFAULT NULL COMMENT '数据状态',
  `item_no` varchar(15) DEFAULT NULL COMMENT '商品货号',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '归并项号',
  `beginning_balance` decimal(15,5) DEFAULT NULL COMMENT '期初数',
  `base_date` decimal(6,0) DEFAULT NULL COMMENT '基准年月',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`data_state`,`item_no`,`base_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1459 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_bom
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_bom`;
CREATE TABLE `bnd_master_bom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `data_state` varchar(1) DEFAULT NULL COMMENT '数据状态',
  `gds_seqno` decimal(19,0) DEFAULT NULL COMMENT '序号',
  `endprd_seqno` decimal(19,0) DEFAULT NULL COMMENT '成品序号',
  `endprd_gds_mtno` varchar(30) DEFAULT NULL COMMENT '成品料号',
  `endprd_gdecd` varchar(10) DEFAULT NULL COMMENT '成品商品编码',
  `endprd_gds_nm` varchar(512) DEFAULT NULL COMMENT '成品商品名称',
  `mtpck_seqno` decimal(19,0) DEFAULT NULL COMMENT '料件序号',
  `mtpck_gds_mtno` varchar(30) DEFAULT NULL COMMENT '料件料号',
  `mtpck_gdecd` varchar(10) DEFAULT NULL COMMENT '料件商品编码',
  `mtpck_gds_nm` varchar(512) DEFAULT NULL COMMENT '料件商品名称',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '单耗版本号',
  `ucns_qty` decimal(19,9) DEFAULT NULL COMMENT '单耗',
  `dec_cm` decimal(19,9) DEFAULT NULL COMMENT '凈耗',
  `dec_dm` decimal(18,9) DEFAULT NULL COMMENT '有形损耗率',
  `intgb_loss_rate` decimal(18,9) DEFAULT NULL COMMENT '无形损耗率',
  `ucns_dcl_stucd` varchar(1) DEFAULT NULL COMMENT '单耗申报状态',
  `modf_markcd` varchar(1) DEFAULT NULL COMMENT '修改标志',
  `bond_mtpck_prpr` decimal(19,9) DEFAULT NULL COMMENT '保税料件比率',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `effective_date` date DEFAULT NULL COMMENT '开始有效日期Z(8)',
  `expiration_date` date DEFAULT NULL COMMENT '结束有效日期Z(8)',
  `product_unit` varchar(3) DEFAULT NULL COMMENT '成品单位',
  `material_unit` varchar(3) DEFAULT NULL COMMENT '材料单位',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工程站别',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作业顺序号',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`ems_no`,`endprd_gds_mtno`,`mtpck_gds_mtno`,`ucns_verno`,`effective_date`,`expiration_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59310 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_bom_weed
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_bom_weed`;
CREATE TABLE `bnd_master_bom_weed` (
  `item_no` varchar(15) DEFAULT NULL,
  `material_item_no` varchar(15) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(20) DEFAULT NULL,
  UNIQUE KEY `index_name` (`item_no`,`material_item_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_bottom_material
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_bottom_material`;
CREATE TABLE `bnd_master_bottom_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrpcode` varchar(1) DEFAULT NULL COMMENT 'MRP',
  `mo_no` varchar(10) DEFAULT NULL COMMENT '制造订单号码',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作业顺序号码',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `material_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代码',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '成品系数',
  `componentparent_itemc` decimal(18,9) DEFAULT NULL COMMENT '总耗',
  `loss_quantity` decimal(18,9) DEFAULT NULL COMMENT '损耗',
  `product_loss_quantity` decimal(18,9) DEFAULT NULL COMMENT '凈耗',
  `material_cf` decimal(18,9) DEFAULT NULL COMMENT '材料系数',
  `dec_cm` decimal(18,9) DEFAULT NULL COMMENT '单耗',
  `dec_dm` decimal(9,5) DEFAULT NULL COMMENT '损耗',
  `gds_seqno` decimal(19,0) DEFAULT NULL COMMENT '序号',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`mo_no`,`equipment_name`,`item_no`,`material_item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1194 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_bottom_material_m
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_bottom_material_m`;
CREATE TABLE `bnd_master_bottom_material_m` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrpcode` varchar(1) DEFAULT NULL COMMENT 'MRP',
  `mo_no` varchar(10) DEFAULT NULL COMMENT '制造订单号码',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作业顺序号码',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `material_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代码',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '成品系数',
  `componentparent_itemc` decimal(18,9) DEFAULT NULL COMMENT '总耗',
  `loss_quantity` decimal(18,9) DEFAULT NULL COMMENT '损耗',
  `product_loss_quantity` decimal(18,9) DEFAULT NULL COMMENT '凈耗',
  `material_cf` decimal(18,9) DEFAULT NULL COMMENT '材料系数',
  `dec_cm` decimal(18,9) DEFAULT NULL COMMENT '单耗',
  `dec_dm` decimal(9,5) DEFAULT NULL COMMENT '损耗',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`mo_no`,`equipment_name`,`item_no`,`material_item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_company_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_company_code`;
CREATE TABLE `bnd_master_company_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(6) DEFAULT NULL COMMENT '公司代码',
  `company_type` varchar(2) DEFAULT NULL COMMENT '公司型态',
  `company_name` varchar(30) DEFAULT NULL COMMENT '公司名（中文）',
  `address1_dbcs` varchar(30) DEFAULT NULL COMMENT '住址１（中文）',
  `address2_dbcs` varchar(30) DEFAULT NULL COMMENT '住址２（中文）',
  `address3_dbcs` varchar(30) DEFAULT NULL COMMENT '住址３（中文）',
  `company_name_2` varchar(30) DEFAULT NULL COMMENT '公司名 2',
  `company_offical_code` varchar(2) DEFAULT NULL COMMENT '公司名称代码',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_country_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_country_code`;
CREATE TABLE `bnd_master_country_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `country_code_5a` varchar(3) DEFAULT NULL COMMENT '国家代码5A',
  `country_code_3a` varchar(3) DEFAULT NULL COMMENT '国家代码3A',
  `country_code_2a` varchar(2) DEFAULT NULL COMMENT '国家代码2A',
  `country_name` varchar(20) DEFAULT NULL COMMENT '国家名',
  `country_name_dbcs` varchar(20) DEFAULT NULL COMMENT '国家名（中文）',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_currency_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_currency_code`;
CREATE TABLE `bnd_master_currency_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) DEFAULT NULL COMMENT '货币代码',
  `customs_currency` varchar(3) DEFAULT NULL COMMENT '海关货币代码',
  `currency_name` varchar(10) DEFAULT NULL COMMENT '货币名称',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1` (`currency`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_customer
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_customer`;
CREATE TABLE `bnd_master_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(10) DEFAULT NULL COMMENT '顾客代码',
  `account_group` varchar(4) DEFAULT NULL COMMENT 'CSACCG',
  `customer_name1_dbcs` varchar(160) DEFAULT NULL COMMENT '顾客中文名称',
  `customer_name1` varchar(70) DEFAULT NULL COMMENT '顾客名称',
  `customer_name_abbr_dbcs` varchar(60) DEFAULT NULL COMMENT '顾客中文简称',
  `customer_name_abbr` varchar(25) DEFAULT NULL COMMENT '顾客简称',
  `address1_dbcs` varchar(250) DEFAULT NULL COMMENT '中文地址',
  `address1` varchar(145) DEFAULT NULL COMMENT '地址',
  `invoice_type` varchar(1) DEFAULT NULL COMMENT '发票型态',
  `tax_code2` varchar(1) DEFAULT NULL COMMENT '税率别代码2',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `country_code` varchar(2) DEFAULT NULL COMMENT '国家代码',
  `city_name_dbcs` varchar(100) DEFAULT NULL COMMENT '城市名',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`customer_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19193 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_customs
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_customs`;
CREATE TABLE `bnd_master_customs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customs_code` decimal(4,0) DEFAULT NULL COMMENT '关区代码',
  `customs_name` varchar(30) DEFAULT NULL COMMENT '关区名称',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=773 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_declare_company
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_declare_company`;
CREATE TABLE `bnd_master_declare_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) DEFAULT NULL COMMENT '类型',
  `dept` varchar(4) DEFAULT NULL COMMENT '申报口岸',
  `dcl_etpsno` varchar(10) DEFAULT NULL COMMENT '海关十位编码',
  `dcl_etps_nm` varchar(100) DEFAULT NULL COMMENT '名称',
  `dec_dm` varchar(18) DEFAULT NULL COMMENT '18码信用代码',
  `serial_number` decimal(3,0) DEFAULT NULL COMMENT '序号',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1` (`type`,`dept`,`dcl_etpsno`,`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_declare_element
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_declare_element`;
CREATE TABLE `bnd_master_declare_element` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商编',
  `serial_number` decimal(3,0) DEFAULT NULL COMMENT '序号',
  `name` varchar(70) DEFAULT NULL COMMENT '要素名称',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`ccc_code`,`serial_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_declare_list
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_declare_list`;
CREATE TABLE `bnd_master_declare_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ems_no` varchar(12) DEFAULT NULL COMMENT '帳冊編號    X(12)',
  `dcr_times` double(9,0) DEFAULT NULL COMMENT '報核次數    Z(8)9',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部歸併前清單編號',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '報關單號    Z(8)9',
  `declaration_notice` varchar(18) DEFAULT NULL COMMENT '報關單預錄入',
  `tax_no` varchar(20) DEFAULT NULL COMMENT '稅單號',
  `customs_name` varchar(4) DEFAULT NULL COMMENT '報關地海關代號9(4)',
  `ie_flag` varchar(1) DEFAULT NULL COMMENT '進出口標志  X(1)',
  `items_num` double(9,0) DEFAULT NULL COMMENT '商品項數    Z(8)9',
  `declare_date` date DEFAULT NULL COMMENT '申報日期    Z(8)',
  `ie_date` date DEFAULT NULL COMMENT '進出日期    Z(8)',
  `deduction_clearance_mode` varchar(2) DEFAULT NULL COMMENT '核扣通關方式X(2)',
  `list_no` varchar(18) DEFAULT NULL COMMENT '清單統一編號X(18)',
  `examine_flag` varchar(1) DEFAULT NULL COMMENT '審核標志    X(1)',
  `reason_code` varchar(10) DEFAULT NULL COMMENT '備注        X(10)',
  `modf_markcd` varchar(1) DEFAULT NULL COMMENT '修改標誌    X(1)',
  `copy_flag` varchar(1) DEFAULT NULL COMMENT 'copyto bnd_paytax_declare_deduct',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `declaration_no` (`declaration_no`,`ems_no`,`internal_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12747 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_declare_material
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_declare_material`;
CREATE TABLE `bnd_master_declare_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商编',
  `serial_number` decimal(3,0) DEFAULT NULL COMMENT '序号',
  `name` varchar(70) DEFAULT NULL COMMENT '要素名称',
  `content` varchar(160) DEFAULT NULL COMMENT '要素内容',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`item_no`,`ccc_code`,`serial_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58782 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_declare_materialz
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_declare_materialz`;
CREATE TABLE `bnd_master_declare_materialz` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `img_no` decimal(5,0) DEFAULT NULL COMMENT '项号',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT '保税标识',
  `itemized_application_code` varchar(1) DEFAULT NULL COMMENT '应用代码',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商编',
  `item_description_dbcs` varchar(36) DEFAULT NULL COMMENT '中文名称',
  `brand_type` varchar(1) DEFAULT NULL COMMENT '品牌类型',
  `export_discount` varchar(10) DEFAULT NULL COMMENT '出口享惠',
  `content` varchar(500) DEFAULT NULL COMMENT '要素内容汇总',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15820 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_declare_scrap
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_declare_scrap`;
CREATE TABLE `bnd_master_declare_scrap` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商编',
  `serial_number` decimal(3,0) DEFAULT NULL COMMENT '序号',
  `name` varchar(70) DEFAULT NULL COMMENT '要素名称',
  `content` varchar(160) DEFAULT NULL COMMENT '要素内容',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`item_no`,`ccc_code`,`serial_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2159 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_declare_scrapz
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_declare_scrapz`;
CREATE TABLE `bnd_master_declare_scrapz` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `img_no` decimal(5,0) DEFAULT NULL COMMENT '项号',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT '保税标识',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商编',
  `item_description_dbcs` varchar(40) DEFAULT NULL COMMENT '边角料中文名称',
  `item_description_dbcs1` varchar(40) DEFAULT NULL COMMENT '中文名称',
  `item_description_dbcs2` varchar(40) DEFAULT NULL COMMENT '下角料贩卖品名',
  `brand_type` varchar(1) DEFAULT NULL COMMENT '品牌类型',
  `export_discount` varchar(10) DEFAULT NULL COMMENT '出口享惠',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '监管单位',
  `net_weigh` decimal(18,9) DEFAULT NULL COMMENT '净重',
  `lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '第一法定计量单位',
  `lawf_unitcd_cf` decimal(18,9) DEFAULT NULL COMMENT '第一法定单位换算系数',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '第二法定计量单位',
  `secd_lawf_unitcd_cf` decimal(18,9) DEFAULT NULL COMMENT '第二法定单位换算系数',
  `unit_price` decimal(19,5) DEFAULT NULL COMMENT '监管单价',
  `content` varchar(500) DEFAULT NULL COMMENT '要素内容汇总',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_ehandbook_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_ehandbook_d`;
CREATE TABLE `bnd_master_ehandbook_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `item_type` varchar(1) DEFAULT NULL COMMENT '物料型态',
  `data_state` varchar(1) DEFAULT NULL COMMENT '数据状态',
  `img_no` decimal(19,0) DEFAULT NULL COMMENT '规并项号',
  `gds_seqno` decimal(19,0) DEFAULT NULL COMMENT '序号',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商品编码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '料号',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `item_spec` varchar(300) DEFAULT NULL COMMENT '规格型号',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在库单位',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '申报计量单位',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '换算系数',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '购买单位',
  `cf_purchase` decimal(18,9) DEFAULT NULL COMMENT '购买单位换算系数',
  `lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '法定计量单位',
  `lawf_unitcd_cf` decimal(18,9) DEFAULT NULL COMMENT '法定单位换算系数',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '第二法定计量单位',
  `secd_lawf_unitcd_cf` decimal(18,9) DEFAULT NULL COMMENT '第二法定单位换算系数',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分类',
  `net_weigh` decimal(18,9) DEFAULT NULL COMMENT '净重',
  `dcl_uprc_amt` decimal(25,5) DEFAULT NULL COMMENT '申报单价',
  `currency` varchar(3) DEFAULT NULL COMMENT '币制',
  `dcl_qty` decimal(19,5) DEFAULT NULL COMMENT '申报数量',
  `lvyrlf_modecd` varchar(6) DEFAULT NULL COMMENT '征免方式',
  `qty_cntr_markcd` varchar(4) DEFAULT NULL COMMENT '数量控制标志',
  `adjmtr_markcd` varchar(4) DEFAULT NULL COMMENT '辅料标记代码',
  `modf_markcd` varchar(4) DEFAULT NULL COMMENT '修改标志',
  `etps_exe_markcd` varchar(4) DEFAULT NULL COMMENT '企业执行标志',
  `cusm_exe_markcd` varchar(4) DEFAULT NULL COMMENT '海关执行标志',
  `appr_max_surp_qty` decimal(19,5) DEFAULT NULL COMMENT '批准最大余数量',
  `vclr_prid_init_qty` decimal(19,5) DEFAULT NULL COMMENT '期初数量',
  `ucns_tqsn_flag` varchar(1) DEFAULT NULL COMMENT '单耗质疑标志',
  `csttn_flag` varchar(1) DEFAULT NULL COMMENT '磋商标志',
  `regulatory_credentials1` varchar(2) DEFAULT NULL COMMENT '监管证件代码1',
  `regulatory_credentials2` varchar(2) DEFAULT NULL COMMENT '监管证件代码2',
  `regulatory_credentials3` varchar(2) DEFAULT NULL COMMENT '监管证件代码3',
  `regulatory_credentials4` varchar(2) DEFAULT NULL COMMENT '监管证件代码4',
  `regulatory_credentials5` varchar(2) DEFAULT NULL COMMENT '监管证件代码5',
  `regulatory_credentials6` varchar(2) DEFAULT NULL COMMENT '监管证件代码6',
  `regulatory_credentials7` varchar(2) DEFAULT NULL COMMENT '监管证件代码7',
  `regulatory_credentials8` varchar(2) DEFAULT NULL COMMENT '监管证件代码8',
  `regulatory_credentials9` varchar(2) DEFAULT NULL COMMENT '监管证件代码9',
  `regulatory_credentials10` varchar(2) DEFAULT NULL COMMENT '监管证件代码10',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`item_no`,`item_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17768 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_ehandbook_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_ehandbook_h`;
CREATE TABLE `bnd_master_ehandbook_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '账册变更次数',
  `etps_preent_no` varchar(64) DEFAULT NULL COMMENT '企业内部编号',
  `bizop_etps_sccd` varchar(18) DEFAULT NULL COMMENT '经营单位社会信用代码',
  `bizop_etpsno` varchar(10) DEFAULT NULL COMMENT '经营单位编码',
  `bizop_etps_nm` varchar(512) DEFAULT NULL COMMENT '经营单位名称',
  `prcs_etps_sccd` varchar(18) DEFAULT NULL COMMENT '加工单位社会信用代码',
  `prcs_etpsno` varchar(10) DEFAULT NULL COMMENT '加工单位编码',
  `prcs_etps_nm` varchar(512) DEFAULT NULL COMMENT '加工单位名称',
  `dec_dm` varchar(18) DEFAULT NULL COMMENT '申报单位社会信用代码',
  `dcl_etpsno` varchar(10) DEFAULT NULL COMMENT '申报单位编码',
  `dcl_etps_nm` varchar(512) DEFAULT NULL COMMENT '申报单位名称',
  `dcl_etps_typecd` varchar(25) DEFAULT NULL COMMENT '申报单位类型',
  `input_code` varchar(10) DEFAULT NULL COMMENT '录入单位编码',
  `input_credit_code` varchar(18) DEFAULT NULL COMMENT '录入单位社会信用代码',
  `input_name` varchar(512) DEFAULT NULL COMMENT '录入单位名称',
  `ems_type` varchar(25) DEFAULT NULL COMMENT '账册类型',
  `finish_valid_time` date DEFAULT NULL COMMENT '账册结束有效期',
  `dcl_typecd` varchar(25) DEFAULT NULL COMMENT '申报类型',
  `actl_imp_total_amt` decimal(19,5) DEFAULT NULL COMMENT '实际进口总金额',
  `actl_exp_total_amt` decimal(19,5) DEFAULT NULL COMMENT '实际出口总金额',
  `apcret_not` varchar(64) DEFAULT NULL COMMENT '批准证编号',
  `netwk_etps_arcrp_no` varchar(64) DEFAULT NULL COMMENT '企业档案库编号',
  `max_tovr_amt` decimal(25,5) DEFAULT NULL COMMENT '最大周转金额（万美金)',
  `dcl_time` date DEFAULT NULL COMMENT '申报日期',
  `rcnt_vclr_time` date DEFAULT NULL COMMENT '最近核销日期',
  `input_date` date DEFAULT NULL COMMENT '录入日期',
  `ucns_dcl_segcd` varchar(8) DEFAULT NULL COMMENT '单耗申报环节',
  `vclr_prid_val` decimal(19,5) DEFAULT NULL COMMENT '核销周期',
  `ucns_verno_cntr_fla` varchar(1) DEFAULT NULL COMMENT '单耗版本号控制标志',
  `material_count` decimal(19,5) DEFAULT NULL COMMENT '料件项数',
  `endprd_item_cnt` decimal(19,5) DEFAULT NULL COMMENT '成品项数',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `master_cuscd` varchar(4) DEFAULT NULL COMMENT '主管海关',
  `imp_max_account` decimal(19,5) DEFAULT NULL COMMENT '最大进口金额（美元）',
  `vclr_typecd` varchar(1) DEFAULT NULL COMMENT '核销类型',
  `usagetypecd` varchar(4) DEFAULT NULL COMMENT '账册用途',
  `putrec_appr_time` date DEFAULT NULL COMMENT '备案批准日期',
  `cash_payment_date` date DEFAULT NULL COMMENT '变更批准日期',
  `exe_markcd` varchar(4) DEFAULT NULL COMMENT '账册执行标志',
  `ehvtyp` varchar(1) DEFAULT NULL COMMENT '核销方式',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`etps_preent_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_exchange_rate`;
CREATE TABLE `bnd_master_exchange_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) DEFAULT NULL COMMENT '货币代码',
  `transaction_date` date DEFAULT NULL COMMENT '异动日期',
  `exchange_rate_type` varchar(1) DEFAULT NULL COMMENT '汇率产生型态',
  `rate` decimal(9,5) DEFAULT NULL COMMENT '汇率',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`currency`,`transaction_date`,`exchange_rate_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14761 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_hs_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_hs_code`;
CREATE TABLE `bnd_master_hs_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商编',
  `data_state` varchar(1) DEFAULT NULL COMMENT '数据状态',
  `lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '第一法定计量单位',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '第二法定计量单位',
  `other_regulatory_conditions` varchar(1) DEFAULT NULL COMMENT '其他监管条件',
  `tax_rate` decimal(13,3) DEFAULT NULL COMMENT '税率',
  `regulatory_credentials1` varchar(2) DEFAULT NULL COMMENT '监管证件代码1',
  `regulatory_credentials2` varchar(2) DEFAULT NULL COMMENT '监管证件代码2',
  `regulatory_credentials3` varchar(2) DEFAULT NULL COMMENT '监管证件代码3',
  `regulatory_credentials4` varchar(2) DEFAULT NULL COMMENT '监管证件代码4',
  `regulatory_credentials5` varchar(2) DEFAULT NULL COMMENT '监管证件代码5',
  `regulatory_credentials6` varchar(2) DEFAULT NULL COMMENT '监管证件代码6',
  `regulatory_credentials7` varchar(2) DEFAULT NULL COMMENT '监管证件代码7',
  `regulatory_credentials8` varchar(2) DEFAULT NULL COMMENT '监管证件代码8',
  `regulatory_credentials9` varchar(2) DEFAULT NULL COMMENT '监管证件代码9',
  `regulatory_credentials10` varchar(2) DEFAULT NULL COMMENT '监管证件代码10',
  `inspection_quarantine1` varchar(2) DEFAULT NULL COMMENT '检验检疫类别1',
  `inspection_quarantine2` varchar(2) DEFAULT NULL COMMENT '检验检疫类别2',
  `inspection_quarantine3` varchar(2) DEFAULT NULL COMMENT '检验检疫类别3',
  `inspection_quarantine4` varchar(2) DEFAULT NULL COMMENT '检验检疫类别4',
  `inspection_quarantine5` varchar(2) DEFAULT NULL COMMENT '检验检疫类别5',
  `inspection_quarantine6` varchar(2) DEFAULT NULL COMMENT '检验检疫类别6',
  `inspection_quarantine7` varchar(2) DEFAULT NULL COMMENT '检验检疫类别7',
  `inspection_quarantine8` varchar(2) DEFAULT NULL COMMENT '检验检疫类别8',
  `inspection_quarantine9` varchar(2) DEFAULT NULL COMMENT '检验检疫类别9',
  `inspection_quarantine10` varchar(2) DEFAULT NULL COMMENT '检验检疫类别10',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_program` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`ccc_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_invt_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_invt_d`;
CREATE TABLE `bnd_master_invt_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `data_state` varchar(1) DEFAULT NULL COMMENT '數據狀態',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '備案編號',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部清單編號',
  `gds_seqno` int(19) DEFAULT NULL COMMENT '商品序號',
  `filing_serial_no` int(19) DEFAULT NULL COMMENT '備案序號(對應底賬序號）',
  `item_no` varchar(15) DEFAULT NULL COMMENT '商品料號',
  `good_code` varchar(10) DEFAULT NULL COMMENT '商品編碼',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '商品名稱',
  `item_spec` varchar(512) DEFAULT NULL COMMENT '商品規格型號',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '申報計量單位',
  `lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '法定計量單位',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '法定第二計量',
  `country_code` varchar(3) DEFAULT NULL COMMENT '原產國 (地區)',
  `unit_price` decimal(19,5) DEFAULT NULL COMMENT '企業申報單價',
  `enterprise_declared_total_price` double(19,2) DEFAULT NULL COMMENT '企業申報總價',
  `usd_statistics_total_amount` double(25,5) DEFAULT NULL COMMENT '美元統計總金額',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣制',
  `legal_qty` double(19,5) DEFAULT NULL COMMENT '法定數量',
  `sec_legal_qty` double(19,5) DEFAULT NULL COMMENT '第二法定數量',
  `weight_scale_factor` double(19,5) DEFAULT NULL COMMENT '重量比例因子',
  `declare_qty` decimal(13,5) DEFAULT NULL COMMENT '申報數量',
  `gross_weight` decimal(19,5) DEFAULT NULL COMMENT '毛重',
  `net_weight` decimal(19,5) DEFAULT NULL COMMENT '淨重',
  `use_code` varchar(4) DEFAULT NULL COMMENT '用途代碼',
  `exempting_method` varchar(6) DEFAULT NULL COMMENT '征免方式',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '單耗版本號',
  `customs_declaration_commodity_no` int(19) DEFAULT NULL COMMENT '報關單商品序號',
  `classification_mark` varchar(4) DEFAULT NULL COMMENT '歸類標志',
  `circulation_declaration_no` double(19,0) DEFAULT NULL COMMENT '流轉申報表序號',
  `final_destination_country` varchar(3) DEFAULT NULL COMMENT '最終目的國',
  `modf_markcd` varchar(4) DEFAULT NULL COMMENT '修改標志',
  `rmk` varchar(512) DEFAULT NULL COMMENT '備注',
  `weight` double(18,9) DEFAULT NULL COMMENT '重量        Z(8)9.9(9)',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '對應報關單商品號Z(8)9',
  `finish_good_consolidation_no` int(9) DEFAULT NULL COMMENT '料件成品歸併項號',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '裝箱/到貨發票',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在庫單位',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '換算系數',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '購買單位',
  `cf_purchase` decimal(11,5) DEFAULT NULL COMMENT '換算系數',
  `packing_qty` decimal(11,1) DEFAULT NULL COMMENT '裝箱/在途數量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  `regul_cred_status` varchar(2) DEFAULT NULL COMMENT '监管证件代码状态',
  PRIMARY KEY (`id`),
  KEY `K1` (`ems_no`,`internal_number`,`item_no`,`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122128 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_invt_del_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_invt_del_d`;
CREATE TABLE `bnd_master_invt_del_d` (
  `data_state` varchar(1) DEFAULT NULL COMMENT '數據狀態',
  `ems_no` varchar(12) DEFAULT NULL COMMENT '加工贸易账册编号',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部編號                          ',
  `gds_seqno` decimal(19,0) DEFAULT NULL COMMENT '序號',
  `filing_serial_no` int(19) DEFAULT NULL COMMENT '备案序号(对应底账序号）',
  `item_no` varchar(30) DEFAULT NULL COMMENT '品名代码',
  `good_code` varchar(10) DEFAULT NULL COMMENT '商品编码',
  `item_description_dbcs` varchar(512) DEFAULT NULL COMMENT '品名（中文）',
  `item_spec` varchar(512) DEFAULT NULL COMMENT '品名规格',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '计量单位（盘点）',
  `lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '法定计量单位',
  `secd_lawf_unitcd` varchar(3) DEFAULT NULL COMMENT '第二法定计量单位',
  `country_code` varchar(3) DEFAULT NULL COMMENT '国家代码',
  `unit_price` decimal(19,5) DEFAULT NULL COMMENT '監管單價                              ',
  `enterprise_declared_total_price` double(19,2) DEFAULT NULL COMMENT '企业申报总价',
  `usd_statistics_total_amount` double(25,5) DEFAULT NULL COMMENT '美元统计总金额',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `legal_qty` double(19,5) DEFAULT NULL COMMENT '法定数量',
  `sec_legal_qty` double(19,5) DEFAULT NULL COMMENT '第二法定数量',
  `weight_scale_factor` double(19,5) DEFAULT NULL COMMENT '重量比例因子',
  `declare_qty` decimal(19,5) DEFAULT NULL COMMENT '報關單數量                            ',
  `gross_weight` decimal(19,5) DEFAULT NULL COMMENT '毛重',
  `net_weigh` decimal(19,5) DEFAULT NULL COMMENT '净重',
  `use_code` varchar(4) DEFAULT NULL COMMENT '用途代码',
  `exempting_method` varchar(6) DEFAULT NULL COMMENT '征免方式',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '单耗版本号',
  `customs_declaration_commodity_no` double(19,0) DEFAULT NULL COMMENT '报关单商品序号',
  `classification_mark` varchar(4) DEFAULT NULL COMMENT '归类标志',
  `circulation_declaration_no` double(19,0) DEFAULT NULL COMMENT '流转申报表序号',
  `final_destination_country` varchar(3) DEFAULT NULL COMMENT '最终目的国',
  `modf_markcd` varchar(1) DEFAULT NULL COMMENT '修改标志',
  `rmk` varchar(512) DEFAULT NULL COMMENT '備註',
  `weight` double(18,9) DEFAULT NULL COMMENT '重量        Z(8)9.9(9)',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '归并项号',
  `finish_good_consolidation_no` double(9,0) DEFAULT NULL COMMENT '料件成品归并项号',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '發票號碼                              ',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '计量单位（入出库）',
  `cf_physical_inventory` decimal(11,5) DEFAULT NULL COMMENT '盘点单位换算系数',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '购买单位',
  `cf_purchase` decimal(11,5) DEFAULT NULL COMMENT '购买单位换算系数',
  `packing_qty` decimal(18,5) DEFAULT NULL COMMENT '包裝數                                ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  KEY `K1` (`ems_no`,`internal_number`,`item_no`,`invoice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_invt_del_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_invt_del_h`;
CREATE TABLE `bnd_master_invt_del_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `data_state` varchar(1) DEFAULT NULL COMMENT '數據狀態',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部編號 ',
  `bizop_etpsno` varchar(10) DEFAULT NULL COMMENT '經營單位編碼',
  `receive_enterprise_no` varchar(10) DEFAULT NULL COMMENT '收货企业编号',
  `dcl_etpsno` varchar(10) DEFAULT NULL COMMENT '海關十位元編碼',
  `bill_no` varchar(64) DEFAULT NULL COMMENT '清单编号',
  `declare_date` date DEFAULT NULL COMMENT '報關日期 ',
  `declaration_date` date DEFAULT NULL COMMENT '报关单申报日期',
  `corresponding_customs_declaration_no` varchar(64) DEFAULT NULL COMMENT '对应报关单编号',
  `associated_list_no` varchar(64) DEFAULT NULL COMMENT '关联清单编号',
  `related_record_no` varchar(64) DEFAULT NULL COMMENT '关联备案编号',
  `related_customs_declaration_no` varchar(64) DEFAULT NULL COMMENT '关联报关单编号',
  `rel_declaration_domestic_rd_no` varchar(10) DEFAULT NULL COMMENT '关联报关单境内收发货编号',
  `rel_declaration_customs_rd_no` varchar(10) DEFAULT NULL COMMENT '关联报关单海关收发货编号',
  `rel_declaration_customs_applicant_code` varchar(10) DEFAULT NULL COMMENT '关联报关单海关申报单位编码',
  `import_export_gate` varchar(4) DEFAULT NULL COMMENT '进出境关别',
  `declare_port` varchar(4) DEFAULT NULL COMMENT '申報口岸',
  `import_export_mark_code` varchar(4) DEFAULT NULL COMMENT '进出口标记代码',
  `part_sign_code` varchar(4) DEFAULT NULL COMMENT '料件成品标记代码',
  `supervision_mode_code` varchar(6) DEFAULT NULL COMMENT '监管方式代码',
  `transport_code` varchar(6) DEFAULT NULL COMMENT '运输方式代码',
  `declaration_flag` varchar(1) DEFAULT NULL COMMENT '是否报关标志',
  `customs_declaration_type_code` varchar(25) DEFAULT NULL COMMENT '报关类型代码',
  `check_mark_code` varchar(4) DEFAULT NULL COMMENT '核扣标记代码',
  `list_import_export_state_code` varchar(4) DEFAULT NULL COMMENT '清单进出卡口状态代码',
  `withholding_time` date DEFAULT NULL COMMENT '预核扣时间',
  `finish_valid_time` date DEFAULT NULL COMMENT '結束有效期',
  `apcret_no` varchar(64) DEFAULT NULL COMMENT '批准證編號',
  `circulation_type` varchar(1) DEFAULT NULL COMMENT '流转类型',
  `input_code` varchar(10) DEFAULT NULL COMMENT '錄入單位編碼',
  `declarant_ic_no` varchar(20) DEFAULT NULL COMMENT '申报人IC卡号',
  `input_date` date DEFAULT NULL COMMENT '錄入日期',
  `list_state` varchar(1) DEFAULT NULL COMMENT '清单状态',
  `corresponding_customs_unit_code` varchar(10) DEFAULT NULL COMMENT '对应报关单申报单位代码',
  `customs_declaration_type` varchar(1) DEFAULT NULL COMMENT '报关单类型',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '變更次數',
  `origin_destination_country` varchar(3) DEFAULT NULL COMMENT '国家代码',
  `list_type` varchar(1) DEFAULT NULL COMMENT '清单类型',
  `declaration_state` varchar(1) DEFAULT NULL COMMENT '报关状态',
  `check_pass_flag_code` varchar(1) DEFAULT NULL COMMENT '核放单生成标志代码',
  `dcl_etps_typecd` varchar(25) DEFAULT NULL COMMENT '申報單位類型',
  `declaration_sync_alt_flag` varchar(1) DEFAULT NULL COMMENT '报关单同步修改标志',
  `taxis_amount` varchar(25) DEFAULT NULL COMMENT '计征金额',
  `trade_country` varchar(3) DEFAULT NULL COMMENT '贸易国',
  `rmk` varchar(512) DEFAULT NULL COMMENT '備註',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '報關單號',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1` (`ems_no`,`internal_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_invt_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_invt_h`;
CREATE TABLE `bnd_master_invt_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `data_state` varchar(1) DEFAULT NULL COMMENT '數據狀態',
  `ems_no` varchar(64) NOT NULL COMMENT '備案編號',
  `internal_number` varchar(20) NOT NULL COMMENT '企業內部清單編號',
  `bizop_etpsno` varchar(10) DEFAULT NULL COMMENT '經營企業編號',
  `receive_enterprise_no` varchar(10) DEFAULT NULL COMMENT '收貨企業編號',
  `dcl_etpsno` varchar(10) DEFAULT NULL COMMENT '申報企業編號',
  `bill_no` varchar(64) DEFAULT NULL COMMENT '清單編號',
  `declare_date` date DEFAULT NULL COMMENT '清單申報時間',
  `declaration_date` date DEFAULT NULL COMMENT '報關單申報日期',
  `corresponding_customs_declaration_no` varchar(64) DEFAULT NULL COMMENT '對應報關單編號',
  `associated_list_no` varchar(64) DEFAULT NULL COMMENT '關聯清單編號',
  `related_record_no` varchar(64) DEFAULT NULL COMMENT '關聯備案編號',
  `related_customs_declaration_no` varchar(64) DEFAULT NULL COMMENT '關聯報關單編號',
  `rel_declaration_domestic_rd_no` varchar(10) DEFAULT NULL COMMENT '關聯報關單境內收發貨編號',
  `rel_declaration_customs_rd_no` varchar(10) DEFAULT NULL COMMENT '關聯報關單海關收發貨編號',
  `rel_declaration_customs_applicant_code` varchar(10) DEFAULT NULL COMMENT '關聯報關單海關申報單位編碼',
  `import_export_gate` varchar(4) DEFAULT NULL COMMENT '進出境關別',
  `declare_port` varchar(4) DEFAULT NULL COMMENT '申報地關區代碼',
  `import_export_mark_code` varchar(4) DEFAULT NULL COMMENT '進出口標記代碼',
  `part_sign_code` varchar(4) DEFAULT NULL COMMENT '料件成品標記代碼',
  `supervision_mode_code` varchar(6) DEFAULT NULL COMMENT '監管方式代碼',
  `transport_code` varchar(6) DEFAULT NULL COMMENT '運輸方式代碼',
  `declaration_flag` varchar(1) DEFAULT NULL COMMENT '是否報關標志',
  `customs_declaration_type_code` varchar(25) DEFAULT NULL COMMENT '報關類型代碼',
  `check_mark_code` varchar(4) DEFAULT NULL COMMENT '核扣標記代碼',
  `list_import_export_state_code` varchar(4) DEFAULT NULL COMMENT '清單進出卡口狀態代碼',
  `withholding_time` date DEFAULT NULL COMMENT '預核扣時間',
  `finish_valid_time` date DEFAULT NULL COMMENT '正式核扣時間',
  `apcret_no` varchar(64) DEFAULT NULL COMMENT '申請表編號',
  `circulation_type` varchar(1) DEFAULT NULL COMMENT '流轉類型',
  `input_code` varchar(10) DEFAULT NULL COMMENT '錄入企業編號',
  `declarant_ic_no` varchar(20) DEFAULT NULL COMMENT '申報人IC卡號',
  `input_date` date DEFAULT NULL COMMENT '錄入日期',
  `list_state` varchar(1) DEFAULT NULL COMMENT '清單狀態',
  `corresponding_customs_unit_code` varchar(10) DEFAULT NULL COMMENT '對應報關單申報單位代碼',
  `customs_declaration_type` varchar(1) DEFAULT NULL COMMENT '報關單類型',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '修改變更次數',
  `origin_destination_country` varchar(3) DEFAULT NULL COMMENT '起運/運抵國(地區）',
  `list_type` varchar(1) DEFAULT NULL COMMENT '清單類型',
  `declaration_state` varchar(1) DEFAULT NULL COMMENT '報關狀態',
  `check_pass_flag_code` varchar(1) DEFAULT NULL COMMENT '核放單生成標志代碼',
  `dcl_etps_typecd` varchar(25) DEFAULT NULL COMMENT '申報類型',
  `declaration_sync_alt_flag` varchar(1) DEFAULT NULL COMMENT '報關單同步修改標志',
  `taxis_amount` varchar(25) DEFAULT NULL COMMENT '計征金額',
  `trade_country` varchar(3) DEFAULT NULL COMMENT '貿易國',
  `rmk` varchar(512) DEFAULT NULL COMMENT '備注',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '報關單預錄入編號X(18)',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`,`ems_no`,`internal_number`),
  UNIQUE KEY `UK1` (`ems_no`,`internal_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13063 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_invt_return
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_invt_return`;
CREATE TABLE `bnd_master_invt_return` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部編號 ',
  `bill_no` varchar(64) DEFAULT NULL COMMENT '清单编号',
  `declare_date` date DEFAULT NULL COMMENT '報關日期 ',
  `state` varchar(1) DEFAULT NULL COMMENT '状态',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `K1` (`internal_number`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_invt_type
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_invt_type`;
CREATE TABLE `bnd_master_invt_type` (
  `invt_type` varchar(100) NOT NULL,
  `import_export_mark_code` varchar(100) DEFAULT NULL COMMENT '出口E，进口I',
  `circulation_type` varchar(100) DEFAULT NULL COMMENT '流转类型',
  `customs_declaration_type_code` varchar(100) DEFAULT NULL COMMENT '报关类型代码',
  `customs_declaration_type` varchar(100) DEFAULT NULL COMMENT '報關單類型',
  `list_type` varchar(100) DEFAULT NULL COMMENT '清單類型 0',
  `declaration_state` varchar(100) DEFAULT NULL COMMENT '報關狀態',
  `dcl_etps_typecd` varchar(100) DEFAULT NULL COMMENT '申报类型',
  `supervision_mode_code` varchar(4) DEFAULT NULL COMMENT '监管方式',
  `part_sign_code` varchar(1) DEFAULT NULL COMMENT '料件成品标志',
  `declare_port` varchar(4) DEFAULT NULL COMMENT '申報海关',
  `import_export_gate` varchar(4) DEFAULT NULL COMMENT '进出口岸',
  `country_code` varchar(3) DEFAULT NULL COMMENT '起运国',
  `trade_country` varchar(3) DEFAULT NULL COMMENT '贸易国',
  `transport_code` varchar(3) DEFAULT NULL COMMENT '运输方式',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '版本',
  `use_code` varchar(2) DEFAULT NULL COMMENT '用途代码',
  `exempting_method` varchar(1) DEFAULT NULL COMMENT '征免方式',
  `return_url` varchar(50) DEFAULT NULL COMMENT '返回网址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_item
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_item`;
CREATE TABLE `bnd_master_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(18) DEFAULT NULL COMMENT '品名代碼                              ',
  `material_type` varchar(4) DEFAULT NULL COMMENT ' ',
  `procurement_flag` varchar(1) DEFAULT NULL COMMENT ' ',
  `procurement_sample_flag` varchar(1) DEFAULT NULL COMMENT ' ',
  `item_description_dbcs` varchar(100) DEFAULT NULL COMMENT '品名（中文）                          ',
  `item_descrip_en` varchar(60) DEFAULT NULL COMMENT '品名                                  ',
  `item_spec` varchar(40) DEFAULT NULL COMMENT '品名規格                              ',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分類代碼                          ',
  `hs_code` varchar(17) DEFAULT NULL COMMENT 'IMHSCD                                  ',
  `ie_tax_rate` decimal(5,2) DEFAULT NULL COMMENT 'IMRATE                                  ',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '計量單位（入出庫）                    ',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '計量單位（盤點）                      ',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '盤點單位換算係數',
  `um_weight` varchar(3) DEFAULT NULL COMMENT '計量單位（重量）   ',
  `warranty_period` decimal(8,0) DEFAULT NULL COMMENT '保証期間   ',
  `net_weigh` decimal(18,9) DEFAULT NULL COMMENT '淨重 ',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT '保稅區分   ',
  `mrpcode` varchar(10) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼  ',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT 'IMGNBR  ',
  `engineering_drawing_no` varchar(30) DEFAULT NULL COMMENT '技術圖面編號 ',
  `safety_standard_code4` varchar(4) DEFAULT NULL COMMENT '安規標準４',
  `pallet_qty` decimal(13,3) DEFAULT NULL COMMENT '台板載運數   ',
  `item_group_code` varchar(9) DEFAULT NULL COMMENT '機種別 ',
  `standard_cost` decimal(16,7) DEFAULT NULL COMMENT '標準成本   ',
  `standard_cost_number` decimal(5,0) DEFAULT NULL COMMENT ' ',
  `sorting_key1` varchar(5) DEFAULT NULL COMMENT '分類代碼１ ',
  `sorting_key2` varchar(5) DEFAULT NULL COMMENT '分類代碼２ ',
  `sorting_key3` varchar(5) DEFAULT NULL COMMENT '分類代碼３ ',
  `sorting_key4` varchar(5) DEFAULT NULL COMMENT '分類代碼４ ',
  `sorting_key5` varchar(5) DEFAULT NULL COMMENT '分類代碼５ ',
  `sorting_key6` varchar(5) DEFAULT NULL COMMENT '分類代碼６ ',
  `sorting_key7` varchar(5) DEFAULT NULL COMMENT '分類代碼７ ',
  `sorting_key8` varchar(5) DEFAULT NULL COMMENT '分類代碼８ ',
  `sorting_key9` varchar(5) DEFAULT NULL COMMENT '分類代碼９ ',
  `sorting_key10` varchar(5) DEFAULT NULL COMMENT '分類代碼１０ ',
  `item_type` varchar(1) DEFAULT NULL COMMENT '品名型态',
  `itemized_application_code` varchar(1) DEFAULT NULL COMMENT '品名應用代碼ITZA',
  `stock_code` varchar(1) DEFAULT NULL COMMENT '常備區分  ',
  `rohs_flag` varchar(1) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=537333 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_item_mail
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_item_mail`;
CREATE TABLE `bnd_master_item_mail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `state` varchar(1) DEFAULT NULL COMMENT '状态',
  `item_spec` varchar(40) DEFAULT NULL COMMENT '品名规格',
  `item_spec_new` varchar(40) DEFAULT NULL COMMENT '品名规格',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT '保税标志',
  `bonded_logo_new` varchar(1) DEFAULT NULL COMMENT '保税标志',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分类代码',
  `item_class_code_new` varchar(5) DEFAULT NULL COMMENT '品名分类代码',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '计量单位（入出库）',
  `um_incoming_outgoing_new` varchar(3) DEFAULT NULL COMMENT '计量单位（入出库）',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '计量单位（盘点）',
  `um_physical_inventory_new` varchar(3) DEFAULT NULL COMMENT '计量单位（盘点）',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '盘点单位换算系数',
  `cf_physical_inventory_new` decimal(18,9) DEFAULT NULL COMMENT '盘点单位换算系数',
  `sorting_key4` varchar(5) DEFAULT NULL COMMENT '分类代码４',
  `sorting_key4_new` varchar(5) DEFAULT NULL COMMENT '分类代码４',
  `net_weigh` decimal(18,9) DEFAULT NULL COMMENT '净重',
  `net_weigh_new` decimal(18,9) DEFAULT NULL COMMENT '净重',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3593 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_maximun_loss
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_maximun_loss`;
CREATE TABLE `bnd_master_maximun_loss` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `material_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名',
  `max_pm_orderqty_io` decimal(5,3) DEFAULT NULL COMMENT 'MAXQ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`material_item_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_mbom
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_mbom`;
CREATE TABLE `bnd_master_mbom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `bom_number` varchar(8) DEFAULT NULL COMMENT 'ISBOMN                                  ',
  `alternative_bom` varchar(2) DEFAULT NULL COMMENT 'ISALTB                                  ',
  `circuit_no` decimal(4,0) DEFAULT NULL COMMENT '電路板號碼                            ',
  `bom_item_node_number` varchar(8) DEFAULT NULL COMMENT 'ISBINN                                  ',
  `component_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代碼                          ',
  `ait_item_group` varchar(2) DEFAULT NULL COMMENT 'ISAIGR                                  ',
  `ait_ranking_order` varchar(2) DEFAULT NULL COMMENT 'ait_ranking_order',
  `ait_item_strategy` varchar(1) DEFAULT NULL COMMENT 'ait_item_strategy',
  `ait_item_usage_prob` decimal(3,0) DEFAULT NULL COMMENT 'ait_item_usage_prob',
  `base_qty` decimal(13,3) DEFAULT NULL COMMENT 'base_qty',
  `component_qtyparent_qty` decimal(13,3) DEFAULT NULL COMMENT '製品用量                              ',
  `loss_qty` decimal(20,9) DEFAULT NULL COMMENT '損耗數                                ',
  `effective_datemfg_lot` date DEFAULT NULL,
  `expiry_datemfg_lot` date DEFAULT NULL,
  `routing_no` varchar(15) DEFAULT NULL COMMENT '制造途程代码',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工程设备名',
  `seq_no` decimal(4,0) DEFAULT NULL COMMENT '流水号',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `item_no` (`item_no`,`bom_number`,`alternative_bom`,`bom_item_node_number`)
) ENGINE=InnoDB AUTO_INCREMENT=330823 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_mo
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_mo`;
CREATE TABLE `bnd_master_mo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mo_no` varchar(10) DEFAULT NULL COMMENT '制造订单号码',
  `mo_status` varchar(2) DEFAULT NULL COMMENT '制造订单状态',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `revision_no` decimal(3,0) DEFAULT NULL COMMENT '版数',
  `mrpcode` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基准代码',
  `warehouse_code` varchar(2) DEFAULT NULL COMMENT '仓库代码',
  `item_descrip_en` varchar(30) DEFAULT NULL COMMENT '品名',
  `item_spec` varchar(30) DEFAULT NULL COMMENT '品名规格',
  `engineering_drawing_no` varchar(15) DEFAULT NULL COMMENT '技术图面编号',
  `planner` varchar(6) DEFAULT NULL COMMENT '计划担当',
  `store_keeper` varchar(6) DEFAULT NULL COMMENT '仓库担当',
  `dept` varchar(5) DEFAULT NULL COMMENT '课别',
  `item_status` varchar(1) DEFAULT NULL COMMENT '品名状态',
  `itemized_application_code` varchar(1) DEFAULT NULL COMMENT '品名应用代码',
  `stock_location` varchar(6) DEFAULT NULL COMMENT '料架',
  `due_date` date DEFAULT NULL COMMENT '纳期',
  `plan_start_date` date DEFAULT NULL COMMENT '计划开始日',
  `plan_completion_date` date DEFAULT NULL COMMENT '计划完成日',
  `actual_start_date` date DEFAULT NULL COMMENT '实际开始日',
  `actual_completion_date` date DEFAULT NULL COMMENT '实际完成日',
  `plan_available_date` date DEFAULT NULL COMMENT '计划入库日',
  `last_operation_regst_date` date DEFAULT NULL COMMENT '最后实绩输入日',
  `input_quantity` decimal(13,3) DEFAULT NULL COMMENT '计划数',
  `plan_production_qty` decimal(13,3) DEFAULT NULL COMMENT '计划生产数',
  `nondefective_quantity` decimal(13,3) DEFAULT NULL COMMENT '制品存仓数',
  `accumulated_defect_qty` decimal(13,3) DEFAULT NULL COMMENT '累计不良数',
  `shortage_items` decimal(3,0) DEFAULT NULL COMMENT '缺料品名数',
  `plant_code` varchar(2) DEFAULT NULL COMMENT '生产场所代码',
  `line_type_code` varchar(2) DEFAULT NULL COMMENT '生产线型态代码',
  `routing_no` varchar(15) DEFAULT NULL COMMENT '制造途程代码',
  `current_work_center_no` varchar(9) DEFAULT NULL COMMENT '目前工作站代码',
  `current_operation_seqno` decimal(4,0) DEFAULT NULL COMMENT '目前作业顺序号码',
  `start_operation_seqno` decimal(4,0) DEFAULT NULL COMMENT '起始作业顺序号码',
  `last_operation_seqno` decimal(4,0) DEFAULT NULL COMMENT '最后作业顺序号码',
  `delivery_follow_up_seqno` decimal(4,0) DEFAULT NULL COMMENT '点货跟催序号',
  `slip_no` varchar(10) DEFAULT NULL COMMENT '出库传票号码',
  `individual_require_flag` varchar(1) DEFAULT NULL COMMENT '制番区分',
  `lotbased_control_flag` varchar(1) DEFAULT NULL COMMENT '批次管理区分',
  `classified_demand_code` varchar(1) DEFAULT NULL COMMENT '需求分类代码',
  `mo_type` varchar(4) DEFAULT NULL COMMENT '制造订单种类',
  `last_split_no` decimal(2,0) DEFAULT NULL COMMENT '上次分割号码',
  `mo_before_split` varchar(10) DEFAULT NULL COMMENT '分割前制造订单',
  `coordinating_mo_no` varchar(10) DEFAULT NULL COMMENT '合并制造订单号码',
  `customer_no` varchar(9) DEFAULT NULL COMMENT '顾客代码',
  `old_item_no` varchar(15) DEFAULT NULL COMMENT '旧品名代码',
  `manufacture_lot_no` decimal(6,0) DEFAULT NULL COMMENT '制造批号',
  `serial_nofrom` decimal(6,0) DEFAULT NULL COMMENT '机号ＦＲＯＭ',
  `serial_noto` decimal(6,0) DEFAULT NULL COMMENT '机号ＴＯ',
  `priority` varchar(1) DEFAULT NULL COMMENT '优先度',
  `advice_code` varchar(2) DEFAULT NULL COMMENT '建议处理代码',
  `advice_days` decimal(3,0) DEFAULT NULL COMMENT '建议处理天数',
  `printed_flag` varchar(1) DEFAULT NULL COMMENT '打印区分',
  `progress_control_no` varchar(10) DEFAULT NULL COMMENT '进度管理号码',
  `consistent_lot_no` varchar(10) DEFAULT NULL COMMENT '制番',
  `job_no` varchar(15) DEFAULT NULL COMMENT '工作代码',
  `rm_flag` varchar(1) DEFAULT NULL COMMENT '存仓识别区分',
  `rm_date` date DEFAULT NULL COMMENT '存仓日期',
  `rm_internal_no` varchar(10) DEFAULT NULL COMMENT '存仓流水号',
  `convert_item_mo` varchar(10) DEFAULT NULL COMMENT '转前制造订单号码',
  `convert_old_item_mo` varchar(10) DEFAULT NULL COMMENT 'TTSIS旧MO号码',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`mo_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=225368 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_mo_recycle
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_mo_recycle`;
CREATE TABLE `bnd_master_mo_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `co_code` varchar(10) DEFAULT NULL COMMENT 'co_code',
  `mo_no` varchar(10) DEFAULT NULL COMMENT '製造訂單號碼                          ',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `recy_date` date DEFAULT NULL COMMENT '日期',
  `defect_mts_lot` varchar(10) DEFAULT NULL COMMENT '不良MO',
  `def_opr_id` decimal(4,0) DEFAULT NULL COMMENT '不良工作站',
  `recy_qty` decimal(13,5) DEFAULT NULL COMMENT '再生数量',
  `domestic_use_qty` decimal(13,5) DEFAULT NULL COMMENT '内销已抵扣数量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `mo_no` (`mo_no`,`operation_sequence_no`,`defect_mts_lot`,`def_opr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226105 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_mo_recycle_copy1
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_mo_recycle_copy1`;
CREATE TABLE `bnd_master_mo_recycle_copy1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `co_code` varchar(10) DEFAULT NULL COMMENT 'co_code',
  `mo_no` varchar(10) DEFAULT NULL COMMENT '製造訂單號碼                          ',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `recy_date` date DEFAULT NULL COMMENT '日期',
  `defect_mts_lot` varchar(10) DEFAULT NULL COMMENT '不良MO',
  `def_opr_id` decimal(4,0) DEFAULT NULL COMMENT '不良工作站',
  `recy_qty` decimal(13,5) DEFAULT NULL COMMENT '再生数量',
  `domestic_use_qty` decimal(13,5) DEFAULT NULL COMMENT '内销已抵扣数量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `mo_no` (`mo_no`,`operation_sequence_no`,`defect_mts_lot`,`def_opr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66113 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_mo_version
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_mo_version`;
CREATE TABLE `bnd_master_mo_version` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mo_no` varchar(10) DEFAULT NULL COMMENT '制造订单号码',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM CODE.',
  `actual_start_date` date DEFAULT NULL COMMENT '实际开始日',
  `actual_completion_date` date DEFAULT NULL COMMENT '实际完成日',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '成品版本',
  `data_state` varchar(1) DEFAULT NULL COMMENT '修改标识Y可修改',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`mo_no`,`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2315450 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_nonbond_lot
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_nonbond_lot`;
CREATE TABLE `bnd_master_nonbond_lot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mo_no` varchar(10) DEFAULT NULL COMMENT 'MO',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `reason` varchar(100) DEFAULT NULL COMMENT '原因',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登录人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`mo_no`,`item_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1672 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_port_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_port_code`;
CREATE TABLE `bnd_master_port_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `port_code` varchar(3) DEFAULT NULL COMMENT 'PORT CODE',
  `country_code` varchar(2) DEFAULT NULL COMMENT 'COUNTRY CODE',
  `port_name` varchar(30) DEFAULT NULL COMMENT 'PORT NAME',
  `port_name_dbcs` varchar(30) DEFAULT NULL COMMENT 'PORT NAME (DBCS)',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`port_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_production_material
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_production_material`;
CREATE TABLE `bnd_master_production_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mo_no` varchar(10) DEFAULT NULL COMMENT '制造订单号码',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作业顺序号码',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `revision_no` decimal(3,0) DEFAULT NULL COMMENT '版数',
  `mrpcode` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基准代码',
  `item_descrip_en` varchar(60) DEFAULT NULL COMMENT '品名',
  `item_spec` varchar(40) DEFAULT NULL COMMENT '品名规格',
  `actual_qty` decimal(13,3) DEFAULT NULL COMMENT '本站实际投入数',
  `material_count` decimal(4,0) DEFAULT NULL COMMENT '材料流水号',
  `material_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代码',
  `material_item_description` varchar(60) DEFAULT NULL COMMENT '材料品名',
  `material_specification` varchar(40) DEFAULT NULL COMMENT '材料品名规格',
  `material_item_no_tmisp` varchar(15) DEFAULT NULL COMMENT '材料品名代码结构文件',
  `material_type` varchar(2) DEFAULT NULL COMMENT '材料类型',
  `manufacture_lot_no` varchar(10) DEFAULT NULL COMMENT '材料批号',
  `vendor_no` varchar(7) DEFAULT NULL COMMENT '供货商代码',
  `lot_expiration_date` date DEFAULT NULL COMMENT ' LOT失效日期',
  `actual_materail_qty` decimal(20,9) DEFAULT NULL COMMENT '实际材料数',
  `material_defect_qty` decimal(20,9) DEFAULT NULL COMMENT '材料不良数',
  `loss_qty` decimal(20,9) DEFAULT NULL COMMENT '损耗数',
  `actual_um` varchar(3) DEFAULT NULL COMMENT '实际单位',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '计量单位（入出库）',
  `product_loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '凈耗',
  `loss_quantity` decimal(20,9) DEFAULT NULL COMMENT '损耗',
  `componentparent_itemc` decimal(20,9) DEFAULT NULL COMMENT '材料用量',
  `component_qtyparent_qty` decimal(13,3) DEFAULT NULL COMMENT '制品用量',
  `material_item_type` varchar(1) DEFAULT NULL COMMENT '材料分类',
  `update_type_manual_auto` varchar(1) DEFAULT NULL COMMENT '手动/自动更新',
  `text_contents1` varchar(10) DEFAULT NULL COMMENT '备注1',
  `text_contents2` varchar(10) DEFAULT NULL COMMENT '备注2',
  `text_contents3` varchar(10) DEFAULT NULL COMMENT '备注3',
  `text_contents4` varchar(10) DEFAULT NULL COMMENT '备注4',
  `text_contents5` varchar(10) DEFAULT NULL COMMENT '备注5',
  `text_contents6` varchar(10) DEFAULT NULL COMMENT '备注6',
  `sap_mo` varchar(12) DEFAULT NULL COMMENT 'MFSAPM',
  `material_bom_ver` decimal(9,0) DEFAULT NULL COMMENT 'MFBOMV',
  `vendor_lot_no` varchar(10) DEFAULT NULL COMMENT 'MFVDLO',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`mo_no`,`operation_sequence_no`,`material_item_no`,`manufacture_lot_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2366346 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_product_structure
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_product_structure`;
CREATE TABLE `bnd_master_product_structure` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `revision_no` decimal(3,0) DEFAULT NULL COMMENT '版数',
  `circuit_code` varchar(3) DEFAULT NULL COMMENT '电路板代码',
  `circuit_no` decimal(4,0) DEFAULT NULL COMMENT '电路板号码',
  `effective_date_mfg_lot` date DEFAULT NULL COMMENT 'EFFECTIVE    DATE/MFG LOT',
  `expiry_date_mfg_lot` date DEFAULT NULL COMMENT 'EXPIRY     DATE/MFG LOT',
  `alternative_item_no` varchar(15) DEFAULT NULL COMMENT '替代品名代码',
  `alternative_revision_no` decimal(3,0) DEFAULT NULL COMMENT '替代品版数',
  `component_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代码',
  `component_revision_no` decimal(3,0) DEFAULT NULL COMMENT '材料版数',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作业顺序号码',
  `individual_require_flag` varchar(1) DEFAULT NULL COMMENT '制番区分',
  `componentparent_itemc` decimal(14,4) DEFAULT NULL COMMENT '材料用量',
  `component_qtyparent_qty` decimal(13,3) DEFAULT NULL COMMENT '制品用量',
  `spare_partsstd_lot_s` decimal(14,4) DEFAULT NULL COMMENT '备用零件数（子）',
  `spare_partsstd_lot` decimal(13,3) DEFAULT NULL COMMENT '备用零件数（亲）',
  `service_parts_flag` varchar(1) DEFAULT NULL COMMENT '服务零件区分',
  `automatic_insertion_code` varchar(1) DEFAULT NULL COMMENT 'AUTOMATIC   INSERTION CODE',
  `option_planning_factor` decimal(5,1) DEFAULT NULL COMMENT '使用确率',
  `adjust_lt_code` varchar(1) DEFAULT NULL COMMENT 'ADJUST   L/T CODE',
  `adjust_lt` decimal(5,1) DEFAULT NULL COMMENT '调整前置时间',
  `yield` decimal(5,1) DEFAULT NULL COMMENT '良品率',
  `setup_yield` decimal(5,1) DEFAULT NULL COMMENT '装设良品率',
  `safety_standard_code1` varchar(4) DEFAULT NULL COMMENT '安规标准１',
  `safety_standard_code2` varchar(4) DEFAULT NULL COMMENT '安规标准２',
  `ait_item_group` varchar(2) DEFAULT NULL COMMENT 'ISAIGR',
  `routing_no` varchar(15) DEFAULT NULL COMMENT 'ISRTNR',
  `bom_number` varchar(8) DEFAULT NULL COMMENT 'ISBOMN',
  `alternative_bom` varchar(2) DEFAULT NULL COMMENT 'ISALTB',
  `bom_item_node_number` varchar(8) DEFAULT NULL COMMENT 'ISBINN',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT 'ISWKNR',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`item_no`,`revision_no`,`circuit_code`,`circuit_no`,`effective_date_mfg_lot`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=212684 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_psa_mrp
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_psa_mrp`;
CREATE TABLE `bnd_master_psa_mrp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `psa_code` varchar(3) DEFAULT NULL,
  `mrp_code` varchar(1) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_purchase_price
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_purchase_price`;
CREATE TABLE `bnd_master_purchase_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(7) DEFAULT NULL COMMENT '供货商代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `revision_no` decimal(3,0) DEFAULT NULL COMMENT '版数',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '贸易条件代码',
  `effective_date` date DEFAULT NULL COMMENT '起始生效日',
  `expiration_date` date DEFAULT NULL COMMENT '截止失效日',
  `um_purchase` varchar(3) DEFAULT NULL COMMENT '计量单位（购买）',
  `cf_purchase` decimal(11,5) DEFAULT NULL COMMENT '购买单位换算系数',
  `price` decimal(18,5) DEFAULT NULL COMMENT '购买价格',
  `maker_code` varchar(7) DEFAULT NULL COMMENT 'MAKER  CODE',
  `vendor_item_no` varchar(35) DEFAULT NULL COMMENT 'BPVINR',
  `currency` varchar(3) DEFAULT NULL COMMENT 'BPCURR',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`vendor_no`,`item_no`,`revision_no`,`terms_trade`,`effective_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=177032 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_qualification_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_qualification_d`;
CREATE TABLE `bnd_master_qualification_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `expiration_flag` varchar(1) DEFAULT NULL COMMENT '物料型态',
  `data_state` varchar(1) DEFAULT NULL COMMENT '数据状态',
  `g_no` decimal(19,0) DEFAULT NULL COMMENT '序号',
  `mtno` varchar(30) DEFAULT NULL COMMENT '料号',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '变更次数',
  `gdecd` varchar(10) DEFAULT NULL COMMENT '商品编码',
  `gds_nm` varchar(512) DEFAULT NULL COMMENT '商品名称',
  `modf_markcd` varchar(4) DEFAULT NULL COMMENT '修改标志',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`seq_no`,`expiration_flag`,`gdecd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_qualification_h
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_qualification_h`;
CREATE TABLE `bnd_master_qualification_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `seq_no` varchar(18) DEFAULT NULL COMMENT '预录入统一编号',
  `et_arcrp_no` varchar(64) DEFAULT NULL COMMENT '档案库编号',
  `chg_tms_cnt` decimal(19,0) DEFAULT NULL COMMENT '变更次数',
  `etps_preent_no` varchar(64) DEFAULT NULL COMMENT '企业内部编号',
  `master_cuscd` varchar(4) DEFAULT NULL COMMENT '主管海关',
  `bizop_etps_sccd` varchar(18) DEFAULT NULL COMMENT '经营单位社会信用代码',
  `bizop_etpsno` varchar(10) DEFAULT NULL COMMENT '经营单位编码',
  `bizop_etps_nm` varchar(512) DEFAULT NULL COMMENT '经营单位名称',
  `prcs_etps_sccd` varchar(18) DEFAULT NULL COMMENT '加工单位社会信用代码',
  `prcs_etpsno` varchar(10) DEFAULT NULL COMMENT '加工单位编码',
  `prcs_etps_nm` varchar(512) DEFAULT NULL COMMENT '加工单位名称',
  `dec_dm` varchar(18) DEFAULT NULL COMMENT '申报单位社会信用代码',
  `dcl_etpsno` varchar(10) DEFAULT NULL COMMENT '申报单位编码',
  `dcl_etps_nm` varchar(512) DEFAULT NULL COMMENT '申报单位名称',
  `dcl_etps_typecd` varchar(25) DEFAULT NULL COMMENT '申报单位类型',
  `conc_addr` varchar(512) DEFAULT NULL COMMENT '联系地址',
  `telephone_no` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `finish_valid_time` date DEFAULT NULL COMMENT '结束有效期',
  `prcs_prdc_ablt_amt` decimal(25,5) DEFAULT NULL COMMENT '加工生产能力（万美元）',
  `apcret_no` varchar(64) DEFAULT NULL COMMENT '批准证编号',
  `risk_assure_markcd` varchar(4) DEFAULT NULL COMMENT '风险担保标志',
  `rlt_form_no` varchar(64) DEFAULT NULL COMMENT '关联单证号',
  `dcl_source_markcd` varchar(4) DEFAULT NULL COMMENT '申报来源标记代码',
  `dcl_typecd` varchar(25) DEFAULT NULL COMMENT '申报类型',
  `dcl_time` date DEFAULT NULL COMMENT '申报日期',
  `emapv_stucd` varchar(4) DEFAULT NULL COMMENT '审批状态代码',
  `exe_markcd` varchar(4) DEFAULT NULL COMMENT '执行标志',
  `putrec_appr_time` date DEFAULT NULL COMMENT '备案批准日期',
  `chg_appr_time` date DEFAULT NULL COMMENT '变更批准日期',
  `rmk` varchar(512) DEFAULT NULL COMMENT '备注',
  `input_code` varchar(10) DEFAULT NULL COMMENT '录入单位编码',
  `input_credit_code` varchar(18) DEFAULT NULL COMMENT '录入单位社会信用代码',
  `input_name` varchar(512) DEFAULT NULL COMMENT '录入单位名称',
  `input_date` date DEFAULT NULL COMMENT '录入日期',
  `ems_type` varchar(1) DEFAULT NULL COMMENT '资质类型',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`etps_preent_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_remission_type
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_remission_type`;
CREATE TABLE `bnd_master_remission_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `remission_code` varchar(1) DEFAULT NULL COMMENT '减免方式',
  `remission_code_name` varchar(30) DEFAULT NULL COMMENT '减免方式描述',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_routing
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_routing`;
CREATE TABLE `bnd_master_routing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `routing_no` varchar(15) DEFAULT NULL COMMENT '制造途程代码                          ',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作业顺序号码                          ',
  `operation_desc_dbcs` varchar(90) DEFAULT NULL COMMENT '作业描述（中文）                      ',
  `section_code` varchar(2) DEFAULT NULL COMMENT '股别                                  ',
  `um_load` varchar(3) DEFAULT NULL COMMENT '计量单位（负荷）                      ',
  `um_operation_register` varchar(3) DEFAULT NULL COMMENT '计量单位（实绩输入）                ',
  `equipment_type` varchar(3) DEFAULT NULL COMMENT '设备型态                              ',
  `jig_tool_no` varchar(9) DEFAULT NULL COMMENT '治工具号码                            ',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站代码                            ',
  `yield` decimal(5,1) DEFAULT NULL COMMENT '良品率                                ',
  `standard_flag` varchar(1) DEFAULT NULL COMMENT '指示前提区分                          ',
  `load_calculation_flag` varchar(1) DEFAULT NULL COMMENT '负荷展开对象区分                      ',
  `labor_machine_code` varchar(1) DEFAULT NULL COMMENT '人工／机器区分                        ',
  `standard_operation_flag` varchar(1) DEFAULT NULL COMMENT '标准作业区分                          ',
  `operation_sequence_group` varchar(4) DEFAULT NULL COMMENT '作业顺序群                            ',
  `operation_instruction_flg` varchar(1) DEFAULT NULL COMMENT '作业指示区分                          ',
  `operation_register_flag` varchar(1) DEFAULT NULL COMMENT '实绩输入区分                          ',
  `additional_inspection_flg` varchar(1) DEFAULT NULL COMMENT '额外检查区分                          ',
  `effect_engineer_chglvl` decimal(5,0) DEFAULT NULL COMMENT 'EFFECT ENGINEER CHG.LVL             ',
  `expiry_engineer_chglvl` decimal(5,0) DEFAULT NULL COMMENT '工程变更失效阶层                      ',
  `moving_lt` decimal(5,1) DEFAULT NULL COMMENT '移动前置时间                          ',
  `queuing_lt` decimal(5,1) DEFAULT NULL COMMENT '等待前置时间                          ',
  `operation_lt` decimal(5,1) DEFAULT NULL COMMENT '作业前置时间                          ',
  `urgent_moving_lt` decimal(5,1) DEFAULT NULL COMMENT '紧急搬运前置时间                      ',
  `urgent_queuing_lt` decimal(5,1) DEFAULT NULL COMMENT '紧急等待前置时间                      ',
  `urgent_operation_lt` decimal(5,1) DEFAULT NULL COMMENT '紧急作业前置时间                      ',
  `setup_flag` varchar(1) DEFAULT NULL COMMENT '装设区分                              ',
  `setup_code` varchar(1) DEFAULT NULL COMMENT '装设代码                              ',
  `setup_crew_size` decimal(3,1) DEFAULT NULL COMMENT '装设人员数                            ',
  `setup_load` decimal(11,3) DEFAULT NULL COMMENT '装设负荷工数                          ',
  `standard_value` decimal(11,1) DEFAULT NULL COMMENT '指示前提值                            ',
  `basic_unit_qty` decimal(11,1) DEFAULT NULL COMMENT '基本单位数量                          ',
  `opertime_basic_unit_qty` decimal(11,3) DEFAULT NULL COMMENT '单位数量作业时间                      ',
  `standard_time_code` varchar(5) DEFAULT NULL COMMENT '标准时间代码                          ',
  `operation_standard_no` varchar(15) DEFAULT NULL COMMENT '作业标准号码                          ',
  `take_up_qty` decimal(5,1) DEFAULT NULL COMMENT '分割标准值                            ',
  `noof_jig_tool` decimal(3,0) DEFAULT NULL COMMENT '治工具数量                            ',
  `uprice_evaluate_unfinish` decimal(13,5) DEFAULT NULL COMMENT '仕挂品评价单价                        ',
  `subcontract_unit_price` decimal(13,5) DEFAULT NULL COMMENT '外注单价                              ',
  `inprocess_matrialucost` decimal(13,5) DEFAULT NULL COMMENT '工程中之材料单位成本                ',
  `inprocess_mfg_unit_cost` decimal(13,5) DEFAULT NULL COMMENT '工程中之制品单位成本                ',
  `alternate_equipment_type` varchar(3) DEFAULT NULL COMMENT '替代设备型态                          ',
  `alternate_work_center_no` varchar(9) DEFAULT NULL COMMENT '替代工作场代码                        ',
  `alternate_jig_tool_qty` decimal(3,0) DEFAULT NULL COMMENT '替代治工具数                          ',
  `effective_date` date DEFAULT NULL COMMENT '起始生效日                            ',
  `expiration_date` date DEFAULT NULL COMMENT '截止失效日                            ',
  `old_routing_no` varchar(15) DEFAULT NULL COMMENT 'RDORTN                                  ',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'RDITNR                                  ',
  `control_key` varchar(4) DEFAULT NULL COMMENT 'RDCTRK                                  ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`routing_no`,`operation_sequence_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=231633 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_routing_mbom
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_routing_mbom`;
CREATE TABLE `bnd_master_routing_mbom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `routing_no` varchar(15) DEFAULT NULL COMMENT '制造途程代码',
  `bom_number` varchar(8) DEFAULT NULL COMMENT 'ISBOMN                                  ',
  `alternative_bom` varchar(2) DEFAULT NULL COMMENT 'ISALTB                                  ',
  `circuit_no` decimal(4,0) DEFAULT NULL COMMENT '電路板號碼                            ',
  `bom_item_node_number` varchar(8) DEFAULT NULL COMMENT 'ISBINN                                  ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `equipment_name` varchar(9) NOT NULL COMMENT '工程设备名',
  `component_item_no` varchar(15) DEFAULT NULL COMMENT '材料品名代碼                          ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3050 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_sample_consume
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_sample_consume`;
CREATE TABLE `bnd_master_sample_consume` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrp_code` varchar(3) DEFAULT NULL COMMENT 'MRP基准代码',
  `type` varchar(10) DEFAULT NULL,
  `yyyymm` decimal(6,0) DEFAULT NULL,
  `material_document` varchar(10) DEFAULT NULL COMMENT 'MD号',
  `document_item` varchar(4) DEFAULT NULL COMMENT 'MD序号',
  `doc_head_text` varchar(60) DEFAULT NULL COMMENT 'MD表头',
  `reference_document_number` varchar(16) DEFAULT NULL COMMENT '关联文档',
  `posting_date` decimal(8,0) DEFAULT NULL COMMENT '异动日期',
  `document_date` decimal(8,0) DEFAULT NULL COMMENT '文档日期',
  `document_time` decimal(6,0) DEFAULT NULL COMMENT '文档时间',
  `item_no` varchar(18) DEFAULT NULL COMMENT '品名代码',
  `transaction_qty` decimal(11,1) DEFAULT NULL COMMENT 'TRANSACTION QTY                         ',
  `unit` varchar(3) DEFAULT NULL COMMENT '单位',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批號                                  ',
  `cost_center` varchar(10) DEFAULT NULL COMMENT '成本 中心',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'PSA',
  `movement_type` varchar(3) DEFAULT NULL COMMENT '异动类型',
  `user_id` varchar(12) DEFAULT NULL COMMENT '用户ID',
  `state` varchar(1) DEFAULT NULL COMMENT '状态',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23787 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_stock_batch
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_stock_batch`;
CREATE TABLE `bnd_master_stock_batch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrpcode` varchar(10) DEFAULT NULL COMMENT 'mrp',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `storage_type` varchar(10) DEFAULT NULL COMMENT 'storagetype',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批號                                  ',
  `bond_flag` varchar(1) DEFAULT NULL COMMENT '保税标识',
  `on_hand_qty` varchar(11) DEFAULT NULL COMMENT '在库数量',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '计量单位（入出库）',
  `stock_location` varchar(10) DEFAULT NULL COMMENT '料架',
  `price0` decimal(13,2) DEFAULT NULL COMMENT '价格',
  `price_number` decimal(5,0) DEFAULT NULL COMMENT '价格数量',
  `category` varchar(1) DEFAULT NULL COMMENT '库存类型',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40144 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_trade_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_trade_code`;
CREATE TABLE `bnd_master_trade_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `trade_code` varchar(3) DEFAULT NULL COMMENT 'TRADE               TERM CODE',
  `trade_desc` varchar(40) DEFAULT NULL COMMENT 'TRADE               TERM DESC.',
  `trade_term_dbsc` varchar(40) DEFAULT NULL COMMENT 'TRADE TERM          DESC.(DBCS)',
  `trade_term_abbr` varchar(20) DEFAULT NULL COMMENT 'TRADE TERM          DESC.(ABBR.)',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_trade_transaction
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_trade_transaction`;
CREATE TABLE `bnd_master_trade_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `trade_code` varchar(3) DEFAULT NULL COMMENT '贸易条件简称',
  `customs_import_code` varchar(3) DEFAULT NULL COMMENT '海关进口录入',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_trans_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_trans_code`;
CREATE TABLE `bnd_master_trans_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `trans_mode` varchar(9) DEFAULT NULL COMMENT '運輸代碼',
  `trans_mode_name` varchar(30) DEFAULT NULL COMMENT '運輸方式描述',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_unit_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_unit_code`;
CREATE TABLE `bnd_master_unit_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(10) DEFAULT NULL COMMENT '单位代码',
  `customs_unit_code` varchar(3) DEFAULT NULL COMMENT '海关单位代码',
  `unit_name` varchar(15) DEFAULT NULL COMMENT '单位全称',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_unit_cost
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_unit_cost`;
CREATE TABLE `bnd_master_unit_cost` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼                          ',
  `unit_cost` decimal(18,9) DEFAULT NULL COMMENT 'BASE UNIT COST',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138167 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_unit_measure_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_unit_measure_code`;
CREATE TABLE `bnd_master_unit_measure_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(3) DEFAULT NULL,
  `unit_code_nm` varchar(20) DEFAULT NULL,
  `unit_code_dbcs` varchar(20) DEFAULT NULL,
  `unit_code_alternative` varchar(3) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_master_use_code
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_use_code`;
CREATE TABLE `bnd_master_use_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `use_code` varchar(9) DEFAULT NULL COMMENT '用途代码',
  `use_code_name` varchar(30) DEFAULT NULL COMMENT '用途代码描述',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_master_vendor
-- ----------------------------
DROP TABLE IF EXISTS `bnd_master_vendor`;
CREATE TABLE `bnd_master_vendor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_no` varchar(10) DEFAULT NULL COMMENT '供应商代码',
  `vendor_name1_dbcs` varchar(160) DEFAULT NULL COMMENT '供应商中文名称',
  `vendor_name1` varchar(70) DEFAULT NULL COMMENT '供应商名称',
  `vendor_name_abbr_dbcs` varchar(60) DEFAULT NULL COMMENT '供应商中文简称',
  `vendor_name_abbr` varchar(25) DEFAULT NULL COMMENT '供应商简称',
  `address1_dbcs` varchar(250) DEFAULT NULL COMMENT '中文地址',
  `address1` varchar(145) DEFAULT NULL COMMENT '地址',
  `vmi_or_jit` varchar(3) DEFAULT NULL COMMENT 'SUVORJ',
  `custom_approved_no` varchar(10) DEFAULT NULL COMMENT '海关承认书号码',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `country_code` varchar(2) DEFAULT NULL COMMENT '国家',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`vendor_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2907 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_mig_list
-- ----------------------------
DROP TABLE IF EXISTS `bnd_mig_list`;
CREATE TABLE `bnd_mig_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `table_type` varchar(20) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `as_table_name` varchar(10) NOT NULL,
  `mig_function` varchar(50) DEFAULT NULL,
  `table_desc` varchar(100) DEFAULT NULL,
  `latest_mig_time` datetime DEFAULT NULL,
  `mig_no` int(5) DEFAULT NULL,
  `run_time` int(5) DEFAULT NULL,
  `table_pic` varchar(20) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_paytax_declare_deduct
-- ----------------------------
DROP TABLE IF EXISTS `bnd_paytax_declare_deduct`;
CREATE TABLE `bnd_paytax_declare_deduct` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部編號                          ',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '報關單號',
  `declare_qty` decimal(13,3) DEFAULT NULL COMMENT '報關單數量                            ',
  `declare_net` decimal(13,3) DEFAULT NULL COMMENT '净重',
  `declare_amt` decimal(13,2) DEFAULT NULL COMMENT '報關單金額                            ',
  `used_qty` decimal(13,5) DEFAULT NULL COMMENT '報關單已抵扣數量                      ',
  `used_net` decimal(15,5) DEFAULT NULL COMMENT '報關單已抵扣重量                      ',
  `used_amt` decimal(13,2) DEFAULT NULL COMMENT '報關單已抵扣金額                      ',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `declare_date` date DEFAULT NULL COMMENT '報關日期                              ',
  `country_code` varchar(3) DEFAULT NULL COMMENT '国家代码',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `item_no` (`item_no`,`internal_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14604 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_paytax_declare_detail
-- ----------------------------
DROP TABLE IF EXISTS `bnd_paytax_declare_detail`;
CREATE TABLE `bnd_paytax_declare_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `data_state` varchar(1) DEFAULT NULL COMMENT '清單狀態                              ',
  `yyyymm` varchar(6) DEFAULT NULL COMMENT '基準年月                              ',
  `paytax_type` varchar(2) DEFAULT NULL COMMENT '補稅形態                              ',
  `declaration_no_b` varchar(18) DEFAULT NULL COMMENT '報關單預號                            ',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '清單編號                              ',
  `list_no` varchar(10) DEFAULT NULL COMMENT '清單統一編號                          ',
  `apply_date` date DEFAULT NULL COMMENT '申報日期                              ',
  `paytax_date` date DEFAULT NULL COMMENT '補稅日期                              ',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '手冊/帳冊號碼                       ',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '成品TYPE                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '歸并項號                              ',
  `country_code` varchar(3) DEFAULT NULL COMMENT '原產國                                ',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '當前商編                              ',
  `tax_rate` decimal(6,3) DEFAULT NULL COMMENT '當前稅率                              ',
  `paytax_qty_total` decimal(15,5) DEFAULT NULL COMMENT '應補稅數量                            ',
  `used_qty` decimal(13,5) DEFAULT NULL COMMENT '補稅數量                              ',
  `used_amt` decimal(13,2) DEFAULT NULL COMMENT '補稅金額                              ',
  `used_wet` decimal(15,5) DEFAULT NULL COMMENT '補稅重量                              ',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '監管單位                              ',
  `purchase_price` double(13,5) DEFAULT NULL COMMENT '單價                                  ',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別                                  ',
  `paytax_declaration_no` varchar(18) DEFAULT NULL COMMENT '抵扣報關單號                          ',
  `paytax_qty` decimal(15,5) DEFAULT NULL COMMENT '抵扣數量                              ',
  `paytax_amt` decimal(13,2) DEFAULT NULL COMMENT '抵扣金額                              ',
  `paytax_wet` decimal(15,5) DEFAULT NULL COMMENT '抵扣重量                              ',
  `remark_1` varchar(30) DEFAULT NULL COMMENT '備註                                  ',
  `remark_2` varchar(50) DEFAULT NULL COMMENT '備註                                  ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1963 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_paytax_deduct_d
-- ----------------------------
DROP TABLE IF EXISTS `bnd_paytax_deduct_d`;
CREATE TABLE `bnd_paytax_deduct_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部編號                          ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `paytax_declaration_no` varchar(18) DEFAULT NULL COMMENT '抵扣報關單號                          ',
  `paytax_qty` decimal(15,5) DEFAULT NULL COMMENT '抵扣數量                              ',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '计量单位（盘点）',
  `paytax_amt` decimal(13,2) DEFAULT NULL COMMENT '抵扣金額                              ',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `paytax_wet` decimal(15,5) DEFAULT NULL COMMENT '抵扣重量                              ',
  `country_code` varchar(2) DEFAULT NULL COMMENT '国家代码',
  `remark_1` varchar(30) DEFAULT NULL COMMENT '備註                                  ',
  `remark_2` varchar(50) DEFAULT NULL COMMENT '備註                                  ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `ems_no` (`ems_no`,`internal_number`,`item_no`,`paytax_declaration_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_paytax_material_tran
-- ----------------------------
DROP TABLE IF EXISTS `bnd_paytax_material_tran`;
CREATE TABLE `bnd_paytax_material_tran` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'HTIDP',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '報關單號                          ',
  `internal_number` varchar(20) DEFAULT NULL COMMENT '企業內部編號                          ',
  `list_no` varchar(10) DEFAULT NULL COMMENT '統一編碼',
  `apply_date` date DEFAULT NULL COMMENT '申報日期                              ',
  `ems_no` varchar(64) DEFAULT NULL COMMENT '加工贸易账册编号',
  `不使用` varchar(12) DEFAULT NULL COMMENT '分冊號                                ',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分类代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商品编码',
  `tax_rate` decimal(6,3) DEFAULT NULL COMMENT '當前稅率                              ',
  `img_no` decimal(9,0) DEFAULT NULL COMMENT '归并项号',
  `used_qty` decimal(13,5) DEFAULT NULL COMMENT '報關單已抵扣數量                      ',
  `used_amt` decimal(13,2) DEFAULT NULL COMMENT '補稅金額                              ',
  `used_wet` decimal(15,5) DEFAULT NULL COMMENT '補稅重量                              ',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '计量单位（盘点）',
  `currency` varchar(3) DEFAULT NULL COMMENT '币别',
  `paytax_declaration_no1` varchar(18) DEFAULT NULL COMMENT '報關單號01                            ',
  `paytax_qty1` decimal(13,3) DEFAULT NULL COMMENT '抵扣數量01                            ',
  `paytax_declaration_no2` varchar(18) DEFAULT NULL COMMENT '報關單號02                            ',
  `paytax_qty2` decimal(13,3) DEFAULT NULL COMMENT '抵扣數量02                            ',
  `paytax_declaration_no3` varchar(18) DEFAULT NULL COMMENT '報關單號03                            ',
  `paytax_qty3` decimal(13,3) DEFAULT NULL COMMENT '抵扣數量03                            ',
  `paytax_declaration_no4` varchar(18) DEFAULT NULL COMMENT '報關單號04                            ',
  `paytax_qty4` decimal(13,3) DEFAULT NULL COMMENT '抵扣數量04                            ',
  `paytax_declaration_no5` varchar(18) DEFAULT NULL COMMENT '報關單號05                            ',
  `paytax_qty5` decimal(13,3) DEFAULT NULL COMMENT '抵扣數量05                            ',
  `country_code` varchar(2) DEFAULT NULL COMMENT '国家代码',
  `remark_1` varchar(30) DEFAULT NULL COMMENT '備註                                  ',
  `remark_2` varchar(50) DEFAULT NULL COMMENT '備註                                  ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_paytax_special_item
-- ----------------------------
DROP TABLE IF EXISTS `bnd_paytax_special_item`;
CREATE TABLE `bnd_paytax_special_item` (
  `ccc_code` varchar(20) NOT NULL COMMENT '商编，补税清单要单独分开',
  `item_code` varchar(20) NOT NULL COMMENT '品番，补税清单要单独分开',
  `type` varchar(20) DEFAULT NULL COMMENT 'T=热敏电阻器 C=cccd',
  PRIMARY KEY (`ccc_code`,`item_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bnd_stock_annual_inventory
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_annual_inventory`;
CREATE TABLE `bnd_stock_annual_inventory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'MRP代碼',
  `stock_type` varchar(1) DEFAULT NULL COMMENT '盤點型態',
  `storage_type` varchar(3) DEFAULT NULL COMMENT '存儲類別',
  `stock_location` varchar(6) DEFAULT NULL COMMENT '料架',
  `stock_location_detail` varchar(3) DEFAULT NULL COMMENT '存置地點明細',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼',
  `bond_flag` varchar(1) DEFAULT NULL COMMENT '保稅標誌',
  `lot_no` varchar(10) DEFAULT NULL COMMENT '批次',
  `seq_no` decimal(4,0) DEFAULT NULL COMMENT '工序',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作中心',
  `on_hand_qty` decimal(16,3) DEFAULT NULL COMMENT '在庫數量',
  `price` decimal(16,7) DEFAULT NULL COMMENT '價格',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在庫單位',
  `card_no` varchar(7) DEFAULT NULL COMMENT '盤點卡號',
  `summary_card_no` varchar(7) DEFAULT NULL COMMENT '盤存清冊號碼',
  `print_code` varchar(1) DEFAULT NULL COMMENT '列印次數代碼',
  `psa` varchar(3) DEFAULT NULL COMMENT 'P6BOWN',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`mrp_code`,`storage_type`,`stock_location`,`stock_location_detail`,`item_no`,`bond_flag`,`seq_no`,`lot_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77422 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_bond_flag
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_bond_flag`;
CREATE TABLE `bnd_stock_bond_flag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bond_flag` varchar(1) DEFAULT NULL COMMENT 'BALANCE BOND FLAG            ',
  `stock_bond_flag` varchar(1) DEFAULT NULL COMMENT 'STOCK TAKING BOND FLAG                  ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_convert_material
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_convert_material`;
CREATE TABLE `bnd_stock_convert_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `store_type` varchar(1) DEFAULT NULL COMMENT '盤點類型',
  `serial_no` decimal(9,0) DEFAULT NULL COMMENT '序號',
  `list_serial_no` decimal(9,0) DEFAULT NULL COMMENT '清冊序號',
  `img_no` varchar(10) DEFAULT NULL COMMENT '項號',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站別',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM',
  `item_description_dbcs` varchar(30) DEFAULT NULL COMMENT '品名(中文）',
  `item_spec` varchar(30) DEFAULT NULL COMMENT '規格',
  `dcl_qty` decimal(15,3) DEFAULT NULL COMMENT '申報數量',
  `dcl_unit` varchar(3) DEFAULT NULL COMMENT '申報單位',
  `stock_location_detail` varchar(9) DEFAULT NULL COMMENT '庫位',
  `ucns_verno` decimal(9,0) DEFAULT NULL COMMENT '版本',
  `material_work_center` varchar(9) DEFAULT NULL COMMENT '材料MTS站別',
  `material_img_no` decimal(5,0) DEFAULT NULL COMMENT '材料項號',
  `material_item_no` varchar(15) DEFAULT NULL COMMENT '材料ITEM',
  `material_description_dbcs` varchar(30) DEFAULT NULL COMMENT '材料品名',
  `manufacture_lot_no` varchar(10) DEFAULT NULL COMMENT '批次',
  `material_unit` varchar(3) DEFAULT NULL COMMENT '材料單位',
  `componentparent_itemc` decimal(18,9) DEFAULT NULL COMMENT '總耗',
  `loss_quantity` decimal(18,9) DEFAULT NULL COMMENT '損耗',
  `product_loss_quantity` decimal(18,9) DEFAULT NULL COMMENT '凈耗',
  `dec_cm` decimal(18,9) DEFAULT NULL COMMENT 'DEC-CM',
  `dec_dm` decimal(18,9) DEFAULT NULL COMMENT 'DEC-DM',
  `dec_dd` decimal(18,9) DEFAULT NULL COMMENT '損耗值',
  `convert_qty` decimal(18,5) DEFAULT NULL COMMENT '折料數量',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_list
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_list`;
CREATE TABLE `bnd_stock_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `store_type` varchar(1) DEFAULT NULL COMMENT '盤點類型',
  `list_serial_no` decimal(9,0) DEFAULT NULL COMMENT '清冊序號',
  `img_no` varchar(10) DEFAULT NULL COMMENT '項號',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT '工作站別',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM',
  `item_description_dbcs` varchar(30) DEFAULT NULL COMMENT '品名(中文）',
  `item_spec` varchar(30) DEFAULT NULL COMMENT '規格',
  `dcl_qty` decimal(15,3) DEFAULT NULL COMMENT '申報數量',
  `dcl_unit` varchar(3) DEFAULT NULL COMMENT '申報單位',
  `stock_location_detail` varchar(9) DEFAULT NULL COMMENT '庫位',
  `sorting_key6` varchar(5) DEFAULT NULL COMMENT '分類代碼6',
  `dcl_amt` decimal(15,2) DEFAULT NULL COMMENT '申報總金額',
  `on_hand_qty` decimal(15,3) DEFAULT NULL COMMENT '在庫數量',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在庫單位',
  `cf_physical_inventory` decimal(18,9) DEFAULT NULL COMMENT '監管單位換算係數',
  `price` decimal(16,5) DEFAULT NULL COMMENT '單價',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_location_floor
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_location_floor`;
CREATE TABLE `bnd_stock_location_floor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_location` varchar(6) DEFAULT NULL COMMENT '存置地點',
  `stock_floor` varchar(6) DEFAULT NULL COMMENT '樓層',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`stock_location`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_psa_upload
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_psa_upload`;
CREATE TABLE `bnd_stock_psa_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `storage_type` varchar(3) DEFAULT NULL COMMENT 'STORAGE TYPE',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'MATERIAL',
  `batch_no` varchar(10) DEFAULT NULL COMMENT 'BATCH',
  `quantity` decimal(16,3) DEFAULT NULL COMMENT 'QUANTITY',
  `unit_code` varchar(3) DEFAULT NULL COMMENT 'UNIT',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT 'BOND',
  `custom_bin` varchar(9) DEFAULT NULL COMMENT 'CUSTOM BIN',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`storage_type`,`item_no`,`batch_no`,`bonded_logo`,`custom_bin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_storage_bin
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_storage_bin`;
CREATE TABLE `bnd_stock_storage_bin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_location` varchar(10) DEFAULT NULL,
  `new_storage_bin` varchar(16) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`stock_location`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1898 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_wip_psa
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_wip_psa`;
CREATE TABLE `bnd_stock_wip_psa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'MRP',
  `storage_type` varchar(3) DEFAULT NULL COMMENT 'STORAGE TYPE',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM NO.',
  `seq_no` decimal(4,0) DEFAULT NULL COMMENT 'SEQUENCE NO.',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT 'WORK CENTER',
  `lot_no` varchar(10) DEFAULT NULL COMMENT 'BATCH',
  `bond_flag` varchar(1) DEFAULT NULL COMMENT 'BALANCE BOND FLAG',
  `on_hand_qty` decimal(16,3) DEFAULT NULL COMMENT 'ON HAND QTY',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT 'U/M (INCOMING & OUTGOING)',
  `price` decimal(16,7) DEFAULT NULL COMMENT 'PRICE',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`mrp_code`,`storage_type`,`item_no`,`seq_no`,`lot_no`,`bond_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20214 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_stock_wip_upload
-- ----------------------------
DROP TABLE IF EXISTS `bnd_stock_wip_upload`;
CREATE TABLE `bnd_stock_wip_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'MRP',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'PSA',
  `item_no` varchar(15) DEFAULT NULL COMMENT 'ITEM NO.',
  `lot_no` varchar(10) DEFAULT NULL COMMENT 'BATCHL',
  `seq_no` decimal(4,0) DEFAULT NULL COMMENT 'SEQUENCE NO.',
  `equipment_name` varchar(9) DEFAULT NULL COMMENT 'WORK CENTER',
  `on_hand_qty` decimal(16,3) DEFAULT NULL COMMENT 'ON HAND QTY',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT 'U/M (INCOMING & OUTGOING)',
  `custom_bin` varchar(9) DEFAULT NULL COMMENT 'CUSTOM BIN',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `index_name` (`psa_code`,`item_no`,`seq_no`,`custom_bin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_subcon_apply_no
-- ----------------------------
DROP TABLE IF EXISTS `bnd_subcon_apply_no`;
CREATE TABLE `bnd_subcon_apply_no` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(14) DEFAULT NULL COMMENT 'WF NO                                   ',
  `apply_no` varchar(14) DEFAULT NULL COMMENT '申請表編號                            ',
  `no_type` varchar(1) DEFAULT NULL COMMENT '流水號類型                            ',
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼                        ',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'PSA                                     ',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '供應商代碼                            ',
  `no_control` varchar(12) DEFAULT NULL COMMENT '號碼類型                              ',
  `current_no` int(2) DEFAULT NULL COMMENT '序列號                                ',
  `vendor_name_abbr_dbcs` varchar(20) DEFAULT NULL COMMENT '供應商名稱                         ',
  `apply_date` date DEFAULT NULL COMMENT '申請日期                              ',
  `date_from` date DEFAULT NULL COMMENT '開始日期                              ',
  `date_to` date DEFAULT NULL COMMENT '結束日期                              ',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外程度                              ',
  `flag` varchar(1) DEFAULT NULL COMMENT '備案標誌                              ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wf_no` (`operation_no`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_subcon_item_no
-- ----------------------------
DROP TABLE IF EXISTS `bnd_subcon_item_no`;
CREATE TABLE `bnd_subcon_item_no` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(14) DEFAULT NULL COMMENT '委外流水号                                ',
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼                        ',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'Y1WPSA                                  ',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '供應商代碼                            ',
  `vendor_name_abbr_dbcs` varchar(20) DEFAULT NULL COMMENT '供應商名稱                            ',
  `apply_date` date DEFAULT NULL COMMENT '申請日期                              ',
  `date_from` date DEFAULT NULL COMMENT '開始日期                              ',
  `date_to` date DEFAULT NULL COMMENT '結束日期                              ',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外程度                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名ITEM                              ',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商編                                  ',
  `img_no` decimal(19,0) DEFAULT NULL COMMENT '項號                                  ',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分類代碼                          ',
  `item_description_dbcs` varchar(30) DEFAULT NULL COMMENT '中文品名                              ',
  `operation_sequence_no1` decimal(4,0) DEFAULT NULL COMMENT '起始工序                              ',
  `operation_sequence_no2` decimal(4,0) DEFAULT NULL COMMENT '結束工序                              ',
  `operation_quantity` decimal(13,2) DEFAULT NULL COMMENT '委外數量                              ',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在庫單位                              ',
  `physical_quantity` decimal(14,2) DEFAULT NULL COMMENT '監管數量                              ',
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '監管單位                              ',
  `itemized_application_code` varchar(1) DEFAULT NULL COMMENT '品名應用代碼                          ',
  `standard_cost` decimal(13,6) DEFAULT NULL COMMENT '標準成本                              ',
  `operation_amount` decimal(16,5) DEFAULT NULL COMMENT '委外金額                              ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `operation_no` (`operation_no`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_subcon_material_no
-- ----------------------------
DROP TABLE IF EXISTS `bnd_subcon_material_no`;
CREATE TABLE `bnd_subcon_material_no` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(14) DEFAULT NULL COMMENT '委外流水号                                       ',
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基準代',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'PSA',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '供應商代碼',
  `operation_type` varchar(1) DEFAULT NULL,
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代碼',
  `operation_quantity` decimal(13,2) DEFAULT NULL COMMENT '委外數量',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '作業順序號碼',
  `material_no` varchar(15) DEFAULT NULL COMMENT '材料品名 1',
  `standard_cost` decimal(13,6) DEFAULT NULL,
  `material_quantity` decimal(13,2) DEFAULT NULL COMMENT '材料用量',
  `material_type` varchar(1) DEFAULT NULL COMMENT '材料類型',
  `apply_date` date DEFAULT NULL COMMENT '申請日期',
  `date_from` date DEFAULT NULL COMMENT '開始日期',
  `date_to` date DEFAULT NULL COMMENT '結束日期',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `operation_no` (`operation_no`,`item_no`,`operation_sequence_no`,`material_no`,`material_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2247 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_subcon_material_replace
-- ----------------------------
DROP TABLE IF EXISTS `bnd_subcon_material_replace`;
CREATE TABLE `bnd_subcon_material_replace` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(14) DEFAULT NULL COMMENT '委外流水号                               ',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '協力廠代碼                            ',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'PSA',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外類型                              ',
  `item_no` varchar(15) DEFAULT NULL COMMENT '製品品名                              ',
  `material_no` varchar(15) DEFAULT NULL COMMENT '材料品名                              ',
  `material_replace` varchar(15) DEFAULT NULL COMMENT '替代料品名                            ',
  `standard_cost` decimal(13,6) DEFAULT NULL COMMENT '單價                                  ',
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在庫單位                              ',
  `item_description_dbcs` varchar(30) DEFAULT NULL COMMENT '中文品名                              ',
  `apply_date` date DEFAULT NULL COMMENT '申請日期                              ',
  `date_from` date DEFAULT NULL COMMENT '申請開始日期                          ',
  `date_to` date DEFAULT NULL COMMENT '申請結束日期                          ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `operation_no` (`operation_no`,`item_no`,`material_no`,`material_replace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bnd_subcon_material_sum
-- ----------------------------
DROP TABLE IF EXISTS `bnd_subcon_material_sum`;
CREATE TABLE `bnd_subcon_material_sum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(14) DEFAULT NULL COMMENT '製品流水號                            ',
  `operation_no1` varchar(14) DEFAULT NULL COMMENT '材料流水號                            ',
  `vendor_code` varchar(7) DEFAULT NULL COMMENT '協力廠代碼                            ',
  `psa_code` varchar(3) DEFAULT NULL COMMENT 'Y3WPSA                                  ',
  `operation_type` varchar(1) DEFAULT NULL COMMENT '委外類型                              ',
  `mrp_code` varchar(1) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼                        ',
  `material_no` varchar(15) DEFAULT NULL COMMENT '品名代碼                              ',
  `ccc_code` varchar(10) DEFAULT NULL COMMENT '商編                                  ',
  `material_type` varchar(1) DEFAULT NULL COMMENT '外撥材料類型                          ',
  `operation_sequence_no` decimal(4,0) DEFAULT NULL COMMENT '仕掛站別                              ',
  `img_no` decimal(19,0) DEFAULT NULL COMMENT '項號                                  ',
  `item_class_code` varchar(5) DEFAULT NULL COMMENT '品名分類代碼                          ',
  `item_description_dbcs` varchar(30) DEFAULT NULL COMMENT '中文品名                              ',
  `material_quantity` decimal(13,2) DEFAULT NULL COMMENT '委外數量                              ',
  `material_quantity_after` decimal(13,2) DEFAULT NULL,
  `um_incoming_outgoing` varchar(3) DEFAULT NULL COMMENT '在庫單位                              ',
  `physical_quantity` decimal(14,2) DEFAULT NULL COMMENT '監管數量                              ',
  `physical_quantity_after` decimal(14,2) DEFAULT NULL,
  `um_physical_inventory` varchar(3) DEFAULT NULL COMMENT '監管單位                              ',
  `itemized_application_code` varchar(1) DEFAULT NULL COMMENT '品名應用代碼                          ',
  `standard_cost` decimal(13,6) DEFAULT NULL COMMENT '單價                                  ',
  `operation_amount` decimal(16,5) DEFAULT NULL COMMENT '申請金額                              ',
  `apply_date` date DEFAULT NULL COMMENT '申請日期                              ',
  `date_from` date DEFAULT NULL COMMENT '開始日期                              ',
  `date_to` date DEFAULT NULL COMMENT '結束日期                              ',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  KEY `operation_no` (`operation_no`,`material_no`,`operation_sequence_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1617 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for com_common
-- ----------------------------
DROP TABLE IF EXISTS `com_common`;
CREATE TABLE `com_common` (
  `key1` varchar(20) NOT NULL,
  `key2` varchar(20) DEFAULT NULL,
  `char1` varchar(20) NOT NULL,
  `int1` int(6) DEFAULT NULL,
  PRIMARY KEY (`key1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_company
-- ----------------------------
DROP TABLE IF EXISTS `com_company`;
CREATE TABLE `com_company` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(10) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `remark` varchar(10) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_department
-- ----------------------------
DROP TABLE IF EXISTS `com_department`;
CREATE TABLE `com_department` (
  `code` varchar(2) NOT NULL,
  `mrp_controller` varchar(3) DEFAULT NULL,
  `mrpcode` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_employee
-- ----------------------------
DROP TABLE IF EXISTS `com_employee`;
CREATE TABLE `com_employee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mmemno` varchar(7) DEFAULT NULL COMMENT '員工編號',
  `mmdnam` varchar(12) DEFAULT NULL COMMENT '中文姓名',
  `mmdnas` varchar(12) DEFAULT NULL COMMENT '中文姓名簡體',
  `mmdept` varchar(8) DEFAULT NULL COMMENT '單位代碼',
  `mmcoop` varchar(2) DEFAULT NULL COMMENT '部門',
  `mmdvcd` varchar(1) DEFAULT NULL COMMENT '組織事業部',
  `mmhire` date DEFAULT NULL COMMENT '入社日',
  `mmrsgn` date DEFAULT NULL COMMENT '辭職日',
  `mmwork` varchar(12) DEFAULT NULL COMMENT '就業證',
  `mmpos5` varchar(2) DEFAULT NULL COMMENT '職位代碼',
  `mmp5nm` varchar(16) DEFAULT NULL COMMENT '職位名稱',
  `mmp5ns` varchar(16) DEFAULT NULL COMMENT '職位名稱簡體',
  `mmpos4` varchar(3) DEFAULT NULL COMMENT '職稱代碼',
  `mmp4nm` varchar(16) DEFAULT NULL COMMENT '職稱名稱',
  `mmp4ns` varchar(16) DEFAULT NULL COMMENT '職位名稱簡體',
  `mmpos3` varchar(4) DEFAULT NULL COMMENT '職種代碼',
  `mmp3nm` varchar(20) DEFAULT NULL COMMENT '職種名稱',
  `mmp3ns` varchar(20) DEFAULT NULL COMMENT '職種名稱簡體',
  `mmstat` varchar(1) DEFAULT NULL COMMENT '處理狀態',
  `mmupdt` varchar(14) DEFAULT NULL COMMENT '更新時間',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mmemno` (`mmemno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60754 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for com_password_rule
-- ----------------------------
DROP TABLE IF EXISTS `com_password_rule`;
CREATE TABLE `com_password_rule` (
  `days` int(3) DEFAULT NULL,
  `len_min` int(3) DEFAULT NULL,
  `len_max` int(3) DEFAULT NULL,
  `allow_letters` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_permission
-- ----------------------------
DROP TABLE IF EXISTS `com_permission`;
CREATE TABLE `com_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_level` int(3) DEFAULT NULL COMMENT '几级菜单',
  `root_menu` varchar(4) DEFAULT NULL,
  `father_menu` varchar(10) DEFAULT NULL,
  `permission_code` varchar(10) DEFAULT NULL,
  `permission_name` varchar(30) DEFAULT NULL,
  `permission_name_en` varchar(30) DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `sort_num` int(3) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_role
-- ----------------------------
DROP TABLE IF EXISTS `com_role`;
CREATE TABLE `com_role` (
  `roleid` varchar(20) NOT NULL COMMENT '角色代码',
  `role_desc` varchar(20) NOT NULL COMMENT '角色说明',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`roleid`,`role_desc`),
  UNIQUE KEY `roleid` (`roleid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `com_role_permission`;
CREATE TABLE `com_role_permission` (
  `roleid` varchar(20) NOT NULL,
  `permissionid` int(10) NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`roleid`,`permissionid`),
  KEY `permissionid` (`permissionid`) USING BTREE,
  CONSTRAINT `com_role_permission_ibfk_1` FOREIGN KEY (`permissionid`) REFERENCES `com_permission` (`id`),
  CONSTRAINT `com_role_permission_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `com_role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_sendmail_d
-- ----------------------------
DROP TABLE IF EXISTS `com_sendmail_d`;
CREATE TABLE `com_sendmail_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mail_type` varchar(20) DEFAULT NULL,
  `mail_subtype` varchar(20) DEFAULT NULL,
  `mail_address` varchar(30) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_sendmail_h
-- ----------------------------
DROP TABLE IF EXISTS `com_sendmail_h`;
CREATE TABLE `com_sendmail_h` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mail_type` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL COMMENT 'Y开启 N关闭',
  `from_mail_address` varchar(20) DEFAULT NULL COMMENT '发件人',
  `mail_subject` varchar(50) DEFAULT NULL COMMENT '主题',
  `mail_content` varchar(100) NOT NULL COMMENT '内容',
  `filePath` varchar(255) DEFAULT NULL COMMENT '附件',
  `PIC` varchar(20) DEFAULT NULL COMMENT 'IT负责人',
  `remark` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_serialnum
-- ----------------------------
DROP TABLE IF EXISTS `com_serialnum`;
CREATE TABLE `com_serialnum` (
  `type` varchar(10) NOT NULL,
  `key01` varchar(10) NOT NULL,
  `key02` varchar(10) NOT NULL DEFAULT '',
  `prefix_letter` varchar(3) DEFAULT NULL,
  `prefix_yy` varchar(6) DEFAULT NULL,
  `serialnum` int(11) NOT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type`,`key01`,`key02`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_user
-- ----------------------------
DROP TABLE IF EXISTS `com_user`;
CREATE TABLE `com_user` (
  `userid` varchar(10) NOT NULL COMMENT '=插入时等于username',
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `name_cn` varchar(20) DEFAULT NULL,
  `employee_id` varchar(7) DEFAULT NULL,
  `department` varchar(10) DEFAULT NULL,
  `mrpcode` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `pwd_change_time` datetime DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `user_login_time` datetime DEFAULT NULL,
  `permissionid` int(10) DEFAULT NULL,
  `home_page` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `com_user_favorite`;
CREATE TABLE `com_user_favorite` (
  `id` int(7) NOT NULL,
  `username` varchar(10) DEFAULT NULL,
  `permissionid` int(7) DEFAULT NULL,
  `permission_name` varchar(30) DEFAULT NULL,
  `self_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for com_user_role
-- ----------------------------
DROP TABLE IF EXISTS `com_user_role`;
CREATE TABLE `com_user_role` (
  `userid` varchar(10) NOT NULL DEFAULT '',
  `roleid` varchar(20) NOT NULL DEFAULT '',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `roleId` (`roleid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for epm_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `epm_daily_report`;
CREATE TABLE `epm_daily_report` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(7) DEFAULT NULL COMMENT '工号',
  `credate` date DEFAULT NULL,
  `department` varchar(10) DEFAULT NULL,
  `employee_no_s` varchar(255) DEFAULT NULL,
  `employee_name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `date` date DEFAULT NULL COMMENT '日期',
  `class_type` varchar(1) DEFAULT NULL COMMENT '班别',
  `dept_code` varchar(8) DEFAULT NULL COMMENT '股别',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `item_spec` varchar(30) DEFAULT NULL,
  `processing_code` varchar(9) DEFAULT NULL COMMENT '工程代码',
  `processing_name` varchar(30) DEFAULT NULL,
  `input_quantity` decimal(11,1) DEFAULT NULL COMMENT '投入数量',
  `input_minutes` decimal(4,0) DEFAULT NULL COMMENT '当日投入分钟',
  `efficiency` decimal(6,5) DEFAULT NULL,
  `efficiency_t` decimal(6,5) DEFAULT NULL,
  `st_value` decimal(6,4) DEFAULT NULL,
  `performance_code` varchar(3) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `score` decimal(3,0) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`employee_no`,`date`,`class_type`,`item_no`,`processing_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115049 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_dept_score
-- ----------------------------
DROP TABLE IF EXISTS `epm_dept_score`;
CREATE TABLE `epm_dept_score` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department` varchar(10) DEFAULT NULL COMMENT '部门',
  `dept_code` varchar(10) DEFAULT NULL,
  `score_b` int(3) DEFAULT NULL,
  `score_c` int(3) DEFAULT NULL,
  `score_d` int(3) DEFAULT NULL,
  `group_dept_code` varchar(10) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_employee_performance
-- ----------------------------
DROP TABLE IF EXISTS `epm_employee_performance`;
CREATE TABLE `epm_employee_performance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department` varchar(10) DEFAULT NULL,
  `employee_no` int(7) DEFAULT NULL COMMENT '工号',
  `employee_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `date` date DEFAULT NULL COMMENT '日期',
  `class_type` varchar(1) NOT NULL COMMENT '班别',
  `dept_code` varchar(8) DEFAULT NULL COMMENT '股别',
  `processing_code` varchar(9) DEFAULT NULL COMMENT '工程代码',
  `performance_code` varchar(3) DEFAULT NULL COMMENT '考核代码',
  `item` varchar(100) DEFAULT NULL COMMENT '项目',
  `score` decimal(3,0) DEFAULT NULL COMMENT '得分',
  `mark` varchar(100) DEFAULT NULL COMMENT '备注',
  `number` int(3) unsigned DEFAULT '1' COMMENT '件数',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`employee_no`,`date`,`class_type`,`processing_code`,`performance_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1131 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_employee_production
-- ----------------------------
DROP TABLE IF EXISTS `epm_employee_production`;
CREATE TABLE `epm_employee_production` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(7) DEFAULT NULL COMMENT '工号',
  `employee_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `department` varchar(10) DEFAULT NULL COMMENT '部门',
  `date` date DEFAULT NULL COMMENT '日期',
  `class_type` varchar(1) DEFAULT NULL COMMENT '班别',
  `dept_code` varchar(8) DEFAULT NULL COMMENT '股别',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `processing_code` varchar(9) DEFAULT NULL COMMENT '工程代码',
  `input_quantity` decimal(11,1) DEFAULT NULL COMMENT '投入数量',
  `input_minutes` decimal(4,0) DEFAULT NULL COMMENT '当日投入分钟',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`employee_no`,`date`,`class_type`,`item_no`,`processing_code`,`department`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52532 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_monthly_report
-- ----------------------------
DROP TABLE IF EXISTS `epm_monthly_report`;
CREATE TABLE `epm_monthly_report` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_month` varchar(6) DEFAULT NULL COMMENT '年月',
  `date_from` date DEFAULT NULL COMMENT '起始日期',
  `date_to` date DEFAULT NULL COMMENT '截止日期',
  `department` varchar(10) DEFAULT NULL,
  `dept_code` varchar(8) DEFAULT NULL COMMENT '股别',
  `employee_no` int(7) DEFAULT NULL COMMENT '工号',
  `employee_name` varchar(12) DEFAULT NULL COMMENT '姓名',
  `efficiency` decimal(6,5) DEFAULT NULL COMMENT '效率',
  `eff_score` decimal(7,3) DEFAULT NULL COMMENT '效率得分',
  `b_score` int(3) DEFAULT NULL COMMENT '品质得分',
  `c_score` int(3) DEFAULT NULL COMMENT '勤务得分',
  `d_score` int(3) DEFAULT NULL COMMENT '奖励分',
  `sum_score` decimal(7,3) DEFAULT NULL COMMENT '汇总',
  `ranking` int(4) DEFAULT NULL COMMENT '排名',
  `flag` varchar(1) DEFAULT NULL COMMENT '判断标志：判断是否取消考核',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `month` (`create_month`,`employee_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5785 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_performance_benchmark
-- ----------------------------
DROP TABLE IF EXISTS `epm_performance_benchmark`;
CREATE TABLE `epm_performance_benchmark` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department` varchar(10) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL COMMENT '类型',
  `performance_code` varchar(3) DEFAULT NULL COMMENT '代码',
  `item` varchar(100) DEFAULT NULL COMMENT '项目',
  `score` decimal(3,0) DEFAULT NULL COMMENT '得分',
  `mark` varchar(20) DEFAULT NULL COMMENT '备注',
  `efficiency_min` decimal(3,2) DEFAULT NULL COMMENT '最低效率',
  `efficiency_max` decimal(3,2) DEFAULT NULL COMMENT '最高效率',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`type`,`performance_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_processing_code
-- ----------------------------
DROP TABLE IF EXISTS `epm_processing_code`;
CREATE TABLE `epm_processing_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department` varchar(10) DEFAULT NULL COMMENT '部门代码',
  `processing_code` varchar(9) DEFAULT NULL COMMENT '工程代码',
  `processing_name` varchar(30) DEFAULT NULL COMMENT '工程名称',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`department`,`processing_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_processing_item
-- ----------------------------
DROP TABLE IF EXISTS `epm_processing_item`;
CREATE TABLE `epm_processing_item` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `department` varchar(10) DEFAULT NULL COMMENT '部门代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `item_spec` varchar(30) DEFAULT NULL COMMENT '品名名称',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for epm_st_count
-- ----------------------------
DROP TABLE IF EXISTS `epm_st_count`;
CREATE TABLE `epm_st_count` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `department` varchar(10) DEFAULT NULL COMMENT '部门代码',
  `item_no` varchar(15) DEFAULT NULL COMMENT '品名代码',
  `processing_code` varchar(9) DEFAULT NULL COMMENT '工程代码',
  `st_value` decimal(6,4) DEFAULT NULL COMMENT 'ST 值',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`item_no`,`processing_code`,`department`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for foc_dn_fee
-- ----------------------------
DROP TABLE IF EXISTS `foc_dn_fee`;
CREATE TABLE `foc_dn_fee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `freight_com_code` varchar(2) DEFAULT NULL,
  `freight_com_name` varchar(60) DEFAULT NULL,
  `address_cn` varchar(50) DEFAULT NULL,
  `address_en` varchar(50) DEFAULT NULL,
  `weight` decimal(3,0) DEFAULT NULL,
  `weight0` decimal(3,1) DEFAULT NULL,
  `price0` decimal(13,5) DEFAULT NULL,
  `weight1` decimal(5,1) DEFAULT NULL,
  `price1` decimal(13,5) DEFAULT NULL,
  `per_weight1` decimal(5,1) DEFAULT NULL,
  `weight2` decimal(5,1) DEFAULT NULL,
  `price2` decimal(13,5) DEFAULT NULL,
  `per_weight2` decimal(5,1) DEFAULT NULL,
  `weight3` decimal(5,1) DEFAULT NULL,
  `price3` decimal(13,5) DEFAULT NULL,
  `per_weight3` decimal(5,1) DEFAULT NULL,
  `weight4` decimal(5,1) DEFAULT NULL,
  `price4` decimal(13,5) DEFAULT NULL,
  `per_weight4` decimal(5,1) DEFAULT NULL,
  `weight5` decimal(5,1) DEFAULT NULL,
  `price5` decimal(13,5) DEFAULT NULL,
  `per_weight5` decimal(5,1) DEFAULT NULL,
  `weight6` decimal(5,1) DEFAULT NULL,
  `price6` decimal(13,5) DEFAULT NULL,
  `per_weight6` decimal(5,1) DEFAULT NULL,
  `weight7` decimal(5,1) DEFAULT NULL,
  `price7` decimal(13,5) DEFAULT NULL,
  `per_weight7` decimal(5,1) DEFAULT NULL,
  `weight8` decimal(5,1) DEFAULT NULL,
  `price8` decimal(13,5) DEFAULT NULL,
  `per_weight8` decimal(5,1) DEFAULT NULL,
  `alternate_field` varchar(30) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `freight_com_code` (`freight_com_code`,`address_en`,`address_cn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for foc_express_d
-- ----------------------------
DROP TABLE IF EXISTS `foc_express_d`;
CREATE TABLE `foc_express_d` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `express_no` varchar(7) NOT NULL COMMENT '快遞單號碼',
  `express_id` int(5) NOT NULL COMMENT '快遞号序號',
  `sample_invoice` varchar(10) DEFAULT NULL COMMENT '送樣發票',
  `item_no` varchar(15) DEFAULT NULL,
  `material_descriable` varchar(30) DEFAULT NULL COMMENT '品名描述',
  `material_specif` varchar(30) DEFAULT NULL COMMENT '品名規格',
  `material_e_descriable` varchar(30) DEFAULT NULL COMMENT '品名英文描述',
  `unit` varchar(3) DEFAULT NULL COMMENT '單位',
  `sips_no` varchar(10) DEFAULT NULL COMMENT 'SIPS NO',
  `price_type` varchar(30) DEFAULT NULL COMMENT '價格分類',
  `confirm_no` varchar(10) DEFAULT NULL COMMENT '承認者工號',
  `confirm_id` varchar(10) DEFAULT NULL COMMENT '承認這 ID',
  `confirm_name` varchar(12) DEFAULT NULL COMMENT '承認這姓名',
  `price_modi_conf` varchar(1) DEFAULT NULL COMMENT '價格修改承認標誌',
  `qty` float(11,1) DEFAULT NULL COMMENT '送樣數量',
  `price` decimal(13,5) DEFAULT NULL COMMENT '單價',
  `amount` decimal(13,2) DEFAULT NULL COMMENT '金额',
  `price_lower` decimal(13,5) DEFAULT NULL COMMENT '價格下限',
  `price_upper` decimal(13,5) DEFAULT NULL COMMENT '價格上限',
  `net_weigh` decimal(12,3) DEFAULT NULL COMMENT '净重',
  `gross_weight` decimal(9,3) DEFAULT NULL COMMENT '毛重',
  `box_from` int(3) DEFAULT NULL COMMENT '箱號 FROM',
  `box_to` int(3) DEFAULT NULL COMMENT '箱號 TO',
  `confirm_time` datetime DEFAULT NULL COMMENT '承認时间',
  `login_time` datetime DEFAULT NULL COMMENT '登陸时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新操作員代碼',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程式名稱',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `express_no` (`express_no`,`express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104537 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for foc_express_h
-- ----------------------------
DROP TABLE IF EXISTS `foc_express_h`;
CREATE TABLE `foc_express_h` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `express_no` varchar(7) NOT NULL COMMENT '快递单号码',
  `sample_invoice` varchar(10) NOT NULL COMMENT '送样发票',
  `customer_name1` varchar(60) DEFAULT NULL COMMENT '客户名称1',
  `customer_name2` varchar(30) DEFAULT NULL COMMENT '客户名称2',
  `ship_address1` varchar(180) DEFAULT NULL COMMENT '送达地址 1',
  `ship_address2` varchar(60) DEFAULT NULL COMMENT '送达地址 2',
  `ship_address3` varchar(60) DEFAULT NULL COMMENT '送达地址 3',
  `zip_code` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `customer_phone` varchar(24) DEFAULT NULL COMMENT '客户电话',
  `recipient` varchar(30) DEFAULT NULL COMMENT '接受人',
  `country` varchar(20) DEFAULT NULL COMMENT '国家地区',
  `harrive_day` date DEFAULT NULL COMMENT '希望抵达日',
  `name_operator` varchar(20) DEFAULT NULL COMMENT '经办人姓名',
  `dept` varchar(1) DEFAULT NULL COMMENT '部门',
  `packing_volume` varchar(10) DEFAULT NULL COMMENT '包装体积',
  `number` int(3) DEFAULT NULL COMMENT '件数',
  `currency` varchar(3) DEFAULT NULL COMMENT '币別',
  `shipping_signs` varchar(1) DEFAULT NULL COMMENT '出货标志',
  `note` varchar(40) DEFAULT NULL COMMENT '备注',
  `salesman_code` varchar(5) DEFAULT NULL COMMENT '营业员代码',
  `alternate_field` varchar(30) DEFAULT NULL COMMENT '备用栏位',
  `handled_manual_id` varchar(10) DEFAULT NULL COMMENT '经办人工号',
  `handled_manual_name` varchar(20) DEFAULT NULL,
  `major_sip_no` varchar(10) DEFAULT NULL COMMENT '主要',
  `scheduled_ship_date` date DEFAULT NULL COMMENT '计划出货日期',
  `freight_com_code` varchar(2) DEFAULT '' COMMENT '貨運公司代碼',
  `release_slip` varchar(10) DEFAULT NULL COMMENT '出场放行单',
  `express_status` varchar(2) DEFAULT NULL COMMENT '该快递单的状态',
  `document_last_time` datetime DEFAULT NULL,
  `free_logo` varchar(1) DEFAULT NULL COMMENT '无偿标志',
  `reason_code` varchar(40) DEFAULT NULL COMMENT '原因代码',
  `pack_material` varchar(20) DEFAULT NULL COMMENT '包装材质',
  `real_express` varchar(15) DEFAULT NULL COMMENT '实际快递单号',
  `express_company` varchar(30) DEFAULT NULL COMMENT '快递公司',
  `bonded_logo` varchar(1) DEFAULT NULL COMMENT '保税标志',
  `overseas` varchar(1) DEFAULT NULL COMMENT '海外',
  `premium` varchar(15) DEFAULT NULL COMMENT '保費',
  `ship_cost` double(13,2) DEFAULT NULL COMMENT '运费',
  `rate` double(9,5) DEFAULT NULL COMMENT '汇率',
  `terms_trade` varchar(3) DEFAULT NULL COMMENT '贸易条件',
  `origin_country` varchar(20) DEFAULT NULL COMMENT '原产国',
  `trading_country` varchar(20) DEFAULT NULL COMMENT '贸易国',
  `print_sign` varchar(5) DEFAULT 'N',
  `print_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL COMMENT '登陸时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新操作員代碼',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程式名稱',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `express_no` (`express_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41436 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for foc_general_trade
-- ----------------------------
DROP TABLE IF EXISTS `foc_general_trade`;
CREATE TABLE `foc_general_trade` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `declare_date` date DEFAULT NULL COMMENT '报关日期',
  `declaration_no` varchar(18) DEFAULT NULL COMMENT '报关单号',
  `declare_port` varchar(4) DEFAULT NULL COMMENT '申报口岸',
  `list_no` varchar(18) DEFAULT NULL COMMENT '统一编码',
  `invoice_no` varchar(10) DEFAULT NULL COMMENT '发票号码',
  `terms_trade` varchar(4) DEFAULT NULL COMMENT '贸易方式',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10570 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for foc_price
-- ----------------------------
DROP TABLE IF EXISTS `foc_price`;
CREATE TABLE `foc_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mrpcode` varchar(10) DEFAULT '' COMMENT 'MRP 代碼',
  `type` varchar(60) DEFAULT NULL COMMENT '分類',
  `effective_date` date DEFAULT NULL COMMENT '生效日',
  `expiration_date` date DEFAULT NULL COMMENT '失效日',
  `products_type` varchar(60) DEFAULT NULL COMMENT '製品類別',
  `price_1_lower` decimal(13,5) DEFAULT NULL COMMENT '價格 1 下限',
  `price_1_upper` decimal(13,5) DEFAULT NULL COMMENT '價格 1 上限',
  `currency` varchar(3) DEFAULT NULL COMMENT '幣別',
  `unit` varchar(3) DEFAULT NULL COMMENT '單位',
  `item_descrip` varchar(30) DEFAULT NULL COMMENT '品名描述',
  `item_descrip_en` varchar(30) DEFAULT NULL COMMENT '品名英文描述',
  `expiration_flag` varchar(1) DEFAULT NULL COMMENT '失效標誌',
  `login_time` datetime DEFAULT NULL COMMENT '登陸时间',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新操作員代碼',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程式名稱',
  PRIMARY KEY (`id`),
  KEY `mrpcode` (`mrpcode`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2448 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for foc_release
-- ----------------------------
DROP TABLE IF EXISTS `foc_release`;
CREATE TABLE `foc_release` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `LHDCNO` varchar(10) DEFAULT NULL,
  `LHCUN1` varchar(100) DEFAULT NULL,
  `LHCUN2` varchar(50) DEFAULT NULL,
  `LHADR1` varchar(180) DEFAULT NULL,
  `LHADR2` varchar(50) DEFAULT NULL,
  `LHADR3` varchar(50) DEFAULT NULL,
  `LHRECP` varchar(30) DEFAULT NULL,
  `LHCUTE` varchar(20) DEFAULT NULL,
  `LHEMNO` varchar(7) DEFAULT NULL,
  `LHSHIP` varchar(8) DEFAULT NULL,
  `LHMEMO` varchar(2) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for foc_release_d
-- ----------------------------
DROP TABLE IF EXISTS `foc_release_d`;
CREATE TABLE `foc_release_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `LDDCNO` varchar(10) DEFAULT NULL,
  `LDSEQN` varchar(50) DEFAULT NULL,
  `LDSPEC` varchar(50) DEFAULT NULL,
  `LDSIPS` varchar(50) DEFAULT NULL,
  `LDSAUM` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for foc_upload
-- ----------------------------
DROP TABLE IF EXISTS `foc_upload`;
CREATE TABLE `foc_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `express_no` varchar(10) NOT NULL DEFAULT '',
  `actual_express_no` varchar(30) DEFAULT NULL,
  `express_company` varchar(10) DEFAULT NULL,
  `state` varchar(10) DEFAULT '未确认',
  PRIMARY KEY (`id`,`express_no`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mac_cost_group
-- ----------------------------
DROP TABLE IF EXISTS `mac_cost_group`;
CREATE TABLE `mac_cost_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_differentiation` varchar(10) NOT NULL COMMENT '製品區分',
  `equipment_name` varchar(10) DEFAULT NULL COMMENT '工程設備名',
  `machine_number` varchar(10) DEFAULT NULL COMMENT '機台號碼',
  `cost_group` varchar(12) DEFAULT NULL COMMENT 'COST GROUP',
  `login_time` date DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`product_differentiation`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mac_equipment
-- ----------------------------
DROP TABLE IF EXISTS `mac_equipment`;
CREATE TABLE `mac_equipment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(9) NOT NULL DEFAULT '' COMMENT '工程设备名',
  `equipment_name_description` varchar(30) DEFAULT NULL COMMENT '工程設備名描述',
  `login_time` date DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipment_name` (`equipment_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mac_movement
-- ----------------------------
DROP TABLE IF EXISTS `mac_movement`;
CREATE TABLE `mac_movement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(10) NOT NULL DEFAULT '' COMMENT '班别',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `product_differentiation` varchar(10) NOT NULL DEFAULT '' COMMENT '製品區分',
  `equipment_name` varchar(10) NOT NULL DEFAULT '' COMMENT '工程設備名',
  `machine_number` varchar(10) NOT NULL DEFAULT '' COMMENT '機台號碼',
  `work_time` double(10,2) DEFAULT NULL COMMENT '就业时间',
  `unittime_product_num` double(10,4) DEFAULT NULL COMMENT '單位時間生產數',
  `input_quantity` double(10,2) DEFAULT NULL COMMENT '投入数量',
  `nondefective_quantity` double(10,2) unsigned zerofill DEFAULT NULL COMMENT '良品数量',
  `machine_type` varchar(10) DEFAULT NULL COMMENT '機台歸類',
  `operate_id` varchar(10) DEFAULT NULL COMMENT '操作員代碼',
  `security_id` varchar(10) DEFAULT NULL COMMENT '保全代碼',
  `login_time` date DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`class_name`,`date`,`product_differentiation`,`equipment_name`,`machine_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=290234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mac_plan_rate
-- ----------------------------
DROP TABLE IF EXISTS `mac_plan_rate`;
CREATE TABLE `mac_plan_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_differentiation` varchar(10) DEFAULT NULL,
  `equipment_name` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `plan_rate` varchar(10) DEFAULT NULL,
  `login_time` date DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`product_differentiation`,`equipment_name`,`date`,`plan_rate`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mac_shutdown
-- ----------------------------
DROP TABLE IF EXISTS `mac_shutdown`;
CREATE TABLE `mac_shutdown` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `class_name` varchar(10) NOT NULL DEFAULT '' COMMENT '班别',
  `product_differentiation` varchar(10) NOT NULL DEFAULT '' COMMENT '製品區分',
  `equipment_name` varchar(10) NOT NULL DEFAULT '' COMMENT '工程設備名',
  `machine_number` varchar(10) NOT NULL DEFAULT '' COMMENT '機台號碼',
  `shutdown_reason_code` varchar(10) DEFAULT NULL COMMENT '停機原因代碼',
  `shutdown_type` varchar(10) DEFAULT NULL COMMENT '停機型態',
  `shutdown_time` double(10,0) DEFAULT NULL COMMENT '停机时间',
  `machine_type` varchar(10) DEFAULT NULL COMMENT '機台歸類',
  `login_time` date DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`class_name`,`product_differentiation`,`equipment_name`,`machine_number`,`shutdown_reason_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=742765 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mac_shutdown_reason
-- ----------------------------
DROP TABLE IF EXISTS `mac_shutdown_reason`;
CREATE TABLE `mac_shutdown_reason` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_differentiation` varchar(10) NOT NULL DEFAULT '' COMMENT '製品區分',
  `equipment_name` varchar(10) NOT NULL DEFAULT '' COMMENT '工程設備名',
  `shutdown_reason_code` varchar(10) NOT NULL DEFAULT '' COMMENT '停機原因代碼',
  `shutdown_type` varchar(10) DEFAULT NULL COMMENT '停機型態',
  `shutdown_description` varchar(30) DEFAULT NULL COMMENT '停機原因描述',
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`product_differentiation`,`equipment_name`,`shutdown_reason_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8728 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mou_balance
-- ----------------------------
DROP TABLE IF EXISTS `mou_balance`;
CREATE TABLE `mou_balance` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) DEFAULT NULL,
  `item_spec` varchar(30) DEFAULT NULL,
  `entry_no` int(3) DEFAULT '0',
  `rating_life` double(10,0) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `stock_location` varchar(10) DEFAULT NULL,
  `warehouse_code` varchar(1) DEFAULT NULL,
  `job_no2` varchar(1) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `use_state` varchar(20) DEFAULT NULL,
  `use_machine` varchar(8) DEFAULT NULL,
  `complete_number` double(10,0) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`item_no`,`entry_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32613 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mou_request
-- ----------------------------
DROP TABLE IF EXISTS `mou_request`;
CREATE TABLE `mou_request` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `request_no` varchar(10) DEFAULT NULL,
  `request_line_no` float(3,0) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `item_no` varchar(15) DEFAULT NULL,
  `memo1` varchar(20) DEFAULT NULL,
  `item_description_dbcs` varchar(30) DEFAULT NULL,
  `item_spec` varchar(30) DEFAULT NULL,
  `sh_ratio` varchar(6) DEFAULT NULL,
  `graph_no_dr` varchar(2) DEFAULT NULL,
  `yamataka_check` varchar(1) DEFAULT NULL,
  `thread_form` varchar(20) DEFAULT NULL,
  `stove_name` varchar(5) DEFAULT NULL,
  `mrpcode` varchar(10) DEFAULT NULL,
  `warehouse_code` varchar(2) DEFAULT NULL,
  `buyer` varchar(7) DEFAULT NULL,
  `on_hand_qty` double(11,1) NOT NULL,
  `sale_qty` double(11,1) NOT NULL,
  `necessary_qty` double(11,1) NOT NULL,
  `security_qty` double(11,1) NOT NULL,
  `last_month_lose_qty` double(11,1) NOT NULL,
  `current_month_lose_qty` double(11,1) NOT NULL,
  `repari_qty` double(11,1) NOT NULL,
  `purchase_request_date` date DEFAULT NULL,
  `require_date` date DEFAULT NULL,
  `purchase_request_qty` double(11,1) DEFAULT NULL,
  `um_incoming_outgoing` varchar(3) DEFAULT NULL,
  `purchase_price` double(13,5) NOT NULL,
  `po_amt_rmb` double(13,2) NOT NULL,
  `um_purchase` varchar(3) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `po_back_order_qty` double(11,1) NOT NULL,
  `po_boarding_qty` double(11,1) NOT NULL,
  `arrived_qty` double(11,1) NOT NULL,
  `text_filed1` varchar(30) DEFAULT NULL,
  `text_filed2` varchar(30) DEFAULT NULL,
  `number_filed1` double(13,2) NOT NULL,
  `number_filed2` double(13,2) NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`request_no`,`item_no`,`request_line_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5937 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mou_request_upload
-- ----------------------------
DROP TABLE IF EXISTS `mou_request_upload`;
CREATE TABLE `mou_request_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) NOT NULL,
  `on_hand_qty` double(11,1) DEFAULT NULL,
  `sale_qty` double(11,1) DEFAULT NULL,
  `necessary_qty` double(11,1) DEFAULT NULL,
  `security_qty` double(11,1) DEFAULT NULL,
  `last_month_lose_qty` double(11,1) DEFAULT NULL,
  `current_month_lose_qty` double(11,1) DEFAULT NULL,
  `repari_qty` double(11,1) DEFAULT NULL,
  `purchase_request_qty` double(11,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mou_specification
-- ----------------------------
DROP TABLE IF EXISTS `mou_specification`;
CREATE TABLE `mou_specification` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `item_no` varchar(15) NOT NULL,
  `kanagata_desc` varchar(30) DEFAULT NULL,
  `kanagata_std` varchar(14) DEFAULT NULL,
  `thread_form` varchar(20) DEFAULT NULL,
  `stove_name` varchar(5) DEFAULT NULL,
  `sh_ratio` varchar(6) DEFAULT NULL,
  `graph_no_dr` varchar(2) DEFAULT NULL,
  `yamataka_check` varchar(1) DEFAULT NULL,
  `memo1` varchar(20) DEFAULT NULL,
  `dr_weight` double(11,5) NOT NULL,
  `item_type` varchar(20) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`,`item_no`) USING BTREE,
  UNIQUE KEY `index_name` (`item_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for par_inventoryfile
-- ----------------------------
DROP TABLE IF EXISTS `par_inventoryfile`;
CREATE TABLE `par_inventoryfile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `part_code` varchar(15) DEFAULT '',
  `mrp` varchar(5) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL COMMENT '部品類型',
  `warehouse_code` varchar(2) DEFAULT NULL COMMENT '倉庫代碼',
  `importance` varchar(1) DEFAULT NULL COMMENT '備品重要度',
  `inventory_duty` varchar(10) DEFAULT NULL COMMENT '盤點擔當(点检者)',
  `stock_code` varchar(6) DEFAULT NULL COMMENT '料架',
  `work_center` varchar(9) DEFAULT NULL COMMENT '工程(工作站)',
  `section_code` varchar(5) DEFAULT NULL COMMENT '股別',
  `machine_code` varchar(5) DEFAULT NULL COMMENT '機台別',
  `equip_code` varchar(5) DEFAULT NULL COMMENT '設備別',
  `stock_qty_on` int(11) unsigned DEFAULT '0' COMMENT '在库数量',
  `vail_stock_qty` int(11) unsigned DEFAULT '0' COMMENT '有效在庫數量',
  `defective_num` int(11) unsigned DEFAULT '0' COMMENT '不良數',
  `price` double(13,0) DEFAULT NULL COMMENT '購買單價',
  `amount` double(13,0) unsigned zerofill DEFAULT NULL COMMENT '在庫金額',
  `chang` int(11) unsigned DEFAULT '0' COMMENT '引當數',
  `processing_times` int(5) unsigned DEFAULT '0' COMMENT '處理次數',
  `mon_in_warehouse` int(11) unsigned DEFAULT '0' COMMENT '當月入庫數量',
  `mon_out_warehouse` int(11) DEFAULT NULL COMMENT '當月出庫數量',
  `inventory_status` varchar(2) DEFAULT NULL COMMENT '盤點狀態',
  `inventory_before` int(11) DEFAULT '0' COMMENT '盤點前帳面在庫數',
  `inventory_actual` int(11) unsigned DEFAULT '0' COMMENT '實際盤點在庫數',
  `inventory_differences` int(11) DEFAULT '0' COMMENT '盤點差異數',
  `last_in_warehouse` date DEFAULT NULL COMMENT '上次盤點日(点检时间)',
  `last_inventory_day` date DEFAULT NULL COMMENT '最後入庫日（入库日期）',
  `last_out_warehouse` date DEFAULT NULL COMMENT '最後出庫日',
  `last_return_warehouse` date DEFAULT NULL COMMENT '最後返庫日',
  `note` varchar(40) DEFAULT NULL COMMENT '備注',
  `note1` varchar(10) DEFAULT NULL COMMENT '備注1',
  `note2` varchar(20) DEFAULT NULL COMMENT '備注2',
  `login_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mrp` (`part_code`,`mrp`,`warehouse_code`,`category`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21270 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for par_masterfile
-- ----------------------------
DROP TABLE IF EXISTS `par_masterfile`;
CREATE TABLE `par_masterfile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `material_spec` varchar(30) DEFAULT NULL COMMENT '品名規格（规格）',
  `part_code` varchar(15) NOT NULL COMMENT '部品代碼',
  `describ` varchar(30) DEFAULT NULL COMMENT '描述',
  `category` varchar(1) DEFAULT NULL COMMENT '類別',
  `mrp` varchar(5) DEFAULT NULL,
  `importance` varchar(1) DEFAULT NULL COMMENT '備品重要度',
  `work_center` varchar(9) DEFAULT NULL COMMENT '工作站',
  `section_code` varchar(5) DEFAULT NULL COMMENT '股別',
  `stock_code` varchar(6) DEFAULT NULL COMMENT '料架號',
  `machine_code` varchar(5) DEFAULT NULL COMMENT '機台別',
  `equip_code` varchar(5) DEFAULT NULL COMMENT '設備別',
  `equip_desc` varchar(20) DEFAULT NULL COMMENT '設備描述',
  `sort_code` varchar(5) DEFAULT NULL COMMENT '分類代碼',
  `unit` varchar(10) DEFAULT NULL COMMENT '計量單位',
  `account` int(3) DEFAULT NULL COMMENT '使用次數',
  `check_flag` varchar(1) DEFAULT NULL COMMENT '檢查區分',
  `check_frequ` int(3) DEFAULT NULL COMMENT '檢查週期(M)',
  `main_item` varchar(20) DEFAULT NULL COMMENT '主要品名代碼',
  `safty_stock_qty` int(11) DEFAULT NULL COMMENT '安全在庫數',
  `min_order_qty` int(11) DEFAULT NULL COMMENT '最小發單數',
  `note1` varchar(10) DEFAULT NULL COMMENT '備用1',
  `note2` varchar(20) DEFAULT NULL COMMENT '備用2',
  `login_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`part_code`),
  UNIQUE KEY `part_code` (`part_code`,`mrp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for par_movefile
-- ----------------------------
DROP TABLE IF EXISTS `par_movefile`;
CREATE TABLE `par_movefile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `part_code` varchar(15) DEFAULT NULL COMMENT '治具代碼',
  `mrp` varchar(5) DEFAULT NULL COMMENT 'ＭＲＰ基準代碼',
  `stock_category` varchar(10) DEFAULT NULL COMMENT '倉庫別',
  `serial_number` bigint(11) DEFAULT '0' COMMENT '流水號',
  `type` varchar(1) DEFAULT NULL COMMENT '類型',
  `status` varchar(2) DEFAULT NULL COMMENT '狀態',
  `complete_logo` varchar(1) DEFAULT NULL COMMENT '完成標識',
  `transcation_qty` int(15) DEFAULT NULL COMMENT 'TRANSACTION QTY',
  `warehouse_qty` int(15) DEFAULT NULL COMMENT '未出庫數量',
  `stock_qty_in` bigint(15) DEFAULT NULL COMMENT 'TRANSACTION AMT',
  `transcation_price` int(13) DEFAULT NULL COMMENT 'TRANSACTION PRICE',
  `last_inventory_day` date DEFAULT NULL COMMENT '异动日期',
  `department_code` varchar(2) DEFAULT NULL COMMENT '部別',
  `class_code` varchar(5) DEFAULT NULL COMMENT '課別',
  `section_code` varchar(8) DEFAULT NULL COMMENT '股別',
  `production_site_code` varchar(5) DEFAULT NULL COMMENT '生產場所代碼',
  `request_number` varchar(15) DEFAULT NULL COMMENT '请求号码',
  `unit_code` varchar(3) DEFAULT NULL COMMENT '計量單位代碼',
  `work_center` varchar(9) DEFAULT NULL COMMENT '工作站',
  `user_number` int(6) DEFAULT NULL COMMENT '員工號碼',
  `chinese_name` varchar(12) DEFAULT NULL COMMENT '中文姓名',
  `note1` varchar(20) DEFAULT NULL COMMENT '備註1',
  `note2` varchar(40) DEFAULT NULL COMMENT '備註2',
  `login_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_code` (`part_code`,`mrp`,`serial_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for par_structurefile
-- ----------------------------
DROP TABLE IF EXISTS `par_structurefile`;
CREATE TABLE `par_structurefile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mrp` varchar(5) DEFAULT NULL,
  `material_code` varchar(30) DEFAULT NULL COMMENT '品名代码',
  `material_spec` varchar(30) DEFAULT NULL COMMENT '品名規格',
  `work_center` varchar(9) DEFAULT NULL COMMENT '工作站',
  `serial_number` int(3) DEFAULT NULL COMMENT '序號',
  `part_code` varchar(15) NOT NULL COMMENT '治具代碼',
  `main_item` varchar(15) DEFAULT NULL COMMENT '治具品名代碼',
  `material_dos` int(11) DEFAULT '0' COMMENT '材料用量',
  `products_dos` int(11) DEFAULT '0' COMMENT '製品用量',
  `alternate_text1` varchar(20) DEFAULT NULL COMMENT '備用文字欄位1',
  `alternate_text2` varchar(20) DEFAULT NULL COMMENT '備用文字欄位2',
  `alternate_int1` int(7) DEFAULT '0' COMMENT '備用數字欄位1',
  `alternate_int2` int(11) DEFAULT '0' COMMENT '備用數字欄位2',
  `login_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`part_code`),
  UNIQUE KEY `material_code` (`material_code`,`work_center`,`part_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for par_user_del
-- ----------------------------
DROP TABLE IF EXISTS `par_user_del`;
CREATE TABLE `par_user_del` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `employee_id` varchar(7) NOT NULL,
  `mrpcode` varchar(10) DEFAULT NULL,
  `user_login_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` datetime DEFAULT NULL,
  `name_cn` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_assessment_history
-- ----------------------------
DROP TABLE IF EXISTS `qcc_assessment_history`;
CREATE TABLE `qcc_assessment_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `educate_type` varchar(6) DEFAULT NULL,
  `workplace_code` varchar(6) DEFAULT NULL,
  `employee_id` varchar(7) DEFAULT NULL,
  `confirm_date_of_1` date DEFAULT NULL,
  `qc_confirm_of_1` varchar(7) DEFAULT NULL COMMENT '一次认定者工号',
  `qc_confirm_name` varchar(12) DEFAULT NULL,
  `identify_ability_1` int(3) DEFAULT NULL,
  `confess_data` varchar(1) DEFAULT NULL,
  `login_time` date DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_1` (`educate_type`,`workplace_code`,`employee_id`,`confirm_date_of_1`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_eap
-- ----------------------------
DROP TABLE IF EXISTS `qcc_eap`;
CREATE TABLE `qcc_eap` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `educate_type` varchar(4) DEFAULT NULL COMMENT '受訓作業種類',
  `educate_type_name` varchar(12) DEFAULT NULL COMMENT '受訓作業種類名稱',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_oid` varchar(10) DEFAULT NULL COMMENT '更新人员',
  `update_program` varchar(30) DEFAULT NULL COMMENT '更新程序',
  `login_oid` varchar(10) DEFAULT NULL COMMENT '登陆人员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_1` (`educate_type`) USING BTREE COMMENT '受訓作業種類'
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_ebp
-- ----------------------------
DROP TABLE IF EXISTS `qcc_ebp`;
CREATE TABLE `qcc_ebp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `educate_type` varchar(4) DEFAULT NULL COMMENT '受訓作業種類',
  `workplace_code` varchar(4) DEFAULT NULL COMMENT '單位代號',
  `dept_code` varchar(2) DEFAULT NULL COMMENT '部門代號',
  `section_code` varchar(16) DEFAULT NULL COMMENT '課別名稱',
  `assistant_code` varchar(16) DEFAULT NULL COMMENT '股別名稱',
  `group_code` varchar(16) DEFAULT NULL COMMENT '組別名稱',
  `work_center` varchar(16) DEFAULT NULL COMMENT '工程名稱',
  `login_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_1` (`educate_type`,`workplace_code`,`dept_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_ecp
-- ----------------------------
DROP TABLE IF EXISTS `qcc_ecp`;
CREATE TABLE `qcc_ecp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `password_code` varchar(6) DEFAULT NULL COMMENT '密碼',
  `workplace_code_from` varchar(4) DEFAULT NULL COMMENT '單位代碼從',
  `workplace_code_to` varchar(4) DEFAULT NULL COMMENT '單位代碼至',
  `educate_type_from` varchar(4) DEFAULT NULL COMMENT '作業種類  從',
  `educate_type_to` varchar(4) DEFAULT NULL COMMENT '作業種類  至',
  `login_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_1` (`password_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_edp
-- ----------------------------
DROP TABLE IF EXISTS `qcc_edp`;
CREATE TABLE `qcc_edp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `educate_type` varchar(4) DEFAULT NULL COMMENT '作業種類',
  `workplace_code` varchar(4) DEFAULT NULL,
  `employee_id` varchar(7) DEFAULT NULL COMMENT '工号',
  `date_of_induction` date DEFAULT NULL COMMENT '上崗日期',
  `date_of_departure` date DEFAULT NULL COMMENT '離崗日期',
  `date_of_vacation` date DEFAULT NULL COMMENT '长假开始日期',
  `skill_development` int(2) DEFAULT NULL COMMENT '技能實習 >=1 月',
  `job_evaluation` varchar(1) DEFAULT NULL COMMENT '作業訓練評定 A',
  `manufature_lore_one` int(3) DEFAULT NULL COMMENT '制品知識 >=90 ONE',
  `manufature_lore_two` int(3) DEFAULT NULL COMMENT '制品知識 >=90 TWO',
  `standard_work_one` int(3) DEFAULT NULL COMMENT '作業標準 >=90 ONE',
  `standard_work_two` int(3) DEFAULT NULL COMMENT '作業標準 >=90 TWO',
  `exoterica_educate_one` int(3) DEFAULT NULL COMMENT '理論教育 >=90 ONE',
  `exoterica_educate_two` int(3) DEFAULT NULL COMMENT '理論教育 >=90 TWO',
  `eligibility_no` varchar(4) DEFAULT NULL COMMENT '合格牌號',
  `eligibility_status` varchar(4) DEFAULT NULL COMMENT '合格牌收回狀態',
  `confirm_date` date DEFAULT NULL COMMENT '合格認定日',
  `qa_manager_confirm` varchar(1) DEFAULT NULL COMMENT 'QA 經理承認',
  `assess_of_1` date DEFAULT NULL COMMENT '1 次訓練評定日',
  `qc_confirm_of_1` varchar(1) DEFAULT NULL COMMENT '1 次 QC 主管認定',
  `assess_of_2` date DEFAULT NULL COMMENT '2 次訓練評定日',
  `qc_confirm_of_2` varchar(1) DEFAULT NULL COMMENT '2 次 QC 主管認定',
  `assess_of_3` date DEFAULT NULL COMMENT '3 次訓練評定日',
  `qc_confirm_of_3` varchar(1) DEFAULT NULL COMMENT '3 次 QC 主管認定',
  `login_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(50) DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_1` (`id`,`educate_type`,`workplace_code`,`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2752 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_master_inspection
-- ----------------------------
DROP TABLE IF EXISTS `qcc_master_inspection`;
CREATE TABLE `qcc_master_inspection` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `educate_type` varchar(4) DEFAULT NULL,
  `workplace_code` varchar(4) DEFAULT NULL,
  `employee_id` varchar(7) DEFAULT NULL,
  `date_of_induction` date DEFAULT NULL,
  `date_of_vacation` date DEFAULT NULL COMMENT '长假开始日期',
  `date_of_departure` date DEFAULT NULL,
  `characte` varchar(2) DEFAULT NULL,
  `sure` int(3) DEFAULT NULL,
  `flexibitity` int(3) DEFAULT NULL,
  `eye_left` decimal(2,1) DEFAULT NULL,
  `eye_right` decimal(2,1) DEFAULT NULL,
  `color_sensitivity` varchar(1) DEFAULT NULL,
  `sampling_principle` int(3) DEFAULT NULL,
  `product_knowledge` int(3) DEFAULT NULL,
  `operation_education` int(3) DEFAULT NULL,
  `skill_development` decimal(5,1) DEFAULT NULL,
  `identify_ability` int(3) DEFAULT NULL,
  `job_evaluation` varchar(1) DEFAULT NULL,
  `stamp_serial_no` varchar(5) DEFAULT NULL COMMENT '印章编号',
  `stamp_type` varchar(1) DEFAULT NULL,
  `eligibility_no` varchar(4) DEFAULT NULL,
  `eligibility_status` varchar(1) DEFAULT NULL,
  `confirm_date` date DEFAULT NULL,
  `qa_manager_confirm` varchar(1) DEFAULT NULL,
  `identify_ability_1` int(3) DEFAULT NULL,
  `qc_confirm_of_1` varchar(7) DEFAULT NULL,
  `confirm_date_of_1` date DEFAULT NULL,
  `identif_ability_2` int(3) DEFAULT NULL,
  `qc_confirm_of_2` varchar(7) DEFAULT NULL,
  `confirm_date_of_2` date DEFAULT NULL,
  `special` varchar(1) DEFAULT NULL,
  `grr` double(3,1) DEFAULT NULL,
  `field1` varchar(20) DEFAULT NULL,
  `field2` decimal(13,5) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_1` (`id`,`educate_type`,`workplace_code`,`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_new
-- ----------------------------
DROP TABLE IF EXISTS `qcc_new`;
CREATE TABLE `qcc_new` (
  `educate_type` varchar(255) DEFAULT NULL,
  `workplace_code` varchar(255) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `workplace_code1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qcc_vision_history
-- ----------------------------
DROP TABLE IF EXISTS `qcc_vision_history`;
CREATE TABLE `qcc_vision_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `educate_type` varchar(6) DEFAULT NULL COMMENT '作業種類',
  `workplace_code` varchar(6) DEFAULT NULL COMMENT '單位代號',
  `employee_id` varchar(7) DEFAULT NULL COMMENT '工號',
  `confirm_date_of_2` date DEFAULT NULL COMMENT '合格認定日',
  `check_type` varchar(1) DEFAULT NULL COMMENT '類別',
  `eye_left` decimal(2,1) DEFAULT NULL COMMENT '左視力 >=0.8',
  `eye_right` decimal(2,1) DEFAULT NULL COMMENT '右視力 >=0.8',
  `confess_data` varchar(1) DEFAULT NULL,
  `login_time` date DEFAULT NULL,
  `login_oid` varchar(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_oid` varchar(10) DEFAULT NULL,
  `update_program` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_1` (`educate_type`,`workplace_code`,`employee_id`,`confirm_date_of_2`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5052 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) NOT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for bnd_export_invoice_v01
-- ----------------------------
DROP VIEW IF EXISTS `bnd_export_invoice_v01`;
CREATE ALGORITHM=UNDEFINED DEFINER=``@``  VIEW `bnd_export_invoice_v01` AS (select 
release_status,statement_customer_no,shipped_date,a.invoice_no,shipping_condition_code,ship_to_name1_dbcs,terms_trade,currency,shipping_date_rate,packing_date_rate,amt_cn,amt_foreign,box_from,total_netwet,total_grosswet,departure_date,bill_to,port_description,forwarder_code,a.pallet_qty,product_country_code,packing_serial,customer_no,item_no,item_description_dbcs,customer_item_code,unit,customer_item_spec,customer_po,po_no ,b.packing_qty,carton_no_from,carton_no_to,net_weigh,caton_weight,sampling_principle,mrpcode,so_no ,packing_amt,original_invoice,catton_qty_by_dn,dn_no from bnd_export_invoice_h a left join bnd_export_invoice_d b on a.invoice_no=b.invoice_no) ;

-- ----------------------------
-- View structure for epm_employee_production_v01
-- ----------------------------
DROP VIEW IF EXISTS `epm_employee_production_v01`;
CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER  VIEW `epm_employee_production_v01` AS (
select  `employee_no`, `employee_name`, `date`,Round(sum(input_quantity*st_value)/SUM(input_minutes),5) as efficiency_t  from epm_employee_production 
left join epm_st_count on  epm_employee_production.item_no=epm_st_count.item_no and  epm_employee_production.processing_code=epm_st_count.processing_code
GROUP BY  `employee_no`, `employee_name`, `date`

) ;

-- ----------------------------
-- Procedure structure for PRBGFG01
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRBGFG01`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `PRBGFG01`(IN IVNR VARCHAR(10),OUT BGFG INTEGER)
BEGIN                                                            
SET BGFG =0;                                                     
SELECT COUNT(*)  INTO BGFG FROM  bnd_master_invt_d WHERE invoice_no=IVNR; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PRBGFG02
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRBGFG02`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `PRBGFG02`(IN IVNR VARCHAR(10),OUT FLAG INTEGER)
BEGIN                                                            
DECLARE FLAG1 INTEGER;
SET FLAG =0;                                                     
SELECT COUNT(*) INTO FLAG FROM bnd_import_asn
JOIN bnd_master_item ON bnd_import_asn.item_no =bnd_master_item.item_no
WHERE itemized_application_code='6' AND custom_approved_no =' ' AND bonded_logo ='Y' AND invoice_no =IVNR;
IF FLAG <>0 THEN
SELECT COUNT(*) INTO FLAG1 FROM bnd_master_invt_d
JOIN bnd_master_declare_list on bnd_master_invt_d.internal_number=bnd_master_declare_list.internal_number 
WHERE bnd_master_invt_d.invoice_no =IVNR;
END IF;
IF FLAG1 <>0 THEN
SET FLAG=0;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PRBGFG03
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRBGFG03`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `PRBGFG03`(IN IVNR VARCHAR(10),OUT FLAG INTEGER)
BEGIN                                                            
SET FLAG =0;                                                     
SELECT COUNT(*)  INTO FLAG FROM bnd_carry_invt_list WHERE invoice_no=IVNR; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PRGR01
-- ----------------------------
DROP PROCEDURE IF EXISTS `PRGR01`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `PRGR01`(IN IVNR VARCHAR(10),IN PRVD
VARCHAR(8),IN  FLAG VARCHAR(1) )
BEGIN
INSERT INTO bnd_if_fepo_gr(grivnr,grrgdc,grtype,grstat) VALUES(IVNR,PRVD,FLAG,'0');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PROCEDURE1
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE1`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `PROCEDURE1`()
BEGIN
show tables;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_get_rework_ver
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_rework_ver`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `p_get_rework_ver`(in item_no VARCHAR(30),in item_no_n VARCHAR(30),in version Int)
BEGIN
-- L1重工MO，品番不一样时，找到新品番材料相同的版本（不考虑用量）
	declare ucns_verno int;
	declare dec_cm NUMERIC;
	declare dec_dm NUMERIC;
	declare operation_sequence_no NUMERIC;

	declare endprd_gds_mtno varchar(30);
	declare mtpck_gds_mtno varchar(30);
	declare equipment_name varchar(9);
	declare cnt_o int DEFAULT 0  ;
	declare cnt_n int DEFAULT 0  ;
	declare max_version int DEFAULT 0  ;
	declare return_version int DEFAULT 1  ;
	

	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT t.endprd_gds_mtno,t.ucns_verno,t.mtpck_gds_mtno,t.equipment_name, t.dec_cm,t.dec_dm,t.  operation_sequence_no from bnd_master_bom t where t.endprd_gds_mtno=item_no and t.ucns_verno=version;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  DELETE from bnd_master_bottom_material_m  where mo_no=mo_no2;
	SELECT COUNT(*) into cnt_o from bnd_master_bom t where t.endprd_gds_mtno=item_no and t.ucns_verno=version;
	
-- 		新品番最高版本
	SELECT max(t.ucns_verno) into max_version from bnd_master_bom t where t. endprd_gds_mtno=item_no_n;

  new_bond:LOOP
-- 材料个数相同，再判断材料是否一样，不同则找上一版本
	SELECT count(*) into cnt_n from bnd_master_bom t where t. endprd_gds_mtno=item_no_n and t.ucns_verno=max_version;
  IF cnt_n=cnt_o THEN
	OPEN cur;
	read_loop: LOOP
	FETCH cur INTO endprd_gds_mtno,ucns_verno,mtpck_gds_mtno,equipment_name, dec_cm,dec_dm,operation_sequence_no;
	
	IF done THEN
	LEAVE read_loop;
	END IF;
--   INSERT bnd_master_bottom_material_m(mo_no,item_no,material_item_no,equipment_name,loss_quantity,product_loss_quantity,operation_sequence_no) VALUES(mo_no2,SUBSTR(endprd_gds_mtno,1,15),SUBSTR(mtpck_gds_mtno,1,15),equipment_name, dec_cm,dec_dm,operation_sequence_no);
--   判断材料是否存在，不存在就结束read_loop，返回版本return_version=0
	SELECT count(*) into cnt_n from  bnd_master_bom t where t. endprd_gds_mtno=item_no_n and t.ucns_verno=max_version and t.mtpck_gds_mtno=mtpck_gds_mtno;

	if cnt_n=0 then  -- 材料不存在结束，找下个版本
	set return_version=-1;
	LEAVE read_loop;
	END IF;	
	END LOOP;
	CLOSE cur;
	
-- 	返回版本return_version<>0 结束new_bond
  if return_version<>-1 then
	set return_version=max_version;
	LEAVE new_bond;
	else
	set return_version=0;
	end if;
  
	END IF;
	if max_version=1 then
	LEAVE new_bond;
	end if;
  set max_version=max_version-1;	
	
	END LOOP;
	
	SELECT return_version;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_get_rework_ver2
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_rework_ver2`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `p_get_rework_ver2`(in mo_no2 VARCHAR(10),in item_no VARCHAR(30),in item_no_n VARCHAR(30),in version Int)
BEGIN
-- L1重工MO，品番不一样时，找到新品番材料相同的版本（不考虑用量）
	declare ucns_verno int;
	declare dec_cm NUMERIC;
	declare dec_dm NUMERIC;
	declare operation_sequence_no NUMERIC;

	declare endprd_gds_mtno varchar(30);
	declare mtpck_gds_mtno varchar(30);
	declare equipment_name varchar(9);
	declare cnt_o int DEFAULT 0  ;
	declare cnt_n int DEFAULT 0  ;
	declare max_version int DEFAULT 0  ;
	declare return_version int DEFAULT 1  ;
	

	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT t.endprd_gds_mtno,t.ucns_verno,t.mtpck_gds_mtno,t.equipment_name, t.dec_cm,t.dec_dm,t.operation_sequence_no from bnd_master_bom t where t.endprd_gds_mtno=item_no and t.ucns_verno=version;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
DELETE from bnd_master_bottom_material_m  where mo_no=mo_no2;
	SELECT COUNT(*) into cnt_o from bnd_master_bom t where t.endprd_gds_mtno=item_no and t.ucns_verno=version;
	
-- 		新品番最高版本
	SELECT max(t.ucns_verno) into max_version from bnd_master_bom t where t. endprd_gds_mtno=item_no_n;

  new_bond:LOOP
-- 材料个数相同，再判断材料是否一样，不同则找上一版本
	SELECT count(*) into cnt_n from bnd_master_bom t where t. endprd_gds_mtno=item_no_n and t.ucns_verno=max_version;
  IF cnt_n=cnt_o THEN
	OPEN cur;
	read_loop: LOOP
	FETCH cur INTO endprd_gds_mtno,ucns_verno,mtpck_gds_mtno,equipment_name, dec_cm,dec_dm,operation_sequence_no;
	
	IF done THEN
	LEAVE read_loop;
	END IF;
--   INSERT bnd_master_bottom_material_m(mo_no,item_no,material_item_no,equipment_name,loss_quantity,product_loss_quantity,operation_sequence_no) VALUES(mo_no2,SUBSTR(endprd_gds_mtno,1,15),SUBSTR(mtpck_gds_mtno,1,15),equipment_name, dec_cm,dec_dm,operation_sequence_no);
--   判断材料是否存在，不存在就结束read_loop，返回版本return_version=0
	SELECT count(*) into cnt_n from  bnd_master_bom t where t. endprd_gds_mtno=item_no_n and t.ucns_verno=max_version and t.mtpck_gds_mtno=mtpck_gds_mtno;

	if cnt_n=0 then  -- 材料不存在结束，找下个版本
	set return_version=-1;
	LEAVE read_loop;
	END IF;	
	END LOOP;
	CLOSE cur;
	
-- 	返回版本return_version<>0 结束new_bond
  if return_version<>-1 then
	set return_version=max_version;
	LEAVE new_bond;
	else
	set return_version=0;
	end if;
  
	END IF;
	if max_version=1 then
	LEAVE new_bond;
	end if;
  set max_version=max_version-1;	
	
	END LOOP;
	
	SELECT return_version;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_print_result
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_print_result`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `sp_print_result`(
 IN f_string varchar(1000),IN f_delimiter varchar(5)
)
BEGIN
  -- Get the separated string.
  declare cnt int default 0;
  declare i int default 0;
  set cnt = func_get_split_string_total(f_string,f_delimiter);
  drop table if exists tmp_print;
  create temporary table tmp_print (num int not null);
  while i < cnt
  do
    set i = i + 1;
    insert into tmp_print(num) values (func_get_split_string(f_string,f_delimiter,i));
  end while;
  select * from tmp_print;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_proc_cursor
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_proc_cursor`;
DELIMITER ;;
CREATE DEFINER=``@`` PROCEDURE `test_proc_cursor`()
BEGIN
	#声明接收变量
	declare v_id int(11);
	declare cnt int(11) DEFAULT 0 ;
	declare v_unit_name varchar(30);
	#游标变量
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT t.id from bnd_master_item t;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	OPEN cur;
	read_loop: LOOP
	FETCH cur INTO v_id;
	
	IF done THEN
	LEAVE read_loop;
	END IF;
  SET cnt=cnt+1;
	END LOOP;
	CLOSE cur;
   SELECT cnt;
 
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_get_split_string
-- ----------------------------
DROP FUNCTION IF EXISTS `func_get_split_string`;
DELIMITER ;;
CREATE DEFINER=``@`` FUNCTION `func_get_split_string`(
f_string varchar(1000),f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8
BEGIN
  -- Get the separated number of given string.
  declare result varchar(255) default '';
  set result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));
  return result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_get_split_string_total
-- ----------------------------
DROP FUNCTION IF EXISTS `func_get_split_string_total`;
DELIMITER ;;
CREATE DEFINER=``@`` FUNCTION `func_get_split_string_total`(
f_string varchar(1000),f_delimiter varchar(5)
) RETURNS int(11)
BEGIN
  -- Get the total number of given string.
  return 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for FUNEXGV03
-- ----------------------------
DROP FUNCTION IF EXISTS `FUNEXGV03`;
DELIMITER ;;
CREATE DEFINER=``@`` FUNCTION `FUNEXGV03`(MONR VARCHAR(10),ITNR
VARCHAR(15),MITN VARCHAR(450),EXGVL VARCHAR(270),OPNQ VARCHAR(120)) RETURNS int(11)
BEGIN
DECLARE EXGV INTEGER;
DECLARE MITN1 VARCHAR(225);
DECLARE MITN2 VARCHAR(225);
DECLARE EXGV1 VARCHAR(135);
DECLARE EXGV2 VARCHAR(135);
DECLARE count01 INTEGER;
SET MITN1 =SUBSTR(MITN,1,225);
SET MITN2 =SUBSTR(MITN,226,225);
SET EXGV1 =SUBSTR(EXGVL,1,135);
SET EXGV2 =SUBSTR(EXGVL,136,135);
SET EXGV =0;
DELETE from bnd_master_mo_version where mo_no=MONR;
DELETE from bnd_master_bottom_material_m where mo_no=MONR;
-- select * from bnd_master_item where item_no=ITNR;																
																
select count(*) into EXGV from bnd_master_nonbond_lot	where	mo_no=MONR and item_no=ITNR;												
-- 	存在	版本=99999999															
-- 		insert htm2p															
-- 	不存在																
-- 		保税且TTMOP存在															
-- 		1	momotp=1		sub03	再生											
-- 				分割MINN成30个品名													
-- 				分割EXGV成30个版本													
-- 				遍历30次													
-- 					判断BOND='Y'  且是 ITTP='1'												
-- 						版本大于0		SUB04									
-- 							结束										
-- 																	
-- 		2	momotp<>1		sub01												
-- 				分割MINN成30个品名													
-- 				分割EXGV成30个版本													
-- 				遍历30次													
-- 					select * from ttadp												
-- 						存在	select * from tmimp where item_no										
-- 							bond='y' 										
-- 								ittp<>'1'									
-- 									计算单损耗								
-- 									判断在htm3p不存在								
-- 									更新HTM1P								
-- 								版本>0 AND ittp='1'									
-- 									找到版本对应的材料，更新HTM1P								
-- 		3	HTM6P最大损耗率的处理														
-- 		4	判断HTM1P有没有指定 mo和ITEM														
-- 				存在找到相应的版本													
-- 					遍历HTM1P和HTBSP（状态等于2）												
-- 						找到材料相同的最大版本											
-- 					没找到												
-- 						遍历HTM1P和HTBSP（状态等于1）											
-- 					如果是半制品自动创建版本												
-- 				不存在版本等于0													
-- 		5	更新HTM2P														
-- 


RETURN EXGV;                           
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for FUNEXGV04
-- ----------------------------
DROP FUNCTION IF EXISTS `FUNEXGV04`;
DELIMITER ;;
CREATE DEFINER=``@`` FUNCTION `FUNEXGV04`(MONR VARCHAR(10),ITNR
VARCHAR(15),MITN VARCHAR(450),EXGVL VARCHAR(270),OPNQ VARCHAR(120)) RETURNS int(11)
BEGIN
DECLARE EXGV INTEGER;
DECLARE MITN1 VARCHAR(225);
DECLARE MITN2 VARCHAR(225);
DECLARE EXGV1 VARCHAR(135);
DECLARE EXGV2 VARCHAR(135);
DECLARE count01 INTEGER;
DECLARE bond_flag VARCHAR(1); -- 保税标识
DECLARE raw_bond_flag VARCHAR(1); -- 材料保税标识
DECLARE mo_type VARCHAR(1); -- 保税标识
  DECLARE mrp_code varchar(1);
  DECLARE raw_itnr varchar(15);
  declare raw_type varchar(1);
  declare raw_exgv int ;
  declare st int default 1;
  declare len int default 15;
	declare i int default 1;
SET EXGV =0;
DELETE from bnd_master_mo_version where mo_no=MONR;
DELETE from bnd_master_bottom_material_m where mo_no=MONR;
select bonded_logo into bond_flag from bnd_master_item where item_no=ITNR;																
																
select count(*) into count01 from bnd_master_nonbond_lot	where	mo_no=MONR and item_no=ITNR;
IF count01>0 THEN
set EXGV=999999999;   -- 	存在	版本=99999999
ELSE   
-- 	不存在
		 IF bond_flag='Y' THEN
--        IF EXISTS (select mo_type into mo_type from bnd_master_mo	where	mo_no=MONR ) THEN	
--    1 1阶材料的计算
-- 				分割MINN成30个品名													
-- 				分割EXGV成30个版本													
-- 				遍历30次
        while i <=30
         do
	       set raw_itnr=SUBSTR(MITN,st,len);
	       set raw_exgv=SUBSTR(EXGVL,st,len);
	       set st=st+len;

   
-- 		 	momotp=1		sub03	再生
         IF mo_type='1' then	

          select bonded_logo into raw_bond_flag from bnd_master_item where item_no=raw_itnr;
					     if bonded_logo='y' and raw_type='1' then
								       if raw_exgv>0 then  
									      set i=30;
                        END IF;	
	              END IF;		
          
            END IF;
						set i = i + 1;
				end while;
        END IF;
END IF;

RETURN EXGV;                           
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for string_split
-- ----------------------------
DROP FUNCTION IF EXISTS `string_split`;
DELIMITER ;;
CREATE DEFINER=``@`` FUNCTION `string_split`(
f_string varchar(1000),num INT
) RETURNS int(11)
BEGIN
  -- Get the separated string.
  declare result varchar(255) default '';
  declare st int default 0;
  declare ed int default 0;
	set ed=num;

  return ed;
END
;;
DELIMITER ;
