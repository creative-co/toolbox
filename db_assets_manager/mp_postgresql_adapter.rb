module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter < AbstractAdapter
      # backport from rails 3.2
      def table_exists?(name)
        name = name.to_s
        schema, table = name.split('.', 2)
        unless table # A table was provided without a schema
          table = schema
          schema = nil
        end

        if name =~ /^"/ # Handle quoted table names
          table = name
          schema = nil
        end

        return false unless table

        binds = [[nil, table]]
        binds << [nil, schema] if schema

        exec_query(<<-SQL, 'SCHEMA', binds).rows.first[0].to_i > 0
            SELECT COUNT(*)
            FROM pg_class c
            LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
            WHERE c.relkind in ('v','r')
            AND c.relname = $1
            AND n.nspname = #{schema ? '$2' : 'ANY (current_schemas(false))'}
        SQL
      end
    end
  end
end

