-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2025 a las 04:49:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `logistics_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `access_control`
--

CREATE TABLE `access_control` (
  `access_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL,
  `exit_time` datetime DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `access_control`
--

INSERT INTO `access_control` (`access_id`, `driver_id`, `entry_time`, `exit_time`, `comment`) VALUES
(1, 2, '2025-06-04 07:00:00', '2025-06-04 20:00:00', NULL),
(2, 3, '2025-06-04 06:00:00', '2025-06-04 16:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `status` enum('pending','in_progress','delayed','completed','canceled') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deliveries`
--

INSERT INTO `deliveries` (`delivery_id`, `unit_id`, `driver_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'pending', '2025-06-04 06:30:00', '2025-06-04 06:30:00'),
(2, 1, 1, 'in_progress', '2025-06-04 06:30:00', '2025-06-04 06:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `license_number` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `drivers`
--

INSERT INTO `drivers` (`driver_id`, `user_id`, `name`, `email`, `phone`, `license_number`, `status`) VALUES
(1, 4, 'Kim Chun Hei', 'kim@example.com', '123-456-7890', 'LIC12345', 'active'),
(2, 5, 'Conductor 1', 'conductor1@example.com', '123-456-7891', 'LIC12346', 'active'),
(3, 6, 'Conductor 2', 'conductor2@example.com', '123-456-7892', 'LIC12347', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuel_analysis`
--

CREATE TABLE `fuel_analysis` (
  `analysis_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `fuel_level` decimal(10,2) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fuel_analysis`
--

INSERT INTO `fuel_analysis` (`analysis_id`, `unit_id`, `fuel_level`, `driver_id`, `recorded_at`) VALUES
(1, 1, 428.00, 1, '2025-06-04 06:30:00'),
(2, 2, 198.00, 2, '2025-06-04 06:30:00'),
(3, 3, 353.00, 3, '2025-06-04 06:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mobile_units`
--

CREATE TABLE `mobile_units` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(50) NOT NULL,
  `license_plate` varchar(20) DEFAULT NULL,
  `fuel_capacity` decimal(10,2) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mobile_units`
--

INSERT INTO `mobile_units` (`unit_id`, `unit_name`, `license_plate`, `fuel_capacity`, `driver_id`) VALUES
(1, 'Unidad 1', 'ABC-123', 500.00, 1),
(2, 'Unidad 2', 'DEF-456', 500.00, 2),
(3, 'Unidad 3', 'GHI-789', 500.00, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `status` enum('pending','assigned','canceled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `package_id`, `status`, `created_at`) VALUES
(1, 1, 1, 'pending', '2025-06-04 06:30:00'),
(2, 1, 3, 'assigned', '2025-06-04 06:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `weight_kg` decimal(10,2) DEFAULT NULL,
  `length_cm` decimal(10,2) DEFAULT NULL,
  `width_cm` decimal(10,2) DEFAULT NULL,
  `height_cm` decimal(10,2) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `priority` enum('Baja','Media','Alta') DEFAULT 'Media',
  `status` enum('on_site','in_transit') NOT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `packages`
--

INSERT INTO `packages` (`package_id`, `product_name`, `description`, `tracking_number`, `weight_kg`, `length_cm`, `width_cm`, `height_cm`, `origin`, `priority`, `status`, `order_id`) VALUES
(1, 'Producto 1', 'Descripción 1', 'TRK001', 5.00, 30.00, 20.00, 15.00, 'Ciudad A', 'Media', 'on_site', NULL),
(2, 'Producto 2', 'Descripción 2', 'TRK002', 10.00, 40.00, 25.00, 20.00, 'Ciudad B', 'Alta', 'on_site', NULL),
(3, 'Producto 3', 'Descripción 3', 'TRK003', 7.00, 35.00, 22.00, 18.00, 'Ciudad C', 'Baja', 'in_transit', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `report_analysis`
--

CREATE TABLE `report_analysis` (
  `report_id` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `packages_processed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `report_analysis`
--

INSERT INTO `report_analysis` (`report_id`, `year`, `packages_processed`) VALUES
(1, 2022, 20),
(2, 2023, 60),
(3, 2024, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `destination` varchar(255) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `routes`
--

INSERT INTO `routes` (`route_id`, `driver_id`, `unit_id`, `destination`, `start_time`, `end_time`) VALUES
(1, 1, 1, 'Ciudad C', '2025-06-04 08:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `role` enum('Usuario','Administrador','Personal de Bodega','Personal de Conductor') NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`, `delivery_address`, `role`, `status`) VALUES
(1, 'user1', 'userpass123', 'Usuario Ejemplo', 'user@example.com', 'Calle 123, Ciudad', 'Usuario', 1),
(2, 'admin1', 'adminpass123', 'Admin Ejemplo', 'admin@example.com', NULL, 'Administrador', 1),
(3, 'bodega1', 'bodegapass123', 'Bodega Ejemplo', 'bodega@example.com', NULL, 'Personal de Bodega', 1),
(4, 'conductor1', 'driverpass123', 'Kim Chun Hei', 'kim@example.com', NULL, 'Personal de Conductor', 1),
(5, 'conductor2', 'driverpass124', 'Conductor 1', 'conductor1@example.com', NULL, 'Personal de Conductor', 1),
(6, 'conductor3', 'driverpass125', 'Conductor 2', 'conductor2@example.com', NULL, 'Personal de Conductor', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `access_control`
--
ALTER TABLE `access_control`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indices de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indices de la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `fuel_analysis`
--
ALTER TABLE `fuel_analysis`
  ADD PRIMARY KEY (`analysis_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indices de la tabla `mobile_units`
--
ALTER TABLE `mobile_units`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indices de la tabla `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `report_analysis`
--
ALTER TABLE `report_analysis`
  ADD PRIMARY KEY (`report_id`);

--
-- Indices de la tabla `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `access_control`
--
ALTER TABLE `access_control`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fuel_analysis`
--
ALTER TABLE `fuel_analysis`
  MODIFY `analysis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mobile_units`
--
ALTER TABLE `mobile_units`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `report_analysis`
--
ALTER TABLE `report_analysis`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `access_control`
--
ALTER TABLE `access_control`
  ADD CONSTRAINT `access_control_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `mobile_units` (`unit_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `fuel_analysis`
--
ALTER TABLE `fuel_analysis`
  ADD CONSTRAINT `fuel_analysis_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `mobile_units` (`unit_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fuel_analysis_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `mobile_units`
--
ALTER TABLE `mobile_units`
  ADD CONSTRAINT `mobile_units_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `mobile_units` (`unit_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
