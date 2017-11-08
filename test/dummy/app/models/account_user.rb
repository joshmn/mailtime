class AccountUser < ActiveRecord::Base

  belongs_to :account
  belongs_to :user

end