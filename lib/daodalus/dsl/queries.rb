module Daodalus
  module DSL
    module Queries

      def find(options = {})
        dao.find(criteria, select_clause, options)
      end

      def find_one(options = {})
        dao.find_one(criteria, select_clause, options)
      end

      private

      ##
      # Including classes must implement the following methods
      #
      # criteria - the query criteria
      # select_clause - the fields to project
      #
      ##

    end
  end
end
