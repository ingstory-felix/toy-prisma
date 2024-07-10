/*
  Warnings:

  - The primary key for the `Post` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE `Post` DROP PRIMARY KEY,
    MODIFY `id` CHAR(36) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- CreateTable
CREATE TABLE `n2_access_ip` (
    `aci_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `aci_target` ENUM('admin', 'user') NOT NULL DEFAULT 'user',
    `aci_type` ENUM('access', 'block') NOT NULL DEFAULT 'block',
    `aci_title` VARCHAR(20) NOT NULL DEFAULT '',
    `aci_ip` VARCHAR(50) NOT NULL DEFAULT '',
    `aci_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `aci_delete_date` DATETIME(0) NULL,
    `aci_reg_ip` VARCHAR(80) NOT NULL DEFAULT '',
    `aci_reg_name` VARCHAR(80) NOT NULL DEFAULT '',
    `aci_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aci_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aci_regdate` DATE NOT NULL,

    INDEX `aci_delete`(`aci_delete`),
    INDEX `aci_search`(`aci_target`, `aci_type`, `aci_ip`, `aci_delete`),
    PRIMARY KEY (`aci_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_addon_info` (
    `adn_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER UNSIGNED NOT NULL,
    `adn_type` TINYINT UNSIGNED NOT NULL,
    `adn_key` TINYINT UNSIGNED NOT NULL,
    `adn_value` TEXT NULL,
    `adn_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `adn_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `n2_addon_sp_no_adn_type_adn_key_index`(`sp_no`, `adn_type`, `adn_key`),
    INDEX `n2_addon_sp_no_index`(`sp_no`),
    PRIMARY KEY (`adn_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_banner` (
    `abn_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `abn_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `abn_title` VARCHAR(80) NOT NULL DEFAULT '',
    `abn_image` VARCHAR(255) NOT NULL DEFAULT '',
    `abn_link` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `abn_link_href` VARCHAR(255) NULL,
    `abn_start_date` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `abn_end_date` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `abn_publish` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `abn_sort` TINYINT NOT NULL DEFAULT 0,
    `abn_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `abn_delete_date` DATETIME(0) NULL,
    `abn_delete_name` VARCHAR(40) NULL,
    `abn_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `abn_update_name` VARCHAR(40) NOT NULL DEFAULT '',
    `abn_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `abn_regdate` DATE NOT NULL,
    `abn_reg_name` VARCHAR(40) NOT NULL DEFAULT '',
    `abn_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',

    INDEX `abn_delete`(`abn_delete`),
    INDEX `abn_sort`(`abn_sort`),
    PRIMARY KEY (`abn_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_event` (
    `aev_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `mn_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `aev_title` VARCHAR(80) NOT NULL DEFAULT '',
    `aev_contents` TEXT NOT NULL,
    `aev_start_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aev_end_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aev_thumbnail` VARCHAR(255) NULL,
    `aev_publish` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `aev_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `aev_delete_date` DATETIME(0) NULL,
    `aev_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',
    `aev_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aev_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aev_regdate` DATE NOT NULL,

    INDEX `aev_delete`(`aev_delete`),
    INDEX `aev_publish`(`aev_publish`),
    INDEX `mn_no`(`mn_no`),
    PRIMARY KEY (`aev_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_favorite` (
    `afv_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `afv_parent` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `afv_type` TINYINT NOT NULL DEFAULT 10,
    `afv_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `afv_delete_date` TIMESTAMP(0) NULL,
    `afv_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `afv_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `afv_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `afv_parent`(`afv_parent`),
    INDEX `afv_type`(`afv_type`),
    INDEX `amb_no`(`amb_no`),
    UNIQUE INDEX `amb_no_afv_parent_afv_type`(`amb_no`, `afv_parent`, `afv_type`),
    PRIMARY KEY (`afv_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_group` (
    `agr_no` INTEGER NOT NULL AUTO_INCREMENT,
    `agr_name` VARCHAR(40) NOT NULL,
    `agr_auth` INTEGER NOT NULL,
    `agr_memo` TEXT NOT NULL,

    PRIMARY KEY (`agr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_location` (
    `alc_no` INTEGER NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER NOT NULL,
    `ambd_no` INTEGER NOT NULL,
    `alc_type` ENUM('1', '2') NOT NULL DEFAULT 1,
    `alc_name` VARCHAR(255) NOT NULL,
    `alc_x` DECIMAL(16, 13) NOT NULL,
    `alc_y` DECIMAL(16, 13) NOT NULL,
    `alc_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `aad_no`(`alc_no`),
    INDEX `amb_no`(`amb_no`),
    INDEX `ambd_no`(`ambd_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_member` (
    `amb_no` INTEGER NOT NULL AUTO_INCREMENT,
    `amb_id` VARCHAR(50) NOT NULL,
    `amb_pw` VARCHAR(255) NOT NULL,
    `amb_pw_date` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `agr_no` TINYINT NOT NULL DEFAULT 1,
    `ambd_no` INTEGER NULL,
    `alc_no` INTEGER NOT NULL,
    `amb_auto_login` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `amb_info` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `amb_name` VARCHAR(40) NOT NULL,
    `amb_nickname` VARCHAR(40) NOT NULL,
    `amb_point` INTEGER NOT NULL,
    `amb_email` VARCHAR(80) NOT NULL,
    `amb_phone` VARCHAR(15) NOT NULL,
    `amb_phone_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `amb_phone_valid_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `amb_pin` VARCHAR(255) NOT NULL,
    `amb_pin_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `amb_pin_delete_date` TIMESTAMP(0) NULL,
    `amb_sms` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `amb_push_notice` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `amb_push_event` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `amb_push_system` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `amb_parents_phone` CHAR(15) NOT NULL DEFAULT '',
    `amb_parents_sms` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `amb_birth` DATE NOT NULL,
    `amb_sex` ENUM('', 'M', 'F') NOT NULL,
    `amb_kakao` VARCHAR(100) NOT NULL,
    `amb_naver` VARCHAR(150) NOT NULL,
    `amb_addr1` VARCHAR(255) NOT NULL,
    `amb_addr2` VARCHAR(255) NOT NULL,
    `amb_terms` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `amb_terms_date` DATETIME(0) NOT NULL,
    `amb_third` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `amb_third_date` DATETIME(0) NOT NULL,
    `amb_policy` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `amb_policy_date` DATETIME(0) NOT NULL,
    `amb_gps` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `amb_gps_date` DATETIME(0) NOT NULL,
    `amb_online` ENUM('N', 'Y') NOT NULL,
    `amb_online_date` DATE NOT NULL,
    `amb_dormant` ENUM('N', 'Y') NOT NULL,
    `amb_dormant_date` DATETIME(0) NOT NULL,
    `amb_withdraw` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `amb_withdraw_date` DATETIME(0) NOT NULL,
    `amb_delete` ENUM('N', 'Y') NOT NULL,
    `amb_delete_date` DATETIME(0) NOT NULL,
    `amb_pw_migrate` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `amb_reg_ip` VARCHAR(40) NOT NULL,
    `amb_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `amb_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `amb_regdate` DATE NOT NULL,

    UNIQUE INDEX `amb_id`(`amb_id`),
    INDEX `amb_delete`(`amb_delete`),
    INDEX `amb_phone`(`amb_phone`),
    INDEX `ambd_no`(`ambd_no`),
    PRIMARY KEY (`amb_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_member_device` (
    `ambd_no` INTEGER NOT NULL AUTO_INCREMENT,
    `alc_no` INTEGER NOT NULL,
    `ambd_device_id` VARCHAR(255) NOT NULL,
    `ambd_client_id` VARCHAR(255) NOT NULL,
    `ambd_push_token` VARCHAR(255) NOT NULL,
    `ambd_time` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ambd_os` VARCHAR(20) NOT NULL,
    `ambd_model` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `ambd_device`(`ambd_device_id`),
    INDEX `alc_no`(`alc_no`),
    PRIMARY KEY (`ambd_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_member_favorite` (
    `ambf_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ambf_parent_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ambf_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `ambf_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ambf_delete_date` DATETIME(0) NULL,
    `ambf_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',
    `ambf_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ambf_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ambf_regdate` DATE NOT NULL,

    INDEX `amb_no`(`amb_no`),
    INDEX `ambf_parent_no`(`ambf_parent_no`),
    INDEX `ambf_type`(`ambf_type`),
    UNIQUE INDEX `amb_no_ambf_parent_no_ambf_type`(`amb_no`, `ambf_parent_no`, `ambf_type`),
    PRIMARY KEY (`ambf_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_member_log` (
    `ambl_no` INTEGER NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER NOT NULL,
    `ambl_action` ENUM('', 'SIGNUP', 'SIGNIN', 'SIGNOUT', 'WITHDRAW', 'DORMANT', 'RELEASE', 'UPDATE', 'DELETE', 'DEVICE_ASSIGN', 'DEVICE_UNASSIGN', 'DEVICE_DIFF', 'PIN_RESET', 'FIRST_SIGN') NOT NULL,
    `ambl_dsc` VARCHAR(255) NOT NULL,
    `ambl_ip` VARCHAR(40) NOT NULL,
    `ambl_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ambl_regdate` DATE NOT NULL,

    PRIMARY KEY (`ambl_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_message` (
    `ams_no` INTEGER NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER NOT NULL,
    `amst_no` INTEGER NULL,
    `amsg_id` INTEGER NOT NULL,
    `ams_mode` ENUM('S', 'D', 'M') NOT NULL DEFAULT 'S',
    `ams_sender` VARCHAR(15) NOT NULL,
    `ams_receiver` VARCHAR(150) NOT NULL,
    `ams_receiver_list` TEXT NOT NULL,
    `ams_msg` TEXT NOT NULL,
    `ams_result` ENUM('Y', 'N') NOT NULL,
    `ams_type` VARCHAR(3) NOT NULL,
    `ams_reserve` DATETIME(0) NULL,
    `ams_regdate` DATETIME(0) NOT NULL,

    PRIMARY KEY (`ams_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_notice` (
    `ant_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `mn_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ant_title` VARCHAR(80) NOT NULL,
    `ant_contents` MEDIUMTEXT NOT NULL,
    `ant_image` VARCHAR(200) NULL,
    `ant_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ant_publish` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `ant_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ant_delete_date` DATETIME(0) NULL,
    `ant_reg_ip` VARCHAR(40) NOT NULL,
    `ant_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ant_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ant_regdate` DATE NOT NULL,

    INDEX `ant_delete`(`ant_delete`),
    INDEX `ant_publish`(`ant_publish`),
    INDEX `mn_no`(`mn_no`),
    PRIMARY KEY (`ant_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_notification` (
    `ano_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `ano_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `amb_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ano_title` VARCHAR(80) NOT NULL DEFAULT '',
    `ano_content` TEXT NOT NULL,
    `ano_action_link` VARCHAR(200) NULL,
    `ano_publish` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ano_read` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ano_read_at` TIMESTAMP(0) NULL,
    `ano_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ano_delete_date` DATETIME(0) NULL,
    `ano_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',
    `ano_reg_name` VARCHAR(80) NOT NULL DEFAULT '',
    `ano_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ano_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ano_regdate` DATE NOT NULL,

    INDEX `amb_no`(`amb_no`),
    INDEX `ano_delete`(`ano_delete`),
    PRIMARY KEY (`ano_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_order` (
    `aod_no` INTEGER NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER NOT NULL,
    `aod_step` ENUM('1', '2', '3', '4', '5', '-1', '-2', '-3') NOT NULL,
    `aod_item_count` INTEGER NOT NULL,
    `aod_price` INTEGER NOT NULL,
    `aod_dc_price` INTEGER NOT NULL,
    `aod_use_point` INTEGER NOT NULL,
    `aod_total_price` INTEGER NOT NULL,
    `aod_pay_type` ENUM('cash', 'card', 'chaipay') NOT NULL,
    `aod_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aod_regdate` DATETIME(0) NOT NULL,

    PRIMARY KEY (`aod_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_order_item` (
    `aodi_no` INTEGER NOT NULL AUTO_INCREMENT,
    `aod_no` INTEGER NOT NULL,
    `aodi_name` VARCHAR(255) NOT NULL,
    `aodi_price` INTEGER NOT NULL,
    `aodi_ea` INTEGER NOT NULL,
    `aodi_dc_price` INTEGER NOT NULL,
    `aodi_total_price` INTEGER NOT NULL,
    `aodi_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `aodi_regdate` DATETIME(0) NOT NULL,

    PRIMARY KEY (`aodi_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_point` (
    `apt_no` INTEGER NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER NOT NULL,
    `amb_point` INTEGER NOT NULL,
    `apt_point` INTEGER NOT NULL,
    `apt_dsc` VARCHAR(255) NOT NULL,
    `apt_ip` VARCHAR(40) NOT NULL,
    `apt_user` VARCHAR(40) NOT NULL,
    `apt_regdate` DATETIME(0) NOT NULL,

    INDEX `amb_no`(`amb_no`),
    PRIMARY KEY (`apt_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_app_sessions` (
    `id` VARCHAR(40) NOT NULL,
    `ip_address` VARCHAR(45) NOT NULL,
    `timestamp` INTEGER NULL,
    `data` BLOB NOT NULL,

    INDEX `id`(`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_area` (
    `ar_code` VARCHAR(21) NOT NULL,
    `ar_parent` VARCHAR(21) NOT NULL,
    `ar_name` VARCHAR(255) NOT NULL,
    `ar_dsc` TEXT NOT NULL,
    `ar_image` VARCHAR(255) NOT NULL,
    `ar_sort` INTEGER NOT NULL,
    `ar_hidden` ENUM('Y', 'N') NULL DEFAULT 'N',

    PRIMARY KEY (`ar_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_banner` (
    `bn_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bn_id` VARCHAR(255) NOT NULL,
    `bn_title` VARCHAR(255) NOT NULL,
    `bn_start_date` DATETIME(0) NOT NULL,
    `bn_end_date` DATETIME(0) NOT NULL,
    `bn_image` VARCHAR(255) NULL,
    `bn_link` VARCHAR(255) NULL,
    `bn_target` VARCHAR(80) NOT NULL DEFAULT '_blank',
    `bn_x` INTEGER NULL,
    `bn_y` INTEGER NULL,
    `bn_show_all` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `bn_use` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bn_order` INTEGER UNSIGNED NOT NULL DEFAULT 1,
    `bn_test` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bn_history` TEXT NULL,
    `bn_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bn_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `bn_regdate` TIMESTAMP(0) NOT NULL,

    PRIMARY KEY (`bn_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_banner_hits` (
    `bnh_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bn_no` INTEGER UNSIGNED NOT NULL,
    `br_no` INTEGER UNSIGNED NULL,
    `sp_no` INTEGER UNSIGNED NULL,
    `mn_no` INTEGER UNSIGNED NULL,
    `bnh_date` DATE NOT NULL DEFAULT ('0000-00-00'),
    `bnh_time` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`bnh_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_banner_target` (
    `bnt_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bn_no` INTEGER UNSIGNED NOT NULL,
    `br_no` INTEGER UNSIGNED NULL,
    `sp_no` INTEGER UNSIGNED NULL,

    PRIMARY KEY (`bnt_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_benefit_report` (
    `bfr_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bfr_type` ENUM('point', '') NOT NULL,
    `bfr_date` DATE NOT NULL,
    `bfr_title` VARCHAR(255) NOT NULL,
    `bfr_data` LONGTEXT NOT NULL,
    `bfr_proc` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `bfr_proc_start` DATETIME(0) NULL,
    `bfr_proc_end` DATETIME(0) NULL,
    `bfr_proc_ip` VARCHAR(40) NOT NULL,
    `bfr_cancel` ENUM('Y', 'N') NULL DEFAULT 'N',
    `bfr_cancel_dsc` VARCHAR(255) NULL,
    `bfr_cancel_data` LONGTEXT NULL,
    `bfr_cancel_user` DATETIME(0) NULL,
    `bfr_cancel_start` DATETIME(0) NULL,
    `bfr_cancel_end` DATETIME(0) NULL,
    `bfr_cancel_ip` VARCHAR(40) NULL,

    PRIMARY KEY (`bfr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_biostar` (
    `bs_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NULL,
    `mb_no` INTEGER NOT NULL,
    `sc_no` INTEGER NULL,
    `bs_regist` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bs_id` VARCHAR(255) NOT NULL,
    `bs_pw` VARCHAR(255) NOT NULL,
    `bs_name` VARCHAR(80) NOT NULL,
    `bs_group` INTEGER NULL,
    `bs_charge` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `bs_ready` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `bs_status` ENUM('AC', 'IN') NOT NULL DEFAULT 'AC',
    `bs_fp` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bs_t1` VARCHAR(512) NOT NULL,
    `bs_t2` VARCHAR(512) NOT NULL,
    `bs_update` DATETIME(0) NOT NULL,
    `bs_regdate` TIMESTAMP(0) NOT NULL,

    INDEX `bs_id`(`bs_id`),
    INDEX `md_no`(`mb_no`),
    PRIMARY KEY (`bs_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_board` (
    `bd_no` INTEGER NOT NULL AUTO_INCREMENT,
    `cdID` VARCHAR(255) NULL,
    `bdc_id` VARCHAR(80) NOT NULL,
    `bd_category` VARCHAR(50) NOT NULL,
    `bd_type` ENUM('F', 'C', 'B', 'CMT') NOT NULL,
    `bd_show` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `bd_group` INTEGER NOT NULL,
    `bd_step` INTEGER NOT NULL,
    `bd_depth` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `bd_pw` VARCHAR(32) NULL,
    `bd_title` VARCHAR(255) NOT NULL,
    `bd_contents` TEXT NOT NULL,
    `bd_writer` VARCHAR(255) NOT NULL,
    `bd_hit` INTEGER NOT NULL,
    `bdAuthView` INTEGER NOT NULL,
    `cdHeaderHTML` TEXT NOT NULL,
    `cdFooterHTML` TEXT NOT NULL,
    `bd_file` VARCHAR(255) NOT NULL,
    `bd_history` TEXT NOT NULL,
    `bd_ip` VARCHAR(20) NOT NULL,
    `bd_regdate` DATETIME(0) NOT NULL,
    `bd_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `cdNo`(`bd_no`),
    INDEX `bdID`(`bdc_id`, `bd_type`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_board_answer` (
    `boda_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bods_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `mbrm_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `boda_permit_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `boda_title` VARCHAR(200) NOT NULL DEFAULT '',
    `boda_content` MEDIUMTEXT NULL,
    `boda_author` VARCHAR(80) NOT NULL DEFAULT '',
    `boda_hidden_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `boda_delete_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `boda_secret_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `boda_password` VARCHAR(100) NOT NULL DEFAULT '',
    `boda_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `bodp_idx`(`bodp_idx`),
    INDEX `bods_idx`(`bods_idx`),
    INDEX `mbrm_idx`(`mbrm_idx`),
    PRIMARY KEY (`boda_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_board_comment` (
    `bodc_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bods_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `mbru_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `mbrm_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodc_group_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodc_sort` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodc_depth` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodc_author` VARCHAR(80) NOT NULL DEFAULT '',
    `bodc_content` MEDIUMTEXT NULL,
    `bodc_like_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodc_sympathy_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodc_sympathy_no_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodc_recommend_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodc_secret_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodc_password` VARCHAR(100) NOT NULL DEFAULT '',
    `bodc_hidden_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodc_delete_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `bodp_idx`(`bodp_idx`),
    INDEX `bods_idx`(`bods_idx`),
    INDEX `mbrm_idx`(`mbrm_idx`),
    INDEX `mbru_idx`(`mbru_idx`),
    PRIMARY KEY (`bodc_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_board_config` (
    `bdc_no` INTEGER NOT NULL AUTO_INCREMENT,
    `bdc_id` VARCHAR(80) NOT NULL,
    `bdc_name` VARCHAR(255) NOT NULL,
    `bdc_image` VARCHAR(255) NOT NULL,
    `bdc_group` TEXT NOT NULL,
    `bdc_category_use` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `bdc_category` VARCHAR(255) NOT NULL,
    `bdc_manager` VARCHAR(80) NOT NULL,
    `bdc_skin` VARCHAR(255) NOT NULL,
    `bdc_antibot` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bdc_antiposts` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bdc_comment` ENUM('Y', 'N') NOT NULL,
    `bdc_view_only` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bdc_perpage` INTEGER NOT NULL,
    `bdc_cols_cnt` INTEGER NOT NULL,
    `bdc_upload_size` INTEGER NOT NULL,
    `bdc_upload_cnt` INTEGER NOT NULL,
    `bdc_auth_list` INTEGER NOT NULL,
    `bdc_auth_view` INTEGER NOT NULL,
    `bdc_auth_write` INTEGER NOT NULL,
    `bdc_auth_reply` INTEGER NOT NULL,
    `bdc_auth_cmt` INTEGER NOT NULL,
    `bdc_auth_down` INTEGER NOT NULL,
    `bdc_auth_link` INTEGER NOT NULL,
    `bdc_auth_upload` INTEGER NOT NULL,
    `bdc_header_html` TEXT NOT NULL,
    `bdc_footer_html` TEXT NOT NULL,
    `bdc_history` TEXT NOT NULL,
    `bdc_regdate` DATETIME(0) NOT NULL,
    `bdc_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `bdID`(`bdc_id`),
    PRIMARY KEY (`bdc_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_board_post` (
    `bodp_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `shop_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bods_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `mbru_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `mbrm_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_lang_cd` VARCHAR(3) NOT NULL DEFAULT 'ko',
    `bods_category` VARCHAR(200) NULL,
    `bodp_group_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_step` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_depth` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_title` VARCHAR(200) NOT NULL DEFAULT '',
    `bodp_content` MEDIUMTEXT NULL,
    `bodp_video` VARCHAR(200) NOT NULL DEFAULT '',
    `bodp_url` VARCHAR(200) NOT NULL DEFAULT '',
    `bodp_author` VARCHAR(80) NOT NULL DEFAULT '',
    `bodp_notice_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_answer_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_hidden_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_delete_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_secret_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_mobile_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_password` VARCHAR(100) NOT NULL DEFAULT '',
    `bodp_permit_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `bodp_email` VARCHAR(100) NULL,
    `bodp_email_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_phone1` VARCHAR(20) NULL,
    `bodp_phone2` VARCHAR(20) NULL,
    `bodp_department` VARCHAR(50) NULL,
    `bodp_sms_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bodp_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_comment_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bodp_like_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `bods_category`(`bods_category`),
    INDEX `bods_idx`(`bods_idx`),
    INDEX `mbrm_idx`(`mbrm_idx`),
    INDEX `mbru_idx`(`mbru_idx`),
    INDEX `shop_idx`(`shop_idx`),
    PRIMARY KEY (`bodp_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_board_setting` (
    `bods_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `shop_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bods_id` VARCHAR(80) NOT NULL DEFAULT '',
    `bods_name` VARCHAR(80) NOT NULL DEFAULT '',
    `bods_content` MEDIUMTEXT NULL,
    `bods_category` VARCHAR(200) NULL,
    `bods_type_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `bods_kind_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `bods_type_skin` VARCHAR(20) NOT NULL DEFAULT '',
    `bods_content_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bods_perpage_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 10,
    `bods_name_display_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 100,
    `bods_block_id` VARCHAR(200) NULL,
    `bods_block_ip` VARCHAR(200) NULL,
    `bods_best_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_author_hidden_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_author_hidden_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 2,
    `bods_comment_delete_type_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `bods_open_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `bods_score_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_edit_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_auto_submit_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_upload_file_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_upload_file_path` VARCHAR(200) NOT NULL DEFAULT '',
    `bods_upload_file_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 10,
    `bods_file_upload_exts` VARCHAR(200) NOT NULL DEFAULT 'jpeg|jpg|png|gif',
    `bods_upload_file_size` INTEGER UNSIGNED NOT NULL DEFAULT 1024,
    `bods_only_member_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_list_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_list` VARCHAR(200) NULL,
    `bods_permit_view_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_view` VARCHAR(200) NULL,
    `bods_permit_write_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_write` VARCHAR(200) NULL,
    `bods_permit_modify_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_modify` VARCHAR(200) NULL,
    `bods_permit_delete_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_delete` VARCHAR(200) NULL,
    `bods_permit_comment_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_comment` VARCHAR(200) NULL,
    `bods_permit_reply_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_reply` VARCHAR(200) NULL,
    `bods_permit_answer_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_answer` VARCHAR(200) NULL,
    `bods_permit_down_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `bods_permit_down` VARCHAR(200) NULL,
    `bods_point_write` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bods_point_view` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bods_point_down` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `bods_point_comment` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `cmm_use_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `cmm_del_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    UNIQUE INDEX `bods_id`(`bods_id`),
    UNIQUE INDEX `bods_name`(`bods_name`),
    INDEX `shop_idx`(`shop_idx`),
    PRIMARY KEY (`bods_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_book` (
    `bk_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `ct_code` VARCHAR(21) NOT NULL,
    `bki_no` INTEGER NOT NULL,
    `bk_code` INTEGER NULL,
    `bk_memo` TEXT NOT NULL,
    `bk_regdate` DATETIME(0) NOT NULL,

    PRIMARY KEY (`bk_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_book_isbn` (
    `bki_no` INTEGER NOT NULL AUTO_INCREMENT,
    `bki_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `bk_isbn` VARCHAR(20) NOT NULL,
    `bk_title` VARCHAR(100) NOT NULL,
    `bk_author` VARCHAR(100) NOT NULL,
    `bk_publisher` VARCHAR(100) NOT NULL,
    `bk_pubdate` DATE NOT NULL,
    `bk_image` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `bk_isbn`(`bk_isbn`),
    PRIMARY KEY (`bki_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_brand` (
    `br_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_id` VARCHAR(20) NOT NULL,
    `br_logo` VARCHAR(255) NOT NULL,
    `br_title` VARCHAR(50) NOT NULL,
    `br_title_eng` VARCHAR(50) NOT NULL,
    `br_skin` VARCHAR(40) NOT NULL DEFAULT 'pickko',
    `br_skin_type` ENUM('1', '2') NOT NULL DEFAULT 1,
    `br_company` VARCHAR(100) NOT NULL,
    `br_regno` VARCHAR(50) NOT NULL,
    `br_name` VARCHAR(50) NOT NULL,
    `br_phone` VARCHAR(50) NOT NULL,
    `br_memo` TEXT NOT NULL,
    `br_email` VARCHAR(50) NOT NULL,
    `br_message_account` VARCHAR(50) NOT NULL,
    `br_ms_cost` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `br_ms_cost_sms` INTEGER NOT NULL,
    `br_ms_cost_lms` INTEGER NOT NULL,
    `br_ms_cost_mms` INTEGER NOT NULL,
    `br_app_fee_yn` ENUM('N', 'Y') NULL DEFAULT 'N',
    `br_app_fee` DECIMAL(2, 1) NULL,
    `br_mobile` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `br_mobile_date` DATETIME(0) NOT NULL,
    `br_valid` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `br_valid_date` DATETIME(0) NOT NULL,
    `br_valid_user` VARCHAR(100) NOT NULL,
    `br_delete` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `br_delete_date` DATETIME(0) NOT NULL,
    `br_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `br_regdate` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `br_id`(`br_id`),
    PRIMARY KEY (`br_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_cate` (
    `no` INTEGER NOT NULL AUTO_INCREMENT,
    `depth` TINYINT NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `dsc` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_category` (
    `ct_no` INTEGER NOT NULL AUTO_INCREMENT,
    `ct_root` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ct_code` VARCHAR(21) NOT NULL,
    `sp_no` INTEGER NULL,
    `ct_name` VARCHAR(255) NOT NULL,
    `ct_dsc` TEXT NOT NULL,
    `ct_image` VARCHAR(255) NOT NULL,
    `ct_sort` INTEGER NOT NULL,
    `ct_hidden` ENUM('Y', 'N') NULL DEFAULT 'N',

    UNIQUE INDEX `ct_code`(`ct_code`, `sp_no`),
    PRIMARY KEY (`ct_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_check` (
    `ck_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `device` INTEGER NOT NULL,
    `user_id` VARCHAR(80) NOT NULL,
    `tna_key` TINYINT NOT NULL,
    `temperature` INTEGER NULL,
    `idx` INTEGER NULL,
    `regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `sp_no`(`sp_no`, `idx`),
    PRIMARY KEY (`ck_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_check_1` (
    `ck_no` INTEGER NOT NULL DEFAULT 0,
    `sp_no` INTEGER NOT NULL,
    `device` INTEGER NOT NULL,
    `user_id` VARCHAR(80) NOT NULL,
    `tna_key` TINYINT NOT NULL,
    `temperature` INTEGER NULL,
    `idx` INTEGER NULL,
    `regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_crond` (
    `cr_no` INTEGER NOT NULL AUTO_INCREMENT,
    `cr_type` ENUM('1', '2', '3', '4', '5', '6', '20', '99') NOT NULL DEFAULT '99',
    `sp_no` INTEGER NULL,
    `cr_name` VARCHAR(1000) NOT NULL,
    `cr_result` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `cr_start` DATETIME(0) NULL,
    `cr_end` DATETIME(0) NULL,
    `cr_date` DATE NOT NULL,

    INDEX `cr_date`(`cr_date`),
    INDEX `cr_result`(`cr_result`),
    INDEX `cr_type_2`(`cr_type`, `sp_no`),
    PRIMARY KEY (`cr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_crond_new` (
    `cr_no` INTEGER NOT NULL AUTO_INCREMENT,
    `cr_type` ENUM('1', '2', '3', '4', '5', '6', '99') NOT NULL DEFAULT '99',
    `sp_no` INTEGER NULL,
    `cr_name` VARCHAR(1000) NOT NULL,
    `cr_result` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `cr_start` DATETIME(0) NULL,
    `cr_end` DATETIME(0) NULL,
    `cr_date` DATE NOT NULL,

    INDEX `cr_date`(`cr_date`),
    INDEX `cr_result`(`cr_result`),
    INDEX `cr_type_2`(`cr_type`, `sp_no`),
    PRIMARY KEY (`cr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_cs_faq` (
    `csf_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `csf_kind` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `csf_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `csf_question` VARCHAR(200) NOT NULL DEFAULT '',
    `csf_content` MEDIUMTEXT NULL,
    `csf_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `csf_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `csf_delete_date` DATETIME(0) NULL,
    `csf_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',
    `csf_reg_name` VARCHAR(40) NOT NULL DEFAULT '',
    `csf_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `csf_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `csf_regdate` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `csf_delete`(`csf_delete`),
    INDEX `sptf_kind_cd`(`csf_type`),
    PRIMARY KEY (`csf_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_cs_inquiry` (
    `csi_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `csi_kind` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `csi_type` TINYINT UNSIGNED NOT NULL,
    `amb_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `csi_author` VARCHAR(80) NOT NULL DEFAULT '',
    `csi_phone` VARCHAR(13) NOT NULL DEFAULT '',
    `csi_title` VARCHAR(200) NOT NULL DEFAULT '',
    `csi_content` MEDIUMTEXT NULL,
    `csi_reply` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mn_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `csi_answer_author` VARCHAR(80) NULL,
    `csi_answer_title` VARCHAR(200) NULL,
    `csi_answer_content` MEDIUMTEXT NULL,
    `csi_answer_date` DATETIME(0) NULL,
    `csi_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `csi_delete_date` DATETIME(0) NULL,
    `csi_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',
    `csi_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `csi_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `csi_regdate` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `amb_no`(`amb_no`),
    INDEX `csi_delete`(`csi_delete`),
    PRIMARY KEY (`csi_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_debug` (
    `db_no` INTEGER NOT NULL AUTO_INCREMENT,
    `db_log_type` ENUM('system', 'user', 'debug') NOT NULL,
    `db_log_message` VARCHAR(200) NULL DEFAULT '',
    `db_log_data` TEXT NULL,
    `db_log_regdate` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `db_log_type`(`db_log_type`),
    PRIMARY KEY (`db_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_device` (
    `dv_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `dv_mode` ENUM('main', 'kiosk', 'kiosk2', 'kiosk3', 'kiosk4', 'checkin', 'checkout', 'locker', 'locker2', 'touch') NULL,
    `dv_program` ENUM('EXEC', 'LOCAL') NOT NULL DEFAULT 'EXEC',
    `dv_name` VARCHAR(100) NOT NULL,
    `dv_ip` VARCHAR(40) NULL,
    `dv_mac` VARCHAR(40) NULL,
    `dv_local_ip` VARCHAR(40) NULL,
    `dv_domain` VARCHAR(255) NULL,
    `dv_start_path` VARCHAR(255) NULL,
    `dv_barcode_path` VARCHAR(255) NULL,
    `dv_broker` SMALLINT NULL DEFAULT 8000,
    `dv_broker_update` DATETIME(0) NOT NULL,
    `dv_broker_ping` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `dv_biomini` SMALLINT NULL,
    `dv_bs_update` DATETIME(0) NOT NULL,
    `dv_bs_ping` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `dv_seat` VARCHAR(10) NULL,
    `dv_seat_baudrate` MEDIUMINT NULL,
    `dv_seat_update` DATETIME(0) NOT NULL,
    `dv_seat_ping` ENUM('Y', 'N') NULL,
    `dv_pay` VARCHAR(10) NULL,
    `dv_pay_baudrate` MEDIUMINT NULL,
    `dv_print` VARCHAR(10) NULL,
    `dv_print_baudrate` MEDIUMINT NULL,
    `dv_barcode` VARCHAR(10) NULL,
    `dv_barcode_baudrate` MEDIUMINT NULL,
    `dv_relay` VARCHAR(10) NULL,
    `dv_relay_baudrate` MEDIUMINT NULL,
    `dv_money_box` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `dv_kiosk_option` TEXT NOT NULL,
    `dv_graphic_level` TINYINT UNSIGNED NOT NULL DEFAULT 3,
    `dv_image1` VARCHAR(60) NOT NULL,
    `dv_image2` VARCHAR(60) NOT NULL,
    `dv_image3` VARCHAR(60) NOT NULL,
    `dv_image4` VARCHAR(60) NOT NULL,
    `dv_image5` VARCHAR(60) NOT NULL,
    `dv_image6` VARCHAR(60) NOT NULL,
    `stc_no` INTEGER NULL,
    `dv_stc_dsc` VARCHAR(80) NULL,
    `dv_user_invalid` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `dv_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `dv_valid_date` DATETIME(0) NULL,
    `dv_online` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `dv_online_date` DATETIME(0) NOT NULL,
    `dv_history` TEXT NOT NULL,
    `dv_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dv_regdate` DATETIME(0) NOT NULL,
    `dv_kiosk_type` ENUM('COME', 'GO') NOT NULL DEFAULT 'COME',
    `dv_device_token` VARCHAR(50) NULL,
    `dv_device_payment` ENUM('Y', 'N') NOT NULL DEFAULT 'N',

    INDEX `sp_no`(`sp_no`, `dv_mode`, `dv_valid`),
    PRIMARY KEY (`dv_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_event_template` (
    `ev_no` INTEGER NOT NULL AUTO_INCREMENT,
    `ev_code` VARCHAR(10) NULL,
    `ev_order` INTEGER UNSIGNED NULL,
    `ev_title` VARCHAR(128) NOT NULL DEFAULT '',
    `ev_type` TEXT NOT NULL,
    `ev_value` LONGTEXT NOT NULL,
    `ev_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ev_regdate` DATE NOT NULL DEFAULT ('0000-00-00'),
    `ev_delete` TINYTEXT NULL,
    `ev_group` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    PRIMARY KEY (`ev_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_feed_favorite` (
    `fedfv_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `amb_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `fedfv_parent_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `fedfv_kind_meta` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `cmm_use_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `cmm_del_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `amb_no`(`amb_no`),
    INDEX `fedfv_kind_meta`(`fedfv_kind_meta`),
    INDEX `fedfv_parent_idx`(`fedfv_parent_idx`),
    UNIQUE INDEX `amb_no_fedfv_parent_idx_fedfv_kind_meta`(`amb_no`, `fedfv_parent_idx`, `fedfv_kind_meta`),
    PRIMARY KEY (`fedfv_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_global_meta` (
    `gmt_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `gmt_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `gmt_group` VARCHAR(80) NOT NULL DEFAULT '',
    `gmt_key` VARCHAR(255) NOT NULL DEFAULT '',
    `gmt_value` LONGTEXT NOT NULL,
    `gmt_json` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `gmt_sort` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `gmt_dsc` VARCHAR(255) NOT NULL DEFAULT '',
    `gmt_use` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `gmt_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `gmt_delete_date` TIMESTAMP(0) NULL,
    `gmt_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `gmt_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `type_group_KEY`(`gmt_type`, `gmt_group`),
    UNIQUE INDEX `type_group_key_UNIQUE`(`gmt_type`, `gmt_group`, `gmt_key`),
    PRIMARY KEY (`gmt_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_goods` (
    `gd_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `ct_code` VARCHAR(21) NOT NULL,
    `gd_name` VARCHAR(255) NOT NULL,
    `gd_dsc` TEXT NOT NULL,
    `gd_image` VARCHAR(255) NOT NULL,
    `gd_stock` INTEGER NOT NULL,
    `gd_price` INTEGER NOT NULL,
    `gd_use` ENUM('Y', 'N', 'D') NOT NULL DEFAULT 'N',
    `gd_regdate` DATETIME(0) NOT NULL,
    `gd_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`gd_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_goods_price` (
    `gdp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `gd_no` INTEGER NOT NULL,
    `gdp_type` ENUM('S', 'A') NOT NULL DEFAULT 'S',
    `gdp_title` VARCHAR(255) NOT NULL,
    `gdp_name` VARCHAR(255) NOT NULL,
    `gdp_price` INTEGER NOT NULL,
    `gdp_use` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `gdp_regdate` DATE NOT NULL,
    `gdp_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`gdp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_group` (
    `gr_no` TINYINT NOT NULL AUTO_INCREMENT,
    `gr_auth` TINYINT NOT NULL,
    `gr_name` VARCHAR(45) NOT NULL,
    `gr_dsc` VARCHAR(45) NULL,
    `gr_default` ENUM('Y') NULL,
    `gr_display` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',

    PRIMARY KEY (`gr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_history` (
    `ht_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `ht_type` VARCHAR(40) NOT NULL,
    `ht_uid` INTEGER NOT NULL,
    `ht_data` TEXT NOT NULL,
    `ht_user` VARCHAR(40) NOT NULL,
    `ht_ip` VARCHAR(40) NOT NULL,
    `ht_regdate` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`ht_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_holiday` (
    `hd_no` INTEGER NOT NULL AUTO_INCREMENT,
    `mn_no` INTEGER NULL,
    `hd_name` VARCHAR(40) NOT NULL,
    `hd_w` TINYINT NOT NULL,
    `hd_date` DATE NOT NULL,
    `hd_timestamp` INTEGER NOT NULL,
    `hd_use` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `hd_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `hd_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `hd_date`(`hd_date`),
    INDEX `mn_no`(`mn_no`),
    PRIMARY KEY (`hd_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_install` (
    `in_no` INTEGER NOT NULL AUTO_INCREMENT,
    `in_code` VARCHAR(10) NULL,
    `in_order` INTEGER UNSIGNED NULL,
    `in_title` VARCHAR(128) NOT NULL DEFAULT '',
    `in_type` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `sp_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `in_value` LONGTEXT NOT NULL,
    `in_etc` TEXT NULL,
    `in_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `in_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `in_id` VARCHAR(128) NULL,
    `in_group` INTEGER UNSIGNED NOT NULL,

    INDEX `n2_install_pk`(`in_code`, `in_type`, `sp_no`),
    PRIMARY KEY (`in_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_invalid` (
    `iv_no` INTEGER NOT NULL AUTO_INCREMENT,
    `iv_device_mode` ENUM('kiosk', 'main', 'app') NOT NULL DEFAULT 'kiosk',
    `sp_no` VARCHAR(20) NOT NULL,
    `iv_phone` VARCHAR(15) NOT NULL,
    `iv_code` SMALLINT NOT NULL,
    `iv_step` ENUM('1', '2', '3') NOT NULL,
    `iv_ip` VARCHAR(40) NOT NULL,
    `iv_invalid` DATETIME(0) NULL,
    `iv_regdate` DATETIME(0) NOT NULL,

    INDEX `iv_step`(`iv_step`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`iv_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_kpass_user` (
    `sp_no` INTEGER NULL,
    `kpass_user_id` INTEGER NULL,
    `type` INTEGER NULL DEFAULT 0,
    `kpass_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `agree_user_id` INTEGER NULL,
    `kpass_response` TEXT NULL,
    `kpass_files` TEXT NULL,
    `mb_no` INTEGER NULL,
    `status` INTEGER NULL DEFAULT 0,
    `memo` TEXT NULL,
    `inoculation_date` DATE NULL,

    UNIQUE INDEX `n2_kpass_user_pk`(`sp_no`, `mb_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_locker` (
    `lk_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `lk_type` ENUM('1', '2') NOT NULL DEFAULT 1,
    `lk_sex` ENUM('A', 'M', 'F') NOT NULL DEFAULT 'A',
    `lk_group` INTEGER NOT NULL,
    `lk_name` VARCHAR(255) NOT NULL,
    `lk_x` TINYINT NOT NULL,
    `lk_y` TINYINT NOT NULL,
    `lk_w` SMALLINT NOT NULL,
    `lk_h` SMALLINT NOT NULL,
    `mb_no` INTEGER NULL,
    `lk_idx` SMALLINT NOT NULL,
    `lk_order` INTEGER UNSIGNED NOT NULL,
    `lk_use` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `lk_dsc` VARCHAR(255) NOT NULL,
    `lk_step` ENUM('') NOT NULL,
    `lk_start` DATE NULL,
    `lk_end` DATE NULL,

    UNIQUE INDEX `lk_no`(`lk_no`),
    INDEX `mb_no`(`mb_no`),
    INDEX `sp_no_2`(`sp_no`, `lk_type`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_log` (
    `lg_no` INTEGER NOT NULL AUTO_INCREMENT,
    `lg_type` TINYINT NOT NULL,
    `lg_action` TINYINT NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `lg_uid` INTEGER NOT NULL,
    `lg_issued` INTEGER NOT NULL,
    `lg_dsc` VARCHAR(255) NOT NULL,
    `lg_idx` INTEGER NULL,
    `lg_ip` VARCHAR(40) NOT NULL,
    `lg_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `lg_date` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `lg_date`(`lg_date`),
    INDEX `lg_uid`(`lg_uid`),
    INDEX `mb_no`(`mb_no`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`lg_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_log_ara` (
    `lga_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `st_no` INTEGER NOT NULL,
    `lga_result` BOOLEAN NOT NULL,
    `lga_msg` VARCHAR(255) NOT NULL,
    `lga_httpcode` VARCHAR(5) NOT NULL,
    `lga_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_log_new` (
    `lg_no` INTEGER NOT NULL AUTO_INCREMENT,
    `lg_type` TINYINT NOT NULL,
    `lg_action` TINYINT NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `lg_uid` INTEGER NOT NULL,
    `lg_issued` INTEGER NOT NULL,
    `lg_dsc` VARCHAR(255) NOT NULL,
    `lg_idx` INTEGER NULL,
    `lg_ip` VARCHAR(40) NOT NULL,
    `lg_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `lg_date` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `lg_date`(`lg_date`),
    INDEX `lg_uid`(`lg_uid`),
    PRIMARY KEY (`lg_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_manager` (
    `mn_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NULL,
    `sp_no` INTEGER NULL,
    `mn_id` VARCHAR(80) NOT NULL,
    `mn_pw` VARCHAR(80) NULL,
    `mn_mode` ENUM('super', 'pickko', 'manager', 'shop', 'shop2', 'device', 'kiosk', 'kiosk2', 'checkin', 'checkout', 'locker', 'locker2', 'book', 'touch') NOT NULL,
    `mn_device` INTEGER NULL,
    `mn_name` VARCHAR(80) NOT NULL,
    `mn_group` ENUM('', 'DEV', 'ADM') NOT NULL,
    `mn_phone` VARCHAR(50) NOT NULL,
    `mn_online` ENUM('Y', 'N') NULL,
    `mn_online_date` DATETIME(0) NULL,
    `mn_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mn_valid_date` DATETIME(0) NOT NULL,
    `mn_valid_user` VARCHAR(100) NOT NULL,
    `mn_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mn_delete_date` DATETIME(0) NULL,
    `mn_ip` VARCHAR(40) NOT NULL,
    `mn_update` VARCHAR(45) NOT NULL,
    `mn_regdate` VARCHAR(45) NOT NULL,

    INDEX `n2_manager_mn_no_index`(`mn_no`),
    PRIMARY KEY (`mn_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_manager_auth` (
    `mna_no` INTEGER NOT NULL AUTO_INCREMENT,
    `mn_no` INTEGER NOT NULL,
    `mna_depth` INTEGER NOT NULL,
    `mna_parent` VARCHAR(6) NULL,
    `mna_code` VARCHAR(9) NOT NULL,
    `mna_name` VARCHAR(80) NOT NULL,
    `mna_route` VARCHAR(80) NOT NULL,
    `mna_access` BOOLEAN NOT NULL,
    `mna_process` BOOLEAN NOT NULL,
    `mna_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `mn_no`(`mn_no`),
    PRIMARY KEY (`mna_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_member` (
    `mb_no` INTEGER NOT NULL AUTO_INCREMENT,
    `mb_app` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `amb_no` INTEGER NULL,
    `sp_no` INTEGER NOT NULL,
    `gr_no` TINYINT NOT NULL DEFAULT 1,
    `mb_pw` VARCHAR(80) NULL,
    `mb_id` VARCHAR(80) NOT NULL,
    `mb_name` VARCHAR(80) NOT NULL,
    `mb_sex` ENUM('', 'F', 'M') NOT NULL,
    `mb_birth` DATE NOT NULL,
    `mb_bio` ENUM('Y', 'N') NOT NULL,
    `mb_phone` VARCHAR(45) NOT NULL,
    `mb_sms` ENUM('N', 'Y') NOT NULL DEFAULT 'Y',
    `mb_name2` VARCHAR(40) NOT NULL,
    `mb_phone2` VARCHAR(45) NOT NULL,
    `mb_sms2` ENUM('N', 'Y') NOT NULL DEFAULT 'Y',
    `mb_email` VARCHAR(80) NOT NULL,
    `mb_memo` TEXT NOT NULL,
    `mb_point` INTEGER NOT NULL,
    `mb_step` ENUM('0', '1', '2', '3', '4', '5', '6') NOT NULL DEFAULT '0',
    `mb_service_type` VARCHAR(16) NULL,
    `mb_service_time` VARCHAR(50) NULL,
    `mb_charge` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `mb_ready` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `mb_seat_type` INTEGER NULL,
    `mb_seat` INTEGER NULL,
    `mb_start` DATE NULL,
    `mb_start_time` TIME(0) NULL,
    `mb_end` DATE NULL,
    `mb_end_time` TIME(0) NULL,
    `mb_code` VARCHAR(40) NOT NULL,
    `mb_service_time2` VARCHAR(50) NULL,
    `mb_seat_type2` INTEGER NULL,
    `mb_seat2` INTEGER NULL,
    `mb_start2` DATE NULL,
    `mb_end2` DATE NULL,
    `mb_online` ENUM('Y', 'O', 'N') NOT NULL DEFAULT 'N',
    `mb_online_date` DATETIME(0) NULL,
    `mb_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mb_delete_date` DATETIME(0) NULL,
    `mb_ip` VARCHAR(40) NOT NULL,
    `mb_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `mb_regdate` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `mb_service_type2` ENUM('H', 'D') NULL,

    INDEX `amb_no`(`amb_no`),
    INDEX `mb_code`(`mb_code`),
    INDEX `mb_delete`(`mb_delete`),
    INDEX `mb_phone`(`mb_phone`),
    INDEX `mb_step`(`mb_step`),
    INDEX `n2_member_temp_mb_seat2_index`(`mb_seat2`),
    INDEX `n2_member_temp_mb_seat_index`(`mb_seat`),
    INDEX `n2_member_temp_sp_no_mb_delete_index`(`sp_no`, `mb_delete`),
    INDEX `search`(`mb_name`, `mb_phone`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`mb_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_member_api` (
    `ap_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `mb_phone` VARCHAR(255) NULL,
    `co_name` VARCHAR(255) NULL,
    `reserve_sdate` DATE NULL,
    `reserve_stime` TIME(0) NULL,
    `reserve_edate` DATE NULL,
    `reserve_etime` TIME(0) NULL,
    `real_sdate` DATE NULL,
    `real_stime` TIME(0) NULL,
    `real_edate` DATE NULL,
    `real_etime` TIME(0) NULL,
    `reserve_price` INTEGER NOT NULL DEFAULT 0,
    `reserve_vat` FLOAT NOT NULL DEFAULT 0.000,
    `reserve_ori_price` FLOAT NOT NULL DEFAULT 0.000,
    `seat_cnt` INTEGER NOT NULL DEFAULT 1,
    `reg_date` TIMESTAMP(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `update_date` TIMESTAMP(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),

    INDEX `mb_no`(`mb_no`),
    INDEX `mb_phone`(`mb_phone`),
    INDEX `real_sdate`(`real_sdate`, `real_stime`, `real_edate`, `real_etime`),
    INDEX `reserve_sdate`(`reserve_sdate`, `reserve_stime`, `reserve_edate`, `reserve_etime`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`ap_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_member_log` (
    `mbl_no` INTEGER NOT NULL AUTO_INCREMENT,
    `mb_no` INTEGER NULL,
    `mn_no` INTEGER NULL,
    `mbl_type` ENUM('M', 'U', 'D') NOT NULL DEFAULT 'U',
    `mbl_action` VARCHAR(10) NOT NULL,
    `mbl_ip` VARCHAR(40) NOT NULL,
    `mbl_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `mblNo`(`mbl_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_member_service` (
    `ms_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NULL,
    `mb_no` INTEGER NULL,
    `ms_seat` INTEGER NULL,
    `ms_start_date` DATETIME(0) NULL,
    `mb_end_date` DATETIME(0) NULL,
    `ms_service_type` INTEGER NULL,
    `ms_service_time` INTEGER NULL,
    `ms_step` INTEGER NULL,
    `ms_regdate` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `ms_update` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `n2_member_service_sp_no_mb_no_ms_seat_ms_service_type_uindex`(`sp_no`, `mb_no`, `ms_seat`, `ms_service_type`),
    PRIMARY KEY (`ms_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_member_temp` (
    `mb_no` INTEGER NULL,
    `sp_no` INTEGER NULL,
    `status` INTEGER NULL,
    `coupon` VARCHAR(128) NULL,
    `phone` VARCHAR(128) NULL,
    `code` VARCHAR(255) NULL,
    `mbUpdateAt` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `mbRegdateAt` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_memo` (
    `mm_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `mm_writer` VARCHAR(40) NOT NULL,
    `mm_memo` TEXT NOT NULL,
    `mm_ip` VARCHAR(40) NOT NULL,
    `mm_step` ENUM('1', '2', '3', '-1') NOT NULL,
    `mm_history` TEXT NOT NULL,
    `mm_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`mm_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_message` (
    `ms_no` INTEGER NOT NULL AUTO_INCREMENT,
    `ms_sms_id` VARCHAR(80) NOT NULL,
    `ms_api` ENUM('aligo', 'hahaland', 'ppurio', 'infobank_text', 'infobank_katalk') NOT NULL DEFAULT 'aligo',
    `sp_no` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `mst_no` INTEGER NULL,
    `msg_id` INTEGER NOT NULL,
    `ms_mode` ENUM('S', 'D', 'M') NOT NULL DEFAULT 'S',
    `ms_sender` VARCHAR(15) NOT NULL,
    `ms_receiver` VARCHAR(150) NOT NULL,
    `ms_receiver_list` TEXT NOT NULL,
    `ms_msg` TEXT NOT NULL,
    `ms_result` ENUM('Y', 'N') NOT NULL,
    `ms_test` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ms_type` VARCHAR(3) NOT NULL,
    `ms_cost` INTEGER NOT NULL,
    `ms_count` INTEGER NOT NULL,
    `ms_price_old` INTEGER NOT NULL,
    `ms_price` INTEGER NOT NULL,
    `ms_money_old` INTEGER NOT NULL,
    `ms_money` INTEGER NOT NULL,
    `ms_point_old` INTEGER NOT NULL,
    `ms_point` INTEGER NOT NULL,
    `ms_reserve` DATETIME(0) NULL,
    `ms_regdate` DATETIME(0) NOT NULL,
    `ms_regdate2` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `ms_regdate2`(`ms_regdate2`),
    INDEX `sp_no`(`sp_no`),
    INDEX `sp_no_2`(`sp_no`, `mb_no`, `mst_no`),
    PRIMARY KEY (`ms_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_message_crd_log` (
    `mscl_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `mscl_type_code` TINYINT NOT NULL DEFAULT 10,
    `sp_no` INTEGER UNSIGNED NOT NULL,
    `mb_no` INTEGER UNSIGNED NOT NULL,
    `mscl_result_code` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `mscl_dsc` VARCHAR(255) NULL,
    `mscl_data` LONGTEXT NULL,
    `mscl_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `n2_message_crd_log_mb_no_index`(`mb_no`),
    INDEX `n2_message_crd_log_sp_no_index`(`sp_no`),
    INDEX `n2_message_crd_log_sp_no_mb_no_mscl_type_code_index`(`sp_no`, `mb_no`, `mscl_type_code`),
    PRIMARY KEY (`mscl_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_message_order` (
    `mso_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `mso_pay_type` ENUM('card', 'vbank', 'bank', 'balance') NOT NULL DEFAULT 'bank',
    `mso_code` CHAR(10) NULL,
    `mso_price` INTEGER NOT NULL,
    `mso_vat` INTEGER NOT NULL,
    `mso_fee` INTEGER NOT NULL,
    `sp_money` INTEGER NOT NULL,
    `sp_ms_price` INTEGER NOT NULL,
    `mso_step` ENUM('1', '2', '-1', '-2') NOT NULL,
    `mso_date` DATE NOT NULL,
    `mso_chargedate` DATE NULL,
    `mso_refunddate` DATE NULL,
    `mso_refund_account_bank_code` VARCHAR(40) NULL,
    `mso_refund_account_bank` VARCHAR(40) NULL,
    `mso_refund_account_number` VARCHAR(40) NULL,
    `mso_refund_account_holder` VARCHAR(40) NULL,
    `mso_name` VARCHAR(80) NOT NULL,
    `mso_memo` TEXT NOT NULL,
    `mso_data` LONGTEXT NULL,
    `mso_ip` VARCHAR(40) NOT NULL,
    `mso_history` TEXT NOT NULL,
    `mso_regdate` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `mso_code`(`mso_code`),
    PRIMARY KEY (`mso_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_message_report` (
    `msr_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `msr_sms_count` INTEGER NOT NULL,
    `msr_sms_price` INTEGER NOT NULL,
    `msr_sms_money` INTEGER NOT NULL,
    `msr_sms_point` INTEGER NOT NULL,
    `msr_lms_count` INTEGER NOT NULL,
    `msr_lms_price` INTEGER NOT NULL,
    `msr_lms_money` INTEGER NOT NULL,
    `msr_lms_point` INTEGER NOT NULL,
    `msr_mms_count` INTEGER NOT NULL,
    `msr_mms_price` INTEGER NOT NULL,
    `msr_mms_money` INTEGER NOT NULL,
    `msr_mms_point` INTEGER NOT NULL,
    `msr_push_count` INTEGER NOT NULL,
    `msr_push_price` INTEGER NOT NULL,
    `msr_push_money` INTEGER NOT NULL,
    `msr_push_point` INTEGER NOT NULL,
    `msr_total_price` INTEGER NOT NULL,
    `msr_total_money` INTEGER NOT NULL,
    `msr_total_cost` INTEGER NOT NULL,
    `msr_total_point` INTEGER NOT NULL,
    `msr_total_count` INTEGER NOT NULL,
    `msr_date` DATE NOT NULL,

    INDEX `msr_date`(`msr_date`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`msr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_message_template` (
    `mst_no` INTEGER NOT NULL AUTO_INCREMENT,
    `mst_default` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NULL,
    `mst_action` VARCHAR(10) NOT NULL,
    `mst_option` VARCHAR(40) NULL,
    `mst_use_h` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mst_msg_h` VARCHAR(1000) NOT NULL,
    `mst_use_h2` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mst_msg_h2` VARCHAR(1000) NOT NULL,
    `mst_use_d` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mst_msg_d` VARCHAR(1000) NOT NULL,
    `mst_use_study` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mst_msg_study` VARCHAR(1000) NOT NULL,
    `mst_use_locker` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mst_msg_locker` VARCHAR(1000) NOT NULL,
    `mst_use_rebill` ENUM('Y', 'N') NULL DEFAULT 'N',
    `mst_msg_rebill` VARCHAR(1000) NULL,
    `mst_use_ticket` ENUM('Y', 'N') NULL DEFAULT 'N',
    `mst_msg_ticket` VARCHAR(1000) NULL,
    `mst_use_manager` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mst_msg_manager` VARCHAR(1000) NOT NULL,
    `mst_force` ENUM('Y', 'N') NOT NULL DEFAULT 'N',

    PRIMARY KEY (`mst_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_message_test` (
    `ms_no` INTEGER NOT NULL AUTO_INCREMENT,
    `ms_sms_id` VARCHAR(80) NOT NULL,
    `ms_api` ENUM('aligo', 'hahaland') NOT NULL DEFAULT 'aligo',
    `sp_no` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `mst_no` INTEGER NULL,
    `msg_id` INTEGER NOT NULL,
    `ms_mode` ENUM('S', 'D', 'M') NOT NULL DEFAULT 'S',
    `ms_sender` VARCHAR(15) NOT NULL,
    `ms_receiver` VARCHAR(150) NOT NULL,
    `ms_receiver_list` TEXT NOT NULL,
    `ms_msg` TEXT NOT NULL,
    `ms_result` ENUM('Y', 'N') NOT NULL,
    `ms_test` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ms_type` VARCHAR(3) NOT NULL,
    `ms_cost` INTEGER NOT NULL,
    `ms_count` INTEGER NOT NULL,
    `ms_price_old` INTEGER NOT NULL,
    `ms_price` INTEGER NOT NULL,
    `ms_money_old` INTEGER NOT NULL,
    `ms_money` INTEGER NOT NULL,
    `ms_point_old` INTEGER NOT NULL,
    `ms_point` INTEGER NOT NULL,
    `ms_reserve` DATETIME(0) NULL,
    `ms_regdate` DATETIME(0) NOT NULL,
    `ms_regdate2` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `ms_regdate2`(`ms_regdate2`),
    INDEX `sp_no`(`sp_no`),
    INDEX `sp_no_2`(`sp_no`, `mb_no`, `mst_no`),
    PRIMARY KEY (`ms_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_notice` (
    `nt_no` INTEGER NOT NULL AUTO_INCREMENT,
    `mn_no` INTEGER NOT NULL,
    `nt_category` VARCHAR(40) NOT NULL,
    `nt_title` VARCHAR(255) NOT NULL,
    `nt_dsc` TEXT NOT NULL,
    `nt_show` ENUM('Y', 'N') NOT NULL,
    `nt_popup_show` ENUM('Y', 'N') NULL DEFAULT 'N',
    `nt_history` TEXT NOT NULL,
    `nt_ip` VARCHAR(40) NOT NULL,
    `nt_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `nt_regdate` DATETIME(0) NOT NULL,
    `nt_popup_info` LONGTEXT NULL,

    UNIQUE INDEX `nt_no`(`nt_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_option` (
    `op_no` INTEGER NOT NULL AUTO_INCREMENT,
    `op_code` INTEGER UNSIGNED NULL,
    `op_type` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `spi_service_type` CHAR(11) NOT NULL DEFAULT '',
    `br_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `op_value` VARCHAR(512) NOT NULL DEFAULT '',
    `op_etc` TEXT NULL,
    `op_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `op_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `op_id` VARCHAR(128) NULL,

    INDEX `n2_option_sp_no_op_code_index`(`sp_no`, `op_code`),
    UNIQUE INDEX `n2_option_uni`(`sp_no`, `op_code`, `spi_service_type`, `op_id`),
    PRIMARY KEY (`op_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_order` (
    `od_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `dv_no` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `stc_no` INTEGER NOT NULL,
    `st_no` INTEGER NOT NULL,
    `lk_no` INTEGER NOT NULL,
    `sv_no` INTEGER NOT NULL,
    `sd_no` INTEGER NOT NULL,
    `od_code` CHAR(10) NULL,
    `od_locker` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `od_service_proc` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `od_type` ENUM('D', 'H', 'H2', 'S', 'C', 'A', 'G', 'L', 'T', 'R') NOT NULL,
    `od_sv_time` VARCHAR(50) NULL,
    `od_sv_start` DATE NULL,
    `od_sv_start_time` TIME(0) NULL,
    `od_sv_end` DATE NULL,
    `od_sv_end_time` TIME(0) NULL,
    `od_name` VARCHAR(255) NOT NULL,
    `od_sv_name` VARCHAR(255) NOT NULL,
    `od_item_name` VARCHAR(255) NOT NULL,
    `od_price` INTEGER NOT NULL,
    `od_dc_price` INTEGER NOT NULL,
    `od_total_price` INTEGER NOT NULL,
    `od_cash_price` INTEGER NULL,
    `od_card_price` INTEGER NULL,
    `od_quota` TINYINT NOT NULL,
    `od_memo` TEXT NOT NULL,
    `od_step` ENUM('1', '2', '3', '-1', '-2', '-3', '-4') NOT NULL,
    `od_refund_price` INTEGER NOT NULL,
    `od_cr_type` ENUM('0', '1', '2', '3') NULL DEFAULT '0',
    `od_cr_no` VARCHAR(13) NULL,
    `od_cr_data` TEXT NULL,
    `od_pay_type` ENUM('1', '2', '3', '4') NULL,
    `od_pay_data` TEXT NULL,
    `od_pay_date` DATE NULL,
    `od_cancle_data` TEXT NULL,
    `od_cancle_date` DATE NULL,
    `od_history` TEXT NOT NULL,
    `od_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `od_date` DATE NOT NULL DEFAULT ('0000-00-00'),
    `od_normal` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `od_refund` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `od_refund_date` DATE NOT NULL,
    `od_app` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `od_device_mode` ENUM('main', 'kiosk', 'app') NOT NULL DEFAULT 'main',

    UNIQUE INDEX `od_code`(`od_code`),
    INDEX `mb_no`(`mb_no`),
    INDEX `od_app`(`od_app`),
    INDEX `od_date`(`od_date`),
    INDEX `od_device_mode`(`od_device_mode`),
    INDEX `od_normal_2`(`sp_no`, `od_date`, `od_normal`),
    INDEX `od_refund`(`od_refund`, `od_refund_date`),
    INDEX `od_refund_2`(`sp_no`, `od_refund`),
    INDEX `od_regdate`(`od_regdate`),
    INDEX `od_step`(`od_step`),
    INDEX `sd_no`(`sd_no`, `od_normal`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`od_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_order_item` (
    `odi_no` INTEGER NOT NULL AUTO_INCREMENT,
    `od_no` INTEGER NOT NULL,
    `gd_no` INTEGER NULL,
    `gd_option` VARCHAR(255) NOT NULL,
    `gdp_no` INTEGER NULL,
    `svc_no` INTEGER NULL,
    `odi_name` VARCHAR(255) NOT NULL,
    `odi_price` INTEGER NOT NULL,
    `odi_ea` INTEGER NOT NULL,
    `odi_dc_price` INTEGER NOT NULL,
    `odi_total_price` INTEGER NOT NULL,

    INDEX `od_no`(`od_no`),
    PRIMARY KEY (`odi_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_order_pg_log` (
    `ordpl_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `shop_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ordi_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ordpl_setting_code` VARCHAR(20) NOT NULL DEFAULT 'iamport',
    `ordpl_setting_name` VARCHAR(20) NOT NULL DEFAULT '아임포트',
    `ordpl_pg_meta` VARCHAR(20) NOT NULL DEFAULT 'kcp',
    `ordpl_pay_method_meta` VARCHAR(20) NOT NULL DEFAULT '10',
    `ordpl_card_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `ordpl_name` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_amount` DECIMAL(20, 3) NOT NULL DEFAULT 0.000,
    `ordpl_tax_free` DECIMAL(20, 3) NOT NULL DEFAULT 0.000,
    `ordpl_vat` DECIMAL(20, 3) NOT NULL DEFAULT 0.000,
    `ordpl_currency` ENUM('KRW', 'USD', 'EUR', 'JPY') NOT NULL DEFAULT 'KRW',
    `ordpl_buyer_name` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_buyer_tel` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_buyer_email` VARCHAR(50) NOT NULL DEFAULT '',
    `ordpl_buyer_addr` VARCHAR(50) NOT NULL DEFAULT '',
    `ordpl_buyer_postcode` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_escrow_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ordpl_interest_free` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_card_quota` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_digital` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ordpl_vbank_due` DATE NOT NULL DEFAULT ('0000-00-00'),
    `ordpl_m_redirect_url` VARCHAR(100) NOT NULL DEFAULT '',
    `ordpl_app_scheme` VARCHAR(100) NOT NULL DEFAULT '',
    `ordpl_biz_num` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_card_code` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_card_name` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_success_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ordpl_result_code` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_result_msg` VARCHAR(200) NOT NULL DEFAULT '',
    `ordpl_imp_uid` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_paid_merchant_uid` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_paid_pay_method_meta` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_paid_amount` DECIMAL(20, 3) NOT NULL DEFAULT 0.000,
    `ordpl_status` ENUM('READY', 'PAID', 'CANCELLED', 'FAILED') NOT NULL DEFAULT 'READY',
    `ordpl_pg_provider` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_pg_tid` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_apply_num` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_paid_unix_date` INTEGER NOT NULL DEFAULT 0,
    `ordpl_approve_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `ordpl_receipt_url` VARCHAR(100) NOT NULL DEFAULT '',
    `ordpl_vbank_code` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_vbank_name` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_vbank_num` VARCHAR(100) NOT NULL DEFAULT '',
    `ordpl_vbank_holder` VARCHAR(80) NOT NULL DEFAULT '',
    `ordpl_vbank_unix_date` INTEGER NOT NULL DEFAULT 0,
    `ordpl_vbank_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `ordpl_vbank_due_date` DATE NOT NULL DEFAULT ('0000-00-00'),
    `ordpl_vbank_income_date` DATE NOT NULL DEFAULT ('0000-00-00'),
    `ordpl_vbank_input_name` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_tel_code` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_mobile_no` VARCHAR(20) NOT NULL DEFAULT '',
    `ordpl_biller_nm` VARCHAR(20) NOT NULL DEFAULT '',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `ordi_idx`(`ordi_idx`),
    INDEX `ordpl_pay_method_cd`(`ordpl_pay_method_meta`),
    INDEX `shop_idx`(`shop_idx`),
    PRIMARY KEY (`ordpl_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_partner_info_sub` (
    `ptifs_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `sp_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `ptifs_mobile_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ptifs_gps_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ptifs_x` DECIMAL(16, 13) NULL,
    `ptifs_y` DECIMAL(16, 13) NULL,
    `ptifs_location` VARCHAR(100) NOT NULL DEFAULT '',
    `ptifs_image` VARCHAR(200) NULL,
    `ptifs_sub_image` VARCHAR(200) NULL,
    `ptifs_sub_image2` VARCHAR(200) NULL,
    `ptifs_sub_image3` VARCHAR(200) NULL,
    `ptifs_desc` VARCHAR(100) NOT NULL DEFAULT '',
    `ptifs_opertime_label` VARCHAR(50) NOT NULL DEFAULT '월~일',
    `ptifs_opertime_value` VARCHAR(50) NOT NULL DEFAULT '',
    `ptifs_closed_label` VARCHAR(50) NOT NULL DEFAULT '휴무일',
    `ptifs_closed_value` VARCHAR(50) NOT NULL DEFAULT '',
    `ptifs_way` VARCHAR(200) NOT NULL DEFAULT '',
    `ptifs_allday_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ptifs_locker_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ptifs_studyroom_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ptifs_locker_guide` MEDIUMTEXT NULL,
    `cmm_use_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `cmm_del_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    UNIQUE INDEX `sp_no`(`sp_idx`),
    INDEX `ptifs_gps`(`ptifs_gps_yn`),
    PRIMARY KEY (`ptifs_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_pay` (
    `py_no` INTEGER NOT NULL AUTO_INCREMENT,
    `od_no` INTEGER NOT NULL,
    `py_group` INTEGER NULL,
    `py_regno` ENUM('1', '2', '3') NOT NULL,
    `py_catid` VARCHAR(10) NULL,
    `py_local` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `py_local_catid` VARCHAR(10) NULL,
    `py_van` ENUM('KICC', 'NICE', 'IAMPORT', 'PAYCO', 'FISERV', 'KCP', 'KAKAO', 'NAVER', 'TOSS', 'COUPON', 'CODE', 'BESTPAY') NOT NULL DEFAULT 'NICE',
    `py_type` ENUM('1', '2', '3', '4') NOT NULL,
    `py_price` INTEGER NOT NULL,
    `py_vat` INTEGER NOT NULL,
    `py_quota` INTEGER NULL,
    `py_cr_type` ENUM('0', '1', '2') NULL DEFAULT '0',
    `py_cr_no` VARCHAR(13) NULL,
    `py_step` ENUM('1', '2', '3', '4', '-1', '-2', '-3') NOT NULL,
    `py_data` TEXT NOT NULL,
    `py_date` DATETIME(0) NOT NULL,
    `py_cancle_data` TEXT NULL,
    `py_cancle_date` DATETIME(0) NULL,
    `py_cancle_date2` DATE NULL,
    `py_history` TEXT NOT NULL,
    `py_regdate` DATETIME(0) NOT NULL,

    INDEX `n2_pay_py_regdate_index`(`py_regdate`),
    INDEX `n2_pay_py_regdate_py_step_index`(`py_regdate`, `py_step`),
    INDEX `n2_pay_py_step_index`(`py_step`),
    INDEX `od_no`(`od_no`),
    INDEX `py_regno`(`py_regno`, `py_type`, `py_cancle_date2`),
    INDEX `py_regno_2`(`py_regno`, `py_type`, `py_cr_type`, `py_cancle_date2`),
    PRIMARY KEY (`py_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_pay_log` (
    `pyl_no` INTEGER NOT NULL AUTO_INCREMENT,
    `pyl_order` ENUM('PARTNER', 'APP') NOT NULL DEFAULT 'APP',
    `sp_no` INTEGER NOT NULL,
    `od_no` INTEGER NULL,
    `od_code` CHAR(10) NULL,
    `py_no` INTEGER NULL,
    `mso_code` CHAR(10) NULL,
    `mso_no` INTEGER NULL,
    `pyl_type` ENUM('PAYMENT', 'REFUND', 'REVOKE') NOT NULL,
    `pyl_van` ENUM('KICC', 'NICE', 'IAMPORT', 'PAYCO', 'FISERV', 'KCP', 'KAKAO', 'NAVER', 'TOSS', 'COUPON', 'BESTPAY') NOT NULL,
    `pyl_payid` VARCHAR(20) NULL,
    `pyl_approval_number` INTEGER NULL,
    `pyl_request` LONGTEXT NOT NULL,
    `pyl_response` LONGTEXT NOT NULL,
    `pyl_ip` VARCHAR(40) NOT NULL,
    `pyl_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `pyl_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `pyl_approval_number`(`pyl_approval_number`),
    INDEX `pyl_order`(`pyl_order`),
    INDEX `pyl_payid`(`pyl_payid`),
    UNIQUE INDEX `od_code`(`od_code`, `mso_code`, `pyl_payid`),
    PRIMARY KEY (`pyl_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_rebill_deposit_config` (
    `rdc_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `svc_no` INTEGER NOT NULL,
    `stc_no` INTEGER NOT NULL,
    `rdc_price` INTEGER NULL DEFAULT 0,
    `isDepositUse` ENUM('Y', 'N') NOT NULL,
    `rdc_regdate` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`rdc_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_rebill_deposit_payment` (
    `rdp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `od_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mb_no` INTEGER NULL,
    `st_no` INTEGER NOT NULL,
    `stc_no` INTEGER NOT NULL,
    `rdp_shop_id` VARCHAR(55) NOT NULL,
    `rdp_price` INTEGER NOT NULL DEFAULT 0,
    `rdp_pay_type` ENUM('1', '2', '3', '4', '6', '7', '15', '16', '17', '21', '23') NOT NULL,
    `rdp_pay_state` ENUM('1', '4', '8', '9', '10', '32', '64', '70', '71') NOT NULL,
    `rdp_mul_no` INTEGER NULL,
    `rdp_card_name` VARCHAR(100) NULL,
    `rdp_card_num` VARCHAR(100) NULL,
    `rdp_pay_authcode` VARCHAR(30) NULL,
    `rdp_amount_taxable` INTEGER NOT NULL DEFAULT 0,
    `rdp_amount_taxfree` INTEGER NOT NULL DEFAULT 0,
    `rdp_amount_vat` INTEGER NOT NULL DEFAULT 0,
    `rdp_cancel_date` DATETIME(0) NULL,
    `rdp_cancel_memo` VARCHAR(100) NULL,
    `isPaid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `rdp_regdate` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`rdp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_rebill_payment` (
    `rp_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `od_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `st_no` INTEGER NOT NULL,
    `stc_no` INTEGER NOT NULL,
    `rp_shop_id` VARCHAR(55) NOT NULL,
    `rp_goodname` VARCHAR(255) NOT NULL DEFAULT '',
    `rp_price` INTEGER NOT NULL,
    `rp_recv_phone` VARCHAR(15) NULL,
    `rp_memo` VARCHAR(255) NULL,
    `rp_pay_memo` VARCHAR(255) NULL,
    `rp_pay_type` INTEGER NOT NULL,
    `rp_pay_state` ENUM('1', '4', '8', '9', '10', '32', '64', '70', '71', '-1', '-2') NOT NULL,
    `rp_mul_no` INTEGER NULL,
    `rp_payurl` VARCHAR(100) NULL,
    `rp_cstrul` VARCHAR(100) NULL,
    `rp_origin_mul_no` INTEGER NULL DEFAULT 0,
    `rp_origin_price` INTEGER NULL DEFAULT 0,
    `rp_amount_taxable` INTEGER NOT NULL,
    `rp_amount_taxfree` INTEGER NOT NULL,
    `rp_amount_vat` INTEGER NOT NULL,
    `rp_buyerid` VARCHAR(100) NULL,
    `rp_cancel_date` DATE NULL,
    `rp_cancel_memo` VARCHAR(100) NULL,
    `rp_rebill_no` VARCHAR(100) NOT NULL,
    `rp_pay_authcode` VARCHAR(30) NULL,
    `rp_card_name` VARCHAR(30) NULL,
    `rp_card_quota` INTEGER NULL,
    `rp_card_num` VARCHAR(30) NULL,
    `rp_paydate` DATE NULL,
    `rp_req_date` DATE NULL,
    `rp_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `rp_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`rp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_reserve` (
    `rs_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `mn_no` INTEGER NULL,
    `rs_writer` VARCHAR(40) NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `rs_name` VARCHAR(40) NOT NULL,
    `rs_phone` VARCHAR(20) NOT NULL,
    `rs_sex` ENUM('F', 'M') NOT NULL,
    `stc_no` INTEGER NOT NULL,
    `rs_dsc` TEXT NOT NULL,
    `rs_step` ENUM('1', '2', '3', '-1') NOT NULL,
    `rs_ip` VARCHAR(40) NOT NULL,
    `rs_history` TEXT NOT NULL,
    `rs_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`rs_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_sales_calc_app` (
    `ssca_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `ssca_type` VARCHAR(20) NOT NULL DEFAULT 'app',
    `ssca_catid` VARCHAR(10) NOT NULL,
    `ssca_taxfree` ENUM('Y', 'N') NOT NULL,
    `ssca_order_date` DATE NOT NULL,
    `ssca_order_price` INTEGER NOT NULL,
    `ssca_order_count` INTEGER NOT NULL,
    `ssca_refund_price` INTEGER NOT NULL,
    `ssca_refund_count` INTEGER NOT NULL,
    `ssca_fee_rate` DECIMAL(4, 2) NOT NULL,
    `ssca_fee_price` INTEGER NOT NULL,
    `ssca_fee_vat` INTEGER NOT NULL,
    `ssca_date` DATE NOT NULL,
    `ssca_price` INTEGER NOT NULL,
    `ssca_modify` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `ssca_modify_price` INTEGER NULL,
    `ssca_modify_memo` VARCHAR(255) NULL,
    `ssca_modify_date` TIMESTAMP(0) NULL,
    `ssca_paid_date` TIMESTAMP(0) NULL,
    `ssca_spb_no` INTEGER NULL,
    `ssca_step` ENUM('1', '2', '3') NOT NULL DEFAULT 1,
    `ssca_history` TEXT NOT NULL,
    `ssca_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `br_no`(`br_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `ssca_date`(`ssca_date`),
    INDEX `ssca_order_date`(`ssca_order_date`),
    PRIMARY KEY (`ssca_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_sales_report` (
    `ssr_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `ssr_order` INTEGER NOT NULL,
    `ssr_order_count` INTEGER NOT NULL,
    `ssr_order_count_app` INTEGER NOT NULL,
    `ssr_order_count_study` INTEGER NOT NULL DEFAULT 0,
    `ssr_order_count_kiosk` INTEGER NOT NULL,
    `ssr_order_count_main` INTEGER NOT NULL,
    `ssr_discount` INTEGER NOT NULL,
    `ssr_discount_count` INTEGER NOT NULL,
    `ssr_catid` VARCHAR(10) NOT NULL,
    `ssr_payment` INTEGER NOT NULL,
    `ssr_refund` INTEGER NOT NULL,
    `ssr_refund_count` INTEGER NOT NULL,
    `ssr_refund_count_app` INTEGER NOT NULL,
    `ssr_refund_count_study` INTEGER NOT NULL DEFAULT 0,
    `ssr_refund_count_kiosk` INTEGER NOT NULL,
    `ssr_refund_count_main` INTEGER NOT NULL,
    `ssr_cash` INTEGER NULL,
    `ssr_cash_count` INTEGER NOT NULL,
    `ssr_cash_receipt` INTEGER NULL,
    `ssr_cash_receipt_count` INTEGER NOT NULL,
    `ssr_card` INTEGER NULL,
    `ssr_card_count` INTEGER NOT NULL,
    `ssr_simple_pay` INTEGER NOT NULL,
    `ssr_simple_pay_count` INTEGER NOT NULL,
    `ssr_app` INTEGER NULL DEFAULT 0,
    `ssr_app_count` INTEGER NOT NULL DEFAULT 0,
    `ssr_study` INTEGER NOT NULL DEFAULT 0,
    `ssr_study_count` INTEGER NOT NULL DEFAULT 0,
    `ssr_refund_cash` INTEGER NULL,
    `ssr_refund_cash_count` INTEGER NOT NULL,
    `ssr_refund_cash_receipt` INTEGER NULL,
    `ssr_refund_cash_receipt_count` INTEGER NOT NULL,
    `ssr_refund_card` INTEGER NULL,
    `ssr_refund_card_count` INTEGER NOT NULL,
    `ssr_refund_simple_pay` INTEGER NOT NULL,
    `ssr_refund_simple_pay_count` INTEGER NOT NULL,
    `ssr_refund_app` INTEGER NULL,
    `ssr_refund_study` INTEGER NOT NULL DEFAULT 0,
    `ssr_refund_app_count` INTEGER NOT NULL,
    `ssr_refund_study_count` INTEGER NOT NULL DEFAULT 0,
    `ssr_date` DATE NOT NULL,

    INDEX `br_no`(`br_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `ssr_date`(`ssr_date`),
    PRIMARY KEY (`ssr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_sales_report_1` (
    `ssr_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NULL,
    `sp_no` INTEGER NULL,
    `ssr_order` INTEGER NULL,
    `ssr_order_count` INTEGER NULL,
    `ssr_order_count_app` INTEGER NULL,
    `ssr_order_count_kiosk` INTEGER NULL,
    `ssr_order_count_main` INTEGER NULL,
    `ssr_discount` INTEGER NULL,
    `ssr_discount_count` INTEGER NULL,
    `ssr_catid` VARCHAR(10) NULL,
    `ssr_payment` INTEGER NULL,
    `ssr_refund` INTEGER NULL,
    `ssr_refund_count` INTEGER NULL,
    `ssr_refund_count_app` INTEGER NULL,
    `ssr_refund_count_kiosk` INTEGER NULL,
    `ssr_refund_count_main` INTEGER NULL,
    `ssr_cash` INTEGER NULL,
    `ssr_cash_count` INTEGER NULL,
    `ssr_cash_receipt` INTEGER NULL,
    `ssr_cash_receipt_count` INTEGER NULL,
    `ssr_card` INTEGER NULL,
    `ssr_card_count` INTEGER NULL,
    `ssr_simple_pay` INTEGER NOT NULL,
    `ssr_simple_pay_count` INTEGER NOT NULL,
    `ssr_app` INTEGER NULL,
    `ssr_app_count` INTEGER NULL,
    `ssr_refund_cash` INTEGER NULL,
    `ssr_refund_cash_count` INTEGER NULL,
    `ssr_refund_cash_receipt` INTEGER NULL,
    `ssr_refund_cash_receipt_count` INTEGER NULL,
    `ssr_refund_card` INTEGER NULL,
    `ssr_refund_card_count` INTEGER NULL,
    `ssr_refund_simple_pay` INTEGER NOT NULL,
    `ssr_refund_simple_pay_count` INTEGER NOT NULL,
    `ssr_refund_app` INTEGER NULL,
    `ssr_refund_app_count` INTEGER NULL,
    `ssr_date` DATE NULL,

    INDEX `br_no`(`br_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `ssr_date`(`ssr_date`),
    PRIMARY KEY (`ssr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_sales_report_new` (
    `ssr_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `ssr_catid` VARCHAR(10) NOT NULL,
    `ssr_payment` INTEGER NOT NULL,
    `ssr_refund_payment` INTEGER NOT NULL,
    `ssr_device` ENUM('kiosk', 'main', 'app') NOT NULL,
    `ssr_type` ENUM('cash', 'receipt', 'card', 'discount', 'simple_pay', 'outer') NOT NULL,
    `ssr_count` INTEGER NOT NULL,
    `ssr_date` DATE NOT NULL,

    INDEX `br_no`(`br_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `ssr_date`(`ssr_date`),
    PRIMARY KEY (`ssr_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_seat` (
    `st_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `stc_no` INTEGER NOT NULL,
    `str_no` INTEGER NOT NULL,
    `mb_no` INTEGER NULL,
    `st_temp` INTEGER NULL,
    `st_temp_time` TIMESTAMP(0) NULL,
    `mb_no_tmp` INTEGER NULL,
    `st_idx` SMALLINT NOT NULL,
    `st_name` VARCHAR(40) NOT NULL,
    `st_min` TINYINT NULL DEFAULT 1,
    `st_max` TINYINT NULL,
    `st_price` INTEGER NULL,
    `st_add_price` INTEGER NULL DEFAULT 0,
    `st_code` SMALLINT NULL,
    `st_light` TINYINT NOT NULL,
    `st_color` SMALLINT NOT NULL,
    `st_lux` TINYINT NOT NULL,
    `st_state` TINYINT NOT NULL DEFAULT 1,
    `st_retry` SMALLINT NOT NULL,
    `st_x` INTEGER NOT NULL,
    `st_y` INTEGER NOT NULL,
    `st_z` INTEGER NOT NULL,
    `st_w` INTEGER NOT NULL,
    `st_h` INTEGER NOT NULL,
    `st_x2` INTEGER NOT NULL,
    `st_y2` INTEGER NOT NULL,
    `st_r2` SMALLINT NOT NULL,
    `st_z2` INTEGER NOT NULL,
    `st_w2` INTEGER NOT NULL,
    `st_h2` INTEGER NOT NULL,
    `st_use` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `st_device` SMALLINT NOT NULL,
    `st_device_id` SMALLINT NOT NULL,
    `st_mn_font_size` SMALLINT NOT NULL,
    `st_ki_font_size` SMALLINT NOT NULL,

    INDEX `mb_no`(`mb_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `st_idx`(`st_idx`),
    INDEX `st_temp`(`st_temp`),
    INDEX `stc_no`(`stc_no`),
    INDEX `str_no`(`str_no`),
    PRIMARY KEY (`st_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_seat_config` (
    `stc_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `stc_name` VARCHAR(50) NOT NULL,
    `stc_image` VARCHAR(50) NOT NULL,
    `stc_title` VARCHAR(255) NOT NULL,
    `stc_dsc` VARCHAR(1000) NOT NULL,
    `stc_use` ENUM('Y', 'N') NOT NULL,
    `stc_show` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `stc_gender` VARCHAR(10) NULL,
    `stc_memo` TEXT NOT NULL,
    `stc_order` INTEGER NOT NULL,
    `stc_etc` VARCHAR(128) NULL,
    `stc_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `stc_regdate` DATETIME(0) NOT NULL,
    `stc_type` ENUM('free', 'fix', 'room', 'none', 'admin') NOT NULL DEFAULT 'none',

    INDEX `stc_name`(`stc_name`),
    INDEX `stc_order`(`stc_order`),
    INDEX `stc_show`(`stc_show`),
    INDEX `stc_use`(`stc_use`),
    PRIMARY KEY (`stc_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_seat_room` (
    `str_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `str_sex` ENUM('A', 'M', 'F') NOT NULL DEFAULT 'A',
    `str_name` VARCHAR(255) NOT NULL,
    `str_name2` VARCHAR(255) NOT NULL,
    `str_w` INTEGER NOT NULL,
    `str_h` INTEGER NOT NULL,
    `str_x` INTEGER NOT NULL,
    `str_y` INTEGER NOT NULL,
    `str_z` INTEGER NOT NULL,
    `str_x2` INTEGER NOT NULL,
    `str_y2` INTEGER NOT NULL,
    `str_z2` INTEGER NOT NULL,
    `str_w2` INTEGER NOT NULL,
    `str_h2` INTEGER NOT NULL,
    `str_bg` ENUM('Y', 'N') NULL,
    `str_auto` ENUM('Y', 'N') NULL,
    `str_auto2` ENUM('Y', 'N') NULL,

    INDEX `str_bg`(`str_bg`),
    PRIMARY KEY (`str_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_service` (
    `sv_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NULL,
    `sp_no` INTEGER NOT NULL,
    `stc_no` INTEGER NOT NULL,
    `st_no` INTEGER NULL,
    `lk_no` INTEGER NULL,
    `mb_no` INTEGER NOT NULL,
    `od_no` INTEGER NOT NULL,
    `sv_name` VARCHAR(255) NOT NULL,
    `sv_time2` SMALLINT NULL,
    `sv_time` VARCHAR(50) NULL,
    `sv_start` DATE NOT NULL,
    `sv_start_time` TIME(0) NULL,
    `sv_end` DATE NOT NULL,
    `sv_end_time` TIME(0) NULL,
    `sv_use_time2` INTEGER NOT NULL,
    `sv_locker` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sv_unit` ENUM('T', 'H', 'H2', 'D', 'L', 'R') NOT NULL,
    `sv_step` ENUM('1', '2', '3', '-1', '-2') NOT NULL,
    `sv_ready` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sv_history` TEXT NOT NULL,
    `sv_regdate` DATETIME(0) NOT NULL,

    INDEX `mb_no`(`mb_no`),
    INDEX `n2_service_sp_no_mb_no_sv_unit_sv_step_index`(`sp_no`, `mb_no`, `sv_unit`, `sv_step`),
    INDEX `n2_service_sv_end_index`(`sv_end`),
    INDEX `sp_no`(`sp_no`),
    INDEX `sv_start`(`sv_start`, `sv_end`, `sv_step`),
    INDEX `sv_step`(`sv_step`),
    PRIMARY KEY (`sv_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_service_config` (
    `svc_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NULL,
    `stc_no` INTEGER NULL,
    `svc_name` VARCHAR(80) NOT NULL,
    `svc_periot` INTEGER NOT NULL,
    `svc_type` ENUM('H', 'H2', 'D', 'W', 'M', 'T', 'L', 'R') NOT NULL,
    `svc_locker` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `svc_price_tax_y` INTEGER NOT NULL,
    `svc_price_tax_n` INTEGER NOT NULL,
    `svc_price` INTEGER NOT NULL,
    `svc_dsc` VARCHAR(40) NOT NULL,
    `svc_price2_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `svc_price2_tax_y` INTEGER NOT NULL,
    `svc_price2_tax_n` INTEGER NOT NULL,
    `svc_price2` INTEGER NOT NULL,
    `svc_dsc2` VARCHAR(40) NOT NULL,
    `svc_range` ENUM('RANGE_1D', 'RANGE_1M', 'RANGE_2M', 'RANGE_nD', 'RANGE_nM', 'RANGE_nH') NULL,
    `svc_range2` INTEGER NULL,
    `svc_discount` TINYTEXT NULL,
    `svc_etc` TEXT NULL,
    `svc_default` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `svc_use` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `svc_use_app` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `svc_delete` ENUM('N', 'Y') NOT NULL DEFAULT 'N',

    INDEX `sp_no`(`sp_no`, `stc_no`),
    INDEX `svc_price`(`svc_price`),
    PRIMARY KEY (`svc_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_service_history` (
    `svh_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sv_no` INTEGER NOT NULL,
    `svh_history` TEXT NOT NULL,
    `svh_update` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `svh_regdate` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `n2_service_history_sv_no_index`(`sv_no`),
    INDEX `n2_service_history_svh_no_index`(`svh_no`),
    PRIMARY KEY (`svh_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_service_pause` (
    `svp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `sv_no` INTEGER NULL,
    `mb_no` INTEGER NULL,
    `sv_step` ENUM('1', '2', '-2') NOT NULL,
    `svp_pause_start` VARCHAR(10) NULL,
    `svp_pause_end` VARCHAR(10) NULL,
    `svp_pause_days` INTEGER NULL,
    `svp_pause_reason` VARCHAR(250) NULL,
    `svp_status` BOOLEAN NULL,
    `svp_cancel_regdate` TIMESTAMP(0) NULL,
    `svp_regdate` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `sp_no`(`sp_no`),
    INDEX `sv_no`(`sv_no`),
    PRIMARY KEY (`svp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_sessions` (
    `id` VARCHAR(40) NOT NULL,
    `ip_address` VARCHAR(45) NOT NULL,
    `timestamp` INTEGER NULL,
    `data` BLOB NOT NULL,

    INDEX `id`(`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shieldus_device` (
    `sdv_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NULL,
    `sdv_name` VARCHAR(20) NOT NULL,
    `sdv_code` VARCHAR(8) NOT NULL,
    `sdv_local_ip` INTEGER NULL,
    `sdv_entrance_start_time` VARCHAR(5) NULL,
    `sdv_entrance_end_time` VARCHAR(5) NULL,

    INDEX `n2_shieldus_device_sdv_code_index`(`sdv_code`),
    INDEX `n2_shieldus_device_sp_no_index`(`sp_no`),
    UNIQUE INDEX `n2_shieldus_device_pk`(`sp_no`, `sdv_code`),
    PRIMARY KEY (`sdv_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop` (
    `sp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_id` INTEGER NOT NULL,
    `sp_no_key` VARCHAR(80) NOT NULL,
    `sp_skin` VARCHAR(10) NOT NULL DEFAULT 'zaksim',
    `sp_title` VARCHAR(80) NOT NULL,
    `sp_title3` VARCHAR(80) NOT NULL,
    `sp_system` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_env` ENUM('production', 'testing', 'development', 'beta') NOT NULL DEFAULT 'production',
    `sp_mobile` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_gps` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_x` DECIMAL(16, 13) NULL,
    `sp_y` DECIMAL(16, 13) NULL,
    `sp_location` VARCHAR(100) NOT NULL,
    `sp_direct` ENUM('Y', 'N', 'O') NOT NULL DEFAULT 'N',
    `sp_state` VARCHAR(40) NOT NULL,
    `sp_regno` VARCHAR(24) NOT NULL,
    `sp_catid` VARCHAR(10) NULL,
    `sp_regno2` VARCHAR(24) NOT NULL,
    `sp_catid2` VARCHAR(10) NULL,
    `sp_regno3` VARCHAR(24) NOT NULL,
    `sp_catid3` VARCHAR(10) NOT NULL,
    `sp_name` VARCHAR(80) NOT NULL,
    `sp_name2` VARCHAR(80) NOT NULL,
    `sp_name3` VARCHAR(80) NOT NULL,
    `sp_ceo` VARCHAR(20) NOT NULL,
    `sp_ceo2` VARCHAR(20) NOT NULL,
    `sp_ceo3` VARCHAR(20) NOT NULL,
    `sp_birth` DATE NOT NULL,
    `sp_postcode` VARCHAR(20) NOT NULL,
    `sp_addr` VARCHAR(255) NOT NULL,
    `sp_addr3` VARCHAR(255) NOT NULL,
    `sp_addr_road` VARCHAR(255) NOT NULL,
    `sp_addr_jibun` VARCHAR(255) NOT NULL,
    `sp_addr_detail` VARCHAR(255) NOT NULL,
    `sp_addr_extra` VARCHAR(255) NOT NULL,
    `sp_email` VARCHAR(100) NOT NULL,
    `sp_phone` VARCHAR(20) NOT NULL,
    `sp_tel` VARCHAR(20) NOT NULL,
    `sp_tel3` VARCHAR(20) NOT NULL,
    `sp_fax` VARCHAR(20) NOT NULL,
    `sp_open` DATE NOT NULL,
    `sp_business` VARCHAR(50) NOT NULL,
    `sp_type` VARCHAR(50) NOT NULL,
    `sp_memo` TEXT NOT NULL,
    `sp_image` VARCHAR(255) NOT NULL,
    `sp_image2` VARCHAR(255) NOT NULL,
    `sp_image3` VARCHAR(255) NOT NULL,
    `sp_logo_image1` VARCHAR(255) NULL,
    `sp_logo_image2` VARCHAR(255) NULL,
    `sp_logo_image3` VARCHAR(255) NULL,
    `sp_logo_image4` VARCHAR(255) NULL,
    `sp_logo_image5` VARCHAR(255) NULL,
    `sp_history` TEXT NOT NULL,
    `sp_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_delete_date` TIMESTAMP(0) NULL,
    `sp_history2` TEXT NOT NULL,
    `sp_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `sp_regdate` DATETIME(0) NOT NULL,
    `sp_taxfree` ENUM('Y', 'N', 'C') NOT NULL DEFAULT 'N',
    `sp_taxfree_force` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_price_type` ENUM('M', 'W') NOT NULL,
    `sp_price_day` INTEGER NOT NULL,
    `sp_price_month` INTEGER NOT NULL,
    `sp_open_time` TINYINT NOT NULL,
    `sp_close_time` TINYINT NOT NULL,
    `sp_proc_date` DATETIME(0) NOT NULL,
    `sp_cafeYN` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_relayYN` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_relay_time` TINYINT NOT NULL DEFAULT 5,
    `sp_biostarYN` ENUM('Y', 'N', 'P') NOT NULL DEFAULT 'N',
    `sp_biostar_mode` ENUM('', 'CLOUD_API', 'LOCAL_API', 'SDK', 'G-SDK') NOT NULL,
    `sp_biostar_name` VARCHAR(80) NOT NULL,
    `sp_biostar_id` VARCHAR(80) NOT NULL,
    `sp_biostar_pw` VARCHAR(80) NOT NULL,
    `sp_biostar_port` SMALLINT NOT NULL DEFAULT 8795,
    `sp_biostar_device` TEXT NOT NULL,
    `sp_biostar_master` INTEGER NULL,
    `sp_biostar_checkin` VARCHAR(255) NOT NULL,
    `sp_biostar_checkout` VARCHAR(255) NOT NULL,
    `sp_biostar_door_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_biostar_door` TEXT NOT NULL,
    `sp_biostar_usergroup` TEXT NOT NULL,
    `sp_biostar_usergroup_stc` TEXT NOT NULL,
    `sp_biostar_access_levels` TEXT NOT NULL,
    `sp_biostar_access_groups` TEXT NOT NULL,
    `sp_charge` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_charge_price` INTEGER NOT NULL,
    `sp_seat_control_maker` ENUM('indm', 'taechang', 'ara', 'enha') NOT NULL DEFAULT 'indm',
    `sp_seat_control_mac` VARCHAR(40) NOT NULL,
    `sp_seat_control` ENUM('0', '1', '2') NOT NULL DEFAULT '0',
    `sp_seat_control_check` TINYINT NOT NULL DEFAULT 0,
    `sp_seat_control_out` TINYINT NOT NULL DEFAULT 0,
    `sp_seat_master` TINYINT NOT NULL,
    `sp_seat_style` VARCHAR(10) NOT NULL DEFAULT 'H',
    `sp_seat_check3` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `sp_seat_check1` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `sp_seat_check2` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `sp_van_mode` ENUM('VAN', 'OFFLINE_PG') NOT NULL DEFAULT 'VAN',
    `sp_local` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_local_catid` VARCHAR(10) NULL,
    `sp_local_catid2` VARCHAR(10) NULL,
    `sp_local_catid3` VARCHAR(10) NULL,
    `sp_van` ENUM('Y', 'N') NOT NULL,
    `sp_van_type` ENUM('NICE', 'KICC', 'FISERV', 'KCP', 'BESTPAY') NOT NULL DEFAULT 'NICE',
    `sp_van_port` INTEGER NOT NULL,
    `sp_print` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_print_payheader` BOOLEAN NOT NULL,
    `sp_print_owner` BOOLEAN NOT NULL,
    `sp_out_time1` INTEGER NOT NULL,
    `sp_out_time2` INTEGER NOT NULL,
    `sp_add_time` INTEGER NOT NULL DEFAULT 5,
    `sp_smsYN` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_sms_api` ENUM('aligo', 'hahaland', 'ppurio', 'infobank_text', 'infobank_katalk') NOT NULL DEFAULT 'aligo',
    `sp_sms_test` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_sms_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_sms_valid_user` VARCHAR(80) NOT NULL,
    `sp_sms_valid_date` DATETIME(0) NOT NULL,
    `sp_sms_id` VARCHAR(40) NOT NULL,
    `sp_ms_sender` VARCHAR(20) NOT NULL,
    `sp_ms_phone` VARCHAR(255) NOT NULL,
    `sp_ms_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_ms_cost` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_ms_cost_sms` INTEGER NOT NULL,
    `sp_ms_cost_lms` INTEGER NOT NULL,
    `sp_ms_cost_mms` INTEGER NOT NULL,
    `sp_money` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_point` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_balance` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_app_fee_yn` ENUM('N', 'Y') NULL DEFAULT 'N',
    `sp_app_fee` DECIMAL(2, 1) NULL,
    `sp_account_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_account_valid_user` VARCHAR(80) NULL,
    `sp_account_valid_date` TIMESTAMP(0) NULL,
    `sp_account_bank_code` VARCHAR(40) NULL,
    `sp_account_bank` VARCHAR(40) NULL,
    `sp_account_number` VARCHAR(40) NULL,
    `sp_account_holder` VARCHAR(40) NULL,
    `sp_benefit` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `sp_benefit_point` INTEGER NOT NULL,
    `sp_kiosk_manager` TEXT NOT NULL,
    `sp_kiosk_locker` TEXT NOT NULL,
    `sp_kiosk_guide` TEXT NOT NULL,
    `sp_kiosk_agreement` TEXT NOT NULL,
    `sp_kiosk_bg` ENUM('1', '2', '3', '4') NOT NULL DEFAULT 1,
    `sp_study_unit` TINYINT NOT NULL DEFAULT 60,
    `sp_study_start` TINYINT NULL,
    `sp_study_end` TINYINT NULL,
    `sp_study_sale` ENUM('NEXT', 'NOW') NOT NULL DEFAULT 'NEXT',
    `sp_kiosk_notice` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_kiosk_notice_title` VARCHAR(255) NOT NULL,
    `sp_kiosk_notice_body` TEXT NOT NULL,
    `sp_kiosk_notice_date_start` DATETIME(0) NOT NULL,
    `sp_kiosk_notice_date_end` DATETIME(0) NOT NULL,
    `sp_kiosk_notice_time_start` TIME(0) NOT NULL,
    `sp_kiosk_notice_time_end` TIME(0) NOT NULL,
    `sp_operation_mode_status` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_kiosk_payment_status` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_sms_api_temp` ENUM('aligo', 'hahaland', 'ppurio', 'infobank_text', 'infobank_katalk') NULL DEFAULT 'infobank_text',
    `sp_contract` VARCHAR(10) NULL,
    `sp_tax_invoice` VARCHAR(10) NULL,
    `sp_business2` VARCHAR(50) NULL,
    `sp_type2` VARCHAR(50) NULL,
    `sp_tax_type_additional` VARCHAR(15) NULL,
    `sp_taxpayer_type` VARCHAR(5) NULL,

    INDEX `br_no`(`br_no`),
    INDEX `sp_benefit`(`sp_benefit`),
    INDEX `sp_close_time`(`sp_close_time`),
    INDEX `sp_gps`(`sp_gps`),
    PRIMARY KEY (`sp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_240226` (
    `sp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_id` INTEGER NOT NULL,
    `sp_no_key` VARCHAR(80) NOT NULL,
    `sp_skin` VARCHAR(10) NOT NULL DEFAULT 'zaksim',
    `sp_title` VARCHAR(80) NOT NULL,
    `sp_title3` VARCHAR(80) NOT NULL,
    `sp_system` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_env` ENUM('production', 'testing', 'development', 'beta') NOT NULL DEFAULT 'production',
    `sp_mobile` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_gps` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_x` DECIMAL(16, 13) NULL,
    `sp_y` DECIMAL(16, 13) NULL,
    `sp_location` VARCHAR(100) NOT NULL,
    `sp_direct` ENUM('Y', 'N', 'O') NOT NULL DEFAULT 'N',
    `sp_state` VARCHAR(40) NOT NULL,
    `sp_regno` VARCHAR(24) NOT NULL,
    `sp_catid` VARCHAR(10) NULL,
    `sp_regno2` VARCHAR(24) NOT NULL,
    `sp_catid2` VARCHAR(10) NULL,
    `sp_regno3` VARCHAR(24) NOT NULL,
    `sp_catid3` VARCHAR(10) NOT NULL,
    `sp_name` VARCHAR(80) NOT NULL,
    `sp_name2` VARCHAR(80) NOT NULL,
    `sp_name3` VARCHAR(80) NOT NULL,
    `sp_ceo` VARCHAR(20) NOT NULL,
    `sp_ceo2` VARCHAR(20) NOT NULL,
    `sp_ceo3` VARCHAR(20) NOT NULL,
    `sp_birth` DATE NOT NULL,
    `sp_postcode` VARCHAR(20) NOT NULL,
    `sp_addr` VARCHAR(255) NOT NULL,
    `sp_addr3` VARCHAR(255) NOT NULL,
    `sp_addr_road` VARCHAR(255) NOT NULL,
    `sp_addr_jibun` VARCHAR(255) NOT NULL,
    `sp_addr_detail` VARCHAR(255) NOT NULL,
    `sp_addr_extra` VARCHAR(255) NOT NULL,
    `sp_email` VARCHAR(100) NOT NULL,
    `sp_phone` VARCHAR(20) NOT NULL,
    `sp_tel` VARCHAR(20) NOT NULL,
    `sp_tel3` VARCHAR(20) NOT NULL,
    `sp_fax` VARCHAR(20) NOT NULL,
    `sp_open` DATE NOT NULL,
    `sp_business` VARCHAR(50) NOT NULL,
    `sp_type` VARCHAR(50) NOT NULL,
    `sp_memo` TEXT NOT NULL,
    `sp_image` VARCHAR(255) NOT NULL,
    `sp_image2` VARCHAR(255) NOT NULL,
    `sp_image3` VARCHAR(255) NOT NULL,
    `sp_logo_image1` VARCHAR(255) NULL,
    `sp_logo_image2` VARCHAR(255) NULL,
    `sp_logo_image3` VARCHAR(255) NULL,
    `sp_logo_image4` VARCHAR(255) NULL,
    `sp_logo_image5` VARCHAR(255) NULL,
    `sp_history` TEXT NOT NULL,
    `sp_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_delete_date` TIMESTAMP(0) NULL,
    `sp_history2` TEXT NOT NULL,
    `sp_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `sp_regdate` DATETIME(0) NOT NULL,
    `sp_taxfree` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_taxfree_force` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_price_type` ENUM('M', 'W') NOT NULL,
    `sp_price_day` INTEGER NOT NULL,
    `sp_price_month` INTEGER NOT NULL,
    `sp_open_time` TINYINT NOT NULL,
    `sp_close_time` TINYINT NOT NULL,
    `sp_proc_date` DATETIME(0) NOT NULL,
    `sp_cafeYN` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_biostarYN` ENUM('Y', 'N', 'P') NOT NULL DEFAULT 'N',
    `sp_biostar_mode` ENUM('', 'CLOUD_API', 'LOCAL_API', 'SDK', 'G-SDK') NOT NULL,
    `sp_biostar_name` VARCHAR(80) NOT NULL,
    `sp_biostar_id` VARCHAR(80) NOT NULL,
    `sp_biostar_pw` VARCHAR(80) NOT NULL,
    `sp_biostar_port` SMALLINT NOT NULL DEFAULT 8795,
    `sp_biostar_device` TEXT NOT NULL,
    `sp_biostar_master` INTEGER NULL,
    `sp_biostar_checkin` VARCHAR(255) NOT NULL,
    `sp_biostar_checkout` VARCHAR(255) NOT NULL,
    `sp_biostar_door_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_biostar_door` TEXT NOT NULL,
    `sp_biostar_usergroup` TEXT NOT NULL,
    `sp_biostar_usergroup_stc` TEXT NOT NULL,
    `sp_biostar_access_levels` TEXT NOT NULL,
    `sp_biostar_access_groups` TEXT NOT NULL,
    `sp_charge` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_charge_price` INTEGER NOT NULL,
    `sp_seat_control_maker` ENUM('indm', 'taechang', 'ara', 'enha') NOT NULL DEFAULT 'indm',
    `sp_seat_control_mac` VARCHAR(40) NOT NULL,
    `sp_seat_control` ENUM('0', '1', '2') NOT NULL DEFAULT '0',
    `sp_seat_control_check` TINYINT NOT NULL DEFAULT 0,
    `sp_seat_control_out` TINYINT NOT NULL DEFAULT 0,
    `sp_seat_master` TINYINT NOT NULL,
    `sp_seat_style` VARCHAR(10) NOT NULL DEFAULT 'H',
    `sp_seat_check3` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `sp_seat_check1` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `sp_seat_check2` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `sp_van_mode` ENUM('VAN', 'OFFLINE_PG') NOT NULL DEFAULT 'VAN',
    `sp_local` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_local_catid` VARCHAR(10) NULL,
    `sp_local_catid2` VARCHAR(10) NULL,
    `sp_local_catid3` VARCHAR(10) NULL,
    `sp_van` ENUM('Y', 'N') NOT NULL,
    `sp_van_type` ENUM('NICE', 'KICC', 'FISERV', 'KCP', 'BESTPAY') NOT NULL DEFAULT 'NICE',
    `sp_van_port` INTEGER NOT NULL,
    `sp_print` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_print_payheader` BOOLEAN NOT NULL,
    `sp_print_owner` BOOLEAN NOT NULL,
    `sp_out_time1` INTEGER NOT NULL,
    `sp_out_time2` INTEGER NOT NULL,
    `sp_add_time` INTEGER NOT NULL DEFAULT 5,
    `sp_smsYN` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_sms_api` ENUM('aligo', 'hahaland', 'ppurio', 'infobank_text', 'infobank_katalk') NOT NULL DEFAULT 'aligo',
    `sp_sms_test` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_sms_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_sms_valid_user` VARCHAR(80) NOT NULL,
    `sp_sms_valid_date` DATETIME(0) NOT NULL,
    `sp_sms_id` VARCHAR(40) NOT NULL,
    `sp_ms_sender` VARCHAR(20) NOT NULL,
    `sp_ms_phone` VARCHAR(255) NOT NULL,
    `sp_ms_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_ms_cost` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_ms_cost_sms` INTEGER NOT NULL,
    `sp_ms_cost_lms` INTEGER NOT NULL,
    `sp_ms_cost_mms` INTEGER NOT NULL,
    `sp_money` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_point` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_balance` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_app_fee_yn` ENUM('N', 'Y') NULL DEFAULT 'N',
    `sp_app_fee` DECIMAL(2, 1) NULL,
    `sp_account_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_account_valid_user` VARCHAR(80) NULL,
    `sp_account_valid_date` TIMESTAMP(0) NULL,
    `sp_account_bank_code` VARCHAR(40) NULL,
    `sp_account_bank` VARCHAR(40) NULL,
    `sp_account_number` VARCHAR(40) NULL,
    `sp_account_holder` VARCHAR(40) NULL,
    `sp_benefit` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `sp_benefit_point` INTEGER NOT NULL,
    `sp_kiosk_manager` TEXT NOT NULL,
    `sp_kiosk_locker` TEXT NOT NULL,
    `sp_kiosk_guide` TEXT NOT NULL,
    `sp_kiosk_agreement` TEXT NOT NULL,
    `sp_kiosk_bg` ENUM('1', '2', '3', '4') NOT NULL DEFAULT 1,
    `sp_study_unit` TINYINT NOT NULL DEFAULT 60,
    `sp_study_start` TINYINT NULL,
    `sp_study_end` TINYINT NULL,
    `sp_study_sale` ENUM('NEXT', 'NOW') NOT NULL DEFAULT 'NEXT',
    `sp_kiosk_notice` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_kiosk_notice_title` VARCHAR(255) NOT NULL,
    `sp_kiosk_notice_body` TEXT NOT NULL,
    `sp_kiosk_notice_date_start` DATETIME(0) NOT NULL,
    `sp_kiosk_notice_date_end` DATETIME(0) NOT NULL,
    `sp_kiosk_notice_time_start` TIME(0) NOT NULL,
    `sp_kiosk_notice_time_end` TIME(0) NOT NULL,
    `sp_operation_mode_status` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_kiosk_payment_status` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `sp_sms_api_temp` ENUM('aligo', 'hahaland', 'ppurio', 'infobank_text', 'infobank_katalk') NOT NULL DEFAULT 'infobank_text',

    INDEX `br_no`(`br_no`),
    INDEX `sp_benefit`(`sp_benefit`),
    INDEX `sp_close_time`(`sp_close_time`),
    INDEX `sp_gps`(`sp_gps`),
    PRIMARY KEY (`sp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_balance` (
    `spb_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `spb_type` ENUM('charge', 'use') NOT NULL,
    `spb_balance_before` INTEGER NOT NULL,
    `spb_balance` INTEGER NOT NULL,
    `spb_balance_after` INTEGER NOT NULL,
    `spb_dsc` VARCHAR(255) NOT NULL,
    `spb_ip` VARCHAR(40) NOT NULL,
    `spb_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `br_no`(`br_no`),
    INDEX `mn_no`(`mn_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `spb_regdate`(`spb_regdate`),
    PRIMARY KEY (`spb_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_biostar` (
    `sp_no` INTEGER NOT NULL,
    `sp_biostarYN` ENUM('Y', 'N', 'P') NOT NULL DEFAULT 'N',
    `sp_biostar_mode` ENUM('', 'CLOUD_API', 'LOCAL_API', 'SDK', 'G-SDK') NOT NULL,
    `sp_biostar_name` VARCHAR(80) NOT NULL,
    `sp_biostar_id` VARCHAR(80) NOT NULL,
    `sp_biostar_pw` VARCHAR(80) NOT NULL,
    `sp_biostar_port` SMALLINT NOT NULL DEFAULT 8795,
    `sp_biostar_device` TEXT NOT NULL,
    `sp_biostar_master` INTEGER NULL,
    `sp_biostar_checkin` VARCHAR(255) NOT NULL,
    `sp_biostar_checkout` VARCHAR(255) NOT NULL,
    `sp_biostar_door_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_biostar_door` TEXT NOT NULL,
    `sp_biostar_usergroup` TEXT NOT NULL,
    `sp_biostar_usergroup_stc` TEXT NOT NULL,
    `sp_biostar_access_levels` TEXT NOT NULL,
    `sp_seat_control_maker` ENUM('indm', 'taechang', 'ara', 'enha') NOT NULL DEFAULT 'indm',
    `sp_seat_control_mac` VARCHAR(40) NOT NULL,
    `sp_seat_control` ENUM('0', '1', '2') NOT NULL DEFAULT '0',
    `sp_seat_control_check` TINYINT NOT NULL DEFAULT 0,
    `sp_seat_control_out` TINYINT NOT NULL DEFAULT 0,
    `sp_seat_master` TINYINT NOT NULL,
    `sp_biostar_access_groups` TEXT NOT NULL,

    PRIMARY KEY (`sp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_close` (
    `sp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_open_time` TINYINT NOT NULL,
    `sp_close_time` TINYINT NOT NULL,
    `sp_state` VARCHAR(40) NOT NULL,
    `sp_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_delete_date` TIMESTAMP(0) NULL,

    INDEX `br_no`(`br_no`),
    INDEX `sp_close_time`(`sp_close_time`),
    PRIMARY KEY (`sp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_control` (
    `spc_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER UNSIGNED NOT NULL,
    `spc_controller` ENUM('enha', 'ara') NOT NULL,
    `spc_type` ENUM('ELECTRIC', 'DOOR') NOT NULL,
    `spc_name` VARCHAR(80) NOT NULL,
    `spc_port` VARCHAR(20) NOT NULL,
    `spc_baudrate` VARCHAR(20) NOT NULL,
    `spc_delay` TINYINT NOT NULL,
    `spc_code` VARCHAR(20) NOT NULL,
    `spc_power` BOOLEAN NOT NULL,
    `spc_state` BOOLEAN NOT NULL,
    `spc_use` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `spc_delete` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `spc_delete_date` TIMESTAMP(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `spc_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `spc_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`spc_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_money` (
    `spm_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `spm_type` ENUM('charge', 'use') NOT NULL,
    `spm_money_before` INTEGER NOT NULL,
    `spm_money` INTEGER NOT NULL,
    `spm_money_after` INTEGER NOT NULL,
    `spm_dsc` VARCHAR(255) NOT NULL,
    `spm_ip` VARCHAR(40) NOT NULL,
    `spm_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `br_no`(`br_no`),
    INDEX `mn_no`(`mn_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `spm_regdate`(`spm_regdate`),
    PRIMARY KEY (`spm_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_money_v2` (
    `spm_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `spm_type` ENUM('charge', 'use') NOT NULL,
    `spm_money_before` INTEGER NOT NULL,
    `spm_money` INTEGER NOT NULL,
    `spm_money_after` INTEGER NOT NULL,
    `spm_dsc` VARCHAR(255) NOT NULL,
    `spm_ip` VARCHAR(40) NOT NULL,
    `spm_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `br_no`(`br_no`),
    INDEX `mn_no`(`mn_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `spm_regdate`(`spm_regdate`),
    PRIMARY KEY (`spm_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_point` (
    `spp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `spp_type` ENUM('charge', 'use') NOT NULL,
    `spp_point_before` INTEGER NOT NULL,
    `spp_point` INTEGER NOT NULL,
    `spp_point_after` INTEGER NOT NULL,
    `spp_dsc` VARCHAR(255) NOT NULL,
    `spp_remain` INTEGER NULL,
    `spp_expire` DATE NULL,
    `spp_ip` VARCHAR(40) NOT NULL,
    `spp_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `br_no`(`br_no`),
    INDEX `mn_no`(`mn_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `spp_regdate`(`spp_regdate`),
    PRIMARY KEY (`spp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_point_v2` (
    `spp_no` INTEGER NOT NULL AUTO_INCREMENT,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `spp_type` ENUM('charge', 'use') NOT NULL,
    `spp_point_before` INTEGER NOT NULL,
    `spp_point` INTEGER NOT NULL,
    `spp_point_after` INTEGER NOT NULL,
    `spp_dsc` VARCHAR(255) NOT NULL,
    `spp_remain` INTEGER NULL,
    `spp_expire` DATE NULL,
    `spp_ip` VARCHAR(40) NOT NULL,
    `spp_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `br_no`(`br_no`),
    INDEX `mn_no`(`mn_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `spp_regdate`(`spp_regdate`),
    PRIMARY KEY (`spp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_sms` (
    `sp_no` INTEGER NOT NULL,
    `br_no` INTEGER NULL,
    `sp_sms_api` ENUM('aligo', 'hahaland', 'ppurio') NOT NULL DEFAULT 'aligo',
    `sp_sms_test` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_sms_valid` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_sms_valid_user` VARCHAR(80) NOT NULL,
    `sp_sms_valid_date` DATETIME(0) NOT NULL,
    `sp_sms_id` VARCHAR(40) NOT NULL,
    `sp_ms_sender` VARCHAR(20) NOT NULL,
    `sp_ms_phone` VARCHAR(255) NOT NULL,
    `sp_ms_price` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_ms_cost` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sp_ms_cost_sms` INTEGER NOT NULL,
    `sp_ms_cost_lms` INTEGER NOT NULL,
    `sp_ms_cost_mms` INTEGER NOT NULL,
    `sp_money` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_point` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_balance` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sp_smsYN` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',

    PRIMARY KEY (`sp_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_subinfo` (
    `spi_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `spi_service_type` CHAR(11) NULL DEFAULT 'study',
    `spi_mobile` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_mobile_pay` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_gps` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_x` DECIMAL(16, 13) NULL,
    `spi_y` DECIMAL(16, 13) NULL,
    `spi_location` VARCHAR(100) NOT NULL DEFAULT '',
    `spi_image` VARCHAR(200) NULL,
    `spi_sub_image1` VARCHAR(200) NULL,
    `spi_sub_image2` VARCHAR(200) NULL,
    `spi_sub_image3` VARCHAR(200) NULL,
    `spi_sub_image4` VARCHAR(200) NULL,
    `spi_desc` VARCHAR(100) NOT NULL DEFAULT '',
    `spi_opertime_label` VARCHAR(50) NOT NULL DEFAULT '월~일',
    `spi_opertime_value` VARCHAR(50) NOT NULL DEFAULT '',
    `spi_closed_label` VARCHAR(50) NOT NULL DEFAULT '휴무일',
    `spi_closed_value` VARCHAR(50) NOT NULL DEFAULT '',
    `spi_way` VARCHAR(200) NOT NULL DEFAULT '',
    `spi_allday` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_locker` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_studyroom` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_studyroom_reserve` ENUM('Y', 'N') NULL DEFAULT 'N',
    `spi_studyroom_refund_policy` TEXT NULL,
    `spi_privacy_policy` TEXT NULL,
    `spi_study_contents` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_study_test` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_locker_guide` MEDIUMTEXT NULL,
    `spi_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spi_delete_date` DATETIME(0) NULL,
    `spi_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',
    `spi_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `spi_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `spi_regdate` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `sp_no_unique`(`sp_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `spi_delete`(`spi_delete`),
    INDEX `spi_gps`(`spi_gps`),
    PRIMARY KEY (`spi_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_shop_withdrawals` (
    `spw_no` INTEGER NOT NULL,
    `br_no` INTEGER NOT NULL,
    `sp_no` INTEGER NOT NULL,
    `iv_no` INTEGER NOT NULL,
    `spw_account_bank` VARCHAR(40) NOT NULL,
    `spw_account_number` VARCHAR(40) NOT NULL,
    `spw_account_holder` VARCHAR(40) NOT NULL,
    `spw_price_before` INTEGER NOT NULL,
    `spw_price` INTEGER NOT NULL,
    `spw_price_after` INTEGER NOT NULL,
    `spw_date` DATE NOT NULL,
    `spw_ip` VARCHAR(40) NOT NULL,
    `spw_step` ENUM('1', '2', '-1', '-2') NOT NULL DEFAULT 1,
    `spw_paid_date` DATETIME(0) NULL,
    `mn_no` INTEGER NULL,
    `spw_memo` TEXT NOT NULL,
    `spw_history` TEXT NOT NULL,
    `spw_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `br_no`(`br_no`),
    INDEX `mn_no`(`mn_no`),
    INDEX `sp_no`(`sp_no`),
    INDEX `spw_date`(`spw_date`),
    INDEX `spw_paid_date`(`spw_paid_date`),
    INDEX `spw_step`(`spw_step`),
    PRIMARY KEY (`spw_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_study` (
    `sd_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `st_no` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `mn_no` INTEGER NOT NULL,
    `sd_name` VARCHAR(80) NOT NULL,
    `sd_start` DATETIME(0) NOT NULL,
    `sd_end` DATETIME(0) NOT NULL,
    `sd_time` DECIMAL(4, 1) NOT NULL,
    `sd_ea` TINYINT NOT NULL,
    `sd_code` VARCHAR(40) NOT NULL,
    `sd_pin` VARCHAR(20) NOT NULL,
    `sd_memo` TEXT NOT NULL,
    `sd_step` ENUM('1', '2', '3', '-1', '-2') NOT NULL,
    `sd_history` TEXT NOT NULL,
    `sd_regdate` DATETIME(0) NOT NULL,
    `sc_no` INTEGER NULL,
    `sd_bs_regist` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sd_bs_group` INTEGER NULL,
    `sd_bs_update` DATETIME(0) NOT NULL,

    INDEX `sp_no`(`sp_no`, `st_no`, `sd_start`, `sd_time`, `sd_step`),
    PRIMARY KEY (`sd_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_support_faq` (
    `sptf_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `shop_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptf_kind_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `sptf_type_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `sptf_question` VARCHAR(200) NOT NULL DEFAULT '',
    `sptf_content` MEDIUMTEXT NULL,
    `sptf_summary` VARCHAR(500) NULL,
    `sptf_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `cmm_use_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `cmm_del_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `shop_idx`(`shop_idx`),
    INDEX `sptf_kind_cd`(`sptf_kind_cd`),
    INDEX `sptf_type_cd`(`sptf_type_cd`),
    PRIMARY KEY (`sptf_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_support_inquiry` (
    `spti_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `shop_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `spti_kind_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `spti_type_cd` TINYINT UNSIGNED NOT NULL DEFAULT 90,
    `spti_title` VARCHAR(200) NOT NULL DEFAULT '',
    `spti_content` MEDIUMTEXT NULL,
    `mbru_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `spti_author` VARCHAR(80) NOT NULL DEFAULT '',
    `mbrm_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `spti_answer_author` VARCHAR(80) NOT NULL DEFAULT '',
    `spti_answer_title` VARCHAR(200) NOT NULL DEFAULT '',
    `spti_answer_content` MEDIUMTEXT NULL,
    `spti_email` VARCHAR(100) NULL,
    `spti_email_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spti_phone1` VARCHAR(20) NULL,
    `spti_phone2` VARCHAR(20) NULL,
    `spti_sms_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spti_reply_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spti_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `spti_like_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `spti_secret_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spti_password` VARCHAR(100) NOT NULL DEFAULT '',
    `spti_hidden_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `spti_delete_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `mbrm_idx`(`mbrm_idx`),
    INDEX `mbru_idx`(`mbru_idx`),
    INDEX `shop_idx`(`shop_idx`),
    INDEX `spti_kind_cd`(`spti_kind_cd`),
    INDEX `spti_type_cd`(`spti_type_cd`),
    PRIMARY KEY (`spti_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_support_reveiw` (
    `sptr_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `shop_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `mbru_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_type_cd` ENUM('QNA', 'REVIEW') NOT NULL DEFAULT 'QNA',
    `sptr_kind_cd` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `sptr_parent_idx` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_reply` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_reply_parent` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_reply_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sptr_email` VARCHAR(100) NULL,
    `sptr_email_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sptr_phone1` VARCHAR(20) NULL,
    `sptr_phone2` VARCHAR(20) NULL,
    `sptr_sms_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sptr_category_id` VARCHAR(100) NULL,
    `sptr_eval_qlty_score` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_eval_svc_score` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_eval_deliv_score` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_eval_price_score` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_eval_total_score` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_reserve_amt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_title` VARCHAR(200) NOT NULL DEFAULT '',
    `sptr_contents` TEXT NULL,
    `sptr_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_like_cnt` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `sptr_secret_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sptr_password` VARCHAR(100) NOT NULL DEFAULT '',
    `sptr_hidden_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `sptr_delete_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT ('0000-00-00 00:00:00'),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',

    INDEX `mbru_idx`(`mbru_idx`),
    INDEX `shop_idx`(`shop_idx`),
    INDEX `sptr_kind_cd`(`sptr_kind_cd`),
    INDEX `sptr_parent_idx`(`sptr_parent_idx`),
    INDEX `sptr_reply_parent`(`sptr_reply_parent`),
    INDEX `sptr_type_cd`(`sptr_type_cd`),
    PRIMARY KEY (`sptr_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_sync` (
    `sc_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `sc_type` ENUM('USER', 'STUDY', 'DOOR', 'ALL') NOT NULL,
    `sc_action` ENUM('C', 'R', 'U', 'D', 'SYNC', 'DELETE', 'OPEN') NOT NULL,
    `sc_uid` INTEGER NOT NULL,
    `sc_step` ENUM('1', '2', '3', '4') NOT NULL DEFAULT 1,
    `sc_retry` TINYINT UNSIGNED NOT NULL,
    `sc_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `sc_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `sc_step`(`sc_step`),
    INDEX `sc_uid`(`sc_uid`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`sc_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_task` (
    `tk_no` INTEGER NOT NULL AUTO_INCREMENT,
    `tk_code` TINYINT NOT NULL DEFAULT 0,
    `tk_type` ENUM('ETC', 'BUGFIX', 'FEATURE') NOT NULL DEFAULT 'ETC',
    `tk_title` VARCHAR(255) NOT NULL,
    `tk_dsc` TEXT NOT NULL,
    `tk_answer` TEXT NOT NULL,
    `tk_important` ENUM('1', '2', '3', '4', '5') NOT NULL DEFAULT 1,
    `tk_author` INTEGER NULL,
    `tk_assign` INTEGER NULL,
    `tk_target` DATE NULL,
    `tk_complete` DATE NULL,
    `tk_step` ENUM('10', '20', '30', '40', '50', '-10', '-20') NOT NULL DEFAULT '10',
    `tk_history` TEXT NOT NULL,
    `tk_ip` VARCHAR(40) NOT NULL,
    `tk_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `tk_delete_date` TIMESTAMP(0) NULL,
    `tk_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `tk_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`tk_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_tcmm_site_meta` (
    `csmt_idx` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `csmt_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `csmt_group` VARCHAR(80) NOT NULL DEFAULT '',
    `csmt_key` VARCHAR(255) NOT NULL DEFAULT '',
    `csmt_val` LONGTEXT NOT NULL,
    `csmt_sort` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `csmt_desc` VARCHAR(255) NOT NULL DEFAULT '',
    `cmm_use_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `cmm_del_yn` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `cmm_mod_id` VARCHAR(80) NULL,
    `cmm_mod_name` VARCHAR(80) NULL,
    `cmm_mod_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_reg_id` VARCHAR(80) NULL,
    `cmm_reg_name` VARCHAR(80) NULL,
    `cmm_reg_date` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cmm_remote_ip` VARCHAR(80) NOT NULL DEFAULT '',
    `cmt_group` VARCHAR(80) NULL,

    INDEX `csmt_type_cmt_group_KEY`(`csmt_type`, `csmt_group`),
    UNIQUE INDEX `csmt_type_csmt_group_csmt_key_UNIQUE`(`csmt_type`, `csmt_group`, `csmt_key`),
    PRIMARY KEY (`csmt_idx`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_temp_member` (
    `mb_no` INTEGER NOT NULL AUTO_INCREMENT,
    `mb_app` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `amb_no` INTEGER NULL,
    `sp_no` INTEGER NOT NULL,
    `gr_no` TINYINT NOT NULL DEFAULT 1,
    `mb_pw` VARCHAR(80) NULL,
    `mb_id` VARCHAR(80) NOT NULL,
    `mb_name` VARCHAR(80) NOT NULL,
    `mb_sex` ENUM('', 'F', 'M') NOT NULL,
    `mb_birth` DATE NOT NULL,
    `mb_bio` ENUM('Y', 'N') NOT NULL,
    `mb_phone` VARCHAR(45) NOT NULL,
    `mb_sms` ENUM('N', 'Y') NOT NULL DEFAULT 'Y',
    `mb_name2` VARCHAR(40) NOT NULL,
    `mb_phone2` VARCHAR(45) NOT NULL,
    `mb_sms2` ENUM('N', 'Y') NOT NULL DEFAULT 'Y',
    `mb_email` VARCHAR(80) NOT NULL,
    `mb_memo` TEXT NOT NULL,
    `mb_point` INTEGER NOT NULL,
    `mb_step` ENUM('0', '1', '2', '3', '4', '5') NOT NULL DEFAULT '0',
    `mb_service_type` ENUM('H', 'H2', 'D') NULL,
    `mb_service_time` VARCHAR(50) NULL,
    `mb_charge` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `mb_ready` ENUM('N', 'Y') NOT NULL DEFAULT 'N',
    `mb_seat_type` INTEGER NULL,
    `mb_seat` INTEGER NULL,
    `mb_start` DATE NULL,
    `mb_start_time` TIME(0) NULL,
    `mb_end` DATE NULL,
    `mb_end_time` TIME(0) NULL,
    `mb_code` VARCHAR(40) NOT NULL,
    `mb_service_time2` VARCHAR(50) NULL,
    `mb_seat_type2` INTEGER NULL,
    `mb_seat2` INTEGER NULL,
    `mb_start2` DATE NULL,
    `mb_end2` DATE NULL,
    `mb_online` ENUM('Y', 'O', 'N') NOT NULL DEFAULT 'N',
    `mb_online_date` DATETIME(0) NULL,
    `mb_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `mb_delete_date` DATETIME(0) NULL,
    `mb_ip` VARCHAR(40) NOT NULL,
    `mb_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `mb_regdate` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `mb_service_type2` ENUM('H', 'D') NULL,
    `mb_status` VARCHAR(255) NULL,

    INDEX `amb_no`(`amb_no`),
    INDEX `mb_code`(`mb_code`),
    INDEX `mb_delete`(`mb_delete`),
    INDEX `mb_phone`(`mb_phone`),
    INDEX `mb_step`(`mb_step`),
    INDEX `n2_member_mb_seat2_index`(`mb_seat2`),
    INDEX `n2_member_mb_seat_index`(`mb_seat`),
    INDEX `n2_member_sp_no_mb_delete_index`(`sp_no`, `mb_delete`),
    INDEX `search`(`mb_name`, `mb_phone`),
    INDEX `sp_no`(`sp_no`),
    PRIMARY KEY (`mb_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_ticket` (
    `tk_uid` VARCHAR(128) NULL,
    `sp_no` INTEGER NULL,
    `mb_no` INTEGER NULL,
    `stc_no` INTEGER NULL,
    `tk_type` ENUM('locker', 'seat') NULL DEFAULT 'seat',
    `tk_start` DATE NULL,
    `tk_start_time` TIME(0) NULL,
    `tk_end` DATE NULL,
    `tk_end_time` TIME(0) NULL,
    `tk_unit` ENUM('T', 'H', 'H2', 'D', 'L') NULL,
    `tk_step` ENUM('0', '1', '2', '3', '-1') NULL DEFAULT '0',
    `tk_ready` ENUM('Y', 'N') NULL DEFAULT 'N',
    `tk_available` VARCHAR(50) NULL,
    `tk_regdate` TIMESTAMP(0) NULL,
    `tk_update_date` TIMESTAMP(0) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_ticket_status` (
    `ts_uid` VARCHAR(128) NULL,
    `tk_uid` VARCHAR(128) NULL,
    `mb_no` INTEGER NULL,
    `ts_device` VARCHAR(50) NULL,
    `ts_start` TIMESTAMP(0) NULL,
    `ts_end` TIMESTAMP(0) NULL,
    `td_regdate` TIMESTAMP(0) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_time` (
    `tm_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `mb_no` INTEGER NOT NULL,
    `sv_unit` ENUM('H', 'H2', 'D', 'R', 'S') NULL,
    `tm_start` DATETIME(0) NOT NULL,
    `tm_end` DATETIME(0) NULL,
    `tm_time` INTEGER NOT NULL,
    `tm_regdateAt` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `tm_updateAt` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `mb_no`(`mb_no`),
    PRIMARY KEY (`tm_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_time_test` (
    `tm_no` INTEGER NULL,
    `sp_no` INTEGER NULL,
    `mb_no` INTEGER NULL,
    `sv_unit` CHAR(2) NULL,
    `tm_start` DATETIME(0) NULL,
    `tm_end` DATETIME(0) NULL,
    `tm_time` INTEGER NULL,
    `tm_regdateAt` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `tm_updateAt` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `n2_time_test_sp_no_mb_no_index`(`sp_no`, `mb_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_time_test_2` (
    `tm_no` INTEGER NULL,
    `sp_no` INTEGER NULL,
    `mb_no` INTEGER NULL,
    `sv_unit` CHAR(2) NULL,
    `tm_start` DATETIME(0) NULL,
    `tm_end` DATETIME(0) NULL,
    `tm_time` INTEGER NULL,
    `tm_regdateAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `tm_updateAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_time_test_3` (
    `tm_no` INTEGER NULL,
    `sp_no` INTEGER NULL,
    `mb_no` INTEGER NULL,
    `sv_unit` CHAR(2) NULL,
    `tm_start` DATETIME(0) NULL,
    `tm_end` DATETIME(0) NULL,
    `tm_time` INTEGER NULL,
    `tm_regdateAt` TIMESTAMP(0) NULL,
    `tm_updateAt` TIMESTAMP(0) NULL,

    INDEX `n2_time_test_3_index`(`sp_no`, `mb_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_banner` (
    `wbn_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wbn_display_ingstory` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbn_display_zaksim` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbn_display_space` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbn_display_pickko` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbn_id` VARCHAR(255) NULL,
    `wbn_title` VARCHAR(255) NOT NULL,
    `wbn_count` INTEGER NOT NULL,
    `wbn_width` INTEGER NOT NULL,
    `wbn_height` INTEGER NOT NULL,
    `wbn_show` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `wbn_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbn_ip` VARCHAR(40) NOT NULL,
    `wbn_history` TEXT NOT NULL,
    `wbn_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wbn_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `wbn_id`(`wbn_id`),
    PRIMARY KEY (`wbn_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_banner_item` (
    `wbni_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wbn_no` INTEGER NOT NULL,
    `wbni_image` VARCHAR(255) NOT NULL,
    `wbni_alt` VARCHAR(255) NOT NULL,
    `wbni_link` VARCHAR(255) NOT NULL,
    `wbni_target` VARCHAR(40) NOT NULL,
    `wbni_order` INTEGER NOT NULL,
    `wbni_show` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `wbni_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbni_ip` VARCHAR(40) NOT NULL,
    `wbni_history` TEXT NOT NULL,
    `wbni_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wbni_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`wbni_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_board` (
    `wbd_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wbd_display_ingstory` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbd_display_zaksim` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbd_display_space` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbd_display_pickko` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbd_type` ENUM('NOTICE', 'NEWS', 'GUIDE') NOT NULL,
    `wbd_category` VARCHAR(255) NOT NULL,
    `wbd_title` VARCHAR(255) NOT NULL,
    `wbd_content` TEXT NOT NULL,
    `wbd_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wbd_hit` INTEGER NOT NULL,
    `wbd_image` VARCHAR(255) NOT NULL,
    `wbd_file` VARCHAR(255) NOT NULL,
    `wbd_file_name` VARCHAR(255) NOT NULL,
    `wbd_link` VARCHAR(255) NOT NULL,
    `wbd_show` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `wbd_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wbd_ip` VARCHAR(40) NOT NULL,
    `wbd_history` TEXT NOT NULL,
    `wbd_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wbd_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `wbd_date`(`wbd_date`),
    PRIMARY KEY (`wbd_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_board_mg` (
    `wbd_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wbd_display_company` VARCHAR(255) NOT NULL,
    `wbd_type` CHAR(6) NULL,
    `wbd_title` VARCHAR(255) NULL,
    `wbd_content` TEXT NULL,
    `wbd_date` TIMESTAMP(0) NULL,
    `wbd_hit` INTEGER NULL,
    `wbd_image` VARCHAR(255) NULL,
    `wbd_file` VARCHAR(255) NULL,
    `wbd_file_name` VARCHAR(255) NULL,
    `wbd_link` VARCHAR(255) NULL,
    `wbd_show` CHAR(1) NULL,
    `wbd_delete` CHAR(1) NULL,
    `wbd_ip` VARCHAR(40) NULL,
    `wbd_history` TEXT NULL,
    `wbd_update` TIMESTAMP(0) NULL,
    `wbd_regdate` TIMESTAMP(0) NULL,

    PRIMARY KEY (`wbd_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_board_test` (
    `wbd_no` INTEGER NULL,
    `wbd_display_ingstory` CHAR(1) NULL,
    `wbd_display_zaksim` CHAR(1) NULL,
    `wbd_display_space` CHAR(1) NULL,
    `wbd_display_pickko` CHAR(1) NULL,
    `wbd_type` CHAR(6) NULL,
    `wbd_category` VARCHAR(255) NULL,
    `wbd_title` VARCHAR(255) NULL,
    `wbd_content` TEXT NULL,
    `wbd_date` TIMESTAMP(0) NULL,
    `wbd_hit` INTEGER NULL,
    `wbd_image` VARCHAR(255) NULL,
    `wbd_file` VARCHAR(255) NULL,
    `wbd_file_name` VARCHAR(255) NULL,
    `wbd_link` VARCHAR(255) NULL,
    `wbd_show` CHAR(1) NULL,
    `wbd_delete` CHAR(1) NULL,
    `wbd_ip` VARCHAR(40) NULL,
    `wbd_history` TEXT NULL,
    `wbd_update` TIMESTAMP(0) NULL,
    `wbd_regdate` TIMESTAMP(0) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_contact` (
    `wct_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wct_from` VARCHAR(128) NOT NULL DEFAULT '기타',
    `wct_to` VARCHAR(255) NULL,
    `wct_member` TINYINT NOT NULL,
    `wct_name` VARCHAR(255) NOT NULL,
    `wct_phone` VARCHAR(255) NOT NULL,
    `wct_email` VARCHAR(255) NOT NULL,
    `wct_title` VARCHAR(255) NOT NULL,
    `wct_content` TEXT NOT NULL,
    `wct_business_content` TEXT NULL,
    `wct_file` VARCHAR(255) NOT NULL,
    `wct_age` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wct_privacy` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wct_marketing` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wct_business` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wct_memo` TEXT NOT NULL,
    `wct_read` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wct_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wct_ip` VARCHAR(40) NULL,
    `wct_history` TEXT NOT NULL,
    `wct_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wct_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`wct_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_event` (
    `wev_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wev_display_ingstory` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wev_display_zaksim` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wev_display_space` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wev_display_pickko` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wev_view_type` ENUM('DEFAULT', 'CUSTOM') NOT NULL DEFAULT 'DEFAULT',
    `wev_id` VARCHAR(40) NOT NULL,
    `wev_title` VARCHAR(255) NOT NULL,
    `wev_content` TEXT NOT NULL,
    `wev_image` VARCHAR(255) NOT NULL,
    `wev_start` DATETIME(0) NOT NULL,
    `wev_end` DATETIME(0) NOT NULL,
    `wev_show_date` DATETIME(0) NOT NULL,
    `wev_show` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wev_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wev_ip` VARCHAR(40) NOT NULL,
    `wev_history` TEXT NOT NULL,
    `wev_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wev_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `wev_id`(`wev_id`),
    PRIMARY KEY (`wev_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_event_template` (
    `wev_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wev_code` VARCHAR(10) NULL,
    `wev_value` LONGTEXT NULL,
    `wev_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wev_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wev_group` INTEGER UNSIGNED NOT NULL,

    PRIMARY KEY (`wev_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_faq` (
    `wfq_no` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `wfq_type` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `wfq_kind` TINYINT UNSIGNED NOT NULL DEFAULT 10,
    `wfq_question` VARCHAR(200) NOT NULL DEFAULT '',
    `wfq_content` MEDIUMTEXT NULL,
    `wfq_hit` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `wfq_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wfq_delete_date` DATETIME(0) NULL,
    `wfq_reg_name` VARCHAR(40) NOT NULL DEFAULT '',
    `wfq_reg_ip` VARCHAR(40) NOT NULL DEFAULT '',
    `wfq_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wfq_regtime` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wfq_regdate` DATE NOT NULL DEFAULT ('0000-00-00'),

    INDEX `wfq_delete`(`wfq_delete`),
    INDEX `wfq_kind`(`wfq_kind`),
    PRIMARY KEY (`wfq_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_popup` (
    `wpu_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wpu_display_ingstory` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_display_zaksim` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_display_space` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_display_pickko` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_title` VARCHAR(255) NOT NULL,
    `wpu_content` TEXT NOT NULL,
    `wpu_width` INTEGER NOT NULL,
    `wpu_height` INTEGER NOT NULL,
    `wpu_x` INTEGER NOT NULL,
    `wpu_y` INTEGER NOT NULL,
    `wpu_image` VARCHAR(255) NOT NULL,
    `wpu_link` VARCHAR(255) NOT NULL,
    `wpu_target` VARCHAR(40) NOT NULL,
    `wpu_show` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `wpu_start` DATE NOT NULL,
    `wpu_end` DATE NOT NULL,
    `wpu_move` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_modal` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_ip` VARCHAR(40) NOT NULL,
    `wpu_history` TEXT NOT NULL,
    `wpu_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wpu_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`wpu_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_web_popup_test` (
    `wpu_no` INTEGER NOT NULL AUTO_INCREMENT,
    `wpu_display` VARCHAR(255) NOT NULL,
    `wpu_title` VARCHAR(255) NOT NULL,
    `wpu_content` TEXT NOT NULL,
    `wpu_width` INTEGER NOT NULL,
    `wpu_height` INTEGER NOT NULL,
    `wpu_x` INTEGER NOT NULL,
    `wpu_y` INTEGER NOT NULL,
    `wpu_image` VARCHAR(255) NOT NULL,
    `wpu_link` VARCHAR(255) NOT NULL,
    `wpu_target` VARCHAR(40) NOT NULL,
    `wpu_show` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
    `wpu_start` DATE NOT NULL,
    `wpu_end` DATE NOT NULL,
    `wpu_move` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_modal` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_delete` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    `wpu_ip` VARCHAR(40) NOT NULL,
    `wpu_history` TEXT NOT NULL,
    `wpu_update` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `wpu_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`wpu_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `n2_ws` (
    `ws_no` INTEGER NOT NULL AUTO_INCREMENT,
    `sp_no` INTEGER NOT NULL,
    `ws_regdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`ws_no`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
