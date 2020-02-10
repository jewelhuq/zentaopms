CREATE DATABASE `zentao_zhonghe_testing` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use    zentao_zhonghe_testing;

-- DROP TABLE IF EXISTS `zt_action`;
CREATE TABLE IF NOT EXISTS `zt_action` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `objectType` varchar(30) NOT NULL default '',
  `objectID` mediumint(8) unsigned NOT NULL default '0',
  `product` varchar(255) NOT NULL,
  `project` mediumint(9) NOT NULL,
  `actor` varchar(100) NOT NULL default '',
  `action` varchar(30) NOT NULL default '',
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  `extra` text NOT NULL,
  `read` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `actor` (`actor`),
  KEY `project` (`project`),
  KEY `objectID` (`objectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_block`;
CREATE TABLE IF NOT EXISTS `zt_block` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `module` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `source` varchar(20) NOT NULL,
  `block` varchar(20) NOT NULL,
  `params` text NOT NULL,
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountModuleOrder` (`account`,`module`,`order`),
  KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_branch`;
CREATE TABLE IF NOT EXISTS `zt_branch` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` smallint unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY  (`id`),
  KEY `product` (`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_bug`;
CREATE TABLE IF NOT EXISTS `zt_bug` (
  `id` mediumint(8) NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `branch` mediumint(8) unsigned NOT NULL default '0',
  `module` mediumint(8) unsigned NOT NULL default '0',
  `project` mediumint(8) unsigned NOT NULL default '0',
  `plan` mediumint(8) unsigned NOT NULL default '0',
  `story` mediumint(8) unsigned NOT NULL default '0',
  `storyVersion` smallint(6) NOT NULL default '1',
  `task` mediumint(8) unsigned NOT NULL default '0',
  `toTask` mediumint(8) unsigned NOT NULL default '0',
  `toStory` mediumint(8) NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `severity` tinyint(4) NOT NULL default '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `type` varchar(30) NOT NULL default '',
  `os` varchar(30) NOT NULL default '',
  `browser` varchar(30) NOT NULL default '',
  `hardware` varchar(30) NOT NULL,
  `found` varchar(30) NOT NULL default '',
  `steps` text NOT NULL,
  `status` enum('active','resolved','closed') NOT NULL default 'active',
  `subStatus` varchar(30) NOT NULL default '',
  `color` char(7) NOT NULL,
  `confirmed` tinyint(1) NOT NULL default '0',
  `activatedCount` smallint(6) NOT NULL,
  `activatedDate` datetime NOT NULL,
  `mailto` text,
  `openedBy` varchar(30) NOT NULL default '',
  `openedDate` datetime NOT NULL,
  `openedBuild` varchar(255) NOT NULL,
  `assignedTo` varchar(30) NOT NULL default '',
  `assignedDate` datetime NOT NULL,
  `deadline` date NOT NULL,
  `resolvedBy` varchar(30) NOT NULL default '',
  `resolution` varchar(30) NOT NULL default '',
  `resolvedBuild` varchar(30) NOT NULL default '',
  `resolvedDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL default '',
  `closedDate` datetime NOT NULL,
  `duplicateBug` mediumint(8) unsigned NOT NULL,
  `linkBug` varchar(255) NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `caseVersion` smallint(6) NOT NULL,
  `result` mediumint(8) unsigned NOT NULL,
  `repo` mediumint(8) unsigned NOT NULL,
  `entry` varchar(255) NOT NULL,
  `lines` varchar(10) NOT NULL,
  `v1` varchar(40) NOT NULL,
  `v2` varchar(40) NOT NULL,
  `repoType` varchar(30) NOT NULL DEFAULT '',
  `testtask` mediumint(8) unsigned NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL default '',
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `project` (`project`),
  KEY `status` (`status`),
  KEY `plan` (`plan`),
  KEY `story` (`story`),
  KEY `case` (`case`),
  KEY `assignedTo` (`assignedTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_build`;
CREATE TABLE IF NOT EXISTS `zt_build` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `branch` mediumint(8) unsigned NOT NULL default '0',
  `project` mediumint(8) unsigned NOT NULL default '0',
  `name` char(150) NOT NULL,
  `scmPath` char(255) NOT NULL,
  `filePath` char(255) NOT NULL,
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `builder` char(30) NOT NULL default '',
  `desc` text NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `project` (`project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_burn`;
CREATE TABLE IF NOT EXISTS `zt_burn` (
  `project` mediumint(8) unsigned NOT NULL,
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `estimate` float NOT NULL,
  `left` float NOT NULL,
  `consumed` float NOT NULL,
  PRIMARY KEY  (`project`,`date`,`task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_case`;
CREATE TABLE IF NOT EXISTS `zt_case` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `branch` mediumint(8) unsigned NOT NULL default '0',
  `lib` mediumint(8) unsigned NOT NULL default '0',
  `module` mediumint(8) unsigned NOT NULL default '0',
  `path` mediumint(8) unsigned NOT NULL default '0',
  `story` mediumint(30) unsigned NOT NULL default '0',
  `storyVersion` smallint(6) NOT NULL default '1',
  `title` varchar(255) NOT NULL,
  `precondition` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL default '3',
  `type` char(30) NOT NULL default '1',
  `stage` varchar(255) NOT NULL,
  `howRun` varchar(30) NOT NULL,
  `scriptedBy` varchar(30) NOT NULL,
  `scriptedDate` date NOT NULL,
  `scriptStatus` varchar(30) NOT NULL,
  `scriptLocation` varchar(255) NOT NULL,
  `status` char(30) NOT NULL default '1',
  `subStatus` varchar(30) NOT NULL default '',
  `color` char(7) NOT NULL,
  `frequency` enum('1','2','3') NOT NULL default '1',
  `order` tinyint(30) unsigned NOT NULL default '0',
  `openedBy` char(30) NOT NULL default '',
  `openedDate` datetime NOT NULL,
  `reviewedBy` varchar(255) NOT NULL,
  `reviewedDate` date NOT NULL,
  `lastEditedBy` char(30) NOT NULL default '',
  `lastEditedDate` datetime NOT NULL,
  `version` tinyint(3) unsigned NOT NULL default '0',
  `linkCase` varchar(255) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL,
  `fromCaseID` mediumint(8) unsigned NOT NULL,
  `fromCaseVersion` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `story` (`story`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_casestep`;
CREATE TABLE IF NOT EXISTS `zt_casestep` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `case` mediumint(8) unsigned NOT NULL default '0',
  `version` smallint(3) unsigned NOT NULL default '0',
  `type` varchar(10) NOT NULL DEFAULT 'step',
  `desc` text NOT NULL,
  `expect` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `case` (`case`),
  KEY `version` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_company`;
CREATE TABLE IF NOT EXISTS `zt_company` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` char(120) default NULL,
  `phone` char(20) default NULL,
  `fax` char(20) default NULL,
  `address` char(120) default NULL,
  `zipcode` char(10) default NULL,
  `website` char(120) default NULL,
  `backyard` char(120) default NULL,
  `guest` enum('1','0') NOT NULL default '0',
  `admins` char(255) default NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_config`;
CREATE TABLE IF NOT EXISTS `zt_config` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `owner` char(30) NOT NULL default '',
  `module` varchar(30) NOT NULL,
  `section` char(30) NOT NULL default '',
  `key` char(30) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique` (`owner`,`module`,`section`,`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_cron`;
CREATE TABLE IF NOT EXISTS `zt_cron` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(20) NOT NULL,
  `h` varchar(20) NOT NULL,
  `dom` varchar(20) NOT NULL,
  `mon` varchar(20) NOT NULL,
  `dow` varchar(20) NOT NULL,
  `command` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `buildin` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL,
  `lastTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lastTime` (`lastTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_lang`;
CREATE TABLE IF NOT EXISTS `zt_lang` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `lang` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  `key` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `system` enum('0','1') NOT NULL default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `lang` (`lang`,`module`,`section`,`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_dept`;
CREATE TABLE IF NOT EXISTS `zt_dept` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` char(60) NOT NULL,
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `path` char(255) NOT NULL default '',
  `grade` tinyint(3) unsigned NOT NULL default '0',
  `order` smallint(4) unsigned NOT NULL default '0',
  `position` char(30) NOT NULL default '',
  `function` char(255) NOT NULL default '',
  `manager` char(30) NOT NULL default '',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `path` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_doc`;
CREATE TABLE IF NOT EXISTS `zt_doc` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL,
  `lib` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `views` smallint(5) unsigned NOT NULL,
  `collector` text NOT NULL,
  `addedBy` varchar(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `acl` varchar(10) NOT NULL DEFAULT 'open',
  `groups` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `project` (`project`),
  KEY `lib` (`lib`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_doccontent`;
CREATE TABLE IF NOT EXISTS `zt_doccontent` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `doc` mediumint(8) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `files` text NOT NULL,
  `type` varchar(10) NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doc_version` (`doc`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_doclib`;
CREATE TABLE IF NOT EXISTS `zt_doclib` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `type` varchar(30) NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `acl` varchar(10) NOT NULL DEFAULT 'open',
  `groups` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `main` enum('0','1') NOT NULL default '0',
  `collector` text NOT NULL,
  `order` tinyint(5) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `product` (`product`),
  KEY `project` (`project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_effort`;
CREATE TABLE IF NOT EXISTS `zt_effort` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user` char(30) NOT NULL default '',
  `todo` enum('1','0') NOT NULL default '1',
  `date` date NOT NULL,
  `begin` datetime NOT NULL default '0000-00-00 00:00:00',
  `end` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` enum('1','2','3') NOT NULL default '1',
  `idvalue` mediumint(8) unsigned NOT NULL default '0',
  `name` char(30) NOT NULL default '',
  `desc` char(255) NOT NULL default '',
  `status` enum('1','2','3') NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_extension`;
CREATE TABLE IF NOT EXISTS `zt_extension` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(150) NOT NULL,
  `code` varchar(30) NOT NULL,
  `version` varchar(50) NOT NULL,
  `author` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `license` text NOT NULL,
  `type` varchar(20) NOT NULL default 'extension',
  `site` varchar(150) NOT NULL,
  `zentaoCompatible` varchar(100) NOT NULL,
  `installedTime` datetime NOT NULL,
  `depends` varchar(100) NOT NULL,
  `dirs` mediumtext NOT NULL,
  `files` mediumtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `name` (`name`),
  KEY `installedTime` (`installedTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_file`;
CREATE TABLE IF NOT EXISTS `zt_file` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `pathname` char(50) NOT NULL,
  `title` char(255) NOT NULL,
  `extension` char(30) NOT NULL,
  `size` int(10) unsigned NOT NULL default '0',
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) NOT NULL default '',
  `addedDate` datetime NOT NULL,
  `downloads` mediumint(8) unsigned NOT NULL default '0',
  `extra` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `objectType` (`objectType`),
  KEY `objectID` (`objectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_group`;
CREATE TABLE IF NOT EXISTS `zt_group` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` char(30) NOT NULL,
  `role` char(30) NOT NULL default '',
  `desc` char(255) NOT NULL default '',
  `acl` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_grouppriv`;
CREATE TABLE IF NOT EXISTS `zt_grouppriv` (
  `group` mediumint(8) unsigned NOT NULL default '0',
  `module` char(30) NOT NULL default '',
  `method` char(30) NOT NULL default '',
  UNIQUE KEY `group` (`group`,`module`,`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_history`;
CREATE TABLE IF NOT EXISTS `zt_history` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `action` mediumint(8) unsigned NOT NULL default '0',
  `field` varchar(30) NOT NULL default '',
  `old` text NOT NULL,
  `new` text NOT NULL,
  `diff` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action` (`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_module`;
CREATE TABLE IF NOT EXISTS `zt_module` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `root` mediumint(8) unsigned NOT NULL default '0',
  `branch` mediumint(8) unsigned NOT NULL default '0',
  `name` char(60) NOT NULL default '',
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `path` char(255) NOT NULL default '',
  `grade` tinyint(3) unsigned NOT NULL default '0',
  `order` smallint(5) unsigned NOT NULL default '0',
  `type` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `collector` text NOT NULL,
  `short` varchar(30) NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `type` (`type`),
  KEY `path` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_notify`;
CREATE TABLE IF NOT EXISTS `zt_notify` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `objectType` varchar(50) NOT NULL,
  `objectID` mediumint unsigned NOT NULL,
  `action` mediumint NOT NULL,
  `toList` varchar(255) NOT NULL,
  `ccList` text NOT NULL,
  `subject` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `sendTime` datetime NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'wait',
  `failReason` text NOT NULL
) ENGINE='MyISAM' COLLATE 'utf8_general_ci';
-- DROP TABLE IF EXISTS `zt_oauth`;
CREATE TABLE IF NOT EXISTS `zt_oauth` (
  `account` varchar(30) NOT NULL,
  `openID` varchar(255) NOT NULL,
  `providerType` varchar(30) NOT NULL,
  `providerID` mediumint(8) unsigned NOT NULL,
  KEY `account` (`account`),
  KEY `providerType` (`providerType`),
  KEY `providerID` (`providerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_product`;
CREATE TABLE IF NOT EXISTS `zt_product` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `line` mediumint(8) NOT NULL,
  `type` varchar(30) NOT NULL default 'normal',
  `status` varchar(30) NOT NULL default '',
  `subStatus` varchar(30) NOT NULL default '',
  `desc` text NOT NULL,
  `PO` varchar(30) NOT NULL,
  `QD` varchar(30) NOT NULL,
  `RD` varchar(30) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL default 'open',
  `whitelist` text NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdVersion` varchar(20) NOT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `acl` (`acl`),
  KEY `order` (`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_productplan`;
CREATE TABLE IF NOT EXISTS `zt_productplan` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  `parent` mediumint(9) NOT NULL DEFAULT '0',
  `title` varchar(90) NOT NULL,
  `desc` text NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `order` text NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `end` (`end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_project`;
CREATE TABLE IF NOT EXISTS `zt_project` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `isCat` enum('1','0') NOT NULL default '0',
  `catID` mediumint(8) unsigned NOT NULL,
  `type` varchar(20) NOT NULL default 'sprint',
  `parent` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `days` smallint(5) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `subStatus` varchar(30) NOT NULL default '',
  `statge` enum('1','2','3','4','5') NOT NULL default '1',
  `pri` enum('1','2','3','4') NOT NULL default '1',
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL default '',
  `openedDate` datetime NOT NULL,
  `openedVersion` varchar(20) NOT NULL,
  `closedBy` varchar(30) NOT NULL default '',
  `closedDate` datetime NOT NULL,
  `canceledBy` varchar(30) NOT NULL default '',
  `canceledDate` datetime NOT NULL,
  `PO` varchar(30) NOT NULL default '',
  `PM` varchar(30) NOT NULL default '',
  `QD` varchar(30) NOT NULL default '',
  `RD` varchar(30) NOT NULL default '',
  `team` varchar(90) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL default 'open',
  `whitelist` text NOT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `parent` (`parent`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `status` (`status`),
  KEY `acl` (`acl`),
  KEY `order` (`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_projectproduct`;
CREATE TABLE IF NOT EXISTS `zt_projectproduct` (
  `project` mediumint(8) unsigned NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  `plan` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`project`,`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_projectstory`;
CREATE TABLE IF NOT EXISTS `zt_projectstory` (
  `project` mediumint(8) unsigned NOT NULL default '0',
  `product` mediumint(8) unsigned NOT NULL,
  `story` mediumint(8) unsigned NOT NULL default '0',
  `version` smallint(6) NOT NULL default '1',
  `order` smallint(6) unsigned NOT NULL,
  UNIQUE KEY `project` (`project`,`story`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_release`;
CREATE TABLE IF NOT EXISTS `zt_release` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `branch` mediumint(8) unsigned NOT NULL default '0',
  `build` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `marker` enum('0','1') NOT NULL default '0',
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `leftBugs` text NOT NULL,
  `desc` text NOT NULL,
  `status` varchar(20) NOT NULL default 'normal',
  `subStatus` varchar(30) NOT NULL default '',
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `build` (`build`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_story`;
CREATE TABLE IF NOT EXISTS `zt_story` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `product` mediumint(8) unsigned NOT NULL default '0',
  `branch` mediumint(8) unsigned NOT NULL default '0',
  `module` mediumint(8) unsigned NOT NULL default '0',
  `plan` text,
  `source` varchar(20) NOT NULL,
  `sourceNote` varchar(255) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL default '',
  `pri` tinyint(3) unsigned NOT NULL default '3',
  `estimate` float unsigned NOT NULL,
  `status` enum('','changed','active','draft','closed') NOT NULL default '',
  `subStatus` varchar(30) NOT NULL default '',
  `color` char(7) NOT NULL,
  `stage` enum('','wait','planned','projected','developing','developed','testing','tested','verified','released', 'closed') NOT NULL DEFAULT 'wait',
  `stagedBy` char(30) NOT NULL,
  `mailto` text,
  `openedBy` varchar(30) NOT NULL default '',
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL default '',
  `assignedDate` datetime NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL default '',
  `lastEditedDate` datetime NOT NULL,
  `reviewedBy` varchar(255) NOT NULL,
  `reviewedDate` date NOT NULL,
  `closedBy` varchar(30) NOT NULL default '',
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `toBug` mediumint(8) unsigned NOT NULL,
  `childStories` varchar(255) NOT NULL,
  `linkStories` varchar(255) NOT NULL,
  `duplicateStory` mediumint(8) unsigned NOT NULL,
  `version` smallint(6) NOT NULL default '1',
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `product` (`product`),
  KEY `status` (`status`),
  KEY `assignedTo` (`assignedTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_storyspec`;
CREATE TABLE IF NOT EXISTS `zt_storyspec` (
  `story` mediumint(9) NOT NULL,
  `version` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `spec` text NOT NULL,
  `verify` text NOT NULL,
  UNIQUE KEY `story` (`story`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_storystage`;
CREATE TABLE IF NOT EXISTS `zt_storystage` (
  `story` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  `stage` varchar(50) NOT NULL,
  `stagedBy` char(30) NOT NULL,
  UNIQUE KEY `story_branch` (`story`,`branch`),
  KEY `story` (`story`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_suitecase`;
CREATE TABLE IF NOT EXISTS `zt_suitecase` (
  `suite` mediumint(8) unsigned NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `suitecase` (`suite`,`case`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_task`;
CREATE TABLE IF NOT EXISTS `zt_task` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent` mediumint(8) NOT NULL DEFAULT '0',
  `project` mediumint(8) unsigned NOT NULL default '0',
  `module` mediumint(8) unsigned NOT NULL default '0',
  `story` mediumint(8) unsigned NOT NULL default '0',
  `storyVersion` smallint(6) NOT NULL default '1',
  `fromBug` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL default '0',
  `estimate` float unsigned NOT NULL,
  `consumed` float unsigned NOT NULL,
  `left` float unsigned NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('wait','doing','done','pause','cancel','closed') NOT NULL default 'wait',
  `subStatus` varchar(30) NOT NULL default '',
  `color` char(7) NOT NULL,
  `mailto` text,
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL,
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL,
  `assignedDate` datetime NOT NULL,
  `estStarted` date NOT NULL,
  `realStarted` date NOT NULL,
  `finishedBy` varchar(30) NOT NULL,
  `finishedDate` datetime NOT NULL,
  `finishedList` text NOT NULL,
  `canceledBy` varchar(30) NOT NULL,
  `canceledDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL,
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL,
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL default '0',
   PRIMARY KEY (`id`),
  KEY `project` (`project`),
  KEY `story` (`story`),
  KEY `assignedTo` (`assignedTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_taskestimate`;
CREATE TABLE IF NOT EXISTS `zt_taskestimate` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `task` mediumint(8) unsigned NOT NULL default '0',
  `date` date NOT NULL,
  `left` float unsigned NOT NULL default '0',
  `consumed` float unsigned NOT NULL,
  `account` char(30) NOT NULL default '',
  `work` text,
  PRIMARY KEY (`id`),
  KEY `task` (`task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_team`;
CREATE TABLE IF NOT EXISTS `zt_team` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `root` mediumint(8) unsigned NOT NULL default '0',
  `type` enum('project','task') NOT NULL DEFAULT 'project',
  `account` char(30) NOT NULL default '',
  `role` char(30) NOT NULL default '',
  `limited` char(8) NOT NULL default 'no',
  `join` date NOT NULL default '0000-00-00',
  `days` smallint(5) unsigned NOT NULL,
  `hours` float(2,1) unsigned NOT NULL default '0',
  `estimate` DECIMAL(12,2) UNSIGNED NOT NULL DEFAULT '0',
  `consumed` DECIMAL(12,2) UNSIGNED NOT NULL DEFAULT '0',
  `left` DECIMAL(12,2) UNSIGNED NOT NULL DEFAULT '0',
  `order` TINYINT(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `team` (`root`,`type`,`account`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testreport`;
CREATE TABLE IF NOT EXISTS `zt_testreport` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL,
  `tasks` varchar(255) NOT NULL,
  `builds` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `owner` char(30) NOT NULL,
  `members` text NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `cases` text NOT NULL,
  `report` text NOT NULL,
  `objectType` varchar(20) NOT NULL,
  `objectID` mediumint(8) unsigned NOT NULL,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testresult`;
CREATE TABLE IF NOT EXISTS `zt_testresult` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `run` mediumint(8) unsigned NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  `caseResult` char(30) NOT NULL,
  `stepResults` text NOT NULL,
  `lastRunner` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `case` (`case`),
  KEY `version` (`version`),
  KEY `run` (`run`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testrun`;
CREATE TABLE IF NOT EXISTS `zt_testrun` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `task` mediumint(8) unsigned NOT NULL default '0',
  `case` mediumint(8) unsigned NOT NULL default '0',
  `version` tinyint(3) unsigned NOT NULL default '0',
  `assignedTo` char(30) NOT NULL default '',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  `status` char(30) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `task` (`task`,`case`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testsuite`;
CREATE TABLE IF NOT EXISTS `zt_testsuite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `addedBy` char(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `lastEditedBy` char(30) NOT NULL,
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_testtask`;
CREATE TABLE IF NOT EXISTS `zt_testtask` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` char(90) NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL default '0',
  `build` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL default '0',
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `mailto` text,
  `desc` text NOT NULL,
  `report` text NOT NULL,
  `status` enum('blocked','doing','wait','done') NOT NULL DEFAULT 'wait',
  `subStatus` varchar(30) NOT NULL default '',
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `build` (`build`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_todo`;
CREATE TABLE IF NOT EXISTS `zt_todo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `date` date NOT NULL,
  `begin` smallint(4) unsigned zerofill NOT NULL,
  `end` smallint(4) unsigned zerofill NOT NULL,
  `type` char(10) NOT NULL,
  `cycle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `idvalue` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `name` char(150) NOT NULL,
  `desc` text NOT NULL,
  `status` enum('wait','doing','done','closed') NOT NULL DEFAULT 'wait',
  `private` tinyint(1) NOT NULL,
  `config` varchar(255) NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedBy` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `finishedBy` varchar(30) NOT NULL DEFAULT '',
  `finishedDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `assignedTo` (`assignedTo`),
  KEY `finishedBy` (`finishedBy`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_user`;
CREATE TABLE IF NOT EXISTS `zt_user` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `dept` mediumint(8) unsigned NOT NULL default '0',
  `account` char(30) NOT NULL default '',
  `password` char(32) NOT NULL default '',
  `role` char(10) NOT NULL default '',
  `realname` varchar(100) NOT NULL default '',
  `nickname` char(60) NOT NULL default '',
  `commiter` varchar(100) NOT NULL,
  `avatar` char(30) NOT NULL default '',
  `birthday` date NOT NULL default '0000-00-00',
  `gender` enum('f','m') NOT NULL default 'f',
  `email` char(90) NOT NULL default '',
  `skype` char(90) NOT NULL default '',
  `qq` char(20) NOT NULL default '',
  `mobile` char(11) NOT NULL default '',
  `phone` char(20) NOT NULL default '',
  `weixin` varchar(90) NOT NULL default '',
  `dingding` varchar(90) NOT NULL default '',
  `slack` varchar(90) NOT NULL default '',
  `whatsapp` varchar(90) NOT NULL default '',
  `address` char(120) NOT NULL default '',
  `zipcode` char(10) NOT NULL default '',
  `join` date NOT NULL default '0000-00-00',
  `visits` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL default '',
  `last` int(10) unsigned NOT NULL default '0',
  `fails` tinyint(5) NOT NULL default '0',
  `locked` datetime NOT NULL default '0000-00-00 00:00:00',
  `ranzhi` char(30) NOT NULL default '',
  `score` INT(11) NOT NULL DEFAULT '0',
  `scoreLevel` INT(11) NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `dept` (`dept`),
  KEY `email` (`email`),
  KEY `commiter` (`commiter`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_usercontact`;
CREATE TABLE IF NOT EXISTS `zt_usercontact` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `account` char(30) NOT NULL,
  `listName` varchar(60) NOT NULL,
  `userList` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_usergroup`;
CREATE TABLE IF NOT EXISTS `zt_usergroup` (
  `account` char(30) NOT NULL default '',
  `group` mediumint(8) unsigned NOT NULL default '0',
  UNIQUE KEY `account` (`account`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_userquery`;
CREATE TABLE IF NOT EXISTS `zt_userquery` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `account` char(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(90) NOT NULL,
  `form` text NOT NULL,
  `sql` text NOT NULL,
  `shortcut` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY  (`id`),
  KEY `account` (`account`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_usertpl`;
CREATE TABLE IF NOT EXISTS `zt_usertpl` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `account` char(30) NOT NULL,
  `type` char(30) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `public` enum('0', '1') NOT NULL DEFAULT '0',
  PRIMARY KEY  (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_userview`;
CREATE TABLE IF NOT EXISTS `zt_userview` (
  `account` char(30) NOT NULL,
  `products` mediumtext NOT NULL,
  `projects` mediumtext NOT NULL,
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_entry`;
CREATE TABLE IF NOT EXISTS `zt_entry` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `account` varchar(30) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL,
  `key` varchar(32) NOT NULL,
  `freePasswd` enum('0','1') NOT NULL DEFAULT '0',
  `ip` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `calledTime` int(10) unsigned NOT NULL DEFAULT '0',
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0', '1') NOT NULL DEFAULT '0',
  PRIMARY KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_webhook`;
CREATE TABLE IF NOT EXISTS `zt_webhook` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT 'default',
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `contentType` varchar(30) NOT NULL DEFAULT 'application/json',
  `sendType` enum('sync','async') NOT NULL DEFAULT 'sync',
  `products` text NOT NULL,
  `projects` text NOT NULL,
  `params` varchar(100) NOT NULL,
  `actions` text NOT NULL,
  `desc` text NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0', '1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_log`;
CREATE TABLE IF NOT EXISTS `zt_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `objectType` varchar(30) NOT NULL,
  `objectID` mediumint(8) unsigned NOT NULL,
  `action` mediumint(8) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `contentType` varchar(30) NOT NULL,
  `data` text NOT NULL,
  `result` text  NOT NULL,
  PRIMARY KEY `id` (`id`),
  KEY `objectType` (`objectType`),
  KEY `obejctID` (`objectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- DROP TABLE IF EXISTS `zt_score`;
CREATE TABLE `zt_score` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL DEFAULT '',
  `method` varchar(30) NOT NULL,
  `desc` varchar(250) NOT NULL DEFAULT '',
  `before` int(11) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  `after` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `model` (`module`),
  KEY `method` (`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `zt_repo`;
CREATE TABLE IF NOT EXISTS `zt_repo` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `prefix` varchar(100) NOT NULL,
  `encoding` varchar(20) NOT NULL,
  `SCM` varchar(10) NOT NULL,
  `client` varchar(100) NOT NULL,
  `commits` mediumint(8) unsigned NOT NULL,
  `account` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `encrypt` varchar(30) NOT NULL DEFAULT 'plain',
  `acl` text NOT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT '0',
  `lastSync` datetime NOT NULL,
  `desc` TEXT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `zt_repobranch`;
CREATE TABLE IF NOT EXISTS `zt_repobranch` (
  `repo` mediumint(8) unsigned NOT NULL,
  `revision` mediumint(8) unsigned NOT NULL,
  `branch` varchar(255) NOT NULL,
  UNIQUE KEY `repo_revision_branch` (`repo`,`revision`,`branch`),
  KEY `branch` (`branch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `zt_repohistory`;
CREATE TABLE IF NOT EXISTS `zt_repohistory` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `repo` mediumint(9) NOT NULL,
  `revision` varchar(40) NOT NULL,
  `commit` mediumint(8) unsigned NOT NULL,
  `comment` text NOT NULL,
  `committer` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repo` (`repo`,`revision`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `zt_repofiles`;
CREATE TABLE IF NOT EXISTS `zt_repofiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repo` mediumint(8) unsigned NOT NULL,
  `revision` mediumint(8) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `action` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`path`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `zt_tag` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `repo` mediumint(9) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `zt_jenkins` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `serviceUrl` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `desc` text NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `password` varchar(30) NOT NULL,
  `encrypt` varchar(30) NOT NULL DEFAULT 'plain',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE `zt_cijob` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `repo` mediumint(8) unsigned NOT NULL,
  `svnFolder` varchar(500) DEFAULT '',
  `jenkins` mediumint(8) unsigned NOT NULL,
  `jenkinsJob` varchar(500) NOT NULL,
  `triggerType` varchar(255) NOT NULL,
  `scheduleType` varchar(255) NOT NULL,
  `cronExpression` varchar(255) DEFAULT NULL,
  `scheduleDay` varchar(255) DEFAULT NULL,
  `scheduleTime` varchar(255) DEFAULT NULL,
  `scheduleInterval` mediumint(8) DEFAULT NULL,
  `tagKeywords` varchar(255) DEFAULT NULL,
  `commentKeywords` varchar(255) DEFAULT NULL,
  `desc` text,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `lastExec` datetime DEFAULT NULL,
  `lastStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

CREATE TABLE `zt_cibuild` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cijob` mediumint(8) unsigned NOT NULL,
  `queueItem` mediumint(8) NOT NULL,
  `status` varchar(255) NOT NULL,
  `logs` text,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

INSERT INTO `zt_cron` (`m`, `h`, `dom`, `mon`, `dow`, `command`, `remark`, `type`, `buildin`, `status`, `lastTime`) VALUES
('*',    '*',    '*',    '*',    '*',    '', '监控定时任务', 'zentao', 1, 'normal',   '0000-00-00 00:00:00'),
('30',   '23',   '*',    '*',    '*',    'moduleName=project&methodName=computeburn', '更新燃尽图',      'zentao', 1, 'normal', '0000-00-00 00:00:00'),
('0',    '8',    '*',    '*',    '*',    'moduleName=report&methodName=remind',       '每日任务提醒',    'zentao', 1, 'normal', '0000-00-00 00:00:00'),
('*/5',  '*',    '*',    '*',    '*',    'moduleName=svn&methodName=run',             '同步SVN',         'zentao', 1, 'stop',   '0000-00-00 00:00:00'),
('*/5',  '*',    '*',    '*',    '*',    'moduleName=git&methodName=run',             '同步GIT',         'zentao', 1, 'stop',   '0000-00-00 00:00:00'),
('30',   '0',    '*',    '*',    '*',    'moduleName=backup&methodName=backup',       '备份数据和附件',  'zentao', 1, 'normal', '0000-00-00 00:00:00'),
('*/5',  '*',    '*',    '*',    '*',    'moduleName=mail&methodName=asyncSend',      '异步发信',        'zentao', 1, 'normal', '0000-00-00 00:00:00'),
('*/5',  '*',    '*',    '*',    '*',    'moduleName=webhook&methodName=asyncSend',   '异步发送Webhook', 'zentao', 1, 'normal', '0000-00-00 00:00:00'),
('*/5',  '*',    '*',    '*',    '*',    'moduleName=admin&methodName=deleteLog',     '删除过期日志',    'zentao', 1, 'normal', '0000-00-00 00:00:00'),
('1',    '1',    '*',    '*',    '*',    'moduleName=todo&methodName=createCycle',    '生成周期性待办',  'zentao', 1, 'normal', '0000-00-00 00:00:00');
('*/5',  '*',    '*',    '*',    '*',    'moduleName=ci&methodName=checkBuildStatus', '同步Jenkins任务状态', 'zentao', -1, 'normal',   '0000-00-00 00:00:00');

INSERT INTO `zt_group` (`id`, `name`, `role`, `desc`) VALUES
(1, 'ADMIN', 'admin', 'for administrator'),
(2, 'DEV', 'dev', 'for developers.'),
(3, 'QA', 'qa', 'for testers.'),
(4, 'PM', 'pm', 'for project managers.'),
(5, 'PO', 'po', 'for product owners.'),
(6, 'TD', 'td', 'for technical director.'),
(7, 'PD', 'pd', 'for product director.'),
(8, 'QD', 'qd', 'for quality director.'),
(9, 'TOP', 'top', 'for top manager.'),
(10, 'OTHERS', 'others', 'for others.'),
(11, 'guest', 'guest', 'For guest'),
(12, 'LIMITED', 'limited', 'For limited user');

INSERT INTO `zt_grouppriv` VALUES (1,'action','editComment'),(1,'action','hideAll'),(1,'action','hideOne'),(1,'action','trash'),(1,'action','undelete'),(1,'admin','checkDB'),(1,'admin','checkWeak'),(1,'admin','index'),(1,'admin','safe'),(1,'api','debug'),(1,'backup','backup'),(1,'backup','change'),(1,'backup','delete'),(1,'backup','index'),(1,'backup','restore'),(1,'branch','delete'),(1,'branch','manage'),(1,'branch','sort'),(1,'bug','activate'),(1,'bug','assignTo'),(1,'bug','batchActivate'),(1,'bug','batchAssignTo'),(1,'bug','batchChangeModule'),(1,'bug','batchClose'),(1,'bug','batchConfirm'),(1,'bug','batchCreate'),(1,'bug','batchEdit'),(1,'bug','batchResolve'),(1,'bug','browse'),(1,'bug','close'),(1,'bug','confirmBug'),(1,'bug','confirmStoryChange'),(1,'bug','create'),(1,'bug','delete'),(1,'bug','deleteTemplate'),(1,'bug','edit'),(1,'bug','export'),(1,'bug','index'),(1,'bug','linkBugs'),(1,'bug','report'),(1,'bug','resolve'),(1,'bug','saveTemplate'),(1,'bug','unlinkBug'),(1,'bug','view'),(1,'build','batchUnlinkBug'),(1,'build','batchUnlinkStory'),(1,'build','create'),(1,'build','delete'),(1,'build','edit'),(1,'build','linkBug'),(1,'build','linkStory'),(1,'build','unlinkBug'),(1,'build','unlinkStory'),(1,'build','view'),(1,'company','browse'),(1,'company','dynamic'),(1,'company','edit'),(1,'company','index'),(1,'company','view'),(1,'convert','checkBugFree'),(1,'convert','checkConfig'),(1,'convert','checkRedmine'),(1,'convert','convertBugFree'),(1,'convert','convertRedmine'),(1,'convert','execute'),(1,'convert','index'),(1,'convert','selectSource'),(1,'convert','setBugfree'),(1,'convert','setConfig'),(1,'convert','setRedmine'),(1,'cron','create'),(1,'cron','delete'),(1,'cron','edit'),(1,'cron','index'),(1,'cron','toggle'),(1,'cron','turnon'),(1,'custom','flow'),(1,'custom','index'),(1,'custom','restore'),(1,'custom','set'),(1,'custom','working'),(1,'dept','browse'),(1,'dept','delete'),(1,'dept','edit'),(1,'dept','manageChild'),(1,'dept','updateOrder'),(1,'dev','api'),(1,'dev','db'),(1,'dev','editor'),(1,'dev','translate'),(1,'doc','allLibs'),(1,'doc','browse'),(1,'doc','create'),(1,'doc','createLib'),(1,'doc','delete'),(1,'doc','deleteLib'),(1,'doc','edit'),(1,'doc','editLib'),(1,'doc','index'),(1,'doc','objectLibs'),(1,'doc','showFiles'),(1,'doc','sort'),(1,'doc','view'),(1,'extension','activate'),(1,'extension','browse'),(1,'extension','deactivate'),(1,'extension','erase'),(1,'extension','install'),(1,'extension','obtain'),(1,'extension','structure'),(1,'extension','uninstall'),(1,'extension','upgrade'),(1,'extension','upload'),(1,'file','delete'),(1,'file','download'),(1,'file','edit'),(1,'file','uploadImages'),(1,'git','apiSync'),(1,'git','cat'),(1,'git','diff'),(1,'group','browse'),(1,'group','copy'),(1,'group','create'),(1,'group','delete'),(1,'group','edit'),(1,'group','manageMember'),(1,'group','managePriv'),(1,'group','manageView'),(1,'index','index'),(1,'mail','batchDelete'),(1,'mail','browse'),(1,'mail','delete'),(1,'mail','detect'),(1,'mail','edit'),(1,'mail','index'),(1,'mail','resend'),(1,'mail','reset'),(1,'mail','save'),(1,'mail','test'),(1,'message','browser'),(1,'message','index'),(1,'message','setting'),(1,'misc','ping'),(1,'my','bug'),(1,'my','calendar'),(1,'my','changePassword'),(1,'my','deleteContacts'),(1,'my','dynamic'),(1,'my','editProfile'),(1,'my','index'),(1,'my','manageContacts'),(1,'my','profile'),(1,'my','project'),(1,'my','story'),(1,'my','task'),(1,'my','testCase'),(1,'my','testTask'),(1,'my','todo'),(1,'my','unbind'),(1,'product','all'),(1,'product','batchEdit'),(1,'product','browse'),(1,'product','build'),(1,'product','close'),(1,'product','create'),(1,'product','delete'),(1,'product','doc'),(1,'product','dynamic'),(1,'product','edit'),(1,'product','index'),(1,'product','order'),(1,'product','project'),(1,'product','roadmap'),(1,'product','updateOrder'),(1,'product','view'),(1,'productplan','batchUnlinkBug'),(1,'productplan','batchUnlinkStory'),(1,'productplan','browse'),(1,'productplan','create'),(1,'productplan','delete'),(1,'productplan','edit'),(1,'productplan','linkBug'),(1,'productplan','linkStory'),(1,'productplan','unlinkBug'),(1,'productplan','unlinkStory'),(1,'productplan','view'),(1,'project','activate'),(1,'project','all'),(1,'project','batchedit'),(1,'project','batchUnlinkStory'),(1,'project','browse'),(1,'project','bug'),(1,'project','build'),(1,'project','burn'),(1,'project','close'),(1,'project','computeBurn'),(1,'project','create'),(1,'project','delete'),(1,'project','doc'),(1,'project','dynamic'),(1,'project','edit'),(1,'project','grouptask'),(1,'project','importBug'),(1,'project','importPlanStories'),(1,'project','importtask'),(1,'project','index'),(1,'project','kanban'),(1,'project','linkStory'),(1,'project','manageMembers'),(1,'project','manageProducts'),(1,'project','order'),(1,'project','putoff'),(1,'project','start'),(1,'project','story'),(1,'project','suspend'),(1,'project','task'),(1,'project','team'),(1,'project','testtask'),(1,'project','tree'),(1,'project','treestory'),(1,'project','treetask'),(1,'project','unlinkMember'),(1,'project','unlinkStory'),(1,'project','updateOrder'),(1,'project','view'),(1,'qa','index'),(1,'release','batchUnlinkBug'),(1,'release','batchUnlinkStory'),(1,'release','browse'),(1,'release','changeStatus'),(1,'release','create'),(1,'release','delete'),(1,'release','edit'),(1,'release','export'),(1,'release','linkBug'),(1,'release','linkStory'),(1,'release','unlinkBug'),(1,'release','unlinkStory'),(1,'release','view'),(1,'repo','browse'),(1,'repo','create'),(1,'repo','delete'),(1,'repo','diff'),(1,'repo','download'),(1,'repo','log'),(1,'repo','revision'),(1,'repo','settings'),(1,'repo','showSyncComment'),(1,'repo','view'),(1,'report','bugAssign'),(1,'report','bugCreate'),(1,'report','index'),(1,'report','productSummary'),(1,'report','projectDeviation'),(1,'report','workload'),(1,'search','buildForm'),(1,'search','buildQuery'),(1,'search','deleteQuery'),(1,'search','saveQuery'),(1,'search','select'),(1,'story','activate'),(1,'story','assignTo'),(1,'story','batchAssignTo'),(1,'story','batchChangeBranch'),(1,'story','batchChangeModule'),(1,'story','batchChangePlan'),(1,'story','batchChangeStage'),(1,'story','batchClose'),(1,'story','batchCreate'),(1,'story','batchEdit'),(1,'story','batchReview'),(1,'story','bugs'),(1,'story','cases'),(1,'story','change'),(1,'story','close'),(1,'story','create'),(1,'story','delete'),(1,'story','edit'),(1,'story','export'),(1,'story','linkStory'),(1,'story','report'),(1,'story','review'),(1,'story','tasks'),(1,'story','unlinkStory'),(1,'story','view'),(1,'story','zeroCase'),(1,'svn','apiSync'),(1,'svn','cat'),(1,'svn','diff'),(1,'task','activate'),(1,'task','assignTo'),(1,'task','batchAssignTo'),(1,'task','batchChangeModule'),(1,'task','batchClose'),(1,'task','batchCreate'),(1,'task','batchEdit'),(1,'task','cancel'),(1,'task','close'),(1,'task','confirmStoryChange'),(1,'task','create'),(1,'task','delete'),(1,'task','deleteEstimate'),(1,'task','edit'),(1,'task','editEstimate'),(1,'task','export'),(1,'task','finish'),(1,'task','pause'),(1,'task','recordEstimate'),(1,'task','report'),(1,'task','restart'),(1,'task','start'),(1,'task','view'),(1,'testcase','batchCaseTypeChange'),(1,'testcase','batchChangeModule'),(1,'testcase','batchConfirmStoryChange'),(1,'testcase','batchCreate'),(1,'testcase','batchDelete'),(1,'testcase','batchEdit'),(1,'testcase','batchReview'),(1,'testcase','browse'),(1,'testcase','bugs'),(1,'testcase','confirmChange'),(1,'testcase','confirmStoryChange'),(1,'testcase','create'),(1,'testcase','createBug'),(1,'testcase','delete'),(1,'testcase','edit'),(1,'testcase','export'),(1,'testcase','exportTemplet'),(1,'testcase','groupCase'),(1,'testcase','import'),(1,'testcase','importFromLib'),(1,'testcase','index'),(1,'testcase','linkCases'),(1,'testcase','review'),(1,'testcase','showImport'),(1,'testcase','unlinkCase'),(1,'testcase','view'),(1,'testreport','browse'),(1,'testreport','create'),(1,'testreport','delete'),(1,'testreport','edit'),(1,'testreport','view'),(1,'testsuite','batchCreateCase'),(1,'testsuite','batchUnlinkCases'),(1,'testsuite','browse'),(1,'testsuite','create'),(1,'testsuite','createCase'),(1,'testsuite','createLib'),(1,'testsuite','delete'),(1,'testsuite','edit'),(1,'testsuite','exportTemplet'),(1,'testsuite','import'),(1,'testsuite','index'),(1,'testsuite','library'),(1,'testsuite','libView'),(1,'testsuite','linkCase'),(1,'testsuite','showImport'),(1,'testsuite','unlinkCase'),(1,'testsuite','view'),(1,'testtask','activate'),(1,'testtask','batchAssign'),(1,'testtask','batchRun'),(1,'testtask','block'),(1,'testtask','browse'),(1,'testtask','cases'),(1,'testtask','close'),(1,'testtask','create'),(1,'testtask','delete'),(1,'testtask','edit'),(1,'testtask','groupCase'),(1,'testtask','index'),(1,'testtask','linkcase'),(1,'testtask','report'),(1,'testtask','results'),(1,'testtask','runcase'),(1,'testtask','start'),(1,'testtask','unlinkcase'),(1,'testtask','view'),(1,'todo','activate'),(1,'todo','assignTo'),(1,'todo','batchClose'),(1,'todo','batchCreate'),(1,'todo','batchEdit'),(1,'todo','batchFinish'),(1,'todo','close'),(1,'todo','create'),(1,'todo','createCycle'),(1,'todo','delete'),(1,'todo','edit'),(1,'todo','export'),(1,'todo','finish'),(1,'todo','import2Today'),(1,'todo','view'),(1,'tree','browse'),(1,'tree','browseTask'),(1,'tree','delete'),(1,'tree','edit'),(1,'tree','fix'),(1,'tree','manageChild'),(1,'tree','updateOrder'),(1,'user','batchCreate'),(1,'user','batchEdit'),(1,'user','bug'),(1,'user','create'),(1,'user','delete'),(1,'user','deleteContacts'),(1,'user','dynamic'),(1,'user','edit'),(1,'user','manageContacts'),(1,'user','profile'),(1,'user','project'),(1,'user','story'),(1,'user','task'),(1,'user','testCase'),(1,'user','testTask'),(1,'user','todo'),(1,'user','unbind'),(1,'user','unlock'),(1,'user','view'),(2,'action','editComment'),(2,'bug','activate'),(2,'bug','assignTo'),(2,'bug','batchActivate'),(2,'bug','batchAssignTo'),(2,'bug','batchChangeModule'),(2,'bug','batchClose'),(2,'bug','batchConfirm'),(2,'bug','batchCreate'),(2,'bug','batchEdit'),(2,'bug','batchResolve'),(2,'bug','browse'),(2,'bug','close'),(2,'bug','confirmBug'),(2,'bug','confirmStoryChange'),(2,'bug','create'),(2,'bug','deleteTemplate'),(2,'bug','edit'),(2,'bug','export'),(2,'bug','index'),(2,'bug','linkBugs'),(2,'bug','report'),(2,'bug','resolve'),(2,'bug','saveTemplate'),(2,'bug','unlinkBug'),(2,'bug','view'),(2,'build','create'),(2,'build','delete'),(2,'build','edit'),(2,'build','view'),(2,'company','browse'),(2,'company','dynamic'),(2,'company','index'),(2,'company','view'),(2,'doc','allLibs'),(2,'doc','browse'),(2,'doc','create'),(2,'doc','edit'),(2,'doc','index'),(2,'doc','objectLibs'),(2,'doc','showFiles'),(2,'doc','view'),(2,'file','download'),(2,'file','edit'),(2,'git','apiSync'),(2,'git','cat'),(2,'git','diff'),(2,'group','browse'),(2,'index','index'),(2,'misc','ping'),(2,'my','bug'),(2,'my','calendar'),(2,'my','changePassword'),(2,'my','deleteContacts'),(2,'my','dynamic'),(2,'my','editProfile'),(2,'my','index'),(2,'my','manageContacts'),(2,'my','profile'),(2,'my','project'),(2,'my','story'),(2,'my','task'),(2,'my','todo'),(2,'my','unbind'),(2,'product','all'),(2,'product','browse'),(2,'product','build'),(2,'product','doc'),(2,'product','dynamic'),(2,'product','index'),(2,'product','project'),(2,'product','roadmap'),(2,'product','view'),(2,'productplan','browse'),(2,'productplan','view'),(2,'project','all'),(2,'project','browse'),(2,'project','bug'),(2,'project','build'),(2,'project','burn'),(2,'project','computeBurn'),(2,'project','doc'),(2,'project','dynamic'),(2,'project','grouptask'),(2,'project','importBug'),(2,'project','importtask'),(2,'project','index'),(2,'project','kanban'),(2,'project','story'),(2,'project','task'),(2,'project','team'),(2,'project','testtask'),(2,'project','tree'),(2,'project','treestory'),(2,'project','treetask'),(2,'project','view'),(2,'qa','index'),(2,'release','browse'),(2,'release','export'),(2,'release','view'),(2,'repo','browse'),(2,'repo','diff'),(2,'repo','download'),(2,'repo','log'),(2,'repo','revision'),(2,'repo','showSyncComment'),(2,'repo','view'),(2,'report','bugAssign'),(2,'report','bugCreate'),(2,'report','index'),(2,'report','productSummary'),(2,'report','projectDeviation'),(2,'report','workload'),(2,'search','buildForm'),(2,'search','buildQuery'),(2,'search','deleteQuery'),(2,'search','saveQuery'),(2,'search','select'),(2,'story','bugs'),(2,'story','cases'),(2,'story','export'),(2,'story','report'),(2,'story','tasks'),(2,'story','view'),(2,'svn','apiSync'),(2,'svn','cat'),(2,'svn','diff'),(2,'task','activate'),(2,'task','assignTo'),(2,'task','batchAssignTo'),(2,'task','batchChangeModule'),(2,'task','batchClose'),(2,'task','batchCreate'),(2,'task','batchEdit'),(2,'task','cancel'),(2,'task','close'),(2,'task','confirmStoryChange'),(2,'task','create'),(2,'task','deleteEstimate'),(2,'task','edit'),(2,'task','editEstimate'),(2,'task','export'),(2,'task','finish'),(2,'task','pause'),(2,'task','recordEstimate'),(2,'task','report'),(2,'task','restart'),(2,'task','start'),(2,'task','view'),(2,'testcase','browse'),(2,'testcase','bugs'),(2,'testcase','export'),(2,'testcase','groupCase'),(2,'testcase','index'),(2,'testcase','view'),(2,'testsuite','browse'),(2,'testsuite','index'),(2,'testsuite','view'),(2,'testtask','browse'),(2,'testtask','cases'),(2,'testtask','create'),(2,'testtask','edit'),(2,'testtask','groupCase'),(2,'testtask','index'),(2,'testtask','results'),(2,'testtask','view'),(2,'todo','activate'),(2,'todo','assignTo'),(2,'todo','batchClose'),(2,'todo','batchCreate'),(2,'todo','batchEdit'),(2,'todo','batchFinish'),(2,'todo','close'),(2,'todo','create'),(2,'todo','createCycle'),(2,'todo','delete'),(2,'todo','edit'),(2,'todo','export'),(2,'todo','finish'),(2,'todo','import2Today'),(2,'todo','view'),(2,'user','bug'),(2,'user','deleteContacts'),(2,'user','dynamic'),(2,'user','manageContacts'),(2,'user','profile'),(2,'user','project'),(2,'user','story'),(2,'user','task'),(2,'user','testCase'),(2,'user','testTask'),(2,'user','todo'),(2,'user','view'),(3,'action','editComment'),(3,'bug','activate'),(3,'bug','assignTo'),(3,'bug','batchActivate'),(3,'bug','batchChangeModule'),(3,'bug','batchClose'),(3,'bug','batchConfirm'),(3,'bug','batchCreate'),(3,'bug','batchEdit'),(3,'bug','batchResolve'),(3,'bug','browse'),(3,'bug','close'),(3,'bug','confirmBug'),(3,'bug','confirmStoryChange'),(3,'bug','create'),(3,'bug','deleteTemplate'),(3,'bug','edit'),(3,'bug','export'),(3,'bug','index'),(3,'bug','linkBugs'),(3,'bug','report'),(3,'bug','resolve'),(3,'bug','saveTemplate'),(3,'bug','unlinkBug'),(3,'bug','view'),(3,'build','create'),(3,'build','edit'),(3,'build','view'),(3,'company','browse'),(3,'company','dynamic'),(3,'company','index'),(3,'company','view'),(3,'doc','allLibs'),(3,'doc','browse'),(3,'doc','create'),(3,'doc','edit'),(3,'doc','index'),(3,'doc','objectLibs'),(3,'doc','showFiles'),(3,'doc','view'),(3,'file','download'),(3,'file','edit'),(3,'git','apiSync'),(3,'git','cat'),(3,'git','diff'),(3,'group','browse'),(3,'index','index'),(3,'misc','ping'),(3,'my','bug'),(3,'my','calendar'),(3,'my','changePassword'),(3,'my','deleteContacts'),(3,'my','dynamic'),(3,'my','editProfile'),(3,'my','index'),(3,'my','manageContacts'),(3,'my','profile'),(3,'my','project'),(3,'my','story'),(3,'my','task'),(3,'my','testCase'),(3,'my','testTask'),(3,'my','todo'),(3,'my','unbind'),(3,'product','all'),(3,'product','browse'),(3,'product','build'),(3,'product','doc'),(3,'product','dynamic'),(3,'product','index'),(3,'product','project'),(3,'product','roadmap'),(3,'product','view'),(3,'productplan','browse'),(3,'productplan','view'),(3,'project','all'),(3,'project','browse'),(3,'project','bug'),(3,'project','build'),(3,'project','burn'),(3,'project','computeBurn'),(3,'project','doc'),(3,'project','dynamic'),(3,'project','grouptask'),(3,'project','importBug'),(3,'project','importtask'),(3,'project','index'),(3,'project','kanban'),(3,'project','story'),(3,'project','task'),(3,'project','team'),(3,'project','testtask'),(3,'project','tree'),(3,'project','treestory'),(3,'project','treetask'),(3,'project','view'),(3,'qa','index'),(3,'release','browse'),(3,'release','export'),(3,'release','view'),(3,'repo','browse'),(3,'repo','diff'),(3,'repo','download'),(3,'repo','log'),(3,'repo','revision'),(3,'repo','showSyncComment'),(3,'repo','view'),(3,'report','bugAssign'),(3,'report','bugCreate'),(3,'report','index'),(3,'report','productSummary'),(3,'report','projectDeviation'),(3,'report','workload'),(3,'search','buildForm'),(3,'search','buildQuery'),(3,'search','deleteQuery'),(3,'search','saveQuery'),(3,'search','select'),(3,'story','bugs'),(3,'story','cases'),(3,'story','export'),(3,'story','report'),(3,'story','tasks'),(3,'story','view'),(3,'story','zeroCase'),(3,'svn','apiSync'),(3,'svn','cat'),(3,'svn','diff'),(3,'task','activate'),(3,'task','assignTo'),(3,'task','batchAssignTo'),(3,'task','batchChangeModule'),(3,'task','batchClose'),(3,'task','batchCreate'),(3,'task','batchEdit'),(3,'task','cancel'),(3,'task','close'),(3,'task','confirmStoryChange'),(3,'task','create'),(3,'task','deleteEstimate'),(3,'task','edit'),(3,'task','editEstimate'),(3,'task','export'),(3,'task','finish'),(3,'task','pause'),(3,'task','recordEstimate'),(3,'task','report'),(3,'task','restart'),(3,'task','start'),(3,'task','view'),(3,'testcase','batchCaseTypeChange'),(3,'testcase','batchChangeModule'),(3,'testcase','batchConfirmStoryChange'),(3,'testcase','batchCreate'),(3,'testcase','batchEdit'),(3,'testcase','batchReview'),(3,'testcase','browse'),(3,'testcase','bugs'),(3,'testcase','confirmChange'),(3,'testcase','confirmStoryChange'),(3,'testcase','create'),(3,'testcase','createBug'),(3,'testcase','edit'),(3,'testcase','export'),(3,'testcase','exportTemplet'),(3,'testcase','groupCase'),(3,'testcase','import'),(3,'testcase','index'),(3,'testcase','linkCases'),(3,'testcase','review'),(3,'testcase','showImport'),(3,'testcase','unlinkCase'),(3,'testcase','view'),(3,'testreport','browse'),(3,'testreport','view'),(3,'testsuite','browse'),(3,'testsuite','create'),(3,'testsuite','delete'),(3,'testsuite','edit'),(3,'testsuite','index'),(3,'testsuite','linkCase'),(3,'testsuite','unlinkCase'),(3,'testsuite','view'),(3,'testtask','activate'),(3,'testtask','batchAssign'),(3,'testtask','batchRun'),(3,'testtask','block'),(3,'testtask','browse'),(3,'testtask','cases'),(3,'testtask','close'),(3,'testtask','create'),(3,'testtask','edit'),(3,'testtask','groupCase'),(3,'testtask','index'),(3,'testtask','linkcase'),(3,'testtask','report'),(3,'testtask','results'),(3,'testtask','runcase'),(3,'testtask','start'),(3,'testtask','unlinkcase'),(3,'testtask','view'),(3,'todo','activate'),(3,'todo','assignTo'),(3,'todo','batchClose'),(3,'todo','batchCreate'),(3,'todo','batchEdit'),(3,'todo','batchFinish'),(3,'todo','close'),(3,'todo','create'),(3,'todo','createCycle'),(3,'todo','delete'),(3,'todo','edit'),(3,'todo','export'),(3,'todo','finish'),(3,'todo','import2Today'),(3,'todo','view'),(3,'user','bug'),(3,'user','deleteContacts'),(3,'user','dynamic'),(3,'user','manageContacts'),(3,'user','profile'),(3,'user','project'),(3,'user','story'),(3,'user','task'),(3,'user','testCase'),(3,'user','testTask'),(3,'user','todo'),(3,'user','view'),(4,'action','editComment'),(4,'action','hideAll'),(4,'action','hideOne'),(4,'action','trash'),(4,'action','undelete'),(4,'admin','index'),(4,'bug','activate'),(4,'bug','assignTo'),(4,'bug','batchActivate'),(4,'bug','batchAssignTo'),(4,'bug','batchChangeModule'),(4,'bug','batchClose'),(4,'bug','batchConfirm'),(4,'bug','batchCreate'),(4,'bug','batchEdit'),(4,'bug','batchResolve'),(4,'bug','browse'),(4,'bug','close'),(4,'bug','confirmBug'),(4,'bug','confirmStoryChange'),(4,'bug','create'),(4,'bug','delete'),(4,'bug','deleteTemplate'),(4,'bug','edit'),(4,'bug','export'),(4,'bug','index'),(4,'bug','linkBugs'),(4,'bug','report'),(4,'bug','resolve'),(4,'bug','saveTemplate'),(4,'bug','unlinkBug'),(4,'bug','view'),(4,'build','batchUnlinkBug'),(4,'build','batchUnlinkStory'),(4,'build','create'),(4,'build','delete'),(4,'build','edit'),(4,'build','linkBug'),(4,'build','linkStory'),(4,'build','unlinkBug'),(4,'build','unlinkStory'),(4,'build','view'),(4,'company','browse'),(4,'company','dynamic'),(4,'company','index'),(4,'company','view'),(4,'doc','allLibs'),(4,'doc','browse'),(4,'doc','create'),(4,'doc','createLib'),(4,'doc','delete'),(4,'doc','deleteLib'),(4,'doc','edit'),(4,'doc','editLib'),(4,'doc','index'),(4,'doc','objectLibs'),(4,'doc','showFiles'),(4,'doc','view'),(4,'extension','browse'),(4,'extension','obtain'),(4,'extension','structure'),(4,'file','delete'),(4,'file','download'),(4,'file','edit'),(4,'file','uploadImages'),(4,'git','apiSync'),(4,'git','cat'),(4,'git','diff'),(4,'group','browse'),(4,'index','index'),(4,'misc','ping'),(4,'my','bug'),(4,'my','calendar'),(4,'my','changePassword'),(4,'my','deleteContacts'),(4,'my','dynamic'),(4,'my','editProfile'),(4,'my','index'),(4,'my','manageContacts'),(4,'my','profile'),(4,'my','project'),(4,'my','story'),(4,'my','task'),(4,'my','testCase'),(4,'my','testTask'),(4,'my','todo'),(4,'my','unbind'),(4,'product','all'),(4,'product','browse'),(4,'product','build'),(4,'product','doc'),(4,'product','dynamic'),(4,'product','index'),(4,'product','project'),(4,'product','roadmap'),(4,'product','view'),(4,'productplan','browse'),(4,'productplan','view'),(4,'project','activate'),(4,'project','all'),(4,'project','batchedit'),(4,'project','batchUnlinkStory'),(4,'project','browse'),(4,'project','bug'),(4,'project','build'),(4,'project','burn'),(4,'project','close'),(4,'project','computeBurn'),(4,'project','create'),(4,'project','delete'),(4,'project','doc'),(4,'project','dynamic'),(4,'project','edit'),(4,'project','grouptask'),(4,'project','importBug'),(4,'project','importPlanStories'),(4,'project','importtask'),(4,'project','index'),(4,'project','kanban'),(4,'project','linkStory'),(4,'project','manageMembers'),(4,'project','manageProducts'),(4,'project','order'),(4,'project','putoff'),(4,'project','start'),(4,'project','story'),(4,'project','suspend'),(4,'project','task'),(4,'project','team'),(4,'project','testtask'),(4,'project','tree'),(4,'project','treestory'),(4,'project','treetask'),(4,'project','unlinkMember'),(4,'project','unlinkStory'),(4,'project','updateOrder'),(4,'project','view'),(4,'qa','index'),(4,'release','browse'),(4,'release','export'),(4,'release','view'),(4,'repo','browse'),(4,'repo','create'),(4,'repo','delete'),(4,'repo','diff'),(4,'repo','download'),(4,'repo','log'),(4,'repo','revision'),(4,'repo','settings'),(4,'repo','showSyncComment'),(4,'repo','view'),(4,'report','bugAssign'),(4,'report','bugCreate'),(4,'report','index'),(4,'report','productSummary'),(4,'report','projectDeviation'),(4,'report','workload'),(4,'search','buildForm'),(4,'search','buildQuery'),(4,'search','deleteQuery'),(4,'search','saveQuery'),(4,'search','select'),(4,'story','bugs'),(4,'story','cases'),(4,'story','export'),(4,'story','report'),(4,'story','tasks'),(4,'story','view'),(4,'story','zeroCase'),(4,'svn','apiSync'),(4,'svn','cat'),(4,'svn','diff'),(4,'task','activate'),(4,'task','assignTo'),(4,'task','batchAssignTo'),(4,'task','batchChangeModule'),(4,'task','batchClose'),(4,'task','batchCreate'),(4,'task','batchEdit'),(4,'task','cancel'),(4,'task','close'),(4,'task','confirmStoryChange'),(4,'task','create'),(4,'task','delete'),(4,'task','deleteEstimate'),(4,'task','edit'),(4,'task','editEstimate'),(4,'task','export'),(4,'task','finish'),(4,'task','pause'),(4,'task','recordEstimate'),(4,'task','report'),(4,'task','restart'),(4,'task','start'),(4,'task','view'),(4,'testcase','browse'),(4,'testcase','bugs'),(4,'testcase','createBug'),(4,'testcase','export'),(4,'testcase','groupCase'),(4,'testcase','index'),(4,'testcase','view'),(4,'testsuite','browse'),(4,'testsuite','index'),(4,'testsuite','view'),(4,'testtask','batchAssign'),(4,'testtask','browse'),(4,'testtask','cases'),(4,'testtask','create'),(4,'testtask','edit'),(4,'testtask','groupCase'),(4,'testtask','index'),(4,'testtask','results'),(4,'testtask','view'),(4,'todo','activate'),(4,'todo','assignTo'),(4,'todo','batchClose'),(4,'todo','batchCreate'),(4,'todo','batchEdit'),(4,'todo','batchFinish'),(4,'todo','close'),(4,'todo','create'),(4,'todo','createCycle'),(4,'todo','delete'),(4,'todo','edit'),(4,'todo','export'),(4,'todo','finish'),(4,'todo','import2Today'),(4,'todo','view'),(4,'tree','browse'),(4,'tree','browseTask'),(4,'tree','delete'),(4,'tree','edit'),(4,'tree','fix'),(4,'tree','manageChild'),(4,'tree','updateOrder'),(4,'user','bug'),(4,'user','deleteContacts'),(4,'user','dynamic'),(4,'user','manageContacts'),(4,'user','profile'),(4,'user','project'),(4,'user','story'),(4,'user','task'),(4,'user','testCase'),(4,'user','testTask'),(4,'user','todo'),(4,'user','view'),(5,'action','editComment'),(5,'action','hideAll'),(5,'action','hideOne'),(5,'action','trash'),(5,'action','undelete'),(5,'admin','index'),(5,'branch','delete'),(5,'branch','manage'),(5,'branch','sort'),(5,'bug','activate'),(5,'bug','assignTo'),(5,'bug','batchActivate'),(5,'bug','batchAssignTo'),(5,'bug','batchChangeModule'),(5,'bug','batchClose'),(5,'bug','batchConfirm'),(5,'bug','batchCreate'),(5,'bug','batchEdit'),(5,'bug','batchResolve'),(5,'bug','browse'),(5,'bug','close'),(5,'bug','confirmBug'),(5,'bug','confirmStoryChange'),(5,'bug','create'),(5,'bug','deleteTemplate'),(5,'bug','edit'),(5,'bug','export'),(5,'bug','index'),(5,'bug','linkBugs'),(5,'bug','report'),(5,'bug','resolve'),(5,'bug','saveTemplate'),(5,'bug','unlinkBug'),(5,'bug','view'),(5,'build','view'),(5,'company','browse'),(5,'company','dynamic'),(5,'company','index'),(5,'company','view'),(5,'doc','allLibs'),(5,'doc','browse'),(5,'doc','create'),(5,'doc','createLib'),(5,'doc','delete'),(5,'doc','deleteLib'),(5,'doc','edit'),(5,'doc','editLib'),(5,'doc','index'),(5,'doc','objectLibs'),(5,'doc','showFiles'),(5,'doc','view'),(5,'extension','browse'),(5,'extension','obtain'),(5,'extension','structure'),(5,'file','delete'),(5,'file','download'),(5,'file','edit'),(5,'file','uploadImages'),(5,'git','apiSync'),(5,'git','cat'),(5,'git','diff'),(5,'group','browse'),(5,'index','index'),(5,'misc','ping'),(5,'my','bug'),(5,'my','calendar'),(5,'my','changePassword'),(5,'my','deleteContacts'),(5,'my','dynamic'),(5,'my','editProfile'),(5,'my','index'),(5,'my','manageContacts'),(5,'my','profile'),(5,'my','project'),(5,'my','story'),(5,'my','task'),(5,'my','testCase'),(5,'my','testTask'),(5,'my','todo'),(5,'my','unbind'),(5,'product','all'),(5,'product','batchEdit'),(5,'product','browse'),(5,'product','build'),(5,'product','close'),(5,'product','create'),(5,'product','delete'),(5,'product','doc'),(5,'product','dynamic'),(5,'product','edit'),(5,'product','index'),(5,'product','order'),(5,'product','project'),(5,'product','roadmap'),(5,'product','updateOrder'),(5,'product','view'),(5,'productplan','batchUnlinkBug'),(5,'productplan','batchUnlinkStory'),(5,'productplan','browse'),(5,'productplan','create'),(5,'productplan','delete'),(5,'productplan','edit'),(5,'productplan','linkBug'),(5,'productplan','linkStory'),(5,'productplan','unlinkBug'),(5,'productplan','unlinkStory'),(5,'productplan','view'),(5,'project','activate'),(5,'project','all'),(5,'project','batchedit'),(5,'project','batchUnlinkStory'),(5,'project','browse'),(5,'project','bug'),(5,'project','build'),(5,'project','burn'),(5,'project','close'),(5,'project','computeBurn'),(5,'project','create'),(5,'project','delete'),(5,'project','doc'),(5,'project','dynamic'),(5,'project','edit'),(5,'project','grouptask'),(5,'project','importBug'),(5,'project','importPlanStories'),(5,'project','importtask'),(5,'project','index'),(5,'project','kanban'),(5,'project','linkStory'),(5,'project','manageMembers'),(5,'project','manageProducts'),(5,'project','order'),(5,'project','putoff'),(5,'project','start'),(5,'project','story'),(5,'project','suspend'),(5,'project','task'),(5,'project','team'),(5,'project','testtask'),(5,'project','tree'),(5,'project','treestory'),(5,'project','treetask'),(5,'project','unlinkMember'),(5,'project','unlinkStory'),(5,'project','updateOrder'),(5,'project','view'),(5,'qa','index'),(5,'release','batchUnlinkBug'),(5,'release','batchUnlinkStory'),(5,'release','browse'),(5,'release','changeStatus'),(5,'release','create'),(5,'release','delete'),(5,'release','edit'),(5,'release','export'),(5,'release','linkBug'),(5,'release','linkStory'),(5,'release','unlinkBug'),(5,'release','unlinkStory'),(5,'release','view'),(5,'repo','browse'),(5,'repo','create'),(5,'repo','delete'),(5,'repo','diff'),(5,'repo','download'),(5,'repo','log'),(5,'repo','revision'),(5,'repo','settings'),(5,'repo','showSyncComment'),(5,'repo','view'),(5,'report','bugAssign'),(5,'report','bugCreate'),(5,'report','index'),(5,'report','productSummary'),(5,'report','projectDeviation'),(5,'report','workload'),(5,'search','buildForm'),(5,'search','buildQuery'),(5,'search','deleteQuery'),(5,'search','saveQuery'),(5,'search','select'),(5,'story','activate'),(5,'story','batchChangeBranch'),(5,'story','batchChangeModule'),(5,'story','batchChangePlan'),(5,'story','batchChangeStage'),(5,'story','batchClose'),(5,'story','batchCreate'),(5,'story','batchEdit'),(5,'story','batchReview'),(5,'story','bugs'),(5,'story','cases'),(5,'story','change'),(5,'story','close'),(5,'story','create'),(5,'story','delete'),(5,'story','edit'),(5,'story','export'),(5,'story','linkStory'),(5,'story','report'),(5,'story','review'),(5,'story','tasks'),(5,'story','unlinkStory'),(5,'story','view'),(5,'story','zeroCase'),(5,'svn','apiSync'),(5,'svn','cat'),(5,'svn','diff'),(5,'task','confirmStoryChange'),(5,'task','deleteEstimate'),(5,'task','editEstimate'),(5,'task','export'),(5,'task','recordEstimate'),(5,'task','report'),(5,'task','view'),(5,'testcase','browse'),(5,'testcase','bugs'),(5,'testcase','createBug'),(5,'testcase','export'),(5,'testcase','groupCase'),(5,'testcase','importFromLib'),(5,'testcase','index'),(5,'testcase','view'),(5,'testsuite','batchCreateCase'),(5,'testsuite','browse'),(5,'testsuite','createCase'),(5,'testsuite','createLib'),(5,'testsuite','exportTemplet'),(5,'testsuite','import'),(5,'testsuite','index'),(5,'testsuite','library'),(5,'testsuite','libView'),(5,'testsuite','showImport'),(5,'testsuite','view'),(5,'testtask','browse'),(5,'testtask','cases'),(5,'testtask','groupCase'),(5,'testtask','index'),(5,'testtask','results'),(5,'testtask','view'),(5,'todo','activate'),(5,'todo','assignTo'),(5,'todo','batchClose'),(5,'todo','batchCreate'),(5,'todo','batchEdit'),(5,'todo','batchFinish'),(5,'todo','close'),(5,'todo','create'),(5,'todo','createCycle'),(5,'todo','delete'),(5,'todo','edit'),(5,'todo','export'),(5,'todo','finish'),(5,'todo','import2Today'),(5,'todo','view'),(5,'tree','browse'),(5,'tree','browseTask'),(5,'tree','delete'),(5,'tree','edit'),(5,'tree','fix'),(5,'tree','manageChild'),(5,'tree','updateOrder'),(5,'user','bug'),(5,'user','deleteContacts'),(5,'user','dynamic'),(5,'user','manageContacts'),(5,'user','profile'),(5,'user','project'),(5,'user','story'),(5,'user','task'),(5,'user','testCase'),(5,'user','testTask'),(5,'user','todo'),(5,'user','view'),(6,'action','editComment'),(6,'action','hideAll'),(6,'action','hideOne'),(6,'action','trash'),(6,'action','undelete'),(6,'admin','index'),(6,'bug','activate'),(6,'bug','assignTo'),(6,'bug','batchActivate'),(6,'bug','batchAssignTo'),(6,'bug','batchChangeModule'),(6,'bug','batchClose'),(6,'bug','batchConfirm'),(6,'bug','batchCreate'),(6,'bug','batchEdit'),(6,'bug','batchResolve'),(6,'bug','browse'),(6,'bug','close'),(6,'bug','confirmBug'),(6,'bug','confirmStoryChange'),(6,'bug','create'),(6,'bug','delete'),(6,'bug','deleteTemplate'),(6,'bug','edit'),(6,'bug','export'),(6,'bug','index'),(6,'bug','linkBugs'),(6,'bug','report'),(6,'bug','resolve'),(6,'bug','saveTemplate'),(6,'bug','unlinkBug'),(6,'bug','view'),(6,'build','batchUnlinkBug'),(6,'build','batchUnlinkStory'),(6,'build','create'),(6,'build','delete'),(6,'build','edit'),(6,'build','linkBug'),(6,'build','linkStory'),(6,'build','unlinkBug'),(6,'build','unlinkStory'),(6,'build','view'),(6,'company','browse'),(6,'company','dynamic'),(6,'company','index'),(6,'company','view'),(6,'doc','allLibs'),(6,'doc','browse'),(6,'doc','create'),(6,'doc','createLib'),(6,'doc','delete'),(6,'doc','deleteLib'),(6,'doc','edit'),(6,'doc','editLib'),(6,'doc','index'),(6,'doc','objectLibs'),(6,'doc','showFiles'),(6,'doc','view'),(6,'extension','browse'),(6,'extension','obtain'),(6,'extension','structure'),(6,'file','delete'),(6,'file','download'),(6,'file','edit'),(6,'file','uploadImages'),(6,'git','apiSync'),(6,'git','cat'),(6,'git','diff'),(6,'group','browse'),(6,'index','index'),(6,'misc','ping'),(6,'my','bug'),(6,'my','calendar'),(6,'my','changePassword'),(6,'my','deleteContacts'),(6,'my','dynamic'),(6,'my','editProfile'),(6,'my','index'),(6,'my','manageContacts'),(6,'my','profile'),(6,'my','project'),(6,'my','story'),(6,'my','task'),(6,'my','testCase'),(6,'my','testTask'),(6,'my','todo'),(6,'my','unbind'),(6,'product','all'),(6,'product','browse'),(6,'product','build'),(6,'product','doc'),(6,'product','dynamic'),(6,'product','index'),(6,'product','project'),(6,'product','roadmap'),(6,'product','view'),(6,'productplan','browse'),(6,'productplan','view'),(6,'project','activate'),(6,'project','all'),(6,'project','batchedit'),(6,'project','batchUnlinkStory'),(6,'project','browse'),(6,'project','bug'),(6,'project','build'),(6,'project','burn'),(6,'project','close'),(6,'project','computeBurn'),(6,'project','create'),(6,'project','delete'),(6,'project','doc'),(6,'project','dynamic'),(6,'project','edit'),(6,'project','grouptask'),(6,'project','importBug'),(6,'project','importPlanStories'),(6,'project','importtask'),(6,'project','index'),(6,'project','kanban'),(6,'project','linkStory'),(6,'project','manageMembers'),(6,'project','manageProducts'),(6,'project','order'),(6,'project','putoff'),(6,'project','start'),(6,'project','story'),(6,'project','suspend'),(6,'project','task'),(6,'project','team'),(6,'project','testtask'),(6,'project','tree'),(6,'project','treestory'),(6,'project','treetask'),(6,'project','unlinkMember'),(6,'project','unlinkStory'),(6,'project','updateOrder'),(6,'project','view'),(6,'qa','index'),(6,'release','browse'),(6,'release','export'),(6,'release','view'),(6,'repo','browse'),(6,'repo','diff'),(6,'repo','download'),(6,'repo','log'),(6,'repo','revision'),(6,'repo','showSyncComment'),(6,'repo','view'),(6,'report','bugAssign'),(6,'report','bugCreate'),(6,'report','index'),(6,'report','productSummary'),(6,'report','projectDeviation'),(6,'report','workload'),(6,'search','buildForm'),(6,'search','buildQuery'),(6,'search','deleteQuery'),(6,'search','saveQuery'),(6,'search','select'),(6,'story','bugs'),(6,'story','cases'),(6,'story','export'),(6,'story','report'),(6,'story','tasks'),(6,'story','view'),(6,'story','zeroCase'),(6,'svn','apiSync'),(6,'svn','cat'),(6,'svn','diff'),(6,'task','activate'),(6,'task','assignTo'),(6,'task','batchAssignTo'),(6,'task','batchChangeModule'),(6,'task','batchClose'),(6,'task','batchCreate'),(6,'task','batchEdit'),(6,'task','cancel'),(6,'task','close'),(6,'task','confirmStoryChange'),(6,'task','create'),(6,'task','delete'),(6,'task','deleteEstimate'),(6,'task','edit'),(6,'task','editEstimate'),(6,'task','export'),(6,'task','finish'),(6,'task','pause'),(6,'task','recordEstimate'),(6,'task','report'),(6,'task','restart'),(6,'task','start'),(6,'task','view'),(6,'testcase','browse'),(6,'testcase','bugs'),(6,'testcase','export'),(6,'testcase','groupCase'),(6,'testcase','index'),(6,'testcase','view'),(6,'testsuite','browse'),(6,'testsuite','index'),(6,'testsuite','view'),(6,'testtask','browse'),(6,'testtask','cases'),(6,'testtask','create'),(6,'testtask','edit'),(6,'testtask','groupCase'),(6,'testtask','index'),(6,'testtask','results'),(6,'testtask','view'),(6,'todo','activate'),(6,'todo','assignTo'),(6,'todo','batchClose'),(6,'todo','batchCreate'),(6,'todo','batchEdit'),(6,'todo','batchFinish'),(6,'todo','close'),(6,'todo','create'),(6,'todo','createCycle'),(6,'todo','delete'),(6,'todo','edit'),(6,'todo','export'),(6,'todo','finish'),(6,'todo','import2Today'),(6,'todo','view'),(6,'tree','browse'),(6,'tree','browseTask'),(6,'tree','delete'),(6,'tree','edit'),(6,'tree','fix'),(6,'tree','manageChild'),(6,'tree','updateOrder'),(6,'user','bug'),(6,'user','deleteContacts'),(6,'user','dynamic'),(6,'user','manageContacts'),(6,'user','profile'),(6,'user','project'),(6,'user','story'),(6,'user','task'),(6,'user','testCase'),(6,'user','testTask'),(6,'user','todo'),(6,'user','view'),(7,'action','editComment'),(7,'action','hideAll'),(7,'action','hideOne'),(7,'action','trash'),(7,'action','undelete'),(7,'admin','index'),(7,'branch','delete'),(7,'branch','manage'),(7,'branch','sort'),(7,'bug','activate'),(7,'bug','assignTo'),(7,'bug','batchActivate'),(7,'bug','batchChangeModule'),(7,'bug','batchClose'),(7,'bug','batchConfirm'),(7,'bug','batchCreate'),(7,'bug','batchEdit'),(7,'bug','batchResolve'),(7,'bug','browse'),(7,'bug','close'),(7,'bug','confirmBug'),(7,'bug','confirmStoryChange'),(7,'bug','create'),(7,'bug','delete'),(7,'bug','deleteTemplate'),(7,'bug','edit'),(7,'bug','export'),(7,'bug','index'),(7,'bug','linkBugs'),(7,'bug','report'),(7,'bug','resolve'),(7,'bug','saveTemplate'),(7,'bug','unlinkBug'),(7,'bug','view'),(7,'build','view'),(7,'company','browse'),(7,'company','dynamic'),(7,'company','index'),(7,'company','view'),(7,'doc','allLibs'),(7,'doc','browse'),(7,'doc','create'),(7,'doc','createLib'),(7,'doc','delete'),(7,'doc','deleteLib'),(7,'doc','edit'),(7,'doc','editLib'),(7,'doc','index'),(7,'doc','objectLibs'),(7,'doc','showFiles'),(7,'doc','view'),(7,'extension','browse'),(7,'extension','obtain'),(7,'extension','structure'),(7,'file','delete'),(7,'file','download'),(7,'file','edit'),(7,'file','uploadImages'),(7,'git','apiSync'),(7,'git','cat'),(7,'git','diff'),(7,'group','browse'),(7,'index','index'),(7,'misc','ping'),(7,'my','bug'),(7,'my','calendar'),(7,'my','changePassword'),(7,'my','deleteContacts'),(7,'my','dynamic'),(7,'my','editProfile'),(7,'my','index'),(7,'my','manageContacts'),(7,'my','profile'),(7,'my','project'),(7,'my','story'),(7,'my','task'),(7,'my','testCase'),(7,'my','testTask'),(7,'my','todo'),(7,'my','unbind'),(7,'product','all'),(7,'product','batchEdit'),(7,'product','browse'),(7,'product','build'),(7,'product','close'),(7,'product','create'),(7,'product','delete'),(7,'product','doc'),(7,'product','dynamic'),(7,'product','edit'),(7,'product','index'),(7,'product','order'),(7,'product','project'),(7,'product','roadmap'),(7,'product','updateOrder'),(7,'product','view'),(7,'productplan','batchUnlinkBug'),(7,'productplan','batchUnlinkStory'),(7,'productplan','browse'),(7,'productplan','create'),(7,'productplan','delete'),(7,'productplan','edit'),(7,'productplan','linkBug'),(7,'productplan','linkStory'),(7,'productplan','unlinkBug'),(7,'productplan','unlinkStory'),(7,'productplan','view'),(7,'project','all'),(7,'project','browse'),(7,'project','bug'),(7,'project','build'),(7,'project','burn'),(7,'project','doc'),(7,'project','dynamic'),(7,'project','grouptask'),(7,'project','importPlanStories'),(7,'project','index'),(7,'project','kanban'),(7,'project','linkStory'),(7,'project','manageProducts'),(7,'project','story'),(7,'project','task'),(7,'project','team'),(7,'project','testtask'),(7,'project','tree'),(7,'project','treestory'),(7,'project','treetask'),(7,'project','unlinkStory'),(7,'project','view'),(7,'qa','index'),(7,'release','batchUnlinkBug'),(7,'release','batchUnlinkStory'),(7,'release','browse'),(7,'release','changeStatus'),(7,'release','create'),(7,'release','delete'),(7,'release','edit'),(7,'release','export'),(7,'release','linkBug'),(7,'release','linkStory'),(7,'release','unlinkBug'),(7,'release','unlinkStory'),(7,'release','view'),(7,'repo','browse'),(7,'repo','diff'),(7,'repo','download'),(7,'repo','log'),(7,'repo','revision'),(7,'repo','showSyncComment'),(7,'repo','view'),(7,'report','bugAssign'),(7,'report','bugCreate'),(7,'report','index'),(7,'report','productSummary'),(7,'report','projectDeviation'),(7,'report','workload'),(7,'search','buildForm'),(7,'search','buildQuery'),(7,'search','deleteQuery'),(7,'search','saveQuery'),(7,'search','select'),(7,'story','activate'),(7,'story','assignTo'),(7,'story','batchAssignTo'),(7,'story','batchChangeBranch'),(7,'story','batchChangeModule'),(7,'story','batchChangePlan'),(7,'story','batchChangeStage'),(7,'story','batchClose'),(7,'story','batchCreate'),(7,'story','batchEdit'),(7,'story','batchReview'),(7,'story','bugs'),(7,'story','cases'),(7,'story','change'),(7,'story','close'),(7,'story','create'),(7,'story','delete'),(7,'story','edit'),(7,'story','export'),(7,'story','linkStory'),(7,'story','report'),(7,'story','review'),(7,'story','tasks'),(7,'story','unlinkStory'),(7,'story','view'),(7,'story','zeroCase'),(7,'svn','apiSync'),(7,'svn','cat'),(7,'svn','diff'),(7,'task','confirmStoryChange'),(7,'task','deleteEstimate'),(7,'task','editEstimate'),(7,'task','export'),(7,'task','recordEstimate'),(7,'task','report'),(7,'task','view'),(7,'testcase','browse'),(7,'testcase','bugs'),(7,'testcase','createBug'),(7,'testcase','export'),(7,'testcase','groupCase'),(7,'testcase','importFromLib'),(7,'testcase','index'),(7,'testcase','view'),(7,'testsuite','batchCreateCase'),(7,'testsuite','browse'),(7,'testsuite','createCase'),(7,'testsuite','createLib'),(7,'testsuite','exportTemplet'),(7,'testsuite','import'),(7,'testsuite','index'),(7,'testsuite','library'),(7,'testsuite','libView'),(7,'testsuite','showImport'),(7,'testsuite','view'),(7,'testtask','browse'),(7,'testtask','cases'),(7,'testtask','groupCase'),(7,'testtask','index'),(7,'testtask','results'),(7,'testtask','view'),(7,'todo','activate'),(7,'todo','assignTo'),(7,'todo','batchClose'),(7,'todo','batchCreate'),(7,'todo','batchEdit'),(7,'todo','batchFinish'),(7,'todo','close'),(7,'todo','create'),(7,'todo','createCycle'),(7,'todo','delete'),(7,'todo','edit'),(7,'todo','export'),(7,'todo','finish'),(7,'todo','import2Today'),(7,'todo','view'),(7,'tree','browse'),(7,'tree','browseTask'),(7,'tree','delete'),(7,'tree','edit'),(7,'tree','fix'),(7,'tree','manageChild'),(7,'tree','updateOrder'),(7,'user','bug'),(7,'user','deleteContacts'),(7,'user','dynamic'),(7,'user','manageContacts'),(7,'user','profile'),(7,'user','project'),(7,'user','story'),(7,'user','task'),(7,'user','testCase'),(7,'user','testTask'),(7,'user','todo'),(7,'user','view'),(8,'action','editComment'),(8,'action','hideAll'),(8,'action','hideOne'),(8,'action','trash'),(8,'action','undelete'),(8,'admin','index'),(8,'bug','activate'),(8,'bug','assignTo'),(8,'bug','batchActivate'),(8,'bug','batchAssignTo'),(8,'bug','batchChangeModule'),(8,'bug','batchClose'),(8,'bug','batchConfirm'),(8,'bug','batchCreate'),(8,'bug','batchEdit'),(8,'bug','batchResolve'),(8,'bug','browse'),(8,'bug','close'),(8,'bug','confirmBug'),(8,'bug','confirmStoryChange'),(8,'bug','create'),(8,'bug','delete'),(8,'bug','deleteTemplate'),(8,'bug','edit'),(8,'bug','export'),(8,'bug','index'),(8,'bug','linkBugs'),(8,'bug','report'),(8,'bug','resolve'),(8,'bug','saveTemplate'),(8,'bug','unlinkBug'),(8,'bug','view'),(8,'build','create'),(8,'build','delete'),(8,'build','edit'),(8,'build','view'),(8,'company','browse'),(8,'company','dynamic'),(8,'company','index'),(8,'company','view'),(8,'doc','allLibs'),(8,'doc','browse'),(8,'doc','create'),(8,'doc','createLib'),(8,'doc','delete'),(8,'doc','deleteLib'),(8,'doc','edit'),(8,'doc','editLib'),(8,'doc','index'),(8,'doc','objectLibs'),(8,'doc','showFiles'),(8,'doc','view'),(8,'extension','browse'),(8,'extension','obtain'),(8,'extension','structure'),(8,'file','delete'),(8,'file','download'),(8,'file','edit'),(8,'file','uploadImages'),(8,'git','apiSync'),(8,'git','cat'),(8,'git','diff'),(8,'group','browse'),(8,'index','index'),(8,'misc','ping'),(8,'my','bug'),(8,'my','calendar'),(8,'my','changePassword'),(8,'my','deleteContacts'),(8,'my','dynamic'),(8,'my','editProfile'),(8,'my','index'),(8,'my','manageContacts'),(8,'my','profile'),(8,'my','project'),(8,'my','story'),(8,'my','task'),(8,'my','testCase'),(8,'my','testTask'),(8,'my','todo'),(8,'my','unbind'),(8,'product','all'),(8,'product','browse'),(8,'product','build'),(8,'product','doc'),(8,'product','dynamic'),(8,'product','index'),(8,'product','project'),(8,'product','roadmap'),(8,'product','view'),(8,'productplan','browse'),(8,'productplan','view'),(8,'project','all'),(8,'project','bug'),(8,'project','build'),(8,'project','burn'),(8,'project','doc'),(8,'project','dynamic'),(8,'project','grouptask'),(8,'project','importBug'),(8,'project','importtask'),(8,'project','index'),(8,'project','kanban'),(8,'project','story'),(8,'project','task'),(8,'project','team'),(8,'project','testtask'),(8,'project','tree'),(8,'project','treestory'),(8,'project','treetask'),(8,'project','view'),(8,'qa','index'),(8,'release','browse'),(8,'release','export'),(8,'release','view'),(8,'repo','browse'),(8,'repo','diff'),(8,'repo','download'),(8,'repo','log'),(8,'repo','revision'),(8,'repo','showSyncComment'),(8,'repo','view'),(8,'report','bugAssign'),(8,'report','bugCreate'),(8,'report','index'),(8,'report','productSummary'),(8,'report','projectDeviation'),(8,'report','workload'),(8,'search','buildForm'),(8,'search','buildQuery'),(8,'search','deleteQuery'),(8,'search','saveQuery'),(8,'search','select'),(8,'story','bugs'),(8,'story','cases'),(8,'story','export'),(8,'story','report'),(8,'story','tasks'),(8,'story','view'),(8,'story','zeroCase'),(8,'svn','apiSync'),(8,'svn','cat'),(8,'svn','diff'),(8,'task','activate'),(8,'task','assignTo'),(8,'task','batchAssignTo'),(8,'task','batchChangeModule'),(8,'task','batchClose'),(8,'task','batchCreate'),(8,'task','batchEdit'),(8,'task','cancel'),(8,'task','close'),(8,'task','confirmStoryChange'),(8,'task','create'),(8,'task','delete'),(8,'task','deleteEstimate'),(8,'task','edit'),(8,'task','editEstimate'),(8,'task','export'),(8,'task','finish'),(8,'task','pause'),(8,'task','recordEstimate'),(8,'task','report'),(8,'task','restart'),(8,'task','start'),(8,'task','view'),(8,'testcase','batchCaseTypeChange'),(8,'testcase','batchChangeModule'),(8,'testcase','batchConfirmStoryChange'),(8,'testcase','batchCreate'),(8,'testcase','batchDelete'),(8,'testcase','batchEdit'),(8,'testcase','batchReview'),(8,'testcase','browse'),(8,'testcase','bugs'),(8,'testcase','confirmChange'),(8,'testcase','confirmStoryChange'),(8,'testcase','create'),(8,'testcase','createBug'),(8,'testcase','delete'),(8,'testcase','edit'),(8,'testcase','export'),(8,'testcase','exportTemplet'),(8,'testcase','groupCase'),(8,'testcase','import'),(8,'testcase','importFromLib'),(8,'testcase','index'),(8,'testcase','linkCases'),(8,'testcase','review'),(8,'testcase','showImport'),(8,'testcase','unlinkCase'),(8,'testcase','view'),(8,'testreport','browse'),(8,'testreport','create'),(8,'testreport','delete'),(8,'testreport','edit'),(8,'testreport','view'),(8,'testsuite','batchCreateCase'),(8,'testsuite','browse'),(8,'testsuite','create'),(8,'testsuite','createCase'),(8,'testsuite','createLib'),(8,'testsuite','delete'),(8,'testsuite','edit'),(8,'testsuite','exportTemplet'),(8,'testsuite','import'),(8,'testsuite','index'),(8,'testsuite','library'),(8,'testsuite','libView'),(8,'testsuite','linkCase'),(8,'testsuite','showImport'),(8,'testsuite','unlinkCase'),(8,'testsuite','view'),(8,'testtask','activate'),(8,'testtask','batchAssign'),(8,'testtask','batchRun'),(8,'testtask','block'),(8,'testtask','browse'),(8,'testtask','cases'),(8,'testtask','close'),(8,'testtask','create'),(8,'testtask','delete'),(8,'testtask','edit'),(8,'testtask','groupCase'),(8,'testtask','index'),(8,'testtask','linkcase'),(8,'testtask','report'),(8,'testtask','results'),(8,'testtask','runcase'),(8,'testtask','start'),(8,'testtask','unlinkcase'),(8,'testtask','view'),(8,'todo','activate'),(8,'todo','assignTo'),(8,'todo','batchClose'),(8,'todo','batchCreate'),(8,'todo','batchEdit'),(8,'todo','batchFinish'),(8,'todo','close'),(8,'todo','create'),(8,'todo','createCycle'),(8,'todo','delete'),(8,'todo','edit'),(8,'todo','export'),(8,'todo','finish'),(8,'todo','import2Today'),(8,'todo','view'),(8,'tree','browse'),(8,'tree','browseTask'),(8,'tree','delete'),(8,'tree','edit'),(8,'tree','fix'),(8,'tree','manageChild'),(8,'tree','updateOrder'),(8,'user','bug'),(8,'user','deleteContacts'),(8,'user','dynamic'),(8,'user','manageContacts'),(8,'user','profile'),(8,'user','project'),(8,'user','story'),(8,'user','task'),(8,'user','testCase'),(8,'user','testTask'),(8,'user','todo'),(8,'user','view'),(9,'action','editComment'),(9,'action','hideAll'),(9,'action','hideOne'),(9,'action','trash'),(9,'action','undelete'),(9,'admin','index'),(9,'bug','browse'),(9,'bug','export'),(9,'bug','index'),(9,'bug','report'),(9,'bug','view'),(9,'build','view'),(9,'company','browse'),(9,'company','dynamic'),(9,'company','edit'),(9,'company','index'),(9,'company','view'),(9,'dept','browse'),(9,'dept','delete'),(9,'dept','manageChild'),(9,'dept','updateOrder'),(9,'doc','allLibs'),(9,'doc','browse'),(9,'doc','create'),(9,'doc','createLib'),(9,'doc','delete'),(9,'doc','deleteLib'),(9,'doc','edit'),(9,'doc','editLib'),(9,'doc','index'),(9,'doc','objectLibs'),(9,'doc','showFiles'),(9,'doc','view'),(9,'extension','browse'),(9,'extension','obtain'),(9,'extension','structure'),(9,'file','delete'),(9,'file','download'),(9,'file','edit'),(9,'file','uploadImages'),(9,'git','apiSync'),(9,'git','cat'),(9,'git','diff'),(9,'group','browse'),(9,'index','index'),(9,'misc','ping'),(9,'my','bug'),(9,'my','calendar'),(9,'my','changePassword'),(9,'my','deleteContacts'),(9,'my','dynamic'),(9,'my','editProfile'),(9,'my','index'),(9,'my','manageContacts'),(9,'my','profile'),(9,'my','project'),(9,'my','story'),(9,'my','task'),(9,'my','testCase'),(9,'my','testTask'),(9,'my','todo'),(9,'my','unbind'),(9,'product','all'),(9,'product','browse'),(9,'product','build'),(9,'product','doc'),(9,'product','dynamic'),(9,'product','index'),(9,'product','project'),(9,'product','roadmap'),(9,'product','view'),(9,'productplan','browse'),(9,'productplan','view'),(9,'project','all'),(9,'project','browse'),(9,'project','bug'),(9,'project','build'),(9,'project','burn'),(9,'project','computeBurn'),(9,'project','doc'),(9,'project','dynamic'),(9,'project','grouptask'),(9,'project','index'),(9,'project','kanban'),(9,'project','story'),(9,'project','task'),(9,'project','team'),(9,'project','tree'),(9,'project','treestory'),(9,'project','treetask'),(9,'project','view'),(9,'qa','index'),(9,'release','browse'),(9,'release','export'),(9,'release','view'),(9,'repo','browse'),(9,'repo','diff'),(9,'repo','download'),(9,'repo','log'),(9,'repo','revision'),(9,'repo','showSyncComment'),(9,'repo','view'),(9,'report','bugAssign'),(9,'report','bugCreate'),(9,'report','index'),(9,'report','productSummary'),(9,'report','projectDeviation'),(9,'report','workload'),(9,'search','buildForm'),(9,'search','buildQuery'),(9,'search','deleteQuery'),(9,'search','saveQuery'),(9,'search','select'),(9,'story','bugs'),(9,'story','cases'),(9,'story','export'),(9,'story','report'),(9,'story','review'),(9,'story','tasks'),(9,'story','view'),(9,'story','zeroCase'),(9,'svn','apiSync'),(9,'svn','cat'),(9,'svn','diff'),(9,'task','deleteEstimate'),(9,'task','editEstimate'),(9,'task','export'),(9,'task','recordEstimate'),(9,'task','report'),(9,'task','view'),(9,'testcase','browse'),(9,'testcase','bugs'),(9,'testcase','export'),(9,'testcase','groupCase'),(9,'testcase','index'),(9,'testcase','view'),(9,'testsuite','browse'),(9,'testsuite','index'),(9,'testsuite','view'),(9,'testtask','browse'),(9,'testtask','cases'),(9,'testtask','groupCase'),(9,'testtask','index'),(9,'testtask','results'),(9,'testtask','view'),(9,'todo','activate'),(9,'todo','assignTo'),(9,'todo','batchClose'),(9,'todo','batchCreate'),(9,'todo','batchEdit'),(9,'todo','batchFinish'),(9,'todo','close'),(9,'todo','create'),(9,'todo','createCycle'),(9,'todo','delete'),(9,'todo','edit'),(9,'todo','export'),(9,'todo','finish'),(9,'todo','import2Today'),(9,'todo','view'),(9,'user','batchCreate'),(9,'user','batchEdit'),(9,'user','bug'),(9,'user','create'),(9,'user','delete'),(9,'user','deleteContacts'),(9,'user','dynamic'),(9,'user','edit'),(9,'user','manageContacts'),(9,'user','profile'),(9,'user','project'),(9,'user','story'),(9,'user','task'),(9,'user','testCase'),(9,'user','testTask'),(9,'user','todo'),(9,'user','unbind'),(9,'user','unlock'),(9,'user','view'),(10,'action','editComment'),(10,'bug','activate'),(10,'bug','batchChangeModule'),(10,'bug','browse'),(10,'bug','close'),(10,'bug','create'),(10,'bug','edit'),(10,'bug','index'),(10,'bug','linkBugs'),(10,'bug','report'),(10,'bug','unlinkBug'),(10,'bug','view'),(10,'build','view'),(10,'company','browse'),(10,'company','dynamic'),(10,'company','index'),(10,'company','view'),(10,'doc','allLibs'),(10,'doc','browse'),(10,'doc','index'),(10,'doc','objectLibs'),(10,'doc','showFiles'),(10,'doc','view'),(10,'file','download'),(10,'index','index'),(10,'misc','ping'),(10,'my','calendar'),(10,'my','changePassword'),(10,'my','dynamic'),(10,'my','editProfile'),(10,'my','index'),(10,'my','profile'),(10,'my','task'),(10,'my','todo'),(10,'my','unbind'),(10,'product','all'),(10,'product','browse'),(10,'product','build'),(10,'product','doc'),(10,'product','dynamic'),(10,'product','index'),(10,'product','roadmap'),(10,'product','view'),(10,'productplan','browse'),(10,'productplan','view'),(10,'project','all'),(10,'project','browse'),(10,'project','bug'),(10,'project','build'),(10,'project','burn'),(10,'project','doc'),(10,'project','dynamic'),(10,'project','grouptask'),(10,'project','index'),(10,'project','kanban'),(10,'project','story'),(10,'project','task'),(10,'project','team'),(10,'project','testtask'),(10,'project','tree'),(10,'project','treestory'),(10,'project','treetask'),(10,'project','view'),(10,'qa','index'),(10,'release','browse'),(10,'release','view'),(10,'repo','browse'),(10,'repo','diff'),(10,'repo','download'),(10,'repo','log'),(10,'repo','revision'),(10,'repo','showSyncComment'),(10,'repo','view'),(10,'report','bugAssign'),(10,'report','bugCreate'),(10,'report','index'),(10,'report','productSummary'),(10,'report','projectDeviation'),(10,'report','workload'),(10,'search','buildForm'),(10,'search','buildQuery'),(10,'search','deleteQuery'),(10,'search','saveQuery'),(10,'story','bugs'),(10,'story','cases'),(10,'story','tasks'),(10,'story','view'),(10,'task','deleteEstimate'),(10,'task','editEstimate'),(10,'task','recordEstimate'),(10,'task','view'),(10,'testsuite','browse'),(10,'testsuite','index'),(10,'testsuite','view'),(10,'todo','activate'),(10,'todo','assignTo'),(10,'todo','batchClose'),(10,'todo','batchCreate'),(10,'todo','batchEdit'),(10,'todo','batchFinish'),(10,'todo','close'),(10,'todo','create'),(10,'todo','createCycle'),(10,'todo','delete'),(10,'todo','edit'),(10,'todo','export'),(10,'todo','finish'),(10,'todo','import2Today'),(10,'todo','view'),(10,'user','bug'),(10,'user','dynamic'),(10,'user','profile'),(10,'user','project'),(10,'user','story'),(10,'user','task'),(10,'user','testCase'),(10,'user','testTask'),(10,'user','todo'),(10,'user','view'),(11,'bug','browse'),(11,'bug','index'),(11,'bug','report'),(11,'bug','view'),(11,'build','view'),(11,'company','browse'),(11,'company','dynamic'),(11,'company','index'),(11,'company','view'),(11,'doc','allLibs'),(11,'doc','browse'),(11,'doc','index'),(11,'doc','objectLibs'),(11,'doc','showFiles'),(11,'doc','view'),(11,'file','download'),(11,'git','cat'),(11,'git','diff'),(11,'group','browse'),(11,'index','index'),(11,'misc','ping'),(11,'my','index'),(11,'product','all'),(11,'product','browse'),(11,'product','build'),(11,'product','doc'),(11,'product','dynamic'),(11,'product','index'),(11,'product','roadmap'),(11,'product','view'),(11,'productplan','browse'),(11,'productplan','view'),(11,'project','all'),(11,'project','browse'),(11,'project','bug'),(11,'project','build'),(11,'project','burn'),(11,'project','doc'),(11,'project','dynamic'),(11,'project','grouptask'),(11,'project','index'),(11,'project','kanban'),(11,'project','story'),(11,'project','task'),(11,'project','team'),(11,'project','testtask'),(11,'project','tree'),(11,'project','treestory'),(11,'project','treetask'),(11,'project','view'),(11,'qa','index'),(11,'release','browse'),(11,'release','view'),(11,'report','bugAssign'),(11,'report','bugCreate'),(11,'report','index'),(11,'report','productSummary'),(11,'report','projectDeviation'),(11,'report','workload'),(11,'search','buildForm'),(11,'search','buildQuery'),(11,'story','bugs'),(11,'story','cases'),(11,'story','tasks'),(11,'story','view'),(11,'svn','cat'),(11,'svn','diff'),(11,'task','recordEstimate'),(11,'task','view'),(11,'testcase','browse'),(11,'testcase','bugs'),(11,'testcase','groupCase'),(11,'testcase','index'),(11,'testcase','view'),(11,'testsuite','browse'),(11,'testsuite','index'),(11,'testsuite','view'),(11,'testtask','browse'),(11,'testtask','cases'),(11,'testtask','groupCase'),(11,'testtask','index'),(11,'testtask','results'),(11,'testtask','view'),(11,'user','bug'),(11,'user','dynamic'),(11,'user','profile'),(11,'user','project'),(11,'user','story'),(11,'user','task'),(11,'user','testCase'),(11,'user','testTask'),(11,'user','todo'),(11,'user','view'),(12,'my','limited');
