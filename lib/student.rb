require_relative "../config/environment.rb"

class Student
    attr_accessor  :name, :grade
    attr_reader :id

    def initialize (id = nil, name, grade)
      @name = name
      @grade = grade
      @id = nil
    end

    def self.create_table

      sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id PRIMARY KEY,
        name TEXT,
        grade TEXT
      );
      SQL
      DB[:conn].execute(sql)

    end

    def self.drop_table
      sql = <<-SQL
      DROP TABLE IF EXISTS students
      SQL

      DB[:conn].execute(sql)
    end

    def update
      sql = <<-SQL
      UPDATE students SET name = ?, grade = ? WHERE id = ?
      SQL

      DB[:conn].execute(sql, self.name, self.grade, self.id)
    end
    

end
