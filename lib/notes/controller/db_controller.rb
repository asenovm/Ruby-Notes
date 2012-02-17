module Notes
    class DatabaseController
      def initialize collection_name
        @collection = Mongo::Connection.new('localhost').db('notes')[collection_name]
      end

      def find criterias
        if should_apply_to_all?(criterias) && criterias.size == 1
          return get_all_records
        end
        @collection.find({'$and' => get_criterias_as_hashes(criterias)})
      end

      def find_one criterias
        @collection.find_one({'$and' => get_criterias_as_hashes(criterias)})
      end

      def get_all_records
        @collection.find
      end

      def create note
        @collection.insert(note.to_hash)
      end

      def remove criterias
        if should_apply_to_all?(criterias)
          remove_all
          return 
        end
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
      def should_apply_to_all?(criterias)
        criteria_hashes = get_criterias_as_hashes criterias
        criteria_hashes.each do |criteria|
          if criteria[Notes::Options::ALL.to_s]
            return true
          end
        end
        false
      end

      def get_criterias_as_hashes criterias
        result = []
        criterias.each do |criteria|
          result << criteria.to_hash
        end
        result
      end
    end
end
