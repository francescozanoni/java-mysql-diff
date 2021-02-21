package net.moznion.mysql.diff;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import com.smattme.MysqlExportService;
import java.util.Properties;

/**
 * Dumper for SQL table definition.
 * 
 * @author moznion
 *
 */
public class SchemaDumper {
  private static final String LINE_SEPARATOR = System.lineSeparator();

  private final MySqlConnectionInfo localMySqlConnectionInfo;

  /**
   * Instantiate SchemaDumper.
   * 
   * @param localMySqlConnectionInfo Connection information of MySQL which is on your local
   *        environment.
   */
  public SchemaDumper(MySqlConnectionInfo localMySqlConnectionInfo) {
    if (localMySqlConnectionInfo == null) {
      throw new IllegalArgumentException("mysqlConnectionInfo must not be null");
    }

    this.localMySqlConnectionInfo = localMySqlConnectionInfo;
  }

  /**
   * Instantiate SchemaDumper.
   * 
   * <p>
   * Connection information of local MySQL will be used default as "-h localhost -u root".
   * </p>
   */
  public SchemaDumper() {
    this(MySqlConnectionInfo.builder().build());
  }
 
  /**
   * Dump schema from SQL string.
   * 
   * @param sql SQL string which is a target to dump.
   * @return Result of dumping.
   * @throws SQLException Throw if invalid SQL is given.
   * @throws IOException Throw if mysqldump command is failed.
   * @throws InterruptedException Throw if mysqldump command is failed.
   */
  public String dump(String sql) throws SQLException, IOException, InterruptedException, ClassNotFoundException {
    String tempDbName = new StringBuilder()
        .append("tmp_")
        .append(UUID.randomUUID().toString().replaceAll("-", ""))
        .toString();

    String mysqlUrl = localMySqlConnectionInfo.getJdbcUrl();
    String mysqlUser = localMySqlConnectionInfo.getUser();
    String mysqlPass = localMySqlConnectionInfo.getPass();
    try (Connection connection = DriverManager.getConnection(mysqlUrl, mysqlUser, mysqlPass)) {
      try (Statement stmt = connection.createStatement()) {
        stmt.executeUpdate("CREATE DATABASE " + tempDbName);
      }

      try (Statement stmt = connection.createStatement()) {
        stmt.execute(new StringBuilder()
            .append("USE ")
            .append(tempDbName)
            .append("; ")
            .append(sql)
            .toString());
      }

      return fetchSchemaViaMysqldump(tempDbName);
    } catch (Exception e) {
      throw e;
    } finally {
      try (Connection connection = DriverManager.getConnection(mysqlUrl, mysqlUser, mysqlPass)) {
        try (Statement stmt = connection.createStatement()) {
          stmt.executeUpdate("DROP DATABASE " + tempDbName);
        }
      }
    }
  }

  /**
   * Dump schema from SQL file.
   * 
   * @param sqlFile SQL file.
   * @param charset Character set of SQL file.
   * @return Result of dumping.
   * @throws SQLException Throw if invalid SQL is given.
   * @throws IOException Throw if mysqldump command is failed.
   * @throws InterruptedException Throw if mysqldump command is failed.
   */
  public String dump(File sqlFile, Charset charset)
      throws IOException, SQLException, InterruptedException, ClassNotFoundException {
    String sqlString =
        new String(Files.readAllBytes(Paths.get(sqlFile.getAbsolutePath())), charset);
    return dump(sqlString);
  }

  /**
   * Dump schema from SQL file which is written by UTF-8.
   * 
   * @param sqlFile SQL file (written by UTF-8).
   * @return Result of dumping.
   * @throws SQLException Throw if invalid SQL is given.
   * @throws IOException Throw if mysqldump command is failed.
   * @throws InterruptedException Throw if mysqldump command is failed.
   */
  public String dump(File sqlFile) throws IOException, SQLException, InterruptedException, ClassNotFoundException {
    return dump(sqlFile, StandardCharsets.UTF_8);
  }

  /**
   * Dump schema from DB name which is in local MySQL.
   * 
   * @param dbName DB name which is in local MySQL.
   * @return Result of dumping.
   * @throws SQLException Throw if invalid SQL is given.
   * @throws IOException Throw if mysqldump command is failed.
   * @throws InterruptedException Throw if mysqldump command is failed.
   */
  public String dumpFromLocalDb(String dbName)
      throws IOException, InterruptedException, SQLException, ClassNotFoundException {
    return fetchSchemaViaMysqldump(dbName);
  }

  /**
   * Dump schema from DB name which is in remote MySQL.
   * 
   * @param dbName DB name which is in remote MySQL.
   * @param mysqlConnectionInfo Connection information of remote MySQL.
   * @return Result of dumping.
   * @throws SQLException Throw if invalid SQL is given.
   * @throws IOException Throw if mysqldump command is failed.
   * @throws InterruptedException Throw if mysqldump command is failed.
   */
  public String dumpFromRemoteDb(String dbName, MySqlConnectionInfo mysqlConnectionInfo)
      throws IOException, InterruptedException, SQLException, ClassNotFoundException {
    String schema = fetchSchemaViaMysqldump(dbName, mysqlConnectionInfo);
    return dump(schema);
  }

  private String fetchSchemaViaMysqldump(String dbName, MySqlConnectionInfo mysqlConnectionInfo)
      throws IOException, InterruptedException, SQLException, ClassNotFoundException {
    String schema;
 
    String mysqlHost = mysqlConnectionInfo.getHost();
    String mysqlUser = mysqlConnectionInfo.getUser();
    String mysqlPass = mysqlConnectionInfo.getPass();

    //required properties for exporting of db
Properties properties = new Properties();
properties.setProperty(MysqlExportService.DB_NAME, mysqlHost);
properties.setProperty(MysqlExportService.DB_USERNAME, mysqlUser);
properties.setProperty(MysqlExportService.DB_PASSWORD, mysqlPass);

//set the outputs temp dir
properties.setProperty(MysqlExportService.TEMP_DIR, new File("external").getPath());

MysqlExportService mysqlExportService = new MysqlExportService(properties);
mysqlExportService.export();

schema = mysqlExportService.getGeneratedSql();

    return schema;
  }

  private String fetchSchemaViaMysqldump(String dbName)
      throws IOException, InterruptedException, SQLException, ClassNotFoundException {
    return fetchSchemaViaMysqldump(dbName, localMySqlConnectionInfo);
  }
}
