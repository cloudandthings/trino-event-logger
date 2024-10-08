/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package cloudandthings.plugin.telogger;

import io.airlift.log.Logger;
import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.output.MigrateResult;

import static java.lang.String.format;

public class FlywayMigration
{
    private static final Logger log = Logger.get(FlywayMigration.class);

    private FlywayMigration()
    {
    }

    private static String getLocation(String configDbUrl)
    {
        if (configDbUrl.startsWith("jdbc:mysql")) {
            return "/db/mysql";
        }

        if (configDbUrl.startsWith("jdbc:postgresql")) {
            return "/db/postgresql";
        }

        if (configDbUrl.startsWith("jdbc:sqlserver")) {
            return "/db/sqlserver";
        }

        throw new IllegalArgumentException(format("Invalid JDBC URL: %s. Only mysql, postgresql and sqlserver is supported.", configDbUrl));
    }

    public static void migrate(TELoggerConfig config)
    {
        log.info("Performing migrations...");
        Flyway flyway = Flyway.configure()
                .dataSource(config.getUrl(), config.getUser(), config.getPassword())
                .locations(getLocation(config.getUrl()))
                .baselineOnMigrate(true)
                .baselineVersion("0")
                .load();

        MigrateResult migrations = flyway.migrate();
        log.info("Performed %s migrations", migrations.migrationsExecuted);
    }
}
