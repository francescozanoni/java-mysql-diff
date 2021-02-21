
-- MariaDB 10.0.38-MariaDB-wsrep

-----------------------------------------------------------------------------------------------------

SHOW DATABASES;
-- +-----------------------------------------+
-- | Database                                |
-- +-----------------------------------------+
-- | information_schema                      |
-- | mysql                                   |
-- | fz_schema_name                          |
-- +-----------------------------------------+

-----------------------------------------------------------------------------------------------------

SHOW CREATE DATABASE fz_schema_name;
--        Database: fz_schema_name
-- Create Database: CREATE DATABASE `fz_schema_name` /*!40100 DEFAULT CHARACTER SET utf8 */

-----------------------------------------------------------------------------------------------------

SELECT * FROM information_schema.EVENTS;
--        EVENT_CATALOG: def
--         EVENT_SCHEMA: fz_schema_name
--           EVENT_NAME: fz_event_name
--              DEFINER: root@%
--            TIME_ZONE: SYSTEM
--           EVENT_BODY: SQL
--     EVENT_DEFINITION: BEGIN
--                         ...
--                       END
--           EVENT_TYPE: RECURRING
--           EXECUTE_AT: NULL
--       INTERVAL_VALUE: 1
--       INTERVAL_FIELD: DAY
--             SQL_MODE: NO_AUTO_VALUE_ON_ZERO
--               STARTS: 2018-03-20 00:00:00
--                 ENDS: NULL
--               STATUS: ENABLED
--        ON_COMPLETION: NOT PRESERVE
--              CREATED: 2018-12-17 14:48:55
--         LAST_ALTERED: 2018-12-17 14:48:55
--        LAST_EXECUTED: NULL
--        EVENT_COMMENT:
--           ORIGINATOR: 0
-- CHARACTER_SET_CLIENT: utf8mb4
-- COLLATION_CONNECTION: utf8mb4_general_ci
--   DATABASE_COLLATION: utf8_general_ci

SHOW CREATE EVENT fz_schema_name.fz_event_name;
--                Event: fz_event_name
--             sql_mode: NO_AUTO_VALUE_ON_ZERO
--            time_zone: SYSTEM
--         Create Event: CREATE DEFINER=`root`@`%` EVENT `fz_event_name`
--                       ON SCHEDULE EVERY 1 DAY
--                       STARTS '2018-03-20 00:00:00'
--                       ON COMPLETION NOT PRESERVE
--                       ENABLE DO
--                       BEGIN
--                           ...
--                       END
-- character_set_client: utf8mb4
-- collation_connection: utf8mb4_general_ci
--   Database Collation: utf8_general_ci

-----------------------------------------------------------------------------------------------------

SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_TYPE IN ('PROCEDURE');
--            SPECIFIC_NAME: fz_procedure_name
--          ROUTINE_CATALOG: def
--           ROUTINE_SCHEMA: fz_schema_name
--             ROUTINE_NAME: fz_procedure_name
--             ROUTINE_TYPE: PROCEDURE
--                DATA_TYPE:
-- CHARACTER_MAXIMUM_LENGTH: NULL
--   CHARACTER_OCTET_LENGTH: NULL
--        NUMERIC_PRECISION: NULL
--            NUMERIC_SCALE: NULL
--       DATETIME_PRECISION: NULL
--       CHARACTER_SET_NAME: NULL
--           COLLATION_NAME: NULL
--           DTD_IDENTIFIER: NULL
--             ROUTINE_BODY: SQL
--       ROUTINE_DEFINITION: main:BEGIN
--                                 ...
--                               END main
--            EXTERNAL_NAME: NULL
--        EXTERNAL_LANGUAGE: NULL
--          PARAMETER_STYLE: SQL
--         IS_DETERMINISTIC: NO
--          SQL_DATA_ACCESS: CONTAINS SQL
--                 SQL_PATH: NULL
--            SECURITY_TYPE: DEFINER
--                  CREATED: 2019-02-27 14:46:49
--             LAST_ALTERED: 2019-02-27 14:46:49
--                 SQL_MODE: NO_AUTO_VALUE_ON_ZERO
--          ROUTINE_COMMENT:
--                  DEFINER: root@%
--     CHARACTER_SET_CLIENT: utf8
--     COLLATION_CONNECTION: utf8_general_ci
--       DATABASE_COLLATION: latin1_swedish_ci

