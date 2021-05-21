from robot.libraries.BuiltIn import BuiltIn

class Assertion(object):
    '''Function that contain custom keywords related to assertion'''

    def type_should_be_integer(self, arg1):
        '''Keyword for checking is arg1 instance is integer'''
        if not (isinstance(arg1, int)):
            raise AssertionError(
                "Type {0} is not integer".format(arg1))
        pass

    def type_should_be_string(self, arg1):
        '''Keyword for checking is arg1 instance is string'''
        if not (isinstance(arg1, str)):
            raise AssertionError(
                "Type {0} is not string".format(arg1))
        pass
