module Notes
    class DatabaseController
      def initialize 
        @collection = Mongo::Connection.new('localhost').db('notes')['notes']
      end

      def find criteria
        @collection.find({ criteria.name => criteria.value})
      end

      def insert note
        @collection.insert(note.to_hash)
      end

      def remove criteria
        @collection.remove ({ criteria.name => criteria.value})
      end

      def update note, criteria
        @collection.update({'token' => note.token}, {'$set' => {criteria.name => criteria.value}})
      end
    end
end
