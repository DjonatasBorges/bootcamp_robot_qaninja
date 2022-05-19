from faker import Faker
fake = Faker()

def factory_user():
    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': fake.password(),
    }

def factory_wrong_email():
    first_name = fake.first_name()
    return {
        'name': first_name,
        'lastname': fake.last_name(),
        'email': f'{first_name.lower()}&gmail.com',
        'password': fake.password(),
    }