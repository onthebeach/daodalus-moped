module Daodalus
  module DSL
    module Updates

      def update(options = {})
        dao.update(criteria, update_clause, options)
      end

      def find_and_modify(options = {})
        dao.find_and_modify(criteria, update_clause, options)
      end
    end
  end
end
