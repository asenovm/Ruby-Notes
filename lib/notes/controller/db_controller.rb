module Notes
    class DatabaseController
      def initialize 
        @collection = Mongo::Connection.new('localhost').db('notes')['notes']
      end

      def find criterias
        @collection.find({'$and' => get_criterias_as_hashes(criterias)})
      end

      def insert note
        @collection.insert(note.to_hash)
      end

      def remove criterias
        @collection.remove({'$and' =>  get_criterias_as_hashes(criterias)})
      end

      def update note, criteria
        @collection.update({'token' => note.token}, {'$set' => {criteria.name => criteria.value}})
      end

      private
      def get_criterias_as_hashes criterias
        result = []
        criterias.each do |criteria|
          result << criteria.to_hash
        end
        result
      end
    end
end