SHOW CREATE PROCEDURE fz_schema_name.fz_procedure_name;
--            Procedure: fz_procedure_name
--             sql_mode: NO_AUTO_VALUE_ON_ZERO
--     Create Procedure: CREATE DEFINER=`root`@`%` PROCEDURE `fz_procedure_name`()
--                       BEGIN
--                         ...
--                       END
-- character_set_client: utf8
-- collation_connection: utf8_general_ci
--   Database Collation: latin1_swedish_ci

-----------------------------------------------------------------------------------------------------

SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_TYPE IN ('FUNCTION');
--            SPECIFIC_NAME: fz_function_name
--          ROUTINE_CATALOG: def
--           ROUTINE_SCHEMA: fz_schema_name
--             ROUTINE_NAME: fz_function_name
--             ROUTINE_TYPE: FUNCTION
--                DATA_TYPE: tinyint
-- CHARACTER_MAXIMUM_LENGTH: NULL
--   CHARACTER_OCTET_LENGTH: NULL
--        NUMERIC_PRECISION: 3
--            NUMERIC_SCALE: 0
--       DATETIME_PRECISION: NULL
--       CHARACTER_SET_NAME: NULL
--           COLLATION_NAME: NULL
--           DTD_IDENTIFIER: tinyint(1)
--             ROUTINE_BODY: SQL
--       ROUTINE_DEFINITION: BEGIN
--                             ...
--                           END
--            EXTERNAL_NAME: NULL
--        EXTERNAL_LANGUAGE: NULL
--          PARAMETER_STYLE: SQL
--         IS_DETERMINISTIC: YES
--          SQL_DATA_ACCESS: READS SQL DATA
--                 SQL_PATH: NULL
--            SECURITY_TYPE: DEFINER
--                  CREATED: 2018-12-17 14:52:42
--             LAST_ALTERED: 2018-12-17 14:52:42
--                 SQL_MODE: NO_AUTO_VALUE_ON_ZERO
--          ROUTINE_COMMENT:
--                  DEFINER: root@%
--     CHARACTER_SET_CLIENT: utf8mb4
--     COLLATION_CONNECTION: utf8mb4_general_ci
--       DATABASE_COLLATION: utf8_general_ci

SHOW CREATE FUNCTION fz_schema_name.fz_function_name;
--             Function: fz_function_name
--             sql_mode: NO_AUTO_VALUE_ON_ZERO
--      Create Function: CREATE DEFINER=`root`@`%` FUNCTION `fz_function_name`() RETURNS tinyint(1)
--                           READS SQL DATA
--                           DETERMINISTIC
--                       BEGIN
--                         ...
--                       END
-- character_set_client: utf8mb4
-- collation_connection: utf8mb4_general_ci
--   Database Collation: utf8_general_ci

-----------------------------------------------------------------------------------------------------

SELECT * FROM information_schema.TABLES WHERE TABLE_TYPE IN ('BASE TABLE');
--   TABLE_CATALOG: def
--    TABLE_SCHEMA: fz_schema_name
--      TABLE_NAME: fz_table_name
--      TABLE_TYPE: BASE TABLE
--          ENGINE: InnoDB
--         VERSION: 10
--      ROW_FORMAT: Compact
--      TABLE_ROWS: 0
--  AVG_ROW_LENGTH: 0
--     DATA_LENGTH: 16384
-- MAX_DATA_LENGTH: 0
--    INDEX_LENGTH: 0
--       DATA_FREE: 0
--  AUTO_INCREMENT: 1
--     CREATE_TIME: 2019-01-31 10:33:56
--     UPDATE_TIME: NULL
--      CHECK_TIME: NULL
-- TABLE_COLLATION: latin1_swedish_ci
--        CHECKSUM: NULL
--  CREATE_OPTIONS:
--   TABLE_COMMENT:

