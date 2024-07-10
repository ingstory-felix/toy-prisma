-- AlterTable
ALTER TABLE `Post` ALTER COLUMN `updatedAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `User` ALTER COLUMN `updatedAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `n2_app_location` MODIFY `alc_type` ENUM('1', '2') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_banner_hits` MODIFY `bnh_date` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_board_answer` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_board_comment` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_board_post` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_board_setting` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_brand` MODIFY `br_skin_type` ENUM('1', '2') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_cs_faq` MODIFY `csf_regdate` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_cs_inquiry` MODIFY `csi_regdate` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_debug` MODIFY `db_log_regdate` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_event_template` MODIFY `ev_regdate` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_feed_favorite` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_locker` MODIFY `lk_type` ENUM('1', '2') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_log` MODIFY `lg_date` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_log_new` MODIFY `lg_date` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_member_api` MODIFY `reg_date` TIMESTAMP(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    MODIFY `update_date` TIMESTAMP(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_message` MODIFY `ms_regdate2` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_message_test` MODIFY `ms_regdate2` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_order` MODIFY `od_date` DATE NOT NULL DEFAULT ('0000-00-00');

-- AlterTable
ALTER TABLE `n2_order_pg_log` MODIFY `ordpl_vbank_due` DATE NOT NULL DEFAULT ('0000-00-00'),
    MODIFY `ordpl_approve_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    MODIFY `ordpl_vbank_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    MODIFY `ordpl_vbank_due_date` DATE NOT NULL DEFAULT ('0000-00-00'),
    MODIFY `ordpl_vbank_income_date` DATE NOT NULL DEFAULT ('0000-00-00'),
    MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_partner_info_sub` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_sales_calc_app` MODIFY `ssca_step` ENUM('1', '2', '3') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_shop` MODIFY `sp_kiosk_bg` ENUM('1', '2', '3', '4') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_shop_240226` MODIFY `sp_kiosk_bg` ENUM('1', '2', '3', '4') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_shop_control` MODIFY `spc_delete_date` TIMESTAMP(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_shop_withdrawals` MODIFY `spw_step` ENUM('1', '2', '-1', '-2') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_support_faq` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_support_inquiry` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_support_reveiw` MODIFY `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00');

-- AlterTable
ALTER TABLE `n2_sync` MODIFY `sc_step` ENUM('1', '2', '3', '4') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_task` MODIFY `tk_important` ENUM('1', '2', '3', '4', '5') NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `n2_web_faq` MODIFY `wfq_regdate` DATE NOT NULL DEFAULT ('0000-00-00');
