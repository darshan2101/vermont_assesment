class User < ApplicationRecord
    ROLES = %w[customer admin]

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :full_name, presence: true
    validates :role, presence: true, inclusion: { in: ROLES }

    before_save: normalize_email

    def admin
        role == "admin"
    end

    private
        def normalize_email
            self.email = email.downcase.strip if email.present?
        end
end