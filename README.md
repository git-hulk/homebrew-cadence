# homebrew-cadence

## Cadence Server

It's as simple as:

```shell
% brew tap git-hulk/cadence
% brew install cadence
```

Then setup the persistence schema, I would take the MySQL as example
and you MUST setup the MySQL instance first.

```shell
export SQL_HOST={YOUR MYSQL HOST}
export SQL_PORT={YOUR MYSQL PORT}
export SQL_USER={YOUR MYSQL USER}
export SQL_PASSWORD={YOUR MYSQL PASSWORD}

cadence-sql-tool create --db cadence \
&& cadence-sql-tool --db cadence setup-schema -v 0.0 \
&& cadence-sql-tool --db cadence update-schema -d /usr/local/etc/cadence/schema/mysql/v57/cadence/versioned \
&& cadence-sql-tool create --db cadence_visibility \
&& cadence-sql-tool --db cadence_visibility setup-schema -v 0.0 \
&& cadence-sql-tool --db cadence_visibility update-schema -d /usr/local/etc/cadence/schema/mysql/v57/visibility/versioned
```

Finally, run the cadence server, replace your MySQL configuration in `/usr/local/etc/cadence/development_mysql.yaml`:

```shell
cadence-server --root /usr/local/etc/cadence --env development_mysql start
```

## Cadence Client

Use the cadence client to create the domain

```shell
cadence --do test-domain domain re --rd 1
```

Then you can have a look at the created domain: 

```
cadence --do test-domain domain desc
```
