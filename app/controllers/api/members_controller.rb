module Api
  class MembersController < ActionController::API
    def tasks
      @members = Member.all

      render json: @members, each_serializer: MemberSerializer
    end
  end
end