SHOW CREATE TABLE fz_schema_name.fz_table_name;
--        Table: fz_table_name
-- Create Table: CREATE TABLE `fz_table_name` (
--                 ...
--               ) ENGINE=InnoDB DEFAULT CHARSET=latin1

-----------------------------------------------------------------------------------------------------

SELECT * FROM information_schema.TABLES WHERE TABLE_TYPE IN ('VIEW');
--   TABLE_CATALOG: def
--    TABLE_SCHEMA: fz_schema_name
--      TABLE_NAME: fz_view_name
--      TABLE_TYPE: VIEW
--          ENGINE: NULL
--         VERSION: NULL
--      ROW_FORMAT: NULL
--      TABLE_ROWS: NULL
--  AVG_ROW_LENGTH: NULL
--     DATA_LENGTH: NULL
-- MAX_DATA_LENGTH: NULL
--    INDEX_LENGTH: NULL
--       DATA_FREE: NULL
--  AUTO_INCREMENT: NULL
--     CREATE_TIME: NULL
--     UPDATE_TIME: NULL
--      CHECK_TIME: NULL
-- TABLE_COLLATION: NULL
--        CHECKSUM: NULL
--  CREATE_OPTIONS: NULL
--   TABLE_COMMENT: VIEW

SELECT * FROM information_schema.VIEWS;
--        TABLE_CATALOG: def
--         TABLE_SCHEMA: fz_schema_name
--           TABLE_NAME: fz_view_name
--      VIEW_DEFINITION: (select ...)
--         CHECK_OPTION: NONE
--         IS_UPDATABLE: YES
--              DEFINER: root@%
--        SECURITY_TYPE: DEFINER
-- CHARACTER_SET_CLIENT: utf8mb4
-- COLLATION_CONNECTION: utf8mb4_general_ci

SHOW CREATE VIEW fz_schema_name.fz_view_name;
--                 View: fz_view_name
--          Create View: CREATE ALGORITHM=UNDEFINED
--                              DEFINER=`root`@`%`
--                              SQL SECURITY DEFINER
--                              VIEW `fz_schema_name`.`fz_view_name` AS (
--                                select ...
--                              )
-- character_set_client: utf8mb4
-- collation_connection: utf8mb4_general_ci


-----------------------------------------------------------------------------------------------------

SELECT * FROM information_schema.TRIGGERS;
--            TRIGGER_CATALOG: def
--             TRIGGER_SCHEMA: fz_schema_name
--               TRIGGER_NAME: fz_trigger_name
--         EVENT_MANIPULATION: INSERT
--       EVENT_OBJECT_CATALOG: def
--        EVENT_OBJECT_SCHEMA: fz_schema_name
--         EVENT_OBJECT_TABLE: fz_table_name
--               ACTION_ORDER: 0
--           ACTION_CONDITION: NULL
--           ACTION_STATEMENT: BEGIN
--                               ...
--                             END
--         ACTION_ORIENTATION: ROW
--              ACTION_TIMING: BEFORE
-- ACTION_REFERENCE_OLD_TABLE: NULL
-- ACTION_REFERENCE_NEW_TABLE: NULL
--   ACTION_REFERENCE_OLD_ROW: OLD
--   ACTION_REFERENCE_NEW_ROW: NEW
--                    CREATED: NULL
--                   SQL_MODE:
--                    DEFINER: root@%
--       CHARACTER_SET_CLIENT: utf8
--       COLLATION_CONNECTION: utf8_general_ci
--         DATABASE_COLLATION: utf8_general_ci

SHOW CREATE TRIGGER fz_schema_name.fz_trigger_name;
--                Trigger: fz_trigger_name
--               sql_mode:
-- SQL Original Statement: CREATE DEFINER=`root`@`%` TRIGGER fz_trigger_name
--                                 BEFORE INSERT
--                                 ON fz_table_name
--                                 FOR EACH ROW
--                         BEGIN
--                           ...
--                         END
--   character_set_client: utf8
--   collation_connection: utf8_general_ci
--     Database Collation: utf8_general_ci
