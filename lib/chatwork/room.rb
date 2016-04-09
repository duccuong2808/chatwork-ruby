module ChatWork
  class Room < Entity
    install_class_operations :create, :get

    def self.path
      "/rooms"
    end

    def path
      "/rooms"
    end

    def self.delete(params = {})
      @assign_path = parse_if_hash_key_exists(path << "/" << params[:room_id].to_s , params, :room_id)
      attach_nested_resource_id(params)
      action = convert ChatWork.client.delete(@assign_path, params)
      if action == APIError.new(204, "")
        {
            status: 204,
            room_id: params[:room_id],
        }
      else
        action
      end
    end

  end
end
