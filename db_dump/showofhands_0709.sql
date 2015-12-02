-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2015 at 11:48 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `showofhands`
--

-- --------------------------------------------------------

--
-- Table structure for table `activitylog`
--

CREATE TABLE IF NOT EXISTS `activitylog` (
`ID` int(11) NOT NULL,
  `scriptname` varchar(2000) DEFAULT NULL,
  `linenumber` int(11) DEFAULT NULL,
  `variablename` varchar(2000) DEFAULT NULL,
  `variablevalue` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE IF NOT EXISTS `audit` (
`id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `date` datetime NOT NULL,
  `insertID` int(11) DEFAULT NULL,
  `sqlString` text NOT NULL,
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`id`, `userid`, `username`, `date`, `insertID`, `sqlString`, `siteid`) VALUES
(1, 1, 'webadmin', '2014-07-15 11:08:55', 0, 'update cmspage SET heading = ''Footer'',\r\n                        uploaddate =  NOW(),\r\n                        metatitle = ''Footer Links'',\r\n                        metakeywords = '''',\r\n                        metadescription = '''',\r\n						static = 0, \r\n						adminmode = 1, \r\n                        filecontent = ''<p>Copyright &copy; 2014. All rights reserveddd</p>'',\r\n						headerid = ''0''						\r\n                        where pageid = 4', 1),
(2, 1, 'webadmin', '2014-07-15 11:09:22', 0, 'update cmspage SET heading = ''Footer'',\r\n                        uploaddate =  NOW(),\r\n                        metatitle = ''Footer Links'',\r\n                        metakeywords = '''',\r\n                        metadescription = '''',\r\n						static = 0, \r\n						adminmode = 1, \r\n                        filecontent = ''<p>Copyright &copy; 2014. All rights reserved | <a href=\\"http://www.onlineinnovations.com\\" title=\\"Website Hosting\\">Website Hosting</a> by Online Innovations</p>'',\r\n						headerid = ''0''						\r\n                        where pageid = 4', 1),
(3, 1, 'webadmin', '2014-07-15 13:59:08', 0, 'UPDATE defaults SET DefaultValue = ''Show of Hands'' WHERE Description = ''metatitle''', 1),
(4, 1, 'webadmin', '2014-07-15 13:59:08', 0, 'UPDATE defaults SET DefaultValue = ''Show of Hands'' WHERE Description = ''metakeywords''', 1),
(5, 1, 'webadmin', '2014-07-15 13:59:08', 0, 'UPDATE defaults SET DefaultValue = ''Show of Hands'' WHERE Description = ''metadescription''', 1),
(6, 1, 'webadmin', '2014-08-14 15:21:22', 2, 'INSERT INTO users (username,realname,password,userlevel) VALUES (''neil@avenue-imc.com'',''Neil van Antwerpen'',''show3685'',1)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auditlog`
--

CREATE TABLE IF NOT EXISTS `auditlog` (
`id` int(11) NOT NULL,
  `pageid` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `parentname` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `module` varchar(200) DEFAULT NULL,
  `extrainfo` varchar(200) DEFAULT '',
  `activity` varchar(200) DEFAULT NULL,
  `serialvalue` text,
  `sqlstatement` varchar(3000) DEFAULT NULL,
  `codelinenumber` int(11) DEFAULT NULL,
  `codefilename` varchar(200) DEFAULT NULL,
  `entrydate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`catid` int(11) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `catname` varchar(250) NOT NULL,
  `cattype` varchar(150) NOT NULL,
  `catdesc1` varchar(1000) DEFAULT NULL,
  `catdesc2` varchar(1000) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cmsdocuments`
--

CREATE TABLE IF NOT EXISTS `cmsdocuments` (
`docid` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `filename` varchar(250) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `docorder` int(11) NOT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cmsfeatures`
--

CREATE TABLE IF NOT EXISTS `cmsfeatures` (
`featureid` int(11) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `linkid` varchar(100) DEFAULT NULL,
  `imagename` varchar(100) NOT NULL,
  `CreateDate` date NOT NULL,
  `intorder` int(11) NOT NULL,
  `mainFeature` tinyint(1) NOT NULL,
  `frontPage` tinyint(1) NOT NULL,
  `QuickLink` tinyint(1) NOT NULL,
  `featuredate` date NOT NULL,
  `featureenddate` date DEFAULT NULL,
  `description` text NOT NULL,
  `frame` varchar(50) NOT NULL,
  `externallink` varchar(255) NOT NULL,
  `home` tinyint(1) unsigned zerofill NOT NULL,
  `allother` tinyint(1) unsigned zerofill NOT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cmsheadercategory`
--

CREATE TABLE IF NOT EXISTS `cmsheadercategory` (
`id` int(11) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `categoryname` varchar(500) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cmsheadercategory`
--

INSERT INTO `cmsheadercategory` (`id`, `siteid`, `categoryname`, `lastmodified`) VALUES
(1, 1, 'General', '2014-06-10 08:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `cmsimages`
--

CREATE TABLE IF NOT EXISTS `cmsimages` (
`id` int(11) NOT NULL,
  `typeid` int(10) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '0',
  `siteid` int(11) DEFAULT NULL,
  `filename` varchar(500) NOT NULL,
  `imageorder` int(10) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subtitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `cmsimages`
--

INSERT INTO `cmsimages` (`id`, `typeid`, `type`, `siteid`, `filename`, `imageorder`, `description`, `title`, `url`, `lastmodified`, `subtitle`) VALUES
(9, 1, 'headers', NULL, 'header_1_9.jpg', 1, 'From bookkeeping and accounting, to auditing and financial management, Capstan outsources financial solutions to\r\nSMME businesses who don’t have a fulltime financial team, making the running of their businesses more successful.', 'Foward Thinking Financial Solutions', '', '2014-06-13 14:35:44', 'Your Business Partners in Finance'),
(10, 1, 'headers', NULL, 'header_1_10.jpg', 2, 'From bookkeeping and accounting, to auditing and financial management, Capstan outsources financial solutions to\r\nSMME businesses who don’t have a fulltime financial team, making the running of their businesses more successful.', 'Foward Thinking Financial Solutions', '', '2014-06-13 14:35:44', 'Your Business Partners in Finance'),
(11, 1, 'headers', NULL, 'header_1_11.jpg', 3, 'From bookkeeping and accounting, to auditing and financial management, Capstan outsources financial solutions to\r\nSMME businesses who don’t have a fulltime financial team, making the running of their businesses more successful.', 'Foward Thinking Financial Solutions', '', '2014-06-13 14:35:45', 'Your Business Partners in Finance'),
(12, 1, 'headers', NULL, 'header_1_12.jpg', 4, 'From bookkeeping and accounting, to auditing and financial management, Capstan outsources financial solutions to\r\nSMME businesses who don’t have a fulltime financial team, making the running of their businesses more successful.', 'Foward Thinking Financial Solutions', '', '2014-06-13 14:35:45', 'Your Business Partners in Finance'),
(13, 1, 'headers', NULL, 'header_1_13.jpg', 5, 'From bookkeeping and accounting, to auditing and financial management, Capstan outsources financial solutions to\r\nSMME businesses who don’t have a fulltime financial team, making the running of their businesses more successful.', 'Foward Thinking Financial Solutions', '', '2014-06-13 14:35:45', 'Your Business Partners in Finance'),
(14, 1, 'headers', NULL, 'header_1_14.jpg', 6, 'From bookkeeping and accounting, to auditing and financial management, Capstan outsources financial solutions to\r\nSMME businesses who don’t have a fulltime financial team, making the running of their businesses more successful.', 'Foward Thinking Financial Solutions', '', '2014-06-13 14:35:45', 'Your Business Partners in Finance');

-- --------------------------------------------------------

--
-- Table structure for table `cmsmenu`
--

CREATE TABLE IF NOT EXISTS `cmsmenu` (
`menuid` int(10) NOT NULL,
  `menusectionid` int(10) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  `menuname` varchar(200) NOT NULL,
  `menuorder` int(10) NOT NULL,
  `mainmenuid` int(10) DEFAULT NULL,
  `pageid` int(10) DEFAULT NULL,
  `linktype` varchar(20) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `frame` varchar(50) DEFAULT NULL,
  `sub` int(10) DEFAULT NULL,
  `isparent` int(10) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `cmsmenu`
--

INSERT INTO `cmsmenu` (`menuid`, `menusectionid`, `siteid`, `menuname`, `menuorder`, `mainmenuid`, `pageid`, `linktype`, `url`, `frame`, `sub`, `isparent`, `lastmodified`) VALUES
(93, 1, 1, 'Info for Volunteers', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-07-08 08:36:07'),
(104, 1, 1, 'Who can Join?', 1, 93, 5, 'page', NULL, '_self', NULL, NULL, '2014-06-23 09:10:47'),
(105, 1, 1, 'What work will we do?', 2, 93, 6, 'page', NULL, '_self', NULL, NULL, '2014-06-23 09:10:53'),
(106, 1, 1, 'How are projects selected?', 3, 93, 7, 'page', NULL, '_self', NULL, NULL, '2014-06-23 09:10:58'),
(107, 1, 1, 'Quick Facts', 4, 93, 8, 'page', NULL, '_self', NULL, NULL, '2014-06-23 09:11:06'),
(108, 1, 1, 'Projects Before and After', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-07-08 08:36:07'),
(109, 1, 1, 'July 2013 - Mandela Day', 1, 108, 9, 'page', NULL, '_self', NULL, NULL, '2014-07-02 12:24:21'),
(110, 1, 1, 'March 2013 - Maranatha', 2, 108, 10, 'page', NULL, '_self', NULL, NULL, '2014-07-02 12:41:34'),
(111, 1, 1, 'Oct 2012 - SAMREC Think Blue', 3, 108, 11, 'page', NULL, '_self', NULL, NULL, '2014-07-02 13:07:11'),
(112, 1, 1, 'July 2012 - Limekhaya High School', 4, 108, 12, 'page', NULL, '_self', NULL, NULL, '2014-07-02 13:21:17'),
(113, 1, 1, 'May 2012 - SOS Children''s Village', 5, 108, 13, 'page', NULL, '_self', NULL, NULL, '2014-07-02 13:41:13'),
(114, 1, 1, 'March 2012 - Siyaphambili', 6, 108, 14, 'page', NULL, '_self', NULL, NULL, '2014-07-02 14:08:26'),
(115, 1, 1, 'Oct 2011 - Lake Farm Centre', 7, 108, 15, 'page', NULL, '_self', NULL, NULL, '2014-07-02 14:30:50'),
(116, 1, 1, 'July 2011 - Orsmond TB Hospital', 8, 108, 16, 'page', NULL, '_self', NULL, NULL, '2014-07-03 07:44:37'),
(117, 1, 1, 'April 2011 - Nonkqubela Pre-school', 9, 108, 17, 'page', NULL, '_self', NULL, NULL, '2014-07-03 08:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `cmspage`
--

CREATE TABLE IF NOT EXISTS `cmspage` (
`pageid` int(10) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `adminmode` tinyint(1) NOT NULL DEFAULT '0',
  `heading` varchar(200) NOT NULL,
  `uploaddate` datetime NOT NULL,
  `metatitle` varchar(200) DEFAULT NULL,
  `metakeywords` varchar(1000) DEFAULT NULL,
  `metadescription` varchar(4000) DEFAULT NULL,
  `filecontent` longtext,
  `static` tinyint(1) NOT NULL DEFAULT '0',
  `headerid` varchar(200) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=18 ;

--
-- Dumping data for table `cmspage`
--

INSERT INTO `cmspage` (`pageid`, `siteid`, `adminmode`, `heading`, `uploaddate`, `metatitle`, `metakeywords`, `metadescription`, `filecontent`, `static`, `headerid`, `lastmodified`) VALUES
(1, 1, 1, 'Over 700 VWSA Employees have volunteered to make a difference!', '2014-06-23 10:56:44', 'Volkswagen Volunteer Programme | Show of Hands Volunteer Programme', '', 'The Show of Hands volunteer programme was initiated in 2011 in response to VWSA employees asking for the opportunity to play a hands-on role in Volkswagen’s annual multimillion rand investment into development of local communities.', '<p>The Show of Hands volunteer programme was initiated in 2011 in response to VWSA employees asking for the opportunity to play a hands-on role in Volkswagen&rsquo;s annual multimillion rand investment into development of local communities.</p>\r\n<p>Over 700 VWSA employees have participated in the company&rsquo;s volunteer programme since inception, impacting on seven local NGO&rsquo;s in the Nelson Mandela Bay area.</p>\r\n<p><em>See what our 2012 volunteers have achieved to date by viewing the highlights video of the March and May 2012 volunteer action.</em></p>\r\n<p><iframe src="//www.youtube.com/embed/wFfX6Wh1YVw" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p><br /><em>Over 300 Volkswagen employees volunteered to make extreme improvements to community projects in 2011.View the highlights video* below to see what we did during 2011 at our three Great Show of Hands projects. *(4min)</em></p>\r\n<p><br /><iframe src="//www.youtube.com/embed/xKXfUsiP1TM" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 1, '0', '2014-06-23 08:56:44'),
(2, 1, 1, 'Contact Us', '2014-06-23 11:57:07', 'Contact Us | Contact Show of Hands Volunteer Projects', '', 'Contact Show of Hands Volunteer Projects for more information.', '<p>For all enquiries please complete the form below:</p>', 0, '0', '2014-06-23 09:57:07'),
(3, 1, 1, 'Thank You', '2014-06-23 11:04:40', 'Thank You | Show of Hands Volunteer Programme', '', 'Thank you for contacting us.', '<p>Thank you for contacting us. We will attend to your enquiry as soon as possible.</p>', 1, '0', '2014-06-23 09:04:40'),
(4, 1, 1, 'Footer', '2014-07-15 11:09:22', 'Footer Links', '', '', '<p>Copyright &copy; 2014. All rights reserved | <a href="http://www.onlineinnovations.com" title="Website Hosting">Website Hosting</a> by Online Innovations</p>', 0, '0', '2014-07-15 09:09:22'),
(5, 1, 0, 'Who can Join?', '2014-07-14 13:06:38', 'Volunteer Members | Show of Hands Volunteer Programme', '', 'All employees and dealer staff of Volkswagen Group South Africa are invited to sign up to The Great Show of Hands as volunteer members.', '<p><img style="float: left;" src="/assets/whocanjoin1.jpg" alt="employees and dealer staff of Volkswagen Group South Africa" width="587" height="250" /></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>All employees and dealer staff of Volkswagen Group South Africa are invited to sign up to The Great Show of Hands as volunteer members.<br /><br />We also encourage employees and staff to bring their family and friends along to volunteer day activities - the more, the merrier!</p><p><img style="float: left;" src="/assets/whocanjoin2.jpg" alt="Show of Hands Employee Volunteerism Programme" width="587" height="250" /></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>For more information regarding the Great Show of Hands Employee Volunteerism Programme, please contact Tumi Maneli on <a href="mailto:manel01@vwsa.co.za">manel01@vwsa.co.za</a><a href="mailto:manel01@vwsa.co.za.">.</a></p><table style="height: 21px; width: 100%; border: none;" cellpadding="5"><tbody><tr><td><table><tbody><tr><td><img style="display: block; margin-left: auto; margin-right: auto;" src="/assets/whocanjoin3.png" alt="" width="184" height="230" /></td></tr></tbody></table></td><td><h2>Each One Teach One</h2><p>Midrand staff are reminded of the Each One Teach One volunteer mentorship programme that is being run by Volkswagen in Gauteng. For more information on the mentorship programme, contact Nobunto Lange on <span><a href="mailto:lange01@vwsa.co.za"><span>lange01@vwsa.co.za</span></a></span><span>, or 011 911 2731</span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></td></tr></tbody></table>', 0, '0', '2015-09-07 09:13:54'),
(6, 1, 0, 'What work will we do?', '2014-07-14 13:06:03', 'Volunteer Work | Volunteer Action | Show of Hands', '', 'Volunteer action comes in so many guises. From donating blankets, food and clothing, all the way through to building a playground for a pre-school, painting a community hall, or cleaning windows at a home for the aged – the list of needs and little to large ways in which a group of volunteers can touch some lives, is endless.', '<p><img src="/assets/whatwork1.jpg" alt="Show of hands volunteer action" width="587" height="250" /></p><p>Volunteer action comes in so many guises. From donating blankets, food and clothing, all the way through to building a playground for a pre-school, painting a community hall, or cleaning windows at a home for the aged &ndash; the list of needs and little to large ways in which a group of volunteers can touch some lives, is endless. That is why we have asked to hear from you, our employees, what volunteer action you would like to see become a reality this year.</p><h2>Some ideas include:</h2><ul><li>building or renovating playground facilities</li><li>planting trees and food gardens</li><li>upgrading or installing plumbing or ablution facilities</li><li>painting and decorating</li><li>hosting a soup kitchen</li><li>donations of clothing and blankets</li><li>donations of educational resources</li></ul><p>Thank you to employees who nominated projects. The cut-off date for nominations was 1 March and Corporate &amp; Government Affairs review the feasibility of all nominations received.</p><p><img src="/assets/whatwork2.jpg" alt="Building or renovating playground facilities" width="587" height="250" /></p>', 0, '0', '2015-09-07 09:13:54'),
(7, 1, 0, 'How are projects selected?', '2014-07-14 12:33:24', 'Volunteer Projects | Beneficiary Projects | Show of Hands Projects', '', 'At Show of Hands our philosophy is to get the input of the beneficiaries before we embark on a volunteer project. This way we can ensure that our actions are needed and welcomed by the local community stakeholders.', '<p><img src="/assets/how1.jpg" alt="Show of Hands beneficiary projects" width="587" height="250" /></p>\r\n<h2>Show of Hands beneficiary projects are identified and selected in two ways:</h2>\r\n<ol>\r\n<li>Through nominations received from employees and dealer staff</li>\r\n<li>Through Corporate and Government Affairs Division consultation with community stakeholders.</li>\r\n</ol>\r\n<p>Ultimately, the projects should be both critically in need of assistance, as well as feasible and sustainable in terms of the volunteer action required.<br /> <br />Our philosophy is to get the input of the beneficiaries before we embark on a volunteer project. This way we can ensure that our actions are needed and welcomed by the local community stakeholders.</p>\r\n<h3>The Corporate and Government Affairs team will review all nominations and select the projects that best fit the following criteria:</h3>\r\n<ul>\r\n<li>Project to be located within Nelson Mandela Bay</li>\r\n<li>Project needs must be clearly identified</li>\r\n<li>Project must be achievable within the period of a one day volunteer event</li>\r\n<li>Project should be aligned with Volkswagen key CSI focus areas</li>\r\n</ul>\r\n<p>Corporate &amp; Government Affairs Division will then engage with identified projects to understand their needs and will procure all the necessary materials, tools or donations required to realise the project.</p>\r\n<h3>Show of Hands volunteer projects align with the Volkswagen Group South Africa key focus areas for corporate social investment:</h3>\r\n<ul>\r\n<li>EDUCATION</li>\r\n<li>YOUTH DEVELOPMENT</li>\r\n<li>LOCAL ECONOMIC DEVELOPMENT</li>\r\n<li>ENVIRONMENT</li>\r\n<li>HEALTH &amp; COMMUNITY WELLBEING</li>\r\n</ul>', 0, '0', '2015-09-07 09:13:54'),
(8, 1, 0, 'Quick Facts about Volunteer Days', '2014-07-14 12:35:25', 'Volunteer Facts |  Show of Hands Volunteer Facts', '', 'Quick Facts about Volunteer Days.', '<p><img src="/assets/quickfacts1.jpg" alt="Show of Hands volunteers" width="587" height="250" /></p>\r\n<ul>\r\n<li>Show of Hands volunteer days are all implemented on a Saturday and generally run from 8am to 2pm</li>\r\n<li>Volunteers don&rsquo;t need to provide any resources &ndash; just their hands, time and enthusiasm!</li>\r\n<li>You are welcome to bring your family along to participate in the volunteer days</li>\r\n<li>Volunteers are provided with refreshments and a lunch snack on the day</li>\r\n<li>Volunteers must RSVP by the closing date one week before each event.</li>\r\n<li>Directions and maps are issued for all event locations.</li>\r\n</ul>\r\n<p><img src="/assets/quickfacts2.jpg" alt="Show of Hands merchandise " width="587" height="250" /></p>', 0, '0', '2015-09-07 09:13:54'),
(9, 1, 0, '126 Volkswagen Volunteers Take Action for International Nelson Mandela Day', '2014-07-14 12:20:02', 'International Nelson Mandela Day | Show of Hands Projects', 'show of hands, volkswagen, charity, nelson mandela, nelson mandela day', '126 Volkswagen volunteers decided to do some good on Nelson Mandela Day by uplifting the centre of Uitenhage. ', '<p><img src="/assets/13julyheader.jpg" alt="International Nelson Mandela Day" width="587" height="175" /></p>\r\n<p><img src="/assets/13july1.jpg" alt="126 Volkswagen Volunteers" width="587" height="175" /></p>\r\n<p><iframe src="//www.youtube.com/embed/w39RTyUTRG4" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p><span>On Saturday 13 July, one hundred and twenty six Volkswagen Group South Africa employees reported for volunteer action in a bid to uplift the town centre of Uitenhage by cleaning and beautifying Algoa Road.&nbsp;</span></p>\r\n<p>The operation, covering over a kilometer from the Goodyear intersection to Innes School, included a major clean up of the road&rsquo;s verges, weeding, trimming of trees and removal of rubbish.</p>\r\n<p><img src="/assets/13july2.jpg" alt="Cleaning and Beautifying Algoa Road" width="587" height="250" /></p>\r\n<p><span>The old municipal concrete bus shelters along Algoa Road also received a makeover of vibrant murals celebrating the spirit of community giving, whilst an impressive indigenous garden was landscaped at the Innes School intersection.</span></p>\r\n<p><span><img src="/assets/mandela_day/13july3.jpg" alt="Bus shelter receives a makeover" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/mandela_day/13july4.jpg" alt="Vibrant murals for the bus shelters" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/mandela_day/13july5.jpg" alt=" Impressive indigenous garden" width="587" height="250" /></span></p>\r\n<p><span>The flagship installation of the &lsquo;Operation Algoa Road&rsquo; volunteer action however, has been the creation of a 300 square meter public park and rest area in honour of Nelson Mandela.&nbsp; The project is Volkswagen volunteers&rsquo; special gift to Madiba in celebration of the bright rainbow nation he has nurtured.</span></p>\r\n<p><span><img src="/assets/mandela_day/13july6.jpg" alt="Operation Algoa Road" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/mandela_day/13july7.jpg" alt="The flagship installation of the &lsquo;Operation Algoa Road&rsquo;" width="587" height="250" /></span></p>\r\n<p><span>&ldquo;The spirit of volunteerism has been overwhelming,&rdquo; said Nonkqubela Maliza, Director of Corporate and Government Affairs at Volkswagen Group South Africa.&nbsp; &ldquo;While the suggestion to mark International Nelson Mandela Day with a town upliftment project came from one of our employees who also drives the local Dorp van Drome volunteer campaign, invaluable support and collaboration has also come from Greg Foxcroft of Nelson Mandela Bay Metropolitan Parks.&rdquo;</span></p>\r\n<p>The International Nelson Mandela Day volunteer action marks the 9<sup>th</sup> community volunteer project initiated by Volkswagen in 2011 in their Show of Hands employee volunteerism campaign. Nearly 1,000 employees have participated in the campaign to date.</p>\r\n<p><img src="/assets/mandela_day/13july8.jpg" alt="Volunteer project initiated by Volkswagen" width="587" height="250" /></p>\r\n<p><span>Celebrated on 18 July every year, the over-arching objective of International Mandela Day is to inspire individuals to take action and help change the world for the better. &nbsp;Ultimately it seeks to empower communities everywhere to "Take action, inspire change, and make everyday a Mandela Day."</span></p>\r\n<p>&ldquo;Volkswagen is proud to have taken action for Madiba this week and we hope the project will inspire more positive action in Uitenhage by our corporate and community neighbours,&rdquo; added Maliza.</p>\r\n<p><img src="/assets/mandela_day/13july9.jpg" alt="Action for Madiba project" width="587" height="250" /></p>', 0, '0', '2015-09-07 09:13:54'),
(10, 1, 0, '70 Volunteers Make a Difference at Maranatha Streetworker Trust', '2014-07-14 12:32:52', '70 Volunteers Help Maranatha Streetworker Trust | Show of Hands Projects', 'volunteers, south africa, maranatha, show of hands, port elizabeth', 'On 16 March, 70 volunteers braved the strong Port Elizabeth winds to make a difference at Maranatha Streetworker Trust. ', '<p><img src="/assets/maranatha/16marcharticleheader.jpg" alt="Maranatha Streetworker Trust" width="587" height="175" /></p>\r\n<p><img src="/assets/maranatha/16march1.jpg" alt="70 Volunteers Help Maranatha Streetworker Trust" width="587" height="250" /></p>\r\n<p><iframe src="//www.youtube.com/embed/CdxTQp5Nr2Q" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p><span>Maranatha has a 22-year track record as a streetwork action organisation.&nbsp; Under the guidance and leadership of Dr Trudi Basson and&nbsp; her husband Albie Basson, the organisation merged with two similar streetwork groups in 1992 to become the Maranatha Streetworker Trust.&nbsp; The Trust is an outreach that cares for vulnerable children and destitute adults to restore their human dignity.&nbsp; Their aim is to empower young and old to develop their full potential and to uplift and care for children and adults through a holistic approach.&nbsp; Currently there are approximately 80 child and adult permanent residents at Maranatha. The centre is housed in 1940&rsquo;s state buildings and is not supported by any form of government maintenance.&nbsp; Although Maranatha receives a nominal government subsidy towards the children&rsquo;s education, all accommodations and operating expenses, food and resources is dependant on funds raised by the Trust through private donors and corporate sponsors.</span></p>\r\n<h1><span>What work did we do?&nbsp;</span></h1>\r\n<h2><span>Dorm Renovations&nbsp;</span></h2>\r\n<p><span>Show of Hands volunteers took on the big task of renovating and uplifting the accommodation exteriors at Maranatha.&nbsp; We renovated and uplifted the adults cottages, as well as the boys and girls dorms in a bid to recreate a vibrant and positive environment.</span></p>\r\n<p><span><img src="/assets/maranatha/16march2.jpg" alt="Renovating and uplifting the accommodation exteriors at Maranatha" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/maranatha/16march3.jpg" alt="Renovated and uplifted the adults cottages" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/maranatha/16march4.jpg" alt="Recreating a vibrant and positive environment." width="587" height="250" /></span></p>\r\n<p><strong><span>Show of Hands Volunteer Action:</span></strong></p>\r\n<ul>\r\n<li><span>Painting exterior walls and features</span></li>\r\n<li><span>Renovate doors, windows &amp; features</span></li>\r\n<li><span>Restore paved areas</span></li>\r\n<li><span>Beautification of gardens</span></li>\r\n</ul>\r\n<h2><span>Outdoor Renovations&nbsp;</span></h2>\r\n<p><span>Maranatha was lacking in suitable outdoor recreation and play areas.&nbsp; The residents did not have an environment that supports social or family gatherings.&nbsp; Show of Hands fixed this by installing new facilities and upgrading existing infrastructure.</span></p>\r\n<p><span><img src="/assets/maranatha/16march5.jpg" alt="Repair and replace play equipment" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/maranatha/16march6.jpg" alt="Creation of gardens" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/maranatha/16march7.jpg" alt="Creation of edu-play tree house" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/maranatha/16march8.jpg" alt="Installation of braai lapa" width="587" height="250" /></span></p>\r\n<p><strong><span>Show of Hands Volunteer Action:</span></strong></p>\r\n<ul>\r\n<li><span>Repair and replace play equipment</span></li>\r\n<li><span>Creation of edu-play tree house</span></li>\r\n<li><span>Creation of gardens</span></li>\r\n<li><span>Installation of braai lapa</span></li>\r\n</ul>\r\n<h2><span>Exciting New Volunteerism Opportunities</span></h2>\r\n<p><span>We also launched the all new 2013 Personal Volunteerism programme at the Maranatha event. &nbsp;We say a huge thank you to the employees who have already signed up to volunteer at Maranatha for both their 25 May 2013 Fun Run Fundraiser event, as well as those who have put their names down to do other volunteer work at the Trust during the year.</span></p>\r\n<p><span><img src="/assets/maranatha/16march9.jpg" alt="Personal Volunteerism programme at the Maranatha" width="587" height="250" /></span></p>\r\n<p><strong>Thank you to each and every one of you who volunteered! Many hands make light work!</strong></p>', 0, '0', '2015-09-07 09:13:54'),
(11, 1, 0, 'Volkswagen Think Blue for National Marine Week', '2014-07-14 13:04:50', 'Volkswagen Think Blue for National Marine Week', 'volkswagen, volunteering, south africa, marine life, samrec, national marine week', 'Over 100 Volkswagen volunteers made a positive impact at SAMREC for National Marine Week. ', '<p><img src="/assets/samrec_think_blue/samrecheader.jpg" alt="Volkswagen Think Blue for National Marine Week" width="587" height="175" /></p>\r\n<p><strong>Thank you to all of the volunteers who could Think Blue. Your contribution has made a positive impact at SAMREC!</strong></p>\r\n<p><strong><img src="/assets/samrec_think_blue/samrec1.jpg" alt=" Volunteers who could Think Blue" width="587" height="227" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p><iframe src="//www.youtube.com/embed/1BOc4bkStXg" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p>&nbsp;</p>\r\n<p><span>In a massive show of support for National Marine Week, over 100 Volkswagen volunteers participated in volunteer action at SAMREC (South African Marine Rehabilitation and Education Centre), at Cape Recife in Port Elizabeth.</span></p>\r\n<p><span>In line with National Marine Week (13-17 October), and as part of it&rsquo;s on-going employee volunteerism programme, Volkswagen Group South Africa identified SAMREC as the beneficiary of the programme&rsquo;s environmental focus for 2012.</span></p>\r\n<p><span>SAMREC, a non-profit organisation, was formed in 2000 mainly to care for sick or injured African penguins because of their vulnerability.&nbsp;&nbsp; Their work is vital, particularly as St Croix Island in Nelson Mandela Bay is now the biggest penguin breeding colony in the world, thereby making SAMREC a marine rehabilitation facility of global importance. Based at the Cape Recife Nature Reserve in Nelson Mandela Bay, the facility has also developed an integrated marine conservation education programme aimed at scholars. The SeaSchool programme caters to school groups and</span><span> offers lessons and talks on the environment covering a vast array of topics. The lessons are held on the beach or in SAMREC&rsquo;s exhibition classroom.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec2.jpg" alt="Libby Loop Sensory Trail" width="587" height="227" /></span></p>\r\n<p><span>Based on designs by Libby Sharwood, SAMREC Centre Manager, the Volkswagen volunteers have extended the educational facilities by creating an interactive trail (Libby''s Loop) and open-air classroom for learners.&nbsp; The volunteers also carried out renovations to the penguin general ward at the SAMREC facility.&nbsp; The general ward, where emergency rehabilitation for groups of rescued penguins takes place, had suffered water damage that prevented SAMREC from utilising it for its intended purposes.&nbsp; The renovations to the ward have now ensured that SAMREC is 100% ready to handle large groups of rescue penguins for emergency treatment.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec3.jpg" alt="Renovations to the penguin general ward" width="587" height="227" /></span></p>\r\n<p><span>Approximately 100 of the Volkswagen volunteers completed a 5 kilometer beach clean-up as part of their National Marine Week volunteer action.&nbsp; In addition to the volunteer action, VW of SA also made a R25,000 cash donation towards the SeaSchool programme that focuses on introducing the sea and its creatures to learners from disadvantaged communities who more often than not have never had the opportunity to look at, taste, smell, feel and hear the sea before. They are taught about the dangers of pollution, and the need for conservation.&nbsp; VW of SA also adopted 15 penguins in the SAMREC Rehabilitation Programme.&nbsp; The funds go towards the medical and food supplies that are required to rehabilitate the penguins to a degree where they can be safely released into the ocean again.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec4.jpg" alt="100 of the Volkswagen volunteers" width="587" height="227" /></span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec5.jpg" alt="Thank you from SAMREC" width="587" height="227" /></span></p>\r\n<h1><span>Thank you from SAMREC</span></h1>\r\n<p><span>Dear Ms Maliza</span></p>\r\n<p><span>I really don&rsquo;t know how to thank you enough for all the hard work and the very generous donations made to us by VW.&nbsp;</span><span>We were overwhelmed. The sensory trail in itself was a miracle. We have worked so hard on creating one only to have it destroyed by first fire and then flood. Now we have a beautiful completed trail that we were able to put into use during the visits from the schools this week. I only wish you could have seen their reaction and just how much they benefitted from it.</span><span>Our Centre too looks so smart with all the new paint and plants. Just in time for the season. We are making sure that all our visitors hear of your assistance (and the fantastic beach clean-up!).</span><span>On behalf of all our penguin patients please could you convey our thanks to all those helping hands. We really appreciate your assistance and hope to see you thee again soon.</span></p>\r\n<p><span>Yours sincerely</span></p>\r\n<p><span>Libby Sharwood</span></p>\r\n<h1><span>More about SAMREC and the work we did&nbsp;</span></h1>\r\n<h2><span>About SAMREC</span></h2>\r\n<p><span>In 2000, the South African Marine Rehabilitation and Education Centre (SAMREC), a non-profit organisation, was formed mainly to care for sick or injured African penguins because of their vulnerability.&nbsp;&nbsp; Their work is vital, particularly as St Croix island in Nelson Mandela Bay is now the biggest penguin breeding colony in the world, thereby making SAMREC a marine rescue facility of global importance. SAMREC is based at the Cape Recife Nature Reserve in Nelson Mandela Bay.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec6.jpg" alt="Penguin Release" width="587" height="227" /></span></p>\r\n<h2><span>Why is the African Penguin vulnerable?&nbsp;</span></h2>\r\n<p><span>One of the causes of the decline in numbers of African penguins is that the cold currents in which penguins find their food have been pushed further out to sea. This results in them having to swim almost 60 kms away from their burrows and by the time they get back to feed their babies much of the food has been digested so the chicks are not fed properly and therefore take longer to fledge. This has a domino effect: the parents start moulting before the chicks fledge, once in a moult they cant swim and find food so the chicks suffer even more. When the chicks are left to fend for themselves, they don&rsquo;t know how to catch fish and in their weakened state they cant cope with the elements and so they are washed up on our beaches. When we get them, either from finding them ourselves or the public bringing them in we treat any diseases they may have, give them a vitamin boost, fatten them up and release them. They still have to learn how to catch fish but at least they are now fit, fat and strong and have a fighting chance. It is important to try and save every bird we can as there are only 25&nbsp;000 breeding pairs left in the world and 21&nbsp;000 of those are mostly right here on our doorstep.</span></p>\r\n<p><span>Another concern is that St Croix is in line with the new port of Ngqura which means ships sail right past the breeding colony. While pollution is strictly controlled and monitored in the harbour itself, spillage can occur as ships approach and queue to get into the harbour. There is also a daily incidence of oiling when people clean their boat engines. A penguin only need to get a spot of oil as small as a 5 cent coin on its feathers to render it helpless.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec7.jpg" alt="Penguin Rehab" width="587" height="227" /></span></p>\r\n<h2><span>How does SAMREC help?&nbsp;</span></h2>\r\n<p><span>SAMREC takes in injured and ill penguins, rehabilitates them by means of medical assistance and nutritional support, and releases healthy, stable penguins back into the ocean to join their colony again.</span></p>\r\n<p><span>SAMREC also runs the SeaSchool, an interactive marine conservation education programme aimed at school groups.&nbsp; Through conservation awareness and education, SAMREC is contributing towards empowering a future generation who will &lsquo;Think Blue&rsquo;.</span>&nbsp;</p>\r\n<p><span>As an NGO, SAMREC is limited by funding constraints and as such has structured itself as a volunteer-based organization.&nbsp; Most of the work at SAMREC is done by volunteers who have received specialised training covering all aspects of marine animal rehabilitation. The SAMREC volunteers are equipped to handle daily incidents as well as oil spill disasters or other emergency situations. All the teachers who facilitate the SeaSchool are volunteers too.</span></p>\r\n<p><span>SAMREC desperately needs more volunteers. SAMREC has various volunteer categories, catering to volunteers from 16 years and older. Their volunteers are supervised at all times and receive on-the-job training as well as the relevant learning material.&nbsp; VWSA employees who are interested in joining SAMREC as a volunteer after the Show of Hands event can engage directly with SAMREC to enquire.</span></p>\r\n<h2><span>How did the Show of Hands volunteers help?&nbsp;</span></h2>\r\n<p><strong>Marine Education Trail</strong></p>\r\n<p><span>SAMREC established a Fynbos Trail to be used by school groups when visiting. The trail was destroyed in a fire and was flooded in parts. Vegetation has grown back, but trail needs to be revitalised.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec8.jpg" alt="Fynbos Trail Upgrade" width="587" height="227" /></span></p>\r\n<p><strong>WHAT WE DID TO HELP:</strong></p>\r\n<ul>\r\n<li><span>Planted trees and shrubs along the trail</span></li>\r\n<li><span>Created OpenAir Classroom</span></li>\r\n<li><span>Step supports at bridges</span></li>\r\n<li><span>Created Sensory Trail &amp; installed educational signage boards</span></li>\r\n</ul>\r\n<p><span><img src="/assets/samrec_think_blue/samrec9.jpg" alt="Planted trees and shrubs along the trail" width="587" height="227" /></span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec10.jpg" alt="Created Sensory Trail &amp; installed educational signage boards" width="587" height="227" /></span></p>\r\n<p><strong>Facilities Renovation</strong></p>\r\n<p><span>SAMREC had stopped using the penguin &lsquo;general hospital ward&rsquo; for it&rsquo;s original purposes due to damp on the walls creating a further health hazard to the frail penguins.&nbsp; The seating stand at the penguin viewing area, utilized mainly for marine education and awareness, was in poor repair, as were the wendy houses used to store critical penguin rescue and release equipment.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec11.jpg" alt="Facilities Renovation" width="587" height="227" /></span></p>\r\n<p><strong>WHAT WE DID TO HELP:</strong></p>\r\n<p><strong><span>GENERAL WARD WORK PARTY</span></strong><span>&nbsp;</span></p>\r\n<ul>\r\n<li><span>Repaired damp &amp; repainted walls</span></li>\r\n<li><span>Installed wood trolley railing</span></li>\r\n</ul>\r\n<p><strong><span>WENDY HOUSES WORK PARTY </span></strong><span>&nbsp;</span></p>\r\n<ul>\r\n<li><span>Repaired, Sanded &amp; varnished</span></li>\r\n</ul>\r\n<p><strong><span>VIEWING AREA WORK PARTY</span></strong><span>&nbsp;</span></p>\r\n<ul>\r\n<li><span>Sanded seating stand</span></li>\r\n<li><span>Varnished</span></li>\r\n<li><span>Weeding</span></li>\r\n<li><span>Install new Penguin Lingo sign</span></li>\r\n<li><span>The volunteers also performed high pressure cleaning of the penguin pool and various adjacent areas and equipment.</span></li>\r\n</ul>\r\n<p><span><img src="/assets/samrec_think_blue/samrec12.jpg" alt="Sanded seating stand" width="587" height="227" /></span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec13.jpg" alt="Weeding" width="587" height="227" /></span></p>\r\n<p><strong>Beach Clean Up Work Party</strong></p>\r\n<p><span>Although SAMREC runs regular beach cleanups in this area, weather and tides impact on this stretch of beach and regularly wash ashore refuse from deep sea including bundles of fishing line, plastic bags and broken glass.&nbsp; All of these waste items represent a very real risk to not only the penguins that swim here in search of food to feed their young, but also to the marine birds and fish.</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec14.jpg" alt="Beach Clean-up" width="587" height="227" /></span></p>\r\n<p><span>WHAT WE DID TO HELP:</span></p>\r\n<p><span>The volunteers cleaned a 5km strip of beach, filling and removing over 100 bags of refuse!</span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec15.jpg" alt="Volunteers cleaned a 5km strip of beach" width="587" height="227" /></span></p>\r\n<p><span><img src="/assets/samrec_think_blue/samrec16.jpg" alt=" Filling and removing over 100 bags of refuse" width="587" height="227" /><br /></span></p>', 0, '0', '2015-09-07 09:13:54'),
(12, 1, 0, 'Volunteers from Volkswagen SA Help Improve Limekhaya High School', '2014-07-15 08:24:39', 'Volunteers from Volkswagen SA Help Improve Limekhaya High School', 'volkswagen, south africa, volunteering, limekhaya high school, nelson mandela, nelson mandela day', 'Volkswagen Group SA volunteers committed 5 hours to volunteer action at Limekhaya High School in Uitenhage for Nelson Mandela Day. ', '<p><img src="/assets/limekhaya_high_school/limekhayaheader.jpg" alt=" Limekhaya High School in Uitenhage for Nelson Mandela Day. " width="587" height="175" /></p>\r\n<p><iframe src="//www.youtube.com/embed/VbOuv2t-kK4" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p><span>Celebrated on 18 July every year, the over-arching objective of International Mandela Day is to inspire individuals to take action and help change the world for the better. &nbsp;Ultimately it seeks to empower communities everywhere to "Take action, inspire change, and make everyday a Mandela Day."</span></p>\r\n<p><span>This year, Volkswagen Group South Africa (VWSA) volunteers joined in the global Mandela Day action by committing five hours of their weekend to volunteer action at the Limekhaya High School in Langa, Uitenhage. &nbsp;Our volunteer action kicked off with a warm welcome by school learners who choreographed a welcoming committee for volunteer arrival and our 70 volunteers made a valiant effort of singing "Happy Birthday" to Madiba!</span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july1.jpg" alt=" Volkswagen Group South Africa (VWSA) volunteers" width="587" height="175" /></span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july2.jpg" alt="70 volunteers made a valiant effort of singing &quot;Happy Birthday&quot; to Madiba!" width="587" height="175" /></span></p>\r\n<p><span>&ldquo;After more than a year of working closely with this school through the Volkswagen Community Trust, we have been able to assess the school''s capacity and needs in terms of maths, science and computer learning,&rdquo; said Nonkqubela Maliza, Director of Corporate and Government Affairs at Volkswagen Group South Africa.</span></p>\r\n<p><span>The research resulted in a VWSA and Volkswagen Community Trust joint funding solution to upgrade the school&rsquo;s science laboratory facilities and equipment, as well as the creation of a multi-purpose resource centre.</span>&nbsp;</p>\r\n<p><span>Under the leadership of school principal Mr Faltein, the 750 learners benefit from an incredibly passionate and dedicated staff compliment who are committed to increasing the standards of science and computer skills amongst the high school learners, a factor that contributed positively to VWSA&rsquo;s review of the sustainability of the investment.&nbsp; Through an initial donation made by the Volkswagen Community Trust, the school has already made significant steps towards development of their Science Laboratory and Computer Hub.</span></p>\r\n<p><span>The funds thus far have enabled the school to not only resource the computer hub with 40 computers, but they have also started the process of preparing the Science Laboratory in order to house a chemical room and state-of-the-art TRAC Lab science stations.</span></p>\r\n<p><span>The Mandela Day Volkswagen volunteers decided to help Limekhaya High School take things to the next level by donating their time and resources towards the creation of the school and community resource centre.&nbsp; The centre aims to enable broader access to diversified learning resources by providing access to multi-media platforms.</span></p>\r\n<p><span>In five hours, 70 volunteers achieved the task of renovation and outfitting a 240m&sup2; centre with study stations, computer hub, library infrastructure, adult reading corner, children&rsquo;s edu-play area, as well as a 40pax theatre for audio visual content and films.</span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july3.jpg" alt="Creation of the school and community resource centre" width="587" height="175" /></span></p>\r\n<p><span>And after five hours of hard graft - the amazing ''AFTER'' results...</span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/231july4.jpg" alt="Resource Hub" width="587" height="175" /></span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july5.jpg" alt="Uplifting the learning environment " width="587" height="175" /></span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july6.jpg" alt="" width="587" height="175" /></span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july7.jpg" alt="Knowledge Hub" width="587" height="175" /></span></p>\r\n<p><span>The volunteers also put their hands to further uplifting the learning environment by beautifying the courtyards and surrounding gardens.</span></p>\r\n<p><span><strong>BEFORE</strong> - the courtyards were dull, a bit dirty and lifeless.</span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july8.jpg" alt="Uplifting the learning environment" width="587" height="175" /></span></p>\r\n<p><span><strong>AFTER</strong> the garden party was done - a lively green environment to uplift the area!</span></p>\r\n<p><span><img src="/assets/limekhaya_high_school/21july9.jpg" alt="Lively green environment to uplift the area" width="587" height="175" /><br /></span></p>', 0, '0', '2015-09-07 09:13:54'),
(13, 1, 0, 'Show of Hands Extreme Makeover at SOS Children''s Village ', '2014-07-14 12:43:50', 'Show of Hands Extreme Makeover at SOS Children''s Village ', 'show of hands, volunteer work, south africa, childrens homes, makeover, volunteering in south africa', 'At Show of Hands'' very own extreme makeover, 95 Volkswagen employees volunteered at SOS Children''s Village to make it a better place.  ', '<p><img src="/assets/sos_children_village/sosheader.gif" alt="Volunteering at SOS Children''s Village" width="587" height="175" /></p>\r\n<p><iframe src="//www.youtube.com/embed/LRtKMv26kEk" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p><img src="/assets/sos_children_village/sos1.jpg" alt=" SOS Children''s Village Unit 10 home" width="587" height="320" /></p>\r\n<p><span>95 Volkswagen employees turned out on Saturday 26th May to volunteer at the Great Show of Hands extreme makeover of the SOS Children''s Village Unit 10 home. A very tight schedule had volunteers racing the clock for a 12h30 ''tools down'' in order for the finishing team to decorate the renovated home. Volunteer work parties spent a grueling 3 hours painting walls, sanding and varnishing furniture, creating indigenous gardens, hand making quilts, repairing play structures, creating mosaics and doing all manner of DIY. Whilst the house work parties were renovating, another team of volunteers kept 120 SOS children entertained for no less than 4 hours with sack races, dancing competitions and a fabulous entertainment programme. The end result was breathtaking and very moving.</span></p>\r\n<p><span> At 2pm, the Show of Hands volunteers ''unveiled'' the makeover to the expectant children and their house ''mom''. The children were speechless and the tears were rolling. Seeing the impact that the new home had on the children, there wasn''t one volunteer with dry eyes! To all the volunteers who turned out for the Show of Hands - an enormous thank you! These children have now been given an environment in which they will feel like winners every morning that they open their eyes to their family home.</span></p>\r\n<p><span><img src="/assets/sos_children_village/sos2.jpg" alt="95 Volkswagen employees" width="587" height="250" /></span></p>\r\n<h2><span>Background</span></h2>\r\n<p><span>For 30 years, SOS Children&rsquo;s Villages has been making an impact on the lives of so many people, more especially children in South Africa. 1982 marked the founding of the national association "SOS Children''s Village Association of South Africa". Since then, SOS Children&rsquo;s Villages has been serving the greater good in South Africa, starting with our greatest hope, the children.</span></p>\r\n<p><span>The SOS Children''s Village''s South Africa is a private, charitable, social development organisation. It is politically and denominationally independent, and is an affiliated member of SOS-Kinderdorf International.</span></p>\r\n<p><span>We take action for orphaned and abandoned children by building and strengthening families for them to live in and grow with love, security and respect.</span></p>\r\n<p><span>SOS Children''s Villages build families for orphaned and abandoned children. Eight to ten children are cared for in small family-type homes, the SOS families, and are raised like brothers and sisters.</span></p>\r\n<h2><span>Port Elizabeth Village&nbsp;</span></h2>\r\n<p><span>Established in 1990, this Village is situated in South Africa''s "windy city" of Port Elizabeth in the Eastern Cape province. Home to 118 children, this Village recently celebrated its 19th anniversary.</span></p>\r\n<p><span>Port Elizabeth Village has rented a house outside the Village for its youth girls, to spread their wings and prepare for an independent life. The Village also has a multi-purpose hall which is used for the many extramural activities that the children are involved in. In 2005, the Village celebrated its 14th anniversary in style, with the children and youth showing off their ballroom dancing talents.</span></p>\r\n<p><span>Situated in the suburb of Schauderville, the Village has 14 family homes, two youth houses and an SOS Kindergarten. An active Family Strengthening Programme also ensures that the needs of HIV &amp; AIDS affected families in the community are met.</span></p>\r\n<p><span>VW &amp; Audi are long-standing sponsors of one of the homes. &nbsp;The annual funding donated to ''House VW / Audi'' is managed by the house ''mom'' for monthly household costs such as groceries and cleaning supplies. &nbsp;Although the house mom and children are exceptionally proud of their home and keep it clean and tidy - there is only so much one can do when the furnishings and interior of the home start showing signs of age and wear and tear. &nbsp;As tidy as the house is, floors and walls need maintenance and renovation, the kitchen, storage and bedroom carpentry is desperately in need of replacement or repair, and bathroom and kitchen fixtures and fittings are old.</span></p>\r\n<p><span>Perhaps the biggest impression one gets though, is that for a family home, the space feels a little sparse and lacking in warmth and light. &nbsp;The children''s bedrooms are a little empty and cold with hard vinyl flooring, whilst the living and homework areas don''t provide sufficient work and recreational space.</span></p>\r\n<p><span>Our Show of Hands volunteers will came to the rescue on 26 May with the mission to perform a home makeover of House VW to create a modern, well appointed and homely environment for the youth who are raised here as a family! &nbsp;</span></p>\r\n<p><strong><span>WHAT WE DID</span></strong></p>\r\n<p><strong><span>GIRLS &amp; BOYS BEDROOMS</span></strong></p>\r\n<ul>\r\n<li><span>Paint walls&nbsp;</span></li>\r\n<li><span>Install fitted carpets</span></li>\r\n<li><span>Install new blinds / curtains&nbsp;</span></li>\r\n<li><span>Supply &amp; fit new bed linens&nbsp;</span></li>\r\n<li><span>Supply &amp; fit wall posters / pictures / d&eacute;cor &amp; dressing&nbsp;</span></li>\r\n<li><span>Rearrange beds / cupboards ergonomically&nbsp;</span></li>\r\n<li><span>Install shelving unit for books / personal effects&nbsp;</span></li>\r\n<li><span>New bedroom door</span></li>\r\n</ul>\r\n<p><span><img src="/assets/sos_children_village/sos3.jpg" alt="Boys Bedrooms" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos4.jpg" alt="Girls Bedrooms" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos5.jpg" alt="Rearrange beds / cupboards ergonomically " width="587" height="250" /></span></p>\r\n<p><strong><span>GIRLS &amp; BOYS BATHROOMS</span></strong></p>\r\n<ul>\r\n<li><span>Deep clean tiling (floor &amp; walls)</span></li>\r\n<li><span>New bathroom door&nbsp;</span></li>\r\n<li><span>Replace rusted shower rail&nbsp;</span></li>\r\n<li><span>Replace damaged taps &amp; fittings&nbsp;</span></li>\r\n<li><span>Create built-in cupboard around sink&nbsp;</span></li>\r\n<li><span>Replace / upgrade mirror area&nbsp;</span></li>\r\n<li><span>Replace blinds / shower curtain&nbsp;</span></li>\r\n<li><span>New towels &amp; toiletries&nbsp;</span></li>\r\n<li><span>Install floor strips btwn carpets &amp; tiles</span></li>\r\n</ul>\r\n<p><span><img src="/assets/sos_children_village/sos6.jpg" alt="Girls and Boys Bathrooms" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos7.jpg" alt="New towels &amp; toiletries " width="587" height="250" /></span></p>\r\n<p><strong><span>LIVING ROOM</span></strong></p>\r\n<ul>\r\n<li><span>Repaint walls&nbsp;</span></li>\r\n<li><span>New wall unit wall to wall</span></li>\r\n<li><span>Carpet</span></li>\r\n<li><span>New blinds / curtains / decor</span></li>\r\n<li><span>Install flat screen tv &amp; DVD player /and DVD&rsquo;s</span></li>\r\n</ul>\r\n<p><span><img src="/assets/sos_children_village/sos8.jpg" alt="A makeover for the Living Room" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos9.jpg" alt="Install flat screen tv &amp; DVD player /and DVD&rsquo;s" width="587" height="250" /></span></p>\r\n<p><strong><span>DINING &amp; HOMEWORK AREA</span></strong></p>\r\n<ul>\r\n<li><span>Repaint walls</span></li>\r\n<li><span>Carpet</span></li>\r\n<li><span>Replace curtains / blinds</span></li>\r\n<li><span>Sand &amp; varnish pine table &amp; chairs</span></li>\r\n<li><span>Install work counter, stools &amp; pin boards for homework area</span></li>\r\n<li><span>Wall mounts/ pictures / decor&nbsp;</span></li>\r\n</ul>\r\n<p><span><img src="/assets/sos_children_village/sos10.jpg" alt="Makeover for the Dining area" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos11.jpg" alt="Makeover for the Homework area" width="587" height="250" /></span></p>\r\n<p><strong><span>KITCHEN</span></strong></p>\r\n<ul>\r\n<li><span>Deep clean wall tiles&nbsp;</span></li>\r\n<li><span>Fit decorative tile borders / mosaic</span></li>\r\n<li><span>Replace all counter tops and cupboard doors</span></li>\r\n<li><span>Repair damaged cupboard structures</span></li>\r\n<li><span>New blinds</span></li>\r\n<li><span>New kitchen crockery / cutlery / utensils, etc</span></li>\r\n</ul>\r\n<p><span><img src="/assets/sos_children_village/sos12.jpg" alt="Replace all counter tops and cupboard doors in the kitchen" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos13.jpg" alt="New kitchen crockery / cutlery / utensils, etc" width="587" height="250" /></span></p>\r\n<p><strong><span>OUTDOOR</span></strong></p>\r\n<ul>\r\n<li><span>Create low maintenance, water wise indigenous beds</span></li>\r\n<li><span>Beautification &amp; Greening</span></li>\r\n<li><span>Renovate play structures and ecreational area for children</span></li>\r\n</ul>\r\n<p><span><img src="/assets/sos_children_village/sos14.jpg" alt="Makeover for the outside area" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos15.jpg" alt="Create low maintenance, water wise indigenous beds" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/sos_children_village/sos16.jpg" alt="Renovate play structures and ecreational area for children" width="587" height="250" /></span></p>\r\n<p><strong><span>QUILTING PARTY</span></strong></p>\r\n<p><span>A team of volunteers also cut and stitched several hundred fabric squares to create 15 hand made quilts to gift to each of the SOS house mothers! The end result was beautiful and the quilts are being presented to the mothers on Friday 1 June.</span></p>\r\n<p><span><img src="/assets/sos_children_village/sos17.jpg" alt="Create 15 hand made quilts" width="587" height="250" /></span></p>\r\n<p><strong><span>SOS CHILDREN''S FUN DAY</span></strong></p>\r\n<p>While the work parties were renovating, our team of 15 Volkswagen volunteers kept the 120 SOS Children well entertained with a jam-packed programme of sack races, dancing and art competitions and a tonne of laughs and good times!</p>\r\n<p><img src="/assets/sos_children_village/sos18.jpg" alt="SOS CHILDREN''S FUN DAY" width="587" height="250" /></p>\r\n<p><img src="/assets/sos_children_village/sos19.jpg" alt="120 SOS Children well entertained" width="587" height="250" /></p>', 0, '0', '2015-09-07 09:13:54');
INSERT INTO `cmspage` (`pageid`, `siteid`, `adminmode`, `heading`, `uploaddate`, `metatitle`, `metakeywords`, `metadescription`, `filecontent`, `static`, `headerid`, `lastmodified`) VALUES
(14, 1, 0, 'Siyaphambili Pre-school Gets an Extreme Makeover', '2014-07-14 12:54:50', 'Siyaphambili Pre-school Gets an Extreme Makeover', 'port elizabeth, south africa volunteer, extreme makeover, pre-school', 'Almost 80 volunteers helped out to give Uitenhage''s Siyaphambili pre-school an extreme makeover. ', '<p><img src="/assets/siyaphambili/24marchheader.gif" alt="Siyaphambili Pre-school" width="587" height="175" /></p>\r\n<p><iframe src="//www.youtube.com/embed/jVbIOmgL2TQ" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p><img src="/assets/siyaphambili/24march1.jpg" alt="Happy children from Siyaphambili Pre Primary" width="587" height="250" /></p>\r\n<h2>FAST FACTS&nbsp;</h2>\r\n<p><span>Project:&nbsp; Siyaphambili Pre Primary School, Tamboville, Uitenhage&nbsp;</span></p>\r\n<p><span>Age Group:&nbsp; 2 &ndash; 6 yrs&nbsp;</span></p>\r\n<p><span>No. of Children:&nbsp; 53&nbsp;</span></p>\r\n<p><span>No. of Staff:&nbsp; 4</span></p>\r\n<p><span>No. of VW Volunteers: &nbsp;73</span></p>\r\n<p><span>Hours worked: &nbsp;4 hours</span></p>\r\n<p><span><img src="/assets/siyaphambili/24march2.jpg" alt="Education for children" width="587" height="250" /></span></p>\r\n<h2><span>About Siyaphambili Pre-primary School</span></h2>\r\n<p><span>The Pre School is operated out of container system sponsored by Volkswagen Community Trust approximately 11 years ago.</span></p>\r\n<p><span>The school is independent and the principal asks only R80 per month school fees.</span></p>\r\n<p><span>Even so, many of the families are not able to pay the full monthly fee, if at all.</span></p>\r\n<p><span>With an absolute maximum income of R4,240 per month, the school must pay 4 staff, as well as supply educational resources and basic nutrition to the 53 children.</span></p>\r\n<p><span>This is already an unrealistic budget, leaving no room for much needed maintenance, repair and improvements that are necessary to a well balanced Early Childhood Development Centre.</span></p>\r\n<p><span>The shoestring budget also means that earl in every month, the school has no more funds for electricity purchases, and they have had to abandon their food garden project as they are not able to afford municipal water bills.</span></p>\r\n<p><span>The staff are incredibly dedicated and show great commitment and creativity in making the most of the poor resources currently available to them.</span></p>\r\n<p><span>The renovation and maintenance work that Show of Hands will implement at Siyaphambili Pre Primary will make a great difference towards improving the educational, recreational, health and safety environment for the children.</span></p>\r\n<h2><span>Thank you to all of our volunteers!</span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march3.jpg" alt="VW volunteers" width="587" height="250" /></span></p>\r\n<p><span>Nearly 80 volunteers arrived in the rain on Saturday 24th to forge ahead with the Siyaphambili extreme makeover!</span></p>\r\n<p><span>An ENORMOUS thank you and congratulations to all for trooping on through the bad weather to achieve the renovations!</span></p>\r\n<h1><span>Challenges overcome at Siyaphambili</span></h1>\r\n<h2><span>Container</span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march4.jpg" alt="Challenges overcome at Siyaphambili" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march5.jpg" alt="Container" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march7.jpg" alt="Undercoat and painted inside and out" width="587" height="250" /></span></p>\r\n<p><strong>BEFORE:&nbsp;</strong></p>\r\n<ul>\r\n<li><span>Roof leaking rainwater inside&nbsp;</span></li>\r\n<li><span>Rusted joints &amp; seams letting in damp / damaging flooring&nbsp;</span></li>\r\n<li><span>Exterior Walls / Finish is in poor repair&nbsp;</span></li>\r\n<li><span>Interior Walls:&nbsp; metal surface need repainting</span></li>\r\n</ul>\r\n<p><strong>WHAT WE DID:</strong></p>\r\n<ul>\r\n<li><span>Repaired rust and leaks</span></li>\r\n<li><span>Repaired broken doors and hinges</span></li>\r\n<li><span>Undercoat and painted inside and out</span></li>\r\n</ul>\r\n<h2><span>Flooring&nbsp;</span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march8.jpg" alt="Removed tiles and rotten carpets" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march9.jpg" alt="Fitted plush new carpet for play and sleep area" width="587" height="250" /></span></p>\r\n<p><strong>BEFORE:</strong></p>\r\n<ul>\r\n<li><span>Repaired rust and leaks</span></li>\r\n<li><span>Repaired broken doors and hinges</span></li>\r\n<li><span>Undercoat and painted inside and out</span></li>\r\n</ul>\r\n<p><strong>WHAT WE DID:</strong></p>\r\n<ul>\r\n<li><span>Removed tiles and rotten carpets</span></li>\r\n<li><span>Treated floors with pesticides</span></li>\r\n<li><span>Repaired rotten floor joists and concreted seriously damaged areas</span></li>\r\n<li><span>Laid new industrial strength flooring throughout</span></li>\r\n<li><span>Fitted plush new carpet for play and sleep area</span></li>\r\n</ul>\r\n<h2><span>Kitchen&nbsp;<br /><br /></span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march10.jpg" alt="Fitted new kitchen cupboards and work surface" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march11.jpg" alt="Provided new crockery for children''s meals" width="587" height="250" /></span></p>\r\n<p><strong>BEFORE:</strong></p>\r\n<ul>\r\n<li><span>No hot water&nbsp;</span></li>\r\n<li><span>No storage / minimal kitchen supplies&nbsp;</span></li>\r\n<li><span>No food preparation area&nbsp;</span></li>\r\n<li><span>Faulty cooker and no urn makes it difficult to prep food for 53 children&nbsp;</span></li>\r\n</ul>\r\n<p><strong>WHAT WE DID:</strong></p>\r\n<ul>\r\n<li><span>Fitted new kitchen cupboards and work surface</span></li>\r\n<li><span>Installed economical 20 litre urn</span></li>\r\n<li><span>Provided new crockery for children''s meals</span></li>\r\n</ul>\r\n<h2><span>Toilets&nbsp;</span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march12.jpg" alt="Repaired all cisterns and replaced all seats" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march13.jpg" alt="Provided new potties and installed towel racks and towels" width="587" height="250" /></span></p>\r\n<p><span><strong>BEFORE:&nbsp;</strong><br /></span></p>\r\n<ul>\r\n<li><span>3 out of 5 toilet units not in proper working order&nbsp;</span></li>\r\n<li><span>All units have no and / or broken seats or cisterns&nbsp;</span></li>\r\n<li><span>Flooring damaged &ndash; hygiene problems</span></li>\r\n</ul>\r\n<p><strong>WHAT WE DID:</strong></p>\r\n<ul>\r\n<li><span>Repaired all cisterns and replaced all seats</span></li>\r\n<li><span>Repaired plumbing</span></li>\r\n<li><span>Provided new potties and installed towel racks and towels</span></li>\r\n</ul>\r\n<h2><span>Sickbay</span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march14.jpg" alt="Repaired and replaced cornices and ceiling boards" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march15.jpg" alt="Provided storage units to keep sick bay clear, safe and clean" width="587" height="250" /></span></p>\r\n<p><strong>BEFORE:&nbsp;</strong></p>\r\n<ul>\r\n<li><span>Damp &amp; mildew in ceiling above sick bay bed &ndash; health issue&nbsp;</span></li>\r\n<li><span>Ceiling &amp; cornice collapsing&nbsp;</span></li>\r\n<li><span>Not a suitable environment as it has become a storage stock-pile due to there being no storage alternatives in the school</span></li>\r\n</ul>\r\n<p><strong>WHAT WE DID:</strong></p>\r\n<ul>\r\n<li><span>Repaired and replaced cornices and ceiling boards</span></li>\r\n<li><span>Installed new bedding / lines / curtains</span></li>\r\n<li><span>Provided storage units to keep sick bay clear, safe and clean</span></li>\r\n</ul>\r\n<h2><span>Storage and Resources&nbsp;</span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march16.jpg" alt="Installed storage units in kitchen area" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march17.jpg" alt="Installed book and resource shelves in classrooms" width="587" height="250" /></span></p>\r\n<p><strong>BEFORE:&nbsp;</strong></p>\r\n<ul>\r\n<li><span>Insufficient sleeping matts and in very poor condition / unhygienic&nbsp;</span></li>\r\n<li><span>No storage options in metal container make it impossible for teachers to organise educational resources, food prep resources, children&rsquo;s work, medical supplies, etc&nbsp;</span></li>\r\n<li><span>Very little stimulating education resources&nbsp;</span></li>\r\n</ul>\r\n<p><strong>WHAT WE DID:&nbsp;</strong></p>\r\n<ul>\r\n<li><span>Installed storage / seating boxes in main play area for toys and resources</span></li>\r\n<li><span>Installed book and resource shelves in classrooms</span></li>\r\n<li><span>Installed storage units in kitchen area</span></li>\r\n</ul>\r\n<h2><span>Outdoor edu-play and gardens&nbsp;</span></h2>\r\n<p><span><img src="/assets/siyaphambili/24march18.jpg" alt="Outdoor edu-play and gardens " width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march19.jpg" alt="Created a edu-play road safety area for kids" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march20.jpg" alt="Erradicated weeds and mowed lawns" width="587" height="250" /></span></p>\r\n<p><strong>BEFORE:</strong></p>\r\n<ul>\r\n<li><span>1 out of 4 existing play structures is safe / usable&nbsp;</span></li>\r\n<li><span>Balance of structures are a safety hazard&nbsp;</span></li>\r\n<li><span>A thorny weed has overrun the grounds making it unsafe for the children to play on the lawn areas (the thorns are approx knee to thigh height for the children, they scratch, sting and cause an itchy rash)&nbsp;</span></li>\r\n<li><span>School does not have a lawn mower and limited funding means that they cannot employ a garden service to keep the vast grounds in acceptable condition for play area&nbsp;</span></li>\r\n<li><span>Despite a full compliment of gardening tools and equipment, an attempted food garden to supplement the children&rsquo;s diet has been unsuccessful due to water shortages&nbsp;</span></li>\r\n<li><span>An attempted edu-play driving area has been left unfinished due to lack of resources&nbsp;</span></li>\r\n<li><span>The grounds are extensive and include mature, strategically positioned trees as well as the beginnings of what could be a truly stimulating outdoor edu-play area&nbsp;</span></li>\r\n<li><span>Aside from a few trees, there is no real shaded play / lesson area outdoors</span></li>\r\n</ul>\r\n<p><strong>WHAT WE DID:</strong></p>\r\n<ul>\r\n<li><span>Erradicated weeds and mowed lawns</span></li>\r\n<li><span>Filled in surface holes and ditches and laid new lawn to exposed area</span></li>\r\n<li><span>Brought in soil and compost to create veggie garden area</span></li>\r\n<li><span>Planted over 200 vegetable seedlings</span></li>\r\n<li><span>Installed water tank, pump and hose system for irrigating garden and lawns</span></li>\r\n<li><span>Supplied lawn mower for long term maintenance</span></li>\r\n<li><span>Installed new play structure network including swings, jungle gyms and soccer pitch / goal posts</span></li>\r\n<li><span>Created a edu-play road safety area for kids to learn pedestrian and road safety on foot and bikes (including a bridged play structure, road signage and new bikes)</span></li>\r\n</ul>\r\n<p><span><img src="/assets/siyaphambili/24march21.jpg" alt="Happy volunteers" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march22.jpg" alt="Planted over 200 vegetable seedlings" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/siyaphambili/24march23.jpg" alt="Supplied lawn mower for long term maintenance" width="587" height="250" /><br /></span></p>', 0, '0', '2015-09-07 09:13:54'),
(15, 1, 0, 'Volkswagen Volunteers for World Environment Day', '2014-07-14 13:12:10', 'Volkswagen Volunteers for World Environment Day', 'volkswagen, south africa, volunteer, eco-friendly, world environment day, show of hands ', 'The Great Show of Hands Volunteer Programme volunteered to remove unwanted alien species from an important water system in Port Elizabeth. ', '<p><img src="/assets/lake_farm_centre/lakeheader.jpg" alt="World Environment Day" width="587" height="250" /></p>\r\n<p><img src="/assets/lake_farm_centre/lake1.jpg" alt="Show of hands volunteers" width="587" height="250" /></p>\r\n<p>September and October marks a number of important national and international environmental events.&nbsp; This is the time of year when people across the globe are focusing on positive action for saving our planet&rsquo;s resources.</p>\r\n<p>The Volkswagen Great Show of Hands Volunteer Programme joined in this year with a plan to remove unwanted alien species from an important water system in Port Elizabeth.</p>\r\n<p><iframe src="//www.youtube.com/embed/QiDyj1iBTCI" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<p><img src="/assets/lake_farm_centre/lake2.jpg" alt="Lake Farm Centre" width="587" height="148" /></p>\r\n<p><span>Lake Farm Centre is a Section 21 NGO focused on providing full-time care to some 91 adult residents who are intellectually disabled.</span></p>\r\n<p><span>They have also adopted 19 &lsquo;adult orphans&rsquo; who either have no family, or who come from economically disadvantaged families.</span></p>\r\n<p><span>Although part subsidised by government, the Centre relies mainly on private donations to maintain running costs and provide care for their residents.</span></p>\r\n<p><span><img src="/assets/lake_farm_centre/lake3.jpg" alt="Lake Farm Centre Volunteers" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/lake_farm_centre/lake4.jpg" alt="Port Jackson Willow" width="587" height="250" /></span></p>\r\n<p><span>On the Lake Farm Centre property, there is a very important section of river feeding the largest lake in Port Elizabeth.&nbsp; This river is being choked by an invasion alien species (like Port Jackson Willow).</span></p>\r\n<p>The property falls within the footprint of endangered indigenous forest within a declared Nature Reserve, thereby making the Invasive Alien Species problem even more critical.</p>\r\n<p>Because the NGO&rsquo;s property falls within the footprint of a nature reserve, they have a legal obligation to remove the alien species from their land.</p>\r\n<p><span>According to the legislation, they currently run the risk of a government contracted agency being appointed to do the work they have not been able to do &ndash; and the NGO will be billed for the work done!</span></p>\r\n<p><span>They simply do not have the manpower or financial resource to meet their legal obligations or to address the problem with any real impact.</span></p>\r\n<p><span>The Volkswagen Show of Hands volunteers came to the rescue on 1</span><sup><span>st</span></sup><span> October!</span></p>\r\n<p><img src="/assets/lake_farm_centre/lake5.jpg" alt="The Volkswagen Show of Hands volunteers came to the rescue" width="587" height="250" /></p>\r\n<p><span>After a briefing by environmental experts Belinda Clark and Mike Cohen of CEN Environmental the volunteers set to work with axes, machetes, bow saws and chain saws.</span></p>\r\n<p>Over the course of 5 hours, the volunteers cleared all the alien vegetation from the identified problem area.&nbsp; With the removal of so much alien vegetation, the area risked exposure to ersosion, so the volunteers continued their work by planting 450 indigenous plants and trees to rehabilitate the river bank.</p>\r\n<h2>Impact and sustainability</h2>\r\n<ul>\r\n<li><span>Thanks to the volunteer action initiated by Volkswagen, stakeholders have decided to launch an ongoing &ldquo;Friends of Lakeside Volunteer Group&rdquo;</span></li>\r\n<li><span>Lake Farm Centre, Royalston, CEN Environmental and EcoMile are joining forces to initiate a monthly volunteer group for the Lakeside / Seaview area community that will focus on ongoing alien species removal in the catchment area of the lake</span></li>\r\n<li><span>Alien species wood chippings generated at the Show of Hands volunteer day will be recycled for sustainable worm farms</span></li>\r\n<li><span>Tools purchased for the day&rsquo;s activities have been donated to the &ldquo;Friends of Lakeside Volunteer Group&rdquo; to maintain and sustain further control and additional impact on IAS removal in the area</span></li>\r\n</ul>\r\n<p>We say &ldquo;Thank You!&rdquo; to the volunteers who gave their time during 2011 to make some incredible Show of Hands extreme makeovers happen!</p>\r\n<h2>Background</h2>\r\n<p><strong>What are invasive alien species?&nbsp;</strong></p>\r\n<p><span>Invasive Alien Species (IAS), are trees and plants that are not indigenous to our country, or region, and that represent a serious threat to the balance of an eco system.&nbsp; These species are called invaders because they take over an area, essentially choking the natural vegetation and in the long run, wiping it out completely.&nbsp; The impact is devastating.</span></p>\r\n<p><span><img src="/assets/lake_farm_centre/lake6.jpg" alt="Invasive Alien Species" width="587" height="250" /></span></p>\r\n<p><strong>Why do we need to get rid of these "invaders"?</strong></p>\r\n<p><span>With the dwindling natural vegetation, animals, birds and insects loose their food source and they too disappear from the area.&nbsp; When alien species invade a water system, the impact is felt even more. Invasive species that overcrowd a water system can result in the block of a river&rsquo;s flow, which in turn increases the risks of flooding. The loss of the natural &lsquo;working plants&rsquo; also affects the quality of the water &ndash; a further negative impact on all life forms relying on that water source.</span></p>\r\n<h2><span>Support from stakeholders&nbsp;</span></h2>\r\n<p><span>The project was made possible through the valuable support of local stakeholders.</span></p>\r\n<p><span><img src="/assets/lake_farm_centre/lake7.bmp" alt="CEN Environmental is a South African based consultant" width="444" height="393" /></span></p>\r\n<p><strong>CEN Environmental</strong></p>\r\n<p><span>CEN Environmental is a South African based </span><span>consultant in rural development and resource management programmes.</span></p>\r\n<p><span>They aim to contribute to the socio-economic advancement and the sound management of the natural resource base of Southern Africa, but in particular, the Eastern Cape Province.</span></p>\r\n<p><span>The team from CEN is supporting the Volkswagen Great Show of Hands action by identifying the area we will be clearing, planning the alien species removal programme and methods, overseeing the volunteer action and post event sustainability of the work the volunteers will have done.</span></p>\r\n<p><strong>Royalston</strong></p>\r\n<p><span>Lake Farm Centre borders Royalston &ndash; an 800ha game farm development.&nbsp; The team from Royalston are dedicated to the protection of the area&rsquo;s biodiversity and have volunteered to assist Show of Hands and Lake Farm Centre on the project by providing the transport logistics for removing the cut alien species from the site after the event.</span></p>\r\n<p><strong>Working for Water programme&nbsp;</strong></p>\r\n<p><span>Working for Water is sponsoring herbicides which Lake Farm Centre staff will apply to specific trees after the volunteer day.</span></p>', 0, '0', '2015-09-07 09:13:54'),
(16, 1, 0, 'Volkswagen Employees Transform Children''s Ward at Orsmond TB Hospital', '2014-07-14 12:58:52', 'Volkswagen Employees Transform Children''s Ward at Orsmond TB Hospital', 'volkswagen, volunteers, tb hospital, south africa, hospital makeover, uitenhage, children''s ward', '121 volunteers from Volkswagen helped to transform the children''s ward at Orsmond TB Hospital in Uitenhage. ', '<p><img src="/assets/orsmond_tb_hospital/orsmond1.jpg" alt=" Orsmond TB Hospital" width="587" height="250" /></p><p><iframe src="//www.youtube.com/embed/c4SxLbGr2Nk" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p><h2>Thank you Volkswagen for transforming the Orsmond TB Hospital Children''s Ward!&nbsp;</h2><ul><li><span>121 Volunteers &ndash; 5 hours of work</span></li><li><span>200m2 lawn</span></li><li><span>300m new flooring</span></li><li><span>500m2 wall repairs &amp; paint</span></li><li><span>Over 690 individual items of furniture, carpentry, linens and educational resources</span></li></ul><p><span>The TB Hospital in Uitenhage was originally established in the 1950''s and over the past few decades has seen management shift from private donors, to SANTA and presently to government administration.</span></p><p><span>The Children''s Ward caters to approximately 100 children diagnosed with TB over the course of a year. The children are aged between 3 months to 13 years old.</span></p><p><span>Due to the nature of TB treatment, the children have to reside permanently at the children''s ward for period ranging from 3 months to 18 months. The hospital therefore becomes their home away from home for a period.</span></p><p><span>Unfortunately, the children''s ward at Orsmond TB Hospital last saw any form of significant renovations and repairs done in the 1990''s. The current state of the facility is in serious disrepair. There is also a significant lack of educational and recreational equipment or resources in the ward for the children.</span></p><p><span>Show of Hands throughly rescued the situation on the 16th of July!</span></p><h2><span>What work did we do?&nbsp;</span></h2><p><span>After several weeks of consultation with the hospital management staff, we shortlisted the volunteer work most critical to the needs. Our volunteer action on 16 July included:</span></p><ul><li><span>Painting the children''s ward, recreational lounge and isolation ward</span></li><li><span>Hanging and fitting new curtains and bedding</span></li><li><span>Installing storage shelves, book shelves and work surfaces</span></li><li><span>Supplying and installing play and educational resources</span></li><li><span>Transforming the outdoor courtyard into an interactive playground for the children.</span></li></ul><h2><span>Playground&nbsp;</span></h2><p><span><img src="/assets/orsmond_tb_hospital/orsmond2.gif" alt="Transforming the outdoor courtyard into an interactive playground for the children" width="587" height="250" /></span></p><p><span><img src="/assets/orsmond_tb_hospital/orsmond3.gif" alt="Painting the children''s ward" width="587" height="250" /></span></p><ul><li><span>200m2 lawn</span></li><li><span>Jungle Gyms</span></li><li><span>Interactive Edu-Play murals</span></li></ul><h2><span>Main ward</span></h2><p><span><img src="/assets/orsmond_tb_hospital/orsmond4.gif" alt="Main ward" width="587" height="250" /></span></p><p><span><img src="/assets/orsmond_tb_hospital/orsmond5.gif" alt="New beds, linens &amp; curtains" width="587" height="250" /></span></p><ul><li><span>New beds, linens &amp; curtains</span></li><li><span>Repairs &amp; 500m2 wall painting</span></li><li><span>New flooring throughout</span></li><li><span>New cabinets, wash and work stations</span></li><li><span>Refurbished bathroom, milk room &amp; kitchen</span></li></ul><h2><span>Recreational room</span></h2><p><span><img src="/assets/orsmond_tb_hospital/orsmond6.gif" alt="Recreational room" width="587" height="250" /></span></p><p><span><img src="/assets/orsmond_tb_hospital/orsmond7.gif" alt="Bean bags &amp; sofa recreational area" width="587" height="250" /></span></p><ul><li><span>Plasma TV, educational DVD&rsquo;s, edu-toys and educational resources</span></li><li><span>Bean bags &amp; sofa recreational area</span></li><li><span>Desk and chairs</span></li><li><span>New flooring throughout</span></li></ul><h2><span>Isolation ward&nbsp;</span></h2><p><span><img src="/assets/orsmond_tb_hospital/orsmond8.gif" alt="Isolation ward" width="587" height="250" /></span></p><p><span><img src="/assets/orsmond_tb_hospital/orsmond9.gif" alt="Bathroom refurbished" width="587" height="250" /></span></p><ul><li><span>Wall repairs &amp; paint</span></li><li><span>Bathroom refurbished</span></li><li><span>New beds &amp; linens</span></li><li><span>Edu-Play resources and area</span></li></ul><p><span><img src="/assets/orsmond_tb_hospital/orsmond10.gif" alt="Orsmond TB Hospital volunteers" width="587" height="250" /><br /></span></p>', 0, '0', '2015-09-07 09:13:54'),
(17, 1, 0, 'Volunteers Give an Extreme Makeover to Nonkqubela Pre-primary', '2014-07-15 08:32:13', 'Volunteers Makeover Nonkqubela Pre-primary | South Africa', 'volunteers, south africa, show of hands, volkswagen, decor, interior makeover, schools', 'Volunteers helped to makeover Nonkqubela Pre-primary School in KwaNobuhle, resulting in lovely facilities for the children.', '<p><img src="/assets/nonkqubela_pre_primary_school/april1.jpg" alt="Volunteers helped to makeover Nonkqubela Pre-primary School" width="587" height="250" /></p>\r\n<p><iframe src="//www.youtube.com/embed/1nGhCXSD0X0" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>\r\n<h2>Thank you to our great Show of Hands volunteers! Your "extreme makeover" has done wonders for the children of Nonkqubela Pre-primary!&nbsp;</h2>\r\n<p><span>The overwhelming response from employees has been in support of volunteer action impacting on the standard of education within our community.</span></p>\r\n<p><span>With this in mind, we launched the 2011 Great Show of Hands Volunteer Programme with an ''extreme makeover'' of the Nonkqubela Pre Primary School in KwaNobuhle.</span></p>\r\n<p><span>Nonkqubela Pre Primary caters to approximately 100 children between the ages of 1 year to 6 years old, Mondays to Fridays, full day.</span></p>\r\n<p><strong>See the amazing BEFORE and AFTER photos below to appreciate how The Great Show of Hands has impacted on solving the challenges at Nonkqubela Pre-primary.&nbsp;</strong></p>\r\n<h2>Safety zone&nbsp;</h2>\r\n<p><span>There were no barriers between the vehicle driveway and the children''s free space. &nbsp;The result is that the children were confined indoors during the peak periods of the day in order to avoid accidents. &nbsp;This translates into a great deal of indoor time.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april2.jpg" alt="Safety zone" width="587" height="250" /></span></p>\r\n<p><span>A week before the volunteer day, contractors set to work grading and levelling the entire site. &nbsp;G2 was brought in to create a driveway and Volkswagen Group South Africa delivered over 200 used tyres for volunteers to create a driveway barrier. &nbsp;On event day, the DRIVE WORK PARTY laid the tyres, filled them all with soil and planted indigenous flowers to help beautify the site.</span></p>\r\n<p><span>Road signage was also installed to enhance the safety for the children''s play zones. &nbsp;</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april3.jpg" alt="Driveway barrier." width="587" height="250" /></span></p>\r\n<h2><span>Playground surface &amp; structures</span></h2>\r\n<p><span>The entire school yard was a barren surface cluttered with rocks, weeds and potholes</span></p>\r\n<p><span>The sloping site and mud-prone surface meant that physical exercise and outdoor play time was reduced to a minimum at Nonkqubela Pre Primary.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april4.jpg" alt="Sloping site and mud-prone surface" width="587" height="250" /></span></p>\r\n<p><span>The GRASS WORK PARTY performed an incredible feat by laying over 900m2 of lawn in 3 hours! &nbsp;Well done!</span></p>\r\n<p><span>The children now have ample lawn area for sports and play time activities, not to mention the jungle gym and swings installed as part of the project.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april5.jpg" alt="Lawn area for sports and play time activities" width="587" height="250" /></span></p>\r\n<h2><span>No shade or trees&nbsp;</span></h2>\r\n<p><span>There was not a single tree or weather proof / shade area outdoors.</span></p>\r\n<p><span>This was another factor impacting on outdoor play or lesson time being almost impossible.</span></p>\r\n<p><span>The lack of trees and greenery made for a desolate environment.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april6.jpg" alt=" Lack of trees and greenery" width="587" height="250" /></span></p>\r\n<p><span>Well done to the TREE WORK PARTY who planted 65 indigenous shade and fruit trees around the perimeter of the school grounds. &nbsp;Mature trees were used to increase the initial impact, but just image how green this site will be in another year! &nbsp;A shade awning at the rear of the school house now means that the children also have a sheltered outdoor lesson area.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april7.jpg" alt=" Planted 65 indigenous shade and fruit trees" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april8.jpg" alt="School house before makeover" width="587" height="250" /></span></p>\r\n<h2><span><img src="/assets/nonkqubela_pre_primary_school/april9.jpg" alt="School house after makeover" width="587" height="250" /></span></h2>\r\n<h2><span>Food garden</span></h2>\r\n<p><span>The school is challenged with supplementing healthy food to many of the children who spend five full days a week at the centre.</span></p>\r\n<p><span>There was no suitable ground / soil for planting the food garden that the principle and teachers desperately want to get going.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april10.jpg" alt="Planting the food garden" width="587" height="250" /></span></p>\r\n<p><span>Congratulations to the VEG WORK PARTY who set to work preparing over 100m2 soil and compost to plant nearly 1,000 vegetable seedlings! &nbsp;The beginnings of the food garden will see wonderful nutrituos benefits to the little ones in the months ahead.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april11.jpg" alt="Veg garden" width="587" height="250" /></span></p>\r\n<h2><span>Outdoor lessons</span></h2>\r\n<p><span>Teachers were desperate for a suitable area for outdoor lesson and activity time.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april12.jpg" alt="Outdoor lesson and activity time" width="587" height="250" /></span></p>\r\n<p><span>The GARDEN WORK PARTY created an indigenous nature study garden that will attract birds &amp; insects and provide outdoor seating for the children for nature study lessons.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april13.jpg" alt="Indigenous nature study garden" width="587" height="250" /></span></p>\r\n<h2><span>Water&nbsp;</span></h2>\r\n<p><span>Even if trees and gardens were possible at the school - what about water with the current restrictions in place?</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april14.jpg" alt="Installed four 2,500 litre rain water tanks" width="587" height="250" /></span></p>\r\n<p><span>We installed four 2,500 litre rain water tanks with a portable pump and spinkler system to irrigate the food garden, lawns and trees. &nbsp;The roof area of the school house translates to 200 litres of water per milimetre of rainfall. &nbsp;A true African blessing was bestowed upon the project when the rain came during the handover ceremony! &nbsp;By the time the volunteers left site on the 16th - over 1,000 litres of water had already been harvested in the rain water tanks!</span></p>\r\n<h2><span>Beautification</span></h2>\r\n<p><span>The Nonkqubela Pre Primary school house was a lack-lustre little structure before the Volkswagen Great Show of Hands volunteers got stuck in.</span></p>\r\n<p><span>Well done to the PAINT WORK PARTY who helped transform the school house into a bright and welcomming little beacon on the streets of KwaNobuhle!</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april15.jpg" alt="" width="587" height="250" /></span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april16.jpg" alt="Transform the school house into a bright and welcomming little beacon" width="587" height="250" /></span></p>\r\n<p><span>Visit this page regularly for updates on the sustainability and maintenance at Nonkqubela Pre Primary School.</span></p>\r\n<p><span><img src="/assets/nonkqubela_pre_primary_school/april17.jpg" alt="Site plan of Nonkqubela Pre Primary" width="587" height="734" /><br /></span></p>', 0, '0', '2015-09-07 09:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `cmsrelated`
--

CREATE TABLE IF NOT EXISTS `cmsrelated` (
`id` int(11) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `parenttype` varchar(50) DEFAULT NULL,
  `linktoid` int(11) DEFAULT NULL,
  `linktotype` varchar(50) DEFAULT NULL,
  `intorder` int(11) DEFAULT NULL,
  `showlink` int(1) DEFAULT '1',
  `urltarget` varchar(2000) DEFAULT NULL,
  `urltitle` varchar(250) DEFAULT NULL,
  `urlframe` varchar(250) DEFAULT '_self',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cmsrelated`
--

INSERT INTO `cmsrelated` (`id`, `parentid`, `parenttype`, `linktoid`, `linktotype`, `intorder`, `showlink`, `urltarget`, `urltitle`, `urlframe`, `lastmodified`, `siteid`) VALUES
(1, 11, 'page', 12, 'page', 1, 1, NULL, NULL, '_self', '2014-06-13 09:54:33', 1),
(2, 12, 'page', 11, 'page', 1, 1, NULL, NULL, '_self', '2014-06-13 09:54:34', 1),
(4, 2, 'page', 1, 'page', 1, 1, NULL, NULL, '_self', '2014-06-14 15:30:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cmsscroller`
--

CREATE TABLE IF NOT EXISTS `cmsscroller` (
`featureid` int(11) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `link` varchar(200) DEFAULT NULL,
  `linkid` varchar(100) DEFAULT NULL,
  `imagename` varchar(100) NOT NULL,
  `CreateDate` date NOT NULL,
  `intorder` int(11) NOT NULL,
  `mainFeature` tinyint(1) NOT NULL,
  `frontPage` tinyint(1) NOT NULL,
  `QuickLink` tinyint(1) NOT NULL,
  `featuredate` date NOT NULL,
  `featureenddate` date DEFAULT NULL,
  `description` text NOT NULL,
  `frame` varchar(50) DEFAULT NULL,
  `externallink` varchar(255) NOT NULL,
  `home` tinyint(1) unsigned zerofill NOT NULL,
  `allother` tinyint(1) unsigned zerofill NOT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE IF NOT EXISTS `contactus` (
`contactid` int(15) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `physaddress` varchar(500) DEFAULT NULL,
  `postaddress` varchar(500) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `stocknumber` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `guests` varchar(100) DEFAULT NULL,
  `bookingdate` date DEFAULT NULL,
  `other5` varchar(100) DEFAULT NULL,
  `other6` varchar(100) DEFAULT NULL,
  `other7` varchar(100) DEFAULT NULL,
  `other8` varchar(100) DEFAULT NULL,
  `other9` varchar(100) DEFAULT NULL,
  `other10` varchar(100) DEFAULT NULL,
  `comments` varchar(1500) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `archive` int(1) NOT NULL DEFAULT '0',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `defaults`
--

CREATE TABLE IF NOT EXISTS `defaults` (
`DefaultID` int(10) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `DefaultValue` text NOT NULL,
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `defaults`
--

INSERT INTO `defaults` (`DefaultID`, `Description`, `DefaultValue`, `siteid`) VALUES
(1, 'metatitle', 'Show of Hands', NULL),
(2, 'metakeywords', 'Show of Hands', NULL),
(3, 'metadescription', 'Show of Hands', NULL),
(4, 'enquiriesemail', '', NULL),
(5, 'googleprofileid', '<script>\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-52186620-1'', ''showofhands.co.za'');\r\n  ga(''send'', ''pageview'');\r\n\r\n</script>', NULL),
(6, 'metainclude', '', NULL),
(7, 'twitteremail', '', NULL),
(8, 'facebookpageid', '', NULL),
(9, 'contactusemail', 'neil@avenue-imc.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE IF NOT EXISTS `enquiries` (
`contactid` int(15) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `physaddress` varchar(500) DEFAULT NULL,
  `postaddress` varchar(500) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `stocknumber` varchar(100) DEFAULT NULL,
  `referrer` varchar(500) DEFAULT NULL,
  `other3` varchar(100) DEFAULT NULL,
  `other4` varchar(100) DEFAULT NULL,
  `other5` varchar(100) DEFAULT NULL,
  `other6` varchar(100) DEFAULT NULL,
  `other7` varchar(100) DEFAULT NULL,
  `other8` varchar(100) DEFAULT NULL,
  `other9` varchar(100) DEFAULT NULL,
  `other10` varchar(100) DEFAULT NULL,
  `comments` varchar(1500) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `archive` int(1) NOT NULL DEFAULT '0',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `siteid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `enquirycategories`
--

CREATE TABLE IF NOT EXISTS `enquirycategories` (
`id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(500) NOT NULL,
  `enqtype` varchar(255) DEFAULT NULL,
  `ccemail` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `facebookpages`
--

CREATE TABLE IF NOT EXISTS `facebookpages` (
  `id` varchar(300) NOT NULL,
  `sessionid` text NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `active` tinyint(5) NOT NULL DEFAULT '0',
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `metadata`
--

CREATE TABLE IF NOT EXISTS `metadata` (
`MetaID` int(10) NOT NULL,
  `PageID` int(10) DEFAULT NULL,
  `CategoryID` int(10) DEFAULT NULL,
  `SubCategoryID` int(10) DEFAULT NULL,
  `SubSubCategoryID` int(10) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `KW1` varchar(50) DEFAULT NULL,
  `KW2` varchar(50) DEFAULT NULL,
  `KW3` varchar(50) DEFAULT NULL,
  `KW4` varchar(50) DEFAULT NULL,
  `KW5` varchar(50) DEFAULT NULL,
  `KW6` varchar(50) DEFAULT NULL,
  `KW7` varchar(50) DEFAULT NULL,
  `KW8` varchar(50) DEFAULT NULL,
  `KW9` varchar(50) DEFAULT NULL,
  `KW10` varchar(50) DEFAULT NULL,
  `KW11` varchar(50) DEFAULT NULL,
  `KW12` varchar(50) DEFAULT NULL,
  `KW13` varchar(50) DEFAULT NULL,
  `KW14` varchar(50) DEFAULT NULL,
  `KW15` varchar(50) DEFAULT NULL,
  `KW16` varchar(50) DEFAULT NULL,
  `KW17` varchar(50) DEFAULT NULL,
  `KW18` varchar(50) DEFAULT NULL,
  `KW19` varchar(50) DEFAULT NULL,
  `Description` text,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
`moduleid` int(11) NOT NULL,
  `modulename` varchar(50) DEFAULT NULL,
  `modulepages` varchar(500) DEFAULT NULL,
  `editor` tinyint(1) NOT NULL DEFAULT '0',
  `editorwidth` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`moduleid`, `modulename`, `modulepages`, `editor`, `editorwidth`) VALUES
(1, 'Content', 'cmspage,cmsmenu', 0, NULL),
(4, 'Features', 'cmsfeatures', 0, NULL),
(6, 'Users', 'cmsusers', 0, NULL),
(8, 'Assets', 'cmsassets', 0, NULL),
(11, 'Audit Log', 'cmsaudit', 0, NULL),
(12, 'Doclib', 'cmsdocuments', 0, NULL),
(15, 'Contact US', 'cmscontactus', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permalinks`
--

CREATE TABLE IF NOT EXISTS `permalinks` (
`id` int(11) NOT NULL,
  `typeid` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `reallink` varchar(500) DEFAULT NULL,
  `permalink` varchar(500) DEFAULT NULL,
  `oldpermalink` varchar(500) DEFAULT NULL,
  `friendlytitle` varchar(500) DEFAULT NULL,
  `friendlytable` varchar(100) DEFAULT NULL,
  `friendlycol` varchar(100) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=21 ;

--
-- Dumping data for table `permalinks`
--

INSERT INTO `permalinks` (`id`, `typeid`, `type`, `reallink`, `permalink`, `oldpermalink`, `friendlytitle`, `friendlytable`, `friendlycol`, `lastmodified`, `siteid`) VALUES
(1, 1, 'page', 'content/content.php?id=1&siteid=1', '', NULL, 'over-700-vwsa-employees-have-volunteered-to-make-a-difference', 'cmspage', 'filecontent', '2014-06-23 07:52:11', 1),
(2, 10, 'page', 'content/content.php?id=10&siteid=1', '', NULL, '70-volunteers-make-a-difference-at-maranatha-streetworker-trust', 'cmspage', 'filecontent', '2014-07-02 12:40:53', 1),
(4, 12, 'page', 'content/content.php?id=12&siteid=1', '', NULL, 'volunteers-from-volkswagen-sa-help-improve-limekhaya-high-school', 'cmspage', 'filecontent', '2014-07-02 13:20:58', 1),
(5, 13, 'page', 'content/content.php?id=13&siteid=1', '', NULL, 'show-of-hands-extreme-makeover-at-sos-children-s-village', 'cmspage', 'filecontent', '2014-07-02 13:40:56', 1),
(7, 15, 'page', 'content/content.php?id=15&siteid=1', '', NULL, 'volkswagen-volunteers-for-world-environment-day', 'cmspage', 'filecontent', '2014-07-02 14:30:32', 1),
(8, 3, 'page', 'content/content.php?id=3&siteid=1', '', NULL, 'thank-you', 'cmspage', 'filecontent', '2014-06-14 15:31:20', 1),
(10, 2, 'page', 'content/content.php?id=2&siteid=1', 'contact', NULL, 'contact-us', 'cmspage', 'filecontent', '2014-06-14 15:31:20', 1),
(11, 5, 'page', 'content/content.php?id=5&siteid=1', NULL, NULL, 'who-can-join', 'cmspage', 'filecontent', '2014-06-23 08:03:55', 1),
(12, 6, 'page', 'content/content.php?id=6&siteid=1', NULL, NULL, 'what-work-will-we-do', 'cmspage', 'filecontent', '2014-06-23 08:19:37', 1),
(13, 7, 'page', 'content/content.php?id=7&siteid=1', NULL, NULL, 'how-are-projects-selected', 'cmspage', 'filecontent', '2014-06-23 08:26:41', 1),
(14, 8, 'page', 'content/content.php?id=8&siteid=1', NULL, NULL, 'quick-facts-about-volunteer-days', 'cmspage', 'filecontent', '2014-06-23 08:29:41', 1),
(15, 9, 'page', 'content/content.php?id=9&siteid=1', NULL, NULL, '126-volkswagen-volunteers-take-action-for-international-nelson-mandela-day', 'cmspage', 'filecontent', '2014-07-02 12:23:59', 1),
(16, 11, 'page', 'content/content.php?id=11&siteid=1', NULL, NULL, 'volkswagen-think-blue-for-national-marine-week', 'cmspage', 'filecontent', '2014-07-02 13:06:52', 1),
(17, 14, 'page', 'content/content.php?id=14&siteid=1', NULL, NULL, 'siyaphambili-pre-school-gets-an-extreme-makeover', 'cmspage', 'filecontent', '2014-07-02 14:08:11', 1),
(18, 16, 'page', 'content/content.php?id=16&siteid=1', NULL, NULL, 'volkswagen-employees-transform-children-s-ward-at-orsmond-tb-hospital', 'cmspage', 'filecontent', '2014-07-03 07:44:18', 1),
(19, 17, 'page', 'content/content.php?id=17&siteid=1', NULL, NULL, 'volunteers-give-an-extreme-makeover-to-nonkqubela-pre-primary', 'cmspage', 'filecontent', '2014-07-03 08:13:29', 1),
(20, 4, 'page', 'content/content.php?id=4&siteid=1', NULL, NULL, 'footer', 'cmspage', 'filecontent', '2014-07-09 07:26:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
`id` int(11) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `domain` varchar(500) DEFAULT NULL,
  `friendlytitle` varchar(250) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `parentid`, `name`, `domain`, `friendlytitle`) VALUES
(1, NULL, 'portal', 'http://www.showofhands.co.za', 'portal');

-- --------------------------------------------------------

--
-- Table structure for table `site_module`
--

CREATE TABLE IF NOT EXISTS `site_module` (
  `siteid` int(11) NOT NULL,
  `moduleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_module`
--

INSERT INTO `site_module` (`siteid`, `moduleid`) VALUES
(0, 0),
(1, 1),
(1, 6),
(1, 8),
(1, 11),
(1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `site_user_module`
--

CREATE TABLE IF NOT EXISTS `site_user_module` (
  `siteid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `moduleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_user_module`
--

INSERT INTO `site_user_module` (`siteid`, `userid`, `moduleid`) VALUES
(0, 2, 1),
(2, 2, 1),
(2, 2, 2),
(2, 2, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `socialnetworks`
--

CREATE TABLE IF NOT EXISTS `socialnetworks` (
`netid` int(11) NOT NULL,
  `network` varchar(150) NOT NULL,
  `networkuser` varchar(300) NOT NULL,
  `networkpass` varchar(250) NOT NULL,
  `postemail` varchar(250) DEFAULT NULL,
  `enabled` tinyint(5) NOT NULL DEFAULT '0',
  `siteid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usermodule`
--

CREATE TABLE IF NOT EXISTS `usermodule` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `moduleid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`userid` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `realname` varchar(100) NOT NULL,
  `userlevel` int(2) NOT NULL DEFAULT '2',
  `usernotes` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `realname`, `userlevel`, `usernotes`) VALUES
(1, 'webadmin', '3653607', 'WebAdmin', 0, NULL),
(2, 'neil@avenue-imc.com', 'show3685', 'Neil van Antwerpen', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activitylog`
--
ALTER TABLE `activitylog`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditlog`
--
ALTER TABLE `auditlog`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `cmsdocuments`
--
ALTER TABLE `cmsdocuments`
 ADD PRIMARY KEY (`docid`), ADD KEY `IX_doc_category` (`catid`);

--
-- Indexes for table `cmsfeatures`
--
ALTER TABLE `cmsfeatures`
 ADD PRIMARY KEY (`featureid`);

--
-- Indexes for table `cmsheadercategory`
--
ALTER TABLE `cmsheadercategory`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmsimages`
--
ALTER TABLE `cmsimages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmsmenu`
--
ALTER TABLE `cmsmenu`
 ADD PRIMARY KEY (`menuid`);

--
-- Indexes for table `cmspage`
--
ALTER TABLE `cmspage`
 ADD PRIMARY KEY (`pageid`);

--
-- Indexes for table `cmsrelated`
--
ALTER TABLE `cmsrelated`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmsscroller`
--
ALTER TABLE `cmsscroller`
 ADD PRIMARY KEY (`featureid`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
 ADD PRIMARY KEY (`contactid`);

--
-- Indexes for table `defaults`
--
ALTER TABLE `defaults`
 ADD PRIMARY KEY (`DefaultID`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
 ADD PRIMARY KEY (`contactid`);

--
-- Indexes for table `enquirycategories`
--
ALTER TABLE `enquirycategories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facebookpages`
--
ALTER TABLE `facebookpages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metadata`
--
ALTER TABLE `metadata`
 ADD PRIMARY KEY (`MetaID`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
 ADD PRIMARY KEY (`moduleid`);

--
-- Indexes for table `permalinks`
--
ALTER TABLE `permalinks`
 ADD PRIMARY KEY (`id`), ADD KEY `TYPELINK` (`typeid`,`type`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_module`
--
ALTER TABLE `site_module`
 ADD PRIMARY KEY (`siteid`,`moduleid`);

--
-- Indexes for table `site_user_module`
--
ALTER TABLE `site_user_module`
 ADD PRIMARY KEY (`siteid`,`userid`,`moduleid`);

--
-- Indexes for table `socialnetworks`
--
ALTER TABLE `socialnetworks`
 ADD PRIMARY KEY (`netid`);

--
-- Indexes for table `usermodule`
--
ALTER TABLE `usermodule`
 ADD PRIMARY KEY (`userid`,`moduleid`), ADD KEY `IX_usermod_module` (`moduleid`), ADD KEY `IX_usermod_user` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activitylog`
--
ALTER TABLE `activitylog`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `auditlog`
--
ALTER TABLE `auditlog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmsdocuments`
--
ALTER TABLE `cmsdocuments`
MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmsfeatures`
--
ALTER TABLE `cmsfeatures`
MODIFY `featureid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmsheadercategory`
--
ALTER TABLE `cmsheadercategory`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cmsimages`
--
ALTER TABLE `cmsimages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `cmsmenu`
--
ALTER TABLE `cmsmenu`
MODIFY `menuid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `cmspage`
--
ALTER TABLE `cmspage`
MODIFY `pageid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `cmsrelated`
--
ALTER TABLE `cmsrelated`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cmsscroller`
--
ALTER TABLE `cmsscroller`
MODIFY `featureid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
MODIFY `contactid` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `defaults`
--
ALTER TABLE `defaults`
MODIFY `DefaultID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
MODIFY `contactid` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `enquirycategories`
--
ALTER TABLE `enquirycategories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `metadata`
--
ALTER TABLE `metadata`
MODIFY `MetaID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
MODIFY `moduleid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `permalinks`
--
ALTER TABLE `permalinks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `socialnetworks`
--
ALTER TABLE `socialnetworks`
MODIFY `netid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
