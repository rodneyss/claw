class Voucher < ActiveRecord::Base
   belongs_to :client
   has_and_belongs_to_many :users
end
