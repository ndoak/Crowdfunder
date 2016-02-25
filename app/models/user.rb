class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :email, confirmation: true
  validates :email, uniqueness: true

  ROLES = %i[owner backer]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

end
