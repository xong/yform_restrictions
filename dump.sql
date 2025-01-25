## Redaxo Database Dump Version 5
## Prefix rex_
## charset utf8mb4

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `rex_action`;
CREATE TABLE `rex_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `preview` text DEFAULT NULL,
  `presave` text DEFAULT NULL,
  `postsave` text DEFAULT NULL,
  `previewmode` tinyint(4) DEFAULT NULL,
  `presavemode` tinyint(4) DEFAULT NULL,
  `postsavemode` tinyint(4) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_article`;
CREATE TABLE `rex_article` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `catname` varchar(255) NOT NULL,
  `catpriority` int(10) unsigned NOT NULL,
  `startarticle` tinyint(1) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `find_articles` (`id`,`clang_id`),
  KEY `clang_id` (`clang_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_article_slice`;
CREATE TABLE `rex_article_slice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `ctype_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `revision` int(11) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `value1` mediumtext DEFAULT NULL,
  `value2` mediumtext DEFAULT NULL,
  `value3` mediumtext DEFAULT NULL,
  `value4` mediumtext DEFAULT NULL,
  `value5` mediumtext DEFAULT NULL,
  `value6` mediumtext DEFAULT NULL,
  `value7` mediumtext DEFAULT NULL,
  `value8` mediumtext DEFAULT NULL,
  `value9` mediumtext DEFAULT NULL,
  `value10` mediumtext DEFAULT NULL,
  `value11` mediumtext DEFAULT NULL,
  `value12` mediumtext DEFAULT NULL,
  `value13` mediumtext DEFAULT NULL,
  `value14` mediumtext DEFAULT NULL,
  `value15` mediumtext DEFAULT NULL,
  `value16` mediumtext DEFAULT NULL,
  `value17` mediumtext DEFAULT NULL,
  `value18` mediumtext DEFAULT NULL,
  `value19` mediumtext DEFAULT NULL,
  `value20` mediumtext DEFAULT NULL,
  `media1` varchar(255) DEFAULT NULL,
  `media2` varchar(255) DEFAULT NULL,
  `media3` varchar(255) DEFAULT NULL,
  `media4` varchar(255) DEFAULT NULL,
  `media5` varchar(255) DEFAULT NULL,
  `media6` varchar(255) DEFAULT NULL,
  `media7` varchar(255) DEFAULT NULL,
  `media8` varchar(255) DEFAULT NULL,
  `media9` varchar(255) DEFAULT NULL,
  `media10` varchar(255) DEFAULT NULL,
  `medialist1` text DEFAULT NULL,
  `medialist2` text DEFAULT NULL,
  `medialist3` text DEFAULT NULL,
  `medialist4` text DEFAULT NULL,
  `medialist5` text DEFAULT NULL,
  `medialist6` text DEFAULT NULL,
  `medialist7` text DEFAULT NULL,
  `medialist8` text DEFAULT NULL,
  `medialist9` text DEFAULT NULL,
  `medialist10` text DEFAULT NULL,
  `link1` varchar(10) DEFAULT NULL,
  `link2` varchar(10) DEFAULT NULL,
  `link3` varchar(10) DEFAULT NULL,
  `link4` varchar(10) DEFAULT NULL,
  `link5` varchar(10) DEFAULT NULL,
  `link6` varchar(10) DEFAULT NULL,
  `link7` varchar(10) DEFAULT NULL,
  `link8` varchar(10) DEFAULT NULL,
  `link9` varchar(10) DEFAULT NULL,
  `link10` varchar(10) DEFAULT NULL,
  `linklist1` text DEFAULT NULL,
  `linklist2` text DEFAULT NULL,
  `linklist3` text DEFAULT NULL,
  `linklist4` text DEFAULT NULL,
  `linklist5` text DEFAULT NULL,
  `linklist6` text DEFAULT NULL,
  `linklist7` text DEFAULT NULL,
  `linklist8` text DEFAULT NULL,
  `linklist9` text DEFAULT NULL,
  `linklist10` text DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slice_priority` (`article_id`,`priority`,`module_id`),
  KEY `find_slices` (`clang_id`,`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_clang`;
CREATE TABLE `rex_clang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_clang` WRITE;
/*!40000 ALTER TABLE `rex_clang` DISABLE KEYS */;
INSERT INTO `rex_clang` VALUES 
  (1,'de','deutsch',1,1,0);
/*!40000 ALTER TABLE `rex_clang` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_config`;
CREATE TABLE `rex_config` (
  `namespace` varchar(75) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`namespace`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_config` WRITE;
/*!40000 ALTER TABLE `rex_config` DISABLE KEYS */;
INSERT INTO `rex_config` VALUES 
  ('core','package-config','{\"adminer\":{\"install\":false,\"status\":false},\"backup\":{\"install\":true,\"status\":true},\"be_style\":{\"install\":true,\"status\":true,\"plugins\":{\"customizer\":{\"install\":false,\"status\":false},\"redaxo\":{\"install\":true,\"status\":true}}},\"cronjob\":{\"install\":false,\"status\":false,\"plugins\":{\"article_status\":{\"install\":false,\"status\":false},\"optimize_tables\":{\"install\":false,\"status\":false}}},\"debug\":{\"install\":false,\"status\":false},\"developer\":{\"install\":false,\"status\":false},\"focuspoint\":{\"install\":false,\"status\":false},\"install\":{\"install\":true,\"status\":true},\"mblock\":{\"install\":false,\"status\":false},\"media_manager\":{\"install\":true,\"status\":true},\"mediapool\":{\"install\":true,\"status\":true},\"metainfo\":{\"install\":true,\"status\":true},\"phpmailer\":{\"install\":false,\"status\":false},\"project\":{\"install\":true,\"status\":true},\"quick_navigation\":{\"install\":false,\"status\":false},\"sprog\":{\"install\":false,\"status\":false},\"structure\":{\"install\":true,\"status\":true,\"plugins\":{\"content\":{\"install\":true,\"status\":true},\"history\":{\"install\":false,\"status\":false},\"version\":{\"install\":false,\"status\":false}}},\"url\":{\"install\":false,\"status\":false},\"users\":{\"install\":true,\"status\":true},\"watson\":{\"install\":false,\"status\":false},\"ydeploy\":{\"install\":false,\"status\":false},\"yform\":{\"install\":true,\"status\":true,\"plugins\":{\"email\":{\"install\":true,\"status\":true},\"manager\":{\"install\":true,\"status\":true},\"rest\":{\"install\":false,\"status\":false},\"tools\":{\"install\":false,\"status\":false}}},\"yrewrite\":{\"install\":false,\"status\":false}}'),
  ('core','package-order','[\"be_style\",\"be_style\\/redaxo\",\"users\",\"backup\",\"install\",\"media_manager\",\"mediapool\",\"structure\",\"metainfo\",\"structure\\/content\",\"yform\",\"yform\\/email\",\"yform\\/manager\",\"project\"]'),
  ('core','utf8mb4','true'),
  ('core','version','\"5.18.1\"'),
  ('media_manager','avif_quality','60'),
  ('media_manager','avif_speed','6'),
  ('media_manager','interlace','[\"jpg\"]'),
  ('media_manager','jpg_quality','80'),
  ('media_manager','png_compression','5'),
  ('media_manager','webp_quality','85'),
  ('structure','notfound_article_id','1'),
  ('structure','start_article_id','1'),
  ('yform_restrictions_1','rex_yf_location','\"|2|3|\"');
/*!40000 ALTER TABLE `rex_config` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_media`;
CREATE TABLE `rex_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `attributes` text DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `originalname` varchar(255) DEFAULT NULL,
  `filesize` varchar(255) DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_media_category`;
CREATE TABLE `rex_media_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `attributes` text DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_media_manager_type`;
CREATE TABLE `rex_media_manager_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_media_manager_type` WRITE;
/*!40000 ALTER TABLE `rex_media_manager_type` DISABLE KEYS */;
INSERT INTO `rex_media_manager_type` VALUES 
  (1,1,'rex_media_small','200 × 200 px','2025-01-25 11:16:18','admin','2025-01-25 11:16:18','admin'),
  (2,1,'rex_media_medium','600 × 600 px','2025-01-25 11:16:18','admin','2025-01-25 11:16:18','admin'),
  (3,1,'rex_media_large','1200 × 1200 px','2025-01-25 11:16:18','admin','2025-01-25 11:16:18','admin');
/*!40000 ALTER TABLE `rex_media_manager_type` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_media_manager_type_effect`;
CREATE TABLE `rex_media_manager_type_effect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL,
  `effect` varchar(255) NOT NULL,
  `parameters` text NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_media_manager_type_effect` WRITE;
/*!40000 ALTER TABLE `rex_media_manager_type_effect` DISABLE KEYS */;
INSERT INTO `rex_media_manager_type_effect` VALUES 
  (1,1,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"200\",\"rex_effect_resize_height\":\"200\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2025-01-25 11:16:18','admin','2025-01-25 11:16:18','admin'),
  (2,2,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"600\",\"rex_effect_resize_height\":\"600\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2025-01-25 11:16:18','admin','2025-01-25 11:16:18','admin'),
  (3,3,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"1200\",\"rex_effect_resize_height\":\"1200\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2025-01-25 11:16:18','admin','2025-01-25 11:16:18','admin');
/*!40000 ALTER TABLE `rex_media_manager_type_effect` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_metainfo_field`;
CREATE TABLE `rex_metainfo_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  `attributes` text NOT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `default` varchar(255) NOT NULL,
  `params` text DEFAULT NULL,
  `validate` text DEFAULT NULL,
  `callback` text DEFAULT NULL,
  `restrictions` text DEFAULT NULL,
  `templates` text DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_metainfo_type`;
CREATE TABLE `rex_metainfo_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `dbtype` varchar(255) NOT NULL,
  `dblength` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_metainfo_type` WRITE;
/*!40000 ALTER TABLE `rex_metainfo_type` DISABLE KEYS */;
INSERT INTO `rex_metainfo_type` VALUES 
  (1,'text','text',0),
  (2,'textarea','text',0),
  (3,'select','varchar',255),
  (4,'radio','varchar',255),
  (5,'checkbox','varchar',255),
  (6,'REX_MEDIA_WIDGET','varchar',255),
  (7,'REX_MEDIALIST_WIDGET','text',0),
  (8,'REX_LINK_WIDGET','varchar',255),
  (9,'REX_LINKLIST_WIDGET','text',0),
  (10,'date','text',0),
  (11,'datetime','text',0),
  (12,'legend','text',0),
  (13,'time','text',0);
/*!40000 ALTER TABLE `rex_metainfo_type` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_module`;
CREATE TABLE `rex_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `output` mediumtext NOT NULL,
  `input` mediumtext NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `attributes` text DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_module_action`;
CREATE TABLE `rex_module_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_template`;
CREATE TABLE `rex_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `attributes` text DEFAULT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_template` WRITE;
/*!40000 ALTER TABLE `rex_template` DISABLE KEYS */;
INSERT INTO `rex_template` VALUES 
  (1,NULL,'Default','REX_ARTICLE[]',1,'2025-01-25 11:15:22','backend','2025-01-25 11:15:22','backend','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0);
/*!40000 ALTER TABLE `rex_template` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_user`;
CREATE TABLE `rex_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `language` varchar(255) NOT NULL,
  `startpage` varchar(255) NOT NULL,
  `role` text DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `login_tries` tinyint(4) NOT NULL DEFAULT 0,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `password_changed` datetime NOT NULL,
  `previous_passwords` text NOT NULL,
  `password_change_required` tinyint(1) NOT NULL,
  `lasttrydate` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_user` WRITE;
/*!40000 ALTER TABLE `rex_user` DISABLE KEYS */;
INSERT INTO `rex_user` VALUES 
  (1,'Administrator',NULL,'admin','$2y$10$g3F/mcrul/.4VufozdpjE.Iuc9sRqf1Db0qy.QYYOQR20313JDLpS',NULL,1,1,'','',NULL,NULL,0,'2025-01-25 11:15:50','setup','2025-01-25 11:15:50','setup','2025-01-25 11:15:50','[]',0,'2025-01-25 11:15:56','2025-01-25 11:15:56','dq6nlludme2t3e1b85t1vo3e8d',0);
/*!40000 ALTER TABLE `rex_user` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_user_passkey`;
CREATE TABLE `rex_user_passkey` (
  `id` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `public_key` text NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rex_user_passkey_user_id` (`user_id`),
  CONSTRAINT `rex_user_passkey_user_id` FOREIGN KEY (`user_id`) REFERENCES `rex_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_user_role`;
CREATE TABLE `rex_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `perms` text NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_user_session`;
CREATE TABLE `rex_user_session` (
  `session_id` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `cookie_key` varchar(255) DEFAULT NULL,
  `passkey_id` varchar(255) DEFAULT NULL,
  `ip` varchar(39) NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `starttime` datetime NOT NULL,
  `last_activity` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `cookie_key` (`cookie_key`),
  KEY `rex_user_session_user_id` (`user_id`),
  KEY `rex_user_session_passkey_id` (`passkey_id`),
  CONSTRAINT `rex_user_session_passkey_id` FOREIGN KEY (`passkey_id`) REFERENCES `rex_user_passkey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rex_user_session_user_id` FOREIGN KEY (`user_id`) REFERENCES `rex_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_user_session` WRITE;
/*!40000 ALTER TABLE `rex_user_session` DISABLE KEYS */;
INSERT INTO `rex_user_session` VALUES 
  ('dq6nlludme2t3e1b85t1vo3e8d',1,'XY+Aoljdb3P/QoVUjJwIUlhdukp82lN0sL4VGXIM0nmXWkmqDhvznU49lihxQBONQQHayTPkOBpzXybLzt+Ckg==',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0','2025-01-25 11:15:56','2025-01-25 12:12:43');
/*!40000 ALTER TABLE `rex_user_session` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yf_location`;
CREATE TABLE `rex_yf_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_yf_location` WRITE;
/*!40000 ALTER TABLE `rex_yf_location` DISABLE KEYS */;
INSERT INTO `rex_yf_location` VALUES 
  (1,'Halle'),
  (2,'Leipzig'),
  (3,'Heilbronn'),
  (4,'Berlin'),
  (5,'München');
/*!40000 ALTER TABLE `rex_yf_location` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yform_email_template`;
CREATE TABLE `rex_yform_email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL DEFAULT '',
  `mail_from` varchar(191) NOT NULL DEFAULT '',
  `mail_from_name` varchar(191) NOT NULL DEFAULT '',
  `mail_reply_to` varchar(191) NOT NULL DEFAULT '',
  `mail_reply_to_name` varchar(191) NOT NULL DEFAULT '',
  `subject` varchar(191) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `body_html` text NOT NULL,
  `attachments` text NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_field`;
CREATE TABLE `rex_yform_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) NOT NULL,
  `prio` int(11) NOT NULL,
  `type_id` varchar(191) NOT NULL,
  `type_name` varchar(191) NOT NULL,
  `db_type` varchar(191) NOT NULL,
  `list_hidden` tinyint(1) NOT NULL,
  `search` tinyint(1) NOT NULL,
  `name` text NOT NULL,
  `label` text NOT NULL,
  `not_required` text NOT NULL,
  `multiple` text NOT NULL,
  `expanded` text NOT NULL,
  `choices` text NOT NULL,
  `choice_attributes` text NOT NULL,
  `no_db` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_yform_field` WRITE;
/*!40000 ALTER TABLE `rex_yform_field` DISABLE KEYS */;
INSERT INTO `rex_yform_field` VALUES 
  (1,'rex_yf_location',1,'value','text','text',0,1,'name','Bezeichnung','','','','','','0');
/*!40000 ALTER TABLE `rex_yform_field` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yform_history`;
CREATE TABLE `rex_yform_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `action` varchar(191) NOT NULL,
  `user` varchar(191) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataset` (`table_name`,`dataset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_history_field`;
CREATE TABLE `rex_yform_history_field` (
  `history_id` int(11) NOT NULL,
  `field` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`history_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_table`;
CREATE TABLE `rex_yform_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `table_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `list_amount` int(11) NOT NULL DEFAULT 50,
  `list_sortfield` varchar(191) NOT NULL DEFAULT 'id',
  `list_sortorder` enum('ASC','DESC') NOT NULL DEFAULT 'ASC',
  `prio` int(11) NOT NULL,
  `search` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `export` tinyint(1) NOT NULL,
  `import` tinyint(1) NOT NULL,
  `mass_deletion` tinyint(1) NOT NULL,
  `mass_edit` tinyint(1) NOT NULL,
  `schema_overwrite` tinyint(1) NOT NULL DEFAULT 1,
  `history` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_yform_table` WRITE;
/*!40000 ALTER TABLE `rex_yform_table` DISABLE KEYS */;
INSERT INTO `rex_yform_table` VALUES 
  (1,1,'rex_yf_location','Standorte','',50,'id','ASC',1,0,0,0,0,0,0,1,0);
/*!40000 ALTER TABLE `rex_yform_table` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS = 1;
