-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: event_management
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event_details`
--

DROP TABLE IF EXISTS `event_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_details` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `detail_type` varchar(100) NOT NULL,
  `detail_description` text,
  `price` decimal(10,2) NOT NULL,
  `room_capacity` int NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_details_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_details`
--

LOCK TABLES `event_details` WRITE;
/*!40000 ALTER TABLE `event_details` DISABLE KEYS */;
INSERT INTO `event_details` VALUES (2,111,'Gold and white.','A gold and white balloon arch, tall gold stands, and a dazzling illuminated 23 Elegant and festive for milestone birthdays.',1000.00,30,'Birthday-img2.jpg'),(4,111,'Elegant white and gold with floral accents.','A balloon arch featuring a mix of white, gold, and beige balloons frames. The backdrop consists of a sheer white curtain, creating a graceful and sophisticated ambiance.',2000.00,80,'Birthday-img4.jpg'),(5,111,'Fresh and floral with a yellow and white color scheme.','A white arch adorned with yellow and white flowers, complemented by green palm leaves. A white high chair and an acrylic cupcake stand add charm to the setting.',1500.00,40,'Birthday-img5.jpg'),(6,111,'Cheerful and vibrant sunflower theme.','A colorful balloon arch with yellow, white, and orange balloons, some accented with sunflowers. The setup includes two white cylindrical stands?one holding a yellow cake and the other a vase of sunflowers.',1800.00,50,'Birthday-img6.jpg'),(7,112,'Red and white floral elegance.','This mandap is adorned with vibrant red and white flowers arranged densely along the structure. Hanging floral garlands enhance the festive look. Inside, ceremonial items are beautifully arranged, reflecting a traditional setup. A lively and celebratory atmosphere, perfect for a traditional-style wedding.',50000.00,300,'Engagement-img1.jpg'),(8,112,'Regal and golden luxury.','The pillars and roof are intricately draped with golden and green garlands, creating a lavish and grand appearance. The floral arrangements and decorative floor add to its rich aesthetic. A sophisticated and majestic setting, ideal for royal-themed weddings.',120000.00,350,'Engagement-img2.jpg'),(9,112,'Red, white, and green harmony.','This mandap features pillars wrapped with garlands of red, white, and green flowers. The setup includes traditional brass lamps and ceremonial items, with a floral backdrop to complete the scene. A warm and traditional vibe, suited for intimate yet colorful weddings.',130000.00,350,'Engagement-img3.jpg'),(10,112,'Golden Aesthetics','The mandap is adorned with vibrant floral garlands in hues of yellow, orange, and pink, symbolizing joy and prosperity. The intricate floral arrangements give the mandap a festive and lively look.',130000.00,400,'Engagement-img4.jpg'),(11,113,'Lush greenery ambiance','Central beige sofa, lush green foliage, white flowers, hanging floral arrangement, warm lighting',100000.00,250,'Wedding-img1.jpg'),(12,113,'Grand floral arrangement','The stage features a central beige sofa set against a lush backdrop of greenery and white flowers, with a striking neon sign reading ?A+H Co.? for a modern touch. The decor is enhanced by warm lighting, hanging floral arrangements, and decorative lanterns, creating an elegant and inviting ambiance.',120000.00,300,'Wedding-img2.jpg'),(13,113,'Luxurious floral wedding','The stage is adorned with white drapes and three large floral arches made up of red and white flowers, complemented by pink fabric accents.',900000.00,250,'Wedding-img3.jpg'),(14,113,'Sophisticated floral backdrop','The decoration features a luxurious white and gold chaise lounge placed on a raised platform, surrounded by a backdrop of white drapes adorned with abundant floral arrangements. Hanging crystal chandeliers and warm lighting complete the look, creating a sophisticated and romantic ambiance.',100000.00,300,'Wedding-img4.jpg'),(15,114,'Grand and luxurious','The setup includes vibrant floral garlands, lush greenery, and traditional brass lamps adorning a regal chair, creating an elegant and festive ambiance.',80000.00,200,'Maternity-img1.jpeg'),(16,114,'Vibrant floral and cultural elegance','The stage is adorned with a striking flower panel featuring hues of yellow, orange, and green, complemented by traditional brass lamps and offerings, highlighting the rich cultural heritage.',90000.00,250,'Maternity-img2.jpeg'),(17,114,'Exquisite traditional Indian aesthetics','The stage features a vibrant blend of floral garlands, a backdrop with symbolic imagery including Ganesha, and traditional brass lamps, celebrating Indias rich cultural heritage with elegance.',80000.00,250,'Maternity-img4.jpeg'),(18,114,'Vibrant floral and ornate decor','The stage is beautifully adorned with vertical garlands of white flowers interspersed with red and pink blooms, complemented by golden lotus motifs and lush green leaves on both sides. A purple cloth-covered table serves as a focal point at the center bottom, adding an elegant touch.',60000.00,200,'Maternity-img3.jpeg'),(19,115,'Sophisticated floral and dreamy elegance','The stage showcases a stunning blend of cascading white drapes illuminated with soft string lights. A floral arch and a hanging circular seat adorned with flowers add an enchanting, whimsical charm to the setup.',25000.00,100,'BabyShower-img1.jpg'),(20,115,'Graceful floral cradle setup','The stage is adorned with bright yellow and white flower garlands against a beige curtain backdrop. A baby cradle, elegantly decorated with matching flowers, creates a festive and joyful centerpiece.',30000.00,150,'BabyShower-img2.jpg'),(21,115,'Whimsical floral and romantic charm','The stage showcases an intricately decorated circular swing adorned with vibrant flowers, surrounded by hanging birdcages filled with floral arrangements. The floral-patterned backdrop features the phrase \"Dia Come True,\" enhancing the dreamy and romantic atmosphere.',35000.00,150,'BabyShower-img3.jpg'),(22,115,'Elegant pastel and whimsical charm','The stage is adorned with soft pastel drapes, shimmering fairy lights, and floral accents, creating a serene and magical ambiance. A delicate swing decorated with flowers serves as the enchanting centerpiece',20000.00,100,'BabyShower-img4.jpg'),(23,116,'Illuminated Stage Showcase for Product Launch','The decoration focuses on creating a sophisticated and welcoming environment for the product launch. The stage features a sleek and modern design, with illuminated geometric shapes framing the backdrop. The central display prominently showcases the event title, \"Indian Restaurant Congress 2012,\" but can easily be adapted to highlight the product being launched. Sponsor logos for \"Cremica\" and \"Franchise India\" appear on the backdrop, blending professionalism with brand visibility.',100000.00,200,'ProductLaunch-img3.jpg'),(24,116,'Elegant Stage Setup with Interactive Product Display','The stage is the centerpiece of this event, designed to captivate attention with a sleek and illuminated look. It features modern lighting elements that frame the interactive product display. The backdrop highlights the theme of the launch and includes sponsor logos, offering a blend of branding and sophistication.',90000.00,150,'ProductLaunch-img1.jpg'),(25,116,'Elegant Ceiling Design with Ambient Lighting','The ceiling features an array of spotlights and speakers, ensuring optimal visual and audio presentation for the event. The seating is thoughtfully arranged to provide a clear view of the stage for all attendees, creating a polished and immersive experience.',90000.00,150,'ProductLaunch-img2.jpg'),(26,116,'Modern Overhead Lighting and Beam Showcase','The ceiling features a captivating design, combining soft ambient lighting with modern suspended elements. Stylish chandeliers or strategically placed spotlights cast a warm glow, creating an inviting and sophisticated atmosphere. Draped fabrics or geometric structures add texture and visual interest, while the overall layout ensures the seating area feels both elegant and cohesive with the events theme. This arrangement transforms the space into a visually appealing and immersive environment for the attendees.',100000.00,300,'ProductLaunch-img4.jpg'),(27,117,'A Cozy Private Hall Experience','The private hall is designed with a lively music-themed atmosphere. The walls feature vibrant neon lighting, including a glowing musical note that adds a playful touch. The seating is arranged with a brown tufted sofa for comfort and style, paired with a round wooden table for casual interaction.',2000.00,10,'PrivateParty-img1.jpeg'),(28,117,'Radiant Elegance: Lighting and Seating Harmony','The private hall features a sophisticated combination of lighting and seating arrangements, creating an ambiance that is both comfortable and visually captivating. The lighting is a mix of soft, ambient hues and focused accent lights, enhancing the warm and inviting atmosphere. Suspended decorative lights and strategically placed spotlights highlight key areas like the seating and main stage',2000.00,10,'PrivateParty-img2.jpeg'),(29,117,'Charming Simplicity for Private Hall Gatherings','The hall features a cozy ambiance with modern accents. Comfortable seating like black leather couches along the side walls brings a relaxed yet elegant feel. Ambient LED lighting in blue adds a subtle glow, perfect for creating a welcoming environment. The room includes decor elements like patterned rugs, stylish furniture, and tasteful wall colors (blue and pink), paired with playful disco lights that energize the space. Functional aspects like a central table for refreshments or accessories add convenience to the setting.',2000.00,10,'PrivateParty-img3.jpeg'),(30,117,'Vibrant and Fun Karaoke Room Decor','The private hall is designed with a simple yet elegant aesthetic, perfect for intimate gatherings or casual events. The ceiling is adorned with soft, warm lighting, creating a cozy and inviting ambiance. Clean and minimalistic walls are complemented with subtle decor elements like modern art pieces or small wall-mounted fixtures',2000.00,10,'PrivateParty-img4.jpeg');
/*!40000 ALTER TABLE `event_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_orders`
--

DROP TABLE IF EXISTS `event_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  `detail_id` int DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `start_booking_date` datetime NOT NULL,
  `end_booking_date` datetime NOT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  KEY `fk_detail_id` (`detail_id`),
  CONSTRAINT `event_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `event_orders_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `fk_detail_id` FOREIGN KEY (`detail_id`) REFERENCES `event_details` (`detail_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_orders`
--

LOCK TABLES `event_orders` WRITE;
/*!40000 ALTER TABLE `event_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  `event_img` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (111,'Birthday','nav-img1.png'),(112,'Engagement','nav-img2.png'),(113,'Wedding','nav-img3.png'),(114,'Maternity','nav-img4.png'),(115,'Baby Shower','nav-img5.png'),(116,'Product Launch','nav-img6.png'),(117,'Private Party','nav-img7.png');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `comments` text,
  `feedback_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,11012,'kumar',4,'Great experience and wonderful arrangements!','2025-04-05 15:17:38'),(2,11013,'Jyothi',4,'Good but the sound system could be better.','2025-04-05 15:19:38'),(3,11014,'Ezra',5,'Perfect ambiance for our wedding.','2025-04-05 15:20:33'),(4,11015,'Varun',5,'Fantastic arrangements and super helpful staff.','2025-04-05 15:27:09'),(5,11016,'Nikhil',3,'Decent, but parking was an issue.','2025-04-05 15:50:17'),(6,11017,'Priya',4,'Loved the catering services!','2025-04-05 15:50:17'),(7,11018,'Arjun',2,'Need better lighting in the halls.','2025-04-05 15:50:17'),(8,11019,'Divya',3,'Average experience, could improve cleanliness.','2025-04-05 15:50:17'),(9,11020,'Sahana',4,'Good venue but a bit pricey.','2025-04-05 15:50:17'),(10,11021,'Manoj',5,'Excellent venue for corporate events.','2025-04-05 15:50:17');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` bigint DEFAULT NULL,
  `role` enum('Admin','User') DEFAULT 'User',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11022 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11011,'Sridhar','sridharkumar3029@gmail.com','sri1234',9113592190,'Admin'),(11012,'kumar','kumar@gmail.com','kum1234',123456789,'User'),(11013,'Jyothi','jyothi@gmail.com','jyo123',789654123,'User'),(11014,'Ezra','ezra@gmail.com','ezra123',321456987,'User'),(11015,'Varun','varun@gmail.com','varun123',753951258,'User'),(11016,'Nikhil','nikhil@gmail.com','nikhil123',456987123,'User'),(11017,'Priya','priya@gmail.com','priya123',789542361,'User'),(11018,'Arjun','arjun@gmail.com','arjun123',123658974,'User'),(11019,'Divya','divya@gmail.com','divya123',756324189,'User'),(11020,'Sahana','sahana@gmail.com','sahana123',8526547931,'User'),(11021,'Manoj','manoj@gmail.com','manoj123',478963152,'User');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06 15:12:23
