class SignupSerializer < ActiveModel::Serializer
    attributes :time, :camper_id, :activity_id
    has_one :activity
    has_one :camper
end
