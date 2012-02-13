module Notes
  module Model
    class DatabaseController
      def initialize 
        @collection = Mongo::Connection.new('localhost').db('notes')['notes']
      end

      def find criteria
        @collection.find({ criteria.name => criteria.value})
      end

      def insert note
        @collection.insert note.to_s
      end

      def remove criteria
        @collection.remove ({ criteria.name => criteria.value})
      end

      def update note, criteria
        @collecton.update({'id' => note.id}, {'$set' => {criteria.name => criteria.value}})
      end
    end
  end
end
