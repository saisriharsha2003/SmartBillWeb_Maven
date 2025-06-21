package utility;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseInitializer {
    public static void initializeDatabase() {
        try (Connection con = Utility.getConnection1(); Statement stmt = con.createStatement()) {

            stmt.executeUpdate(
                "create table if not exists consumer_details (" +
                "meter_number varchar(10))"
            );

            stmt.executeUpdate(
                "insert into consumer_details (meter_number) values " +
                "('mtrx9012'), ('mtry3456'), ('mtrz7890')," +
                "('mtrw4567'), ('mtrv1234'), ('mtru5678')," +
                "('mtrt8901'), ('mtrs2345'), ('mtrr6789')," +
                "('mtrq0123')"
            );

            stmt.executeUpdate(
                "create table if not exists consumer (" +
                "consumer_id bigint primary key," +
                "meter_number varchar(20) unique," +
                "title varchar(20)," +
                "consumer_name varchar(100)," +
                "email varchar(50)," +
                "mobile bigint," +
                "gender varchar(20)," +
                "user_name varchar(50)," +
                "password varchar(50))"
            );

            stmt.executeUpdate(
                "create table if not exists admin_login(" +
                "username varchar(50) primary key," +
                "password varchar(50))"
            );

            stmt.executeUpdate(
                "create table if not exists bill (" +
                "bill_number integer primary key," +
                "due_amount double," +
                "bill_amount double," +
                "due_date varchar(20)," +
                "penalty double," +
                "status varchar(20)," +
                "meter_number varchar(20)," +
                "foreign key (meter_number) references consumer(meter_number))"
            );

            stmt.executeUpdate(
                "create table if not exists login (" +
                "username varchar(50) primary key," +
                "password varchar(50)," +
                "consumer_id bigint," +
                "status varchar(20)," +
                "foreign key (consumer_id) references consumer(consumer_id))"
            );

            stmt.executeUpdate(
                "create table if not exists payment (" +
                "transaction_number integer primary key," +
                "bill_number integer," +
                "paid_amount double," +
                "transaction_mode varchar(50)," +
                "transaction_date varchar(50)," +
                "consumer_id bigint," +
                "meter_number varchar(20)," +
                "foreign key (bill_number) references bill(bill_number))"
            );

            stmt.executeUpdate(
                "create table if not exists complaint (" +
                "complaint_id integer primary key," +
                "landmark varchar(50)," +
                "service varchar(50)," +
                "category varchar(50)," +
                "mobile bigint," +
                "contact varchar(50)," +
                "problem varchar(200)," +
                "address varchar(200)," +
                "complaint_status varchar(200)," +
                "consumer_id bigint," +
                "foreign key (consumer_id) references consumer(consumer_id))"
            );

            stmt.executeUpdate(
                "insert ignore into admin_login (username, password) " +
                "values ('admin', 'harsha@2005')"
            );

            System.out.println("✅ Tables created or verified.");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("❌ Database setup failed.");
        }
    }
}
