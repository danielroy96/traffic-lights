CREATE TABLE `trafficlightstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(4000) DEFAULT NULL,
  `trafficlight` varchar(45) DEFAULT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `workingfromhome` varchar(45) DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci