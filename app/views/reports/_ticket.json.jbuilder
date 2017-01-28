return unless ticket

json.extract! ticket,
              :id,
              :title,
              :created_at,
              :closed_at,
              :updated_at,
              :open_time,
              :author
