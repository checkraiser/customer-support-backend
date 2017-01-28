return unless user

json.extract! user,
              :email,
              :first_name,
              :last_name,
              :full_name
