Role.find_or_create_by(name: "fitclubs_administrator", type: :default, russian_name: 'Администратор приложения')
Role.find_or_create_by(name: "franchise_administrator", type: :default, russian_name: 'Администратор франшизы')
Role.find_or_create_by(name: "club_administrator", type: :default, russian_name: 'Администратор клуба')

Role.find_or_create_by(name: "club_reader", type: :reader, russian_name: 'Клуб (Чтение)')
Role.find_or_create_by(name: "club_writer", type: :writer, russian_name: 'Клуб (Изменение)')

Role.find_or_create_by(name: "workout_reader", type: :reader, russian_name: 'Групповые тренировки (Чтение)')
Role.find_or_create_by(name: "workout_writer", type: :writer, russian_name: 'Групповые тренировки (Изменение)')

Role.find_or_create_by(name: "news_reader", type: :reader, russian_name: 'Новости (Чтение)')
Role.find_or_create_by(name: "news_writer", type: :writer, russian_name: 'Новости (Изменение)')

Role.find_or_create_by(name: "ticket_administrator", type: :default, russian_name: 'Запросы клиентов')

Role.find_or_create_by(name: "user_reader", type: :reader, russian_name: 'Пользователи (Чтение)')
Role.find_or_create_by(name: "user_writer", type: :writer, russian_name: 'Пользователи (Изменение)')