module Daodalus
  module DAO
    include DSL

    def find_one(query={}, select={}, options={})
      collection.where(query).select(select).one
    end

    def find(query={}, select={}, options={})
      collection.where(query).select(select)
    end

    def insert(data={}, options={})
      collection.insert(data)
    end

    def update(query={}, update={}, options={})
      collection.where(query).update(update)
    end

    def remove(criteria={}, options={})
      collection.where(criteria).remove_all
    end

    def remove_all
      collection.where.remove_all
    end

    def count(query={}, options={})
      collection.find(query).count
    end

    def find_and_modify(query={}, update={}, options={})
      collection.find(query).modify(update, options)
    end

    def aggregate(*args)
      collection.aggregate(*args)
    end


    private

    def connection_name
      @connection_name || self.class.connection_name
    end

    def collection_name
      @collection_name || self.class.collection_name
    end

    def collection
      @collection ||= Daodalus::Connection.fetch(connection_name).tap do |conn|
        conn.use(connection_name)
      end[collection_name.to_s]
    end

    module Targetable
      def target(conn, coll)
        @connection_name = conn.to_s
        @collection_name = coll.to_s
      end
      attr_reader :collection_name
      attr_reader :connection_name
    end

    def self.included(base)
      base.extend(Targetable)
    end
    include Targetable

  end
end
