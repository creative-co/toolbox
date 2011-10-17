module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter < AbstractAdapter
      def table_exists? name
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

        table_exists = query(<<-SQL).first[0].to_i > 0
            SELECT COUNT(*)
            FROM pg_tables
            WHERE tablename = '#{table.gsub(/(^"|"$)/, '')}'
            #{schema ? "AND schemaname = '#{schema}'" : ''}
        SQL
        view_exists = query(<<-SQL).first[0].to_i > 0
            SELECT COUNT(*)
            FROM pg_views
            WHERE viewname = '#{table.gsub(/(^"|"$)/, '')}'
            #{schema ? "AND schemaname = '#{schema}'" : ''}
        SQL
        table_exists || view_exists
      end
    end
  end
end

