package ru.job4j.jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import java.util.StringJoiner;
import java.sql.Statement;
import java.io.InputStream;
import java.sql.DriverManager;

public class TableEditor implements AutoCloseable {
    private Connection connection;

    private Properties properties;

    public TableEditor(Properties properties) throws Exception {
        this.properties = properties;
        initConnection();
    }

    private void initConnection() throws ClassNotFoundException, SQLException {
        Class.forName(properties.getProperty("driver_class"));
        String url = properties.getProperty("url");
        String user = properties.getProperty("username");
        String password = properties.getProperty("password");
        connection = DriverManager.getConnection(url, user, password);
    }

    private void executeSQL(String sql) throws Exception {
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        }
    }

    public void createTable(String tableName) throws Exception {
        executeSQL(String.format(
                "CREATE TABLE IF NOT EXISTS %s ();", tableName
        ));
    }


    public void dropTable(String tableName) throws Exception {
        executeSQL(String.format(
                "DROP TABLE %s;", tableName
        ));
    }

    public void addColumn(String tableName, String columnName, String type) throws Exception {
       executeSQL(String.format(
               "ALTER TABLE %s ADD COLUMN %s %s;",
               tableName, columnName, type
       ));
    }

    public void dropColumn(String tableName, String columnName) throws Exception {
        executeSQL(String.format(
                "ALTER TABLE %s DROP COLUMN %s;",
                tableName, columnName
        ));
    }

    public void renameColumn(String tableName, String columnName, String newColumnName) throws Exception {
       executeSQL(String.format(
               "ALTER TABLE %s RENAME COLUMN %s TO %s;",
               tableName, columnName, newColumnName
       ));
    }

    public String getTableScheme(String tableName) throws Exception {
        var rowSeparator = "-".repeat(30).concat(System.lineSeparator());
        var header = String.format("%-15s|%-15s%n", "NAME", "TYPE");
        var buffer = new StringJoiner(rowSeparator, rowSeparator, rowSeparator);
        buffer.add(header);
        try (var statement = connection.createStatement()) {
            var selection = statement.executeQuery(String.format(
                    "SELECT * FROM %s LIMIT 1", tableName
            ));
            var metaData = selection.getMetaData();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                buffer.add(String.format("%-15s|%-15s%n",
                        metaData.getColumnName(i), metaData.getColumnTypeName(i))
                );
            }
        }
        return buffer.toString();
    }

    @Override
    public void close() throws Exception {
        if (connection != null) {
            connection.close();
        }
    }

    public static void main(String[] args) throws Exception {
        Properties properties = new Properties();
        try (InputStream in = TableEditor.class.getClassLoader()
                .getResourceAsStream("app.properties")) {
            properties.load(in);
        }

        try (TableEditor editor = new TableEditor(properties)) {
            editor.createTable("test_table");
            System.out.println(editor.getTableScheme("test_table"));

            editor.addColumn("test_table", "last_name", "TEXT");
            System.out.println(editor.getTableScheme("test_table"));

            editor.renameColumn("test_table", "last_name", "first_name");
            System.out.println(editor.getTableScheme("test_table"));

            editor.dropColumn("test_table", "first_name");
            System.out.println(editor.getTableScheme("test_table"));

            editor.dropTable("test_table");

        }
    }
}
