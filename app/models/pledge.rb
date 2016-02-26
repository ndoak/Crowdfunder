class Pledge < ActiveRecord::Base
  belongs_to :projects
  belongs_to :user
  belongs_to :project
end
