from os import environ
import string
import random
from faker import Faker


class UserLibrary(object):

    def generate_user_data(self):
        '''Keyword for generating user test data'''
        return _generate_user_data()


def _generate_user_data():
    user = {}
    user['name'] = generate_name()
    user['email'] = generate_name_to_email(user.get('name'))
    user['password'] = 123
    user['confirm_password'] = 123
    return user


def generate_name():
    max_name_length = 10
    fake = Faker()
    name = '{0} {1}'.format(str(fake.first_name()),
                            str(fake.last_name()))
    return name[:max_name_length]


def generate_name_to_email(name):
    EMAIL_SUFFIX = '-@test.com'
    lower_case_name = '{0}{1}'.format(name.lower(), random_string())
    email = lower_case_name.replace(' ', '') + EMAIL_SUFFIX
    return str(email)


def random_string():
    size = 5
    chars = string.digits
    random_string = ''.join(random.choice(chars) for _ in range(size))
    return random_string