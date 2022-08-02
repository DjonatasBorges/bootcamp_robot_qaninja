from faker import Faker
from bcrypt import gensalt, hashpw

fake = Faker()


def get_hashed_pass(password):
    hashed = hashpw(password.encode('utf-8'), gensalt(8))
    return hashed


def factory_user(target):
    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': fake.password(),
        },
        'wrong_email': {
            'name': 'João',
            'lastname': fake.last_name(),
            'email': 'joao&gmail.com',
            'password': fake.password(),
        },
        'login': {
            'name': "Djonatas",
            'lastname': "Borges",
            'email': "djonatas@qaninja.com.br",
            'password': "pwd123",
        },
        'be_geek': {
            'name': 'Kim',
            'lastname': 'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'desc': 'Seu computador esta lento? Reiniciando do nada? Me contrate \
                        que eu tenho a solução para seu problema!',
                        'printer_repair': 'Sim',
                        'work': 'Remoto',
                        'cost': '100',
            }
        }
    }
    return data[target]
