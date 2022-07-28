from faker import Faker
from bcrypt import gensalt, hashpw
fake = Faker()



def get_hashed_pass(password):
    hashed = hashpw(password.encode('utf-8'), gensalt(8))
    return hashed


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

def factory_user_login():
    return {
        'name': "Djonatas",
        'lastname': "Borges",
        'email': "djonatas@qaninja.com.br",
        'password': "pwd123",
    }