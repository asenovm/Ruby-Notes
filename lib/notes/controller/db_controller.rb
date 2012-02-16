module Notes
    class DatabaseController
      def initialize collection_name
        @collection = Mongo::Connection.new('localhost').db('notes')[collection_name]
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

      def remove_all
        @collection.remove({})
      end

      def update note, criterias
        criterias.each do |criteria|
          @collection.update({'token' => note.token}, {'$set' => {criteria.name => criteria.value}})
        end
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
